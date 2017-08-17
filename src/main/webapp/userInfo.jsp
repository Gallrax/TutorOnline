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
        .user_nav_box{
            text-align:center;
            width:20%;
            float: left;
            display: block;
        }
        .user_nav_box li{
            width: 155px;
            position: relative;
            display: block;
            margin-bottom: -1px;
            background-color: #fff;
            border: 1px solid #ddd;
        }
        .user_nav_box li a{
            display: block;
            height: 40px;
            line-height: 40px;
            color: #333;
            text-decoration: none;
        }
        .toubu{
            width:75%;
            height:120px;
            background:#fff;
            border:1px solid #e3e3e3;
            float: right;
            margin-bottom: 20px;
        }
        .toubu dl{
            float:left;
            margin:10px 0 0 20px;
            width:70%;
        }
        .toubu img{
            width:100px;
            height:100px;
            border-radius:50%;
            margin:-18px 20px 0 38px;
            box-shadow: 0 0 10px #000;
            float:left;
        }
        .toubu dl dt{
            font-size:20px;
            color:#4e4545;
            font-weight:700;
        }
        .toubu dl dd{
            font-size:14px;
            color:#999;
            line-height:14px;
            margin-top:8px;
        }
        .toubu dl dd .xian{
            color:#27BFFE;
            text-decoration: underline;
        }
        .gm_dd{
            text-align: right;
            padding-top:10px;
        }
        .gm_dd *{
            display:inline-block;
            width:70px;
            line-height:30px;
            text-align: center;
            font-size:14px;
            margin:0 4px;
        }
        .tui{
            color:#999;
        }
        .gm_kc,.yy_kc{
            background:#27BFFE;
            color:#fff;
        }
        .zhiliao_xg,.tuichu{
            background:#f6f6f6;
            color:#767676;
            border:1px solid #e3e3e3;
        }
        .guanli{
            width:958px;
            border:1px solid #e3e3e3;
            border-top:0;
            margin:0 auto 20px auto;
            background:#fff;
            font-size:0;
        }
        .guanli a{
            display:inline-block;
            line-height:50px;
            padding:0 20px;
            border-right:1px solid #e3e3e3;
            color:#898989;
            font-size:14px;
        }
        li.active{
            background-color: #d8d8d8;
        }
    </style>
    <div class="user_nav_box">
        <li><a href="#" onclick="userSubjects()">课程管理</a></li>
        <li class="active"><a href="#">个人信息</a></li>
    </div>
    <div class="user_content_box" style="width: 75%;float: right;display: block">
        <nav id="n-info-nav">
            <a class="n-active" href="#">个人信息</a>
        </nav>
        <div class="n-main-container">
            <form class="info_reg" id="info_reg" action="${pageContext.request.contextPath}/user/updateUser" method="post" onsubmit="return updateInfo();">
                <p>
                    <label for="n-username">用户名:</label><br>
                    <input id="n-username" class="ipt" type="text" disabled="disabled"><br>
                    <span class="tip-info"></span>
                </p>
                <p>
                    <label for="n-name">姓名:</label><br>
                    <input id="n-name" name="name" class="ipt" type="text" value=""><br>
                    <span class="tip-info"></span>
                </p>
                <p>
                    <label for="n-age">年龄:</label><br>
                    <input id="n-age" name="age" class="ipt" type="text" value=""><br>
                    <span class="tip-info"></span>
                </p>
                <p>
                    <label >性别:</label><br>
                    <input id="male" class="radio sex_choose" type="radio" name="sex" value="0"><label for="male">男</label>
                    <input id="female" class="radio sex_choose" type="radio" name="sex" value="1"><label for="female">女</label>
                </p>
                <p>
                    <label for="n-telphone">手机:</label><br>
                    <input id="n-telphone" name="telphone" class="ipt" type="text" value=""><br>
                    <span class="tip-info"></span>
                </p>
                <p>
                    <label for="n-description">个人介绍:</label><br>
                    <input id="n-description" name="description" class="ipt" type="text" value=""><br>
                    <span class="tip-info"></span>
                </p>
                <input id="id" name="id" type="hidden" />
                <button id="xg-btn" type="submit">确认修改</button>
            </form>

        </div>
    </div>

</div>

<jsp:include page="foot.jsp"/>
</body>
</html>
<script>
    $(function () {

        var id = getQueryString("id");
        $("#id").val(id);
        getUserInfo(id);
    });

    function updateInfo(){
       if($("#n-name").val() == "" || $("#n-name").val() == null) return false;
       if($("#n-age").val() == "" || $("#n-age").val() == null) return false;
       return true;
    }

    function getUserInfo(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/user/getUserById",
            type: "get",
            data: "id="+ id,
            success: function (data) {
                var obj = $.parseJSON(data);
                $("#id").val(obj.id);
                $("#n-username").val(obj.username);
                $("#n-name").val(obj.name);
                $("#n-age").val(obj.age);
                $("#n-description").val(obj.description);
                $("#n-telphone").val(obj.telphone);
                if (obj.sex == 0) $("#male").attr("checked", "checked");
                if (obj.sex == 1) $("#female").attr("checked", "checked");
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

    function userSubjects() {
        var uid = $("#uid").val();
        if(uid == null) alert("请登陆");
        if(uid != null) location.href = "${pageContext.request.contextPath}/userSubjects.jsp?id="+uid;
    }

</script>
