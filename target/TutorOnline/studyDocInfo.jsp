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
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/portal.css">
<jsp:include page="head.jsp"/>
<body>

<div class="pc_main_box">
    <div class="tbox">
        <h1 id="title">教育局工作计划</h1>
        <p style="text-align: center;color: #A59F9E;margin-bottom: 20px;" id="time"></p>
        <div id="content" class="des">
        </div>
    </div>
</div>

<jsp:include page="foot.jsp"/>
</body>
</html>
<script>
    $(function () {

        var id = getQueryString("id");
        getStudyDoc(id);

    });

    function getStudyDoc(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/studyDoc/getStudyDocById",
            type: "get",
            data: "id=" + id,
            success: function (data) {
                var obj = $.parseJSON(data);
                $("#title").html(obj.title);
                $("#time").html("发布时间："+ formatDate(obj.insertTime));
                $("#content").html("<p>"+ obj.content +"</p>");
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

</script>
