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
                            <h1 id="subTitle" class="courseInfo_h1"></h1>
                            <ul id="subInfo">
                            </ul>
                        </div>
                    </div>
                </div>
                <span class="sFillet ht10 filletBg fillet773Bold_b"></span>
            </div>
            <ul class="course_tabTag mart10 clearfix tabTag_course">
                <li class="curTag">课程内容</li>
            </ul>
            <span class="sFillet ht5 filletBg fillet773_t"></span>
            <div class="fillet773_border tabCon_course" style="width: 770px;">
                <div class="course_tabCon_del tabCon_del_intro">
                    <h2 style="text-align: left"><span class="intro_h2 commonIcon">1</span>课程简介</h2>
                    <p id="des"></p>
                    <%--<h2 style="text-align: left"><span class="intro_h2 commonIcon">2</span>课程目录</h2>
                    <table summary="课程目录" class="course_tab">
                        <thead>
                        <tr>
                            <th width="10%"><span class="noborder">讲次</span></th>
                            <th width="10%"><span>老师</span></th>
                            <th><span>讲次介绍</span></th>
                            <th width="12%"><span>时长</span></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>第1讲</td>
                            <td>麻雪玲</td>
                            <td class="textleft">
                                <p title="点击展开" class="lessonIntro_til">专题 Unit1 What's the matter(一)<img
                                        src="http://image.jiandan100.cn/images/course/icon_arrows.gif" alt="点击展开"/></p>
                                <div class="lessonIntro_del">
                                    <p>1、lie既可以表示“说谎”，又可以表示“躺”，如何巧妙记住？麻老师一个口诀教会你。</p>
                                    <p>2、在if引导的条件状语从句中，从句有tomorrow，一定要用一般将来时吗？麻老师的回答是“No”，想知道原因吗？赶紧来听课吧！</p></div>
                                <div style="float: right; text-align:center;">
                                    <!--                                         <input type="button" style="padding:0 4px; cursor:pointer;" value="免费注册试听"  onclick="javascript:location.href='http://www.jd100.com/c2/user/register/?courseinfo=1&fromurl=http://www.jd100.com/c2/freelesson/'"/>
                                    -->
                                </div>
                            </td>
                            <td>27分钟</td>
                        </tr>
                        </tbody>
                    </table>--%>
                </div>
                <div class="course_tabCon_del tabCon_del_intro">
                    <h2 style="text-align: left"><span class="intro_h2 commonIcon">2</span>预约学生</h2>
                    <p id="des2" style="color: red;"></p>
                </div>
            </div>
            <span class="sFillet ht5 filletBg fillet773_b"></span>
        </div><!--此行不可删除，影响chat.53kf的正常使用-->

        <jsp:include page="foot.jsp"/>
</html>
<script>
    $(function () {

        var id = getQueryString("id");
        getSubject(id);

    });

    function getSubject(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/subject/getSubjectById",
            type: "get",
            data: "id=" + id,
            success: function (data) {
               var obj = $.parseJSON(data);
                 $("#subTitle").html(data.title);
                 var str = "<li>"+ obj.title +"</li><li>主讲老师：<a href=\"${pageContext.request.contextPath}/teacherInfo.jsp?id="+ obj.teacher.id +"\">"+ obj.teacher.name +"</a></li><li>地点："+ obj.address +"</li><li>价格："+ obj.money +"元</li><li>开始时间："+ formatDate(obj.beginTime) +"</li><li>结束时间："+ formatDate(obj.endTime) +"</li>"
                 $("#img").html("<img src=\"${pageContext.request.contextPath}/images/test_subject.jpg\">");
                 $("#subInfo").html(str);
                 $("#des").html("&nbsp&nbsp&nbsp&nbsp"+ obj.description);
                 var name = obj.user == null ? "现在还没有学生预约，抓紧时间预约噢！" : obj.user.name;
                 var telphone = obj.teacher.id == $("#uid").val() ? obj.user.telphone : "";//如果登录用户和此课程教师id一致，则显示电话，反之无;
                 $("#des2").html("&nbsp&nbsp&nbsp&nbsp"+ name +"&nbsp&nbsp&nbsp&nbsp"+ telphone);
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
