<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/28
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<div id="logo-intro" class="pc_main_box">
    <div class="left">
        <div class="logo l"><h1>每时在线家教网</h1>
        </div>
    </div>
    <div class="right">
        <div id="login_status" class="loginbox">
            <c:if test="${sessionScope.user == null}">
                <form method="post" id="lsform">
                    用户名：<input type="text" name="username" id="ls_username" autocomplete="off" class="px"
                               tabindex="901"><br>密　码：<input type="password" name="password" id="ls_password" class="px"
                                                             autocomplete="off" tabindex="902"><br>
                    <button type="button" class="btn log" tabindex="904" onclick="login()">登　录</button>
                    <a class="reg" href="${pageContext.request.contextPath}/regist.jsp">还没注册？立即注册&gt;&gt;</a>
                </form>
            </c:if>
            <c:if test="${sessionScope.user != null}">
                <input id="uid" type="hidden" value="${sessionScope.user.id}"/>
                <input id="isTea" type="hidden" value="${sessionScope.user.isTea}"/>
                <c:if test="${sessionScope.user.isTea == 0}">
                    你好，${sessionScope.user.name}同学<br>
                </c:if>
                <c:if test="${sessionScope.user.isTea == 1}">
                    你好，${sessionScope.user.name}老师<br>
                </c:if>
                <a href="#" onclick="userInfo()">个人中心</a>
                <a href="${pageContext.request.contextPath}/user/logout">退出</a>
            </c:if>
        </div>
    </div>
</div>
<div class="nab-bg">
    <div id="nav" class="pc_main_box">
        <ul>
            <li class="first"><a style="padding-left: 26px;" href="#">学习课程</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/teachers.jsp">教师列表</a></li>
            <li><a href="${pageContext.request.contextPath}/studyDocs.jsp">实用文档</a></li>
            <li><a href="${pageContext.request.contextPath}/findTeacher.jsp">老师招聘</a></li>
        </ul>
        <div class="link"><img src="${pageContext.request.contextPath}/images/play.png"><a
                href="#" onclick="userInfo()" rel="nofollow">个人中心</a></div>
    </div>
</div>
<script>

    function login() {
        var username = $("#ls_username").val();
        var password = $("#ls_password").val();
        $.ajax({
            url: "${pageContext.request.contextPath}/user/login",
            type: "post",
            data: "username=" + username + "&password=" + password,
            success: function (data) {
                if (data == "false") alert("用户名或密码不正确");
                if (data == "true") window.location.href = "${pageContext.request.contextPath}/index.jsp";
            }
        });
    }

    function userInfo() {
        var uid = $("#uid").val();
        if(uid == null) alert("请登陆");
        if(uid != null) location.href = "${pageContext.request.contextPath}/userInfo.jsp?id="+uid;
    }

</script>
