<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/28
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userRegist.css">
<jsp:include page="head.jsp"/>
<body>
<div id="reg">
    <style>
        .container {
            width: 1200px;
            height: 600px;
            background: url('${pageContext.request.contextPath}/images/regist.jpg') center center no-repeat;
            margin: auto;
        }

        .xs-enter {
            width: 600px;
            height: 300px;
            float: left;
        }

        .ls-enter {
            width: 600px;
            height: 300px;
            float: left;
            padding-top: 300px;
        }

        .xs-enter p:first-child {
            font-size: 24px;
            color: #555555;
            text-align: right;
            margin-right: 50px;
            padding-top: 30px;
        }

        .xs-enter .xx {
            font-size: 24px;
            color: #555555;
            text-align: right;
            padding-top: 10px;
        }

        .zc1 {
            width: 200px;
            background: #2db741;
            line-height: 60px;
            text-align: center;
            margin: 10px 0 0 400px;
            display: block;
            color: #fff;
            font-size: 36px;
        }

        .ls-enter p:first-child {
            font-size: 24px;
            color: #fff;
            margin: 50px 0 10px 50px;
        }

        .sk {
            font-size: 24px;
            color: #fff;
            margin: 0 0 10px 100px;
        }

        .zc2 {
            width: 200px;
            background: #10bae5;
            line-height: 60px;
            text-align: center;
            display: block;
            color: #fff;
            font-size: 36px;
        }
    </style>
    <div class="container">
        <div class="xs-enter">
            <p>我是学生</p>
            <p class="xx">我要学习</p>
            <a href="#" onclick="stuReg()" class="zc1">注册入口</a>
        </div>
        <div class="ls-enter">
            <p>我是老师</p>
            <p class="sk">我要授课</p>
            <a href="#" onclick="teaReg()" class="zc2">注册入口</a>
        </div>
    </div>
</div>

<%--学生注册div--%>
<div id="stuReg">
    <div class="container student_container">
        <form class="regbox" name="login" method="post">
            <h1 class="student_color">我是学生</h1>
            <h2 class="student_color">我要学习</h2>
            <p class="form-group">
                <label for="stuUsername"></label>
                <input type="text" id="stuUsername" name="username" placeholder="用户名"><br>
                <span class="tip">请输入2―16位用户名，由字母、数字组合</span>
            </p>
            <p class="form-group">
                <input type="password" id="stuPassword" name="password" placeholder="密码"><br>
                <span class="tip">请输入6―20位密码，由字母、数字任意组合</span>
            </p>
            <button class="regbtn" type="button" onclick="submitStu()">注 册</button>
            <span class="tiaokuan">注册代表您已经阅读并同意<a class="student_color" href="#">《精英家教网服务条款》</a>
            </span>
            <button class="regbtn" type="button" onclick="teaReg()">我是老师</button>
        </form>
    </div>
</div>

<div id="teaReg">
    <div class="container teacher_container">
        <form class="regbox" name="login" method="post" onsubmit="return check_submit_form();">
            <h1 class="teacher_color">我是老师</h1>
            <h2 class="teacher_color">我要授课</h2>
            <p class="form-group">
                <input type="text" id="teaUsername" name="username" placeholder="用户名"><br>
                <span class="tip">请输入2―16位用户名，由字母、数字组合</span>
            </p>
            <p class="form-group">
                <input type="password" id="teaPassword" name="password" placeholder="密码"><br>
                <span class="tip">请输入6―20位密码，由字母、数字任意组合</span>
            </p>
            <button style="background:#10bae5" class="regbtn" type="button" onclick="submitTea()">注 册</button>
            <span class="tiaokuan">注册代表您已经阅读并同意<a class="teacher_color" href="##">《精英家教网服务条款》</a>
            </span>
            <button class="regbtn" type="button" onclick="stuReg()">我是学生</button>
        </form>
    </div>
</div>
</body>
<jsp:include page="foot.jsp"/>
</html>
<script>
    $(function () {
        $("#stuReg").hide();
        $("#teaReg").hide();
    });

    function stuReg() {
        $("#stuReg").show();
        $("#reg").hide();
        $("#teaReg").hide();
    }

    function teaReg() {
        $("#teaReg").show();
        $("#stuReg").hide();
        $("#reg").hide();
    }

    function submitStu() {
        var username = $("#stuUsername").val();
        var password = $("#stuPassword").val();
        if(username.length < 2 || password.length < 2){
            alert("用户名或密码格式不对");
            return false;
        }
        $.ajax({
            url : "${pageContext.request.contextPath}/user/regist",
            type : "post",
            data : "isTea=0&username="+ username +"&password="+ password,
            success : function(e) {
                alert(e);
                if(e.substring(1,e.length-1) == "no") alert("用户名已注册");
                if(e.substring(1,e.length-1) == "yes") location.href = "${pageContext.request.contextPath}/index.jsp";
            }
        });
    }

    function submitTea() {
        var username = $("#teaUsername").val();
        var password = $("#teaPassword").val();
        if(username.length < 2 || password.length < 2){
            alert("用户名或密码格式不对");
            return false;
        }
        $.ajax({
            url : "${pageContext.request.contextPath}/user/regist",
            type : "post",
            data : "isTea=1&username="+ username +"&password="+ password,
            success : function(e) {
                if(e.substring(1,e.length-1) == "no") alert("用户名已注册");
                if(e.substring(1,e.length-1) == "yes") location.href = "${pageContext.request.contextPath}/index.jsp";
            }
        });
    }
</script>
