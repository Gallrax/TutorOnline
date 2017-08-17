<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/28
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ebusiness.css">
    <link href="${pageContext.request.contextPath}/css/coursehome.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/keyword.css" rel="stylesheet" type="text/css"/>--%>

    <link rel="stylesheet" type="text/css" href="http://css.jd100.com/css/base.css?201307101816">
    <link rel="stylesheet" type="text/css" href="http://css.jd100.com/css/common.css?201704281006">
    <link rel="stylesheet" type="text/css" href="http://css.jd100.com/css/ebusiness.css">
    <link href="http://css.jd100.com/css/coursehome.css" rel="stylesheet" type="text/css"/>
    <link href="http://css.jd100.com/css/keyword.css" rel="stylesheet" type="text/css"/>


    <jsp:include page="head.jsp"/>

    <div id="container">
        <div id="content" class="whitebg">
            <div class="courseCon_wrap">
                <span class="sFillet ht10 filletBg fillet773Bold_t"></span>
                <div class="fillet773Bold_border courseCon">
                    <div class="clearfix">
                        <div id="img" class="courseVideo left">

                        </div>
                        <div class="courseInfo">
                            <h1 id="teaTitle" class="courseInfo_h1"></h1>
                            <ul id="teaInfo">
                            </ul>
                        </div>
                    </div>
                </div>
                <span class="sFillet ht10 filletBg fillet773Bold_b"></span>
            </div>
            <ul class="course_tabTag mart10 clearfix tabTag_course">
                <li class="curTag">教师介绍</li>
            </ul>
            <span class="sFillet ht5 filletBg fillet773_t"></span>
            <div class="fillet773_border tabCon_course" style="width: 770px;">
                <div class="course_tabCon_del tabCon_del_intro">
                    <h2 style="text-align: left"><span class="intro_h2 commonIcon">1</span>教师简介</h2>
                    <p id="des"></p>
                    <h2 style="text-align: left"><span class="intro_h2 commonIcon">2</span>课程目录</h2>
                    <table summary="课程目录" class="course_tab" style="font-size: 13px">
                        <thead>
                        <tr>
                            <th width="10%"><span class="noborder">课程名</span></th>
                            <th width="10%"><span>价格</span></th>
                            <th><span>介绍</span></th>
                            <th width="12%"><span>结束时间</span></th>
                        </tr>
                        </thead>
                        <tbody id="subList">
                        </tbody>
                    </table>
                </div>
            </div>
            <span class="sFillet ht5 filletBg fillet773_b"></span>
        </div><!--此行不可删除，影响chat.53kf的正常使用-->

        <jsp:include page="foot.jsp"/>
</html>
<script>
    $(function () {

        var id = getQueryString("id");
        getTeacher(id);
        getSubjects(id, 1);

    });

    function getTeacher(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/user/getUserById",
            type: "get",
            data: "id=" + id,
            success: function (data) {
               var obj = $.parseJSON(data);
                 $("#teaTitle").html(obj.name);
                 var sex = obj.sex == 0 ? "男" : "女";
                 var str = "<li>年龄："+ obj.age +"</li><li>性别："+ sex +"</li><li>手机："+ obj.telphone +"</li><li>个人介绍："+ obj.description +"</li>";
                 $("#img").html("<img src=\"${pageContext.request.contextPath}/images/test_subject.jpg\">");
                 $("#teaInfo").html(str);
                 $("#des").html(obj.description);
            }
        });
    }

    function getSubjects(teaId, index) {
        $.ajax({
            url: "${pageContext.request.contextPath}/subject/getSubjectsByTeaId",
            type: "get",
            data: "index="+ index +"&teaId=" + teaId,
            success: function (data) {
                var obj = $.parseJSON(data);
                var str = "";
                for (var i = 0; i < obj.length; i++) {
                    str += "<tr><td>"+ obj[i].title +"</td><td>"+ obj[i].money +"</td><td>"+ obj[i].description +"</td><td>"+ formatDate(obj[i].endTime) +"</td></tr>";
                }
                $("#subList").append(str);
                /*$("#teaTitle").html(obj.name);
                var str = "<li>年龄："+ obj.age +"</li><li>性别："+ obj.sex +"</li><li>个人介绍："+ obj.description +"</li>";
                $("#img").html("<img src=\"${pageContext.request.contextPath}/images/test_subject.jpg\">");
                $("#teaInfo").html(str);
                $("#des").html(obj.description);*/
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
