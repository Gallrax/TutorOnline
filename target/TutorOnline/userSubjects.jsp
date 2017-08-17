<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/28
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<jsp:include page="head.jsp"/>
<link type="text/css" rel="stylesheet" href="http://thumb.1010pic.com/styles/1d1/common.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/person_info.css">
<body>

<div class="pc_main_box mainbox">
    <style>
        .mainbox {
            width: 958px;
            border-top: 0;
            margin: auto;
            padding-top: 40px;
            top: 50%;
        }

        .user_nav_box {
            text-align: center;
            width: 20%;
            float: left;
            display: block;
        }

        .user_nav_box li {
            width: 155px;
            position: relative;
            display: block;
            margin-bottom: -1px;
            background-color: #fff;
            border: 1px solid #ddd;
        }

        .user_nav_box li a {
            display: block;
            height: 40px;
            line-height: 40px;
            color: #333;
            text-decoration: none;
        }

        .toubu {
            width: 75%;
            height: 120px;
            background: #fff;
            border: 1px solid #e3e3e3;
            float: right;
            margin-bottom: 20px;
        }

        .toubu dl {
            float: left;
            margin: 10px 0 0 20px;
            width: 70%;
        }

        .toubu img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin: -18px 20px 0 38px;
            box-shadow: 0 0 10px #000;
            float: left;
        }

        .toubu dl dt {
            font-size: 20px;
            color: #4e4545;
            font-weight: 700;
        }

        .toubu dl dd {
            font-size: 14px;
            color: #999;
            line-height: 14px;
            margin-top: 8px;
        }

        .toubu dl dd .xian {
            color: #27BFFE;
            text-decoration: underline;
        }

        .gm_dd {
            text-align: right;
            padding-top: 10px;
        }

        .gm_dd * {
            display: inline-block;
            width: 70px;
            line-height: 30px;
            text-align: center;
            font-size: 14px;
            margin: 0 4px;
        }

        .tui {
            color: #999;
        }

        .gm_kc, .yy_kc {
            background: #27BFFE;
            color: #fff;
        }

        .zhiliao_xg, .tuichu {
            background: #f6f6f6;
            color: #767676;
            border: 1px solid #e3e3e3;
        }

        .guanli {
            width: 958px;
            border: 1px solid #e3e3e3;
            border-top: 0;
            margin: 0 auto 20px auto;
            background: #fff;
            font-size: 0;
        }

        .guanli a {
            display: inline-block;
            line-height: 50px;
            padding: 0 20px;
            border-right: 1px solid #e3e3e3;
            color: #898989;
            font-size: 14px;
        }

        li.active {
            background-color: #d8d8d8;
        }
    </style>
    <div class="user_nav_box">
        <li class="active"><a href="#">课程管理</a></li>
        <li><a href="#" onclick="userInfo()">个人信息</a></li>
    </div>
    <div class="user_content_box" style="width: 75%;float: right;display: block">
        <nav id="n-info-nav">
            <a class="n-active" href="#">课程管理</a>
            <a id="add" href="${pageContext.request.contextPath}/addSubject.jsp">添加课程</a>
        </nav>
        <div class="center">
            <div id="page" style="text-align: center"></div>
            <div id="slist">
                <div style="width:220px;height:150px;float:left;text-align:center;padding:5px;margin: 0 5px;cursor:pointer;">
                   <%-- <a href="/TutorOnline/subjectInfo.jsp?id=9"><img src="/TutorOnline/images/test_subject.jpg" style="width:200px;height:120px;"><br>test09</a>--%>
                </div>
            </div>
        </div>
    </div>

</div>

<jsp:include page="foot.jsp"/>
</body>
</html>
<script>
    var id = getQueryString("id");
    var isTea = $("#isTea").val();

    $(function () {
        if(isTea == 0) {
            $("#add").hide();
            getPage("userId", id);
        }
        if(isTea == 1){
            $("#add").show();
            getPage("teaId", id);
        }
        getSubjectList(isTea, id, 1);
    });

    function getSubjectList(isTea, id, index) {
        var url = "";
        var data = ""
        if(isTea == 0) {
            url = "${pageContext.request.contextPath}/subject/getSubjectsByUserId";
            data = "index="+ index +"&userId="+ id;
        }
        if(isTea == 1) {
            url = "${pageContext.request.contextPath}/subject/getSubjectsByTeaId";
            data = "index="+ index +"&teaId="+ id;
        }
        $.ajax({
            url : url,
            type : "get",
            data : data,
            success : function(data) {
                var obj = $.parseJSON(data);
                var str = "";
                for(var i = 0; i < obj.length; i++) {
                    str += "<div style=\"width:220px;height:150px;float:left;text-align:center;padding:5px;margin: 0 5px;cursor:pointer;\"><a href=\"${pageContext.request.contextPath}/subjectInfo.jsp?id="+ obj[i].id +"\"><img src=\"${pageContext.request.contextPath}/images/test_subject.jpg\" style=\"width:200px;height:120px;\"><br>"+ obj[i].title +"</a>&nbsp&nbsp&nbsp<a href=\"#\" onclick=upd("+ obj[i].id +")>更改</a>&nbsp&nbsp&nbsp<a href=\"#\" onclick=del("+ obj[i].id +")>删除</a></div>";
                }
                $("#slist").html(str);
            }
        });
    }

    function getPage(field, value) {
        $.ajax({
            url: "${pageContext.request.contextPath}/subject/getPage",
            type: "get",
            data: "field="+ field +"&value="+ value,
            success: function (data) {
                var str = "";
                for (var i = 1; i <= data; i++) {
                    str += "<a href=\"#\" onclick=\"getSubjectList("+ isTea +","+ id +","+ i +")\">"+ i +"</a>&nbsp";
                }
                $("#page").html(str);
            }
        });
    }

    function upd(id) {
        $.ajax({
            url : "${pageContext.request.contextPath}/subject/judgeUpdate",
            type : "get",
            data : "id="+ id,
            success : function (data) {
                if(data.substring(1,data.length-1) == "true") location.href = "${pageContext.request.contextPath}/updateSubject.jsp?id="+ id;
                if(data.substring(1,data.length-1) == "false") alert("已有学生预定，不可更改");
            }
        });
    }

    function del(id) {
        $.ajax({
            url : "${pageContext.request.contextPath}/subject/deleteSubject",
            type : "get",
            data : "id="+ id,
            success : function (data) {
                if(data.substring(1,data.length-1) == "true") alert("删除成功");
                if(data.substring(1,data.length-1) == "false") alert("已有学生预定，不可删除");
                location.href = "${pageContext.request.contextPath}/index.jsp";
            }
        });
    }

    //获得url参数(key - value)
    function getQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    }

    //格式化日期
    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        return [year, month, day].join('-');
    }

    function userInfo() {
        var uid = $("#uid").val();
        if (uid == null) alert("请登陆");
        if (uid != null) location.href = "${pageContext.request.contextPath}/userInfo.jsp?id=" + uid;
    }



</script>
