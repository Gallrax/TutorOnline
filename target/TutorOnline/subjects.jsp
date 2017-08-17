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
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/kemu.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/inner.css">
<body>
<div class="pc_main_box">
    <div class="gbox"><p class="sty1"><a id="t" href="#"></a></p>
        <ul id="subs">
            <%--<li><a class="flimg" href="javascript:void(0)"><img src="#"></a>
                <div class="rbox"><p class="title"><a href="#">高中英语写作专项突破课程(新课标)</a>
                </p>
                    <div class="des"><p>
                        全国知名英语特级教师李俊和老师，为你系统梳理英语各类作文写作要求，通过常见错误的剖析，让同学们避免中式英语，写出漂亮的地道英语。同时以幽默风趣的讲解让你轻松掌握“写”、“记”、“仿”、“背”、“学”五招，把握英语写作要点，快速提高英语写作成绩。</p>
                    </div>
                    <p style="color: #86CC46;"><b>授课老师：</b>李俊和&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>课程截止时间：</b>2017-09-01</p>
                </div>
            </li>--%>
        </ul>
        <div id="page" style="text-align: center"></div>
    </div>
</div>
</div>

<jsp:include page="foot.jsp"/>
</body>
</html>
<script>
    var id = getQueryString("id");

    $(function () {
        getSubjects(id, 1);
        getPage("courseId", id);
        setTitle();

    });

    function getSubjects(id, index) {
        $.ajax({
            url: "${pageContext.request.contextPath}/subject/getSubjectsByCourse",
            type: "get",
            data: "index="+ index +"&id=" + id,
            success: function (data) {
                var obj = $.parseJSON(data);
                var str = "";
                for (var i = 0; i < obj.length; i++) {
                    str += "<li><a class=\"flimg\" href=\"javascript:void(0)\"><img src=\"${pageContext.request.contextPath}/images/test_subject.jpg\"></a><div class=\"rbox\"><p class=\"title\"><a href=\"${pageContext.request.contextPath}/subjectInfo.jsp?id="+ obj[i].id +"\">" + obj[i].title + "</a></p><div class=\"des\"><p>" + obj[i].description + "</p></div><div class=\"btn5\" onclick=\"reserve("+ obj[i].id +")\">免费预约</div><p style=\"color: #86CC46;\"><b>授课老师：</b>" + obj[i].teacher.name + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>课程地点：</b>" + obj[i].address + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>课程时间：</b>" + formatDate(obj[i].beginTime) +"&nbsp;~&nbsp;"+ formatDate(obj[i].endTime) + "</p></div></li>";
                }
                $("#subs").html(str);
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
                    str += "<a href=\"#\" onclick=\"getSubjects("+id +","+ i +")\">"+ i +"</a>&nbsp";
                }
                $("#page").html(str);
            }
        });
    }

    function reserve(id) {
        var isTea = $("#isTea").val() == "1";
        var judge = $("#uid").val() == null;
        if(isTea) alert("老师不能预约课程");
        if(!isTea) {
            if(judge) alert("您未登陆，请登陆");
            if(!judge) update(id);
        }
    }

    function update(id) {
        $.ajax({
            url : "${pageContext.request.contextPath}/subject/updateUserId",
            type : "get",
            data : "id="+ id +"&userId="+ $("#uid").val(),
            success : function(data) {
                if(data.substring(1, data.length - 1) == "true") alert("预约成功");
                if(data.substring(1, data.length - 1) == "false") alert("该课程已被预约");
            }
        });
    }

    //设置标题，不访问服务器，使用解析传值加载速度快
    function setTitle() {
        var gradeName = decodeURI(decodeURI(getQueryString("gradeName")));
        var courseName = decodeURI(decodeURI(getQueryString("courseName")));
        $("#t").html(gradeName + courseName + "一对一辅导");
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

</script>
