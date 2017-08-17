<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<%--<head>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>--%>
<jsp:include page="head.jsp"/>
<body>
<%--<div id="logo-intro" class="pc_main_box">
    <div class="left">
        <div class="logo l"><h1>每时在线家教网</h1>
        </div>
    </div>
    <div class="right">
        <div id="login_status" class="loginbox">
            <form method="post" id="lsform" action="#">
                用户名：<input type="text" name="username" id="ls_username" autocomplete="off" class="px"
                           tabindex="901"><br>密　码：<input type="password" name="password" id="ls_password" class="px"
                                                         autocomplete="off" tabindex="902"><br>
                <button type="submit" class="btn log" tabindex="904">登　录</button>
                <a class="reg" href="#">还没注册？立即注册&gt;&gt;</a></form>
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
            <li><a href="#">学生入口</a></li>
            <li><a href="#">学生入口</a></li>
            <li><a href="#" target="_blank">实用文档</a></li>
            <li><a href="#">老师招聘</a></li>
        </ul>
        <div class="link"><img src="${pageContext.request.contextPath}/images/play.png"><a
                href="#" rel="nofollow">个人中心</a></div>
    </div>
</div>--%>
<div id="contentA" class="pc_main_box">
    <div class="left">
        <div class="box boxC">
            <h4>高中</h4>
            <p id="gc">
                <%--<a href="http://www.1010jiajiao.com/czdl/index.php">地理</a>--%>
            </p>
        </div>
        <div class="box boxB">
            <h4>初中</h4>
            <p id="cc">
                <%--<a href="http://www.1010jiajiao.com/czdl/index.php">地理</a>--%>
            </p>
        </div>
        <div class="box boxA">
            <h4>小学</h4>
            <p id="xc">
                <%--<a href="http://www.1010jiajiao.com/xxyw/index.php">语文</a>
                <a href="http://www.1010jiajiao.com/xxsx/index.php">数学</a>--%>
            </p>
        </div>
    </div>
    <div class="center">
        <div id="MDC_FocusImage_2" class="fi07">
            <div class="fi07_1" id="MDC_FocusImage_2_1">
                <div class="fi_ct">
                    <div class="fi_list" style="left: 0px;"><img src="${pageContext.request.contextPath}/images/1.jpg"><img
                            src="${pageContext.request.contextPath}/images/2.jpg"><img
                            src="${pageContext.request.contextPath}/images/3.jpg"></div>
                    <div class="fi_ovl" style="opacity: 0.5; width: 530px;"></div>
                    <div class="fi_tt"><span></span></div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            jQuery("#MDC_FocusImage_2").focusImg(
                {"speed": "5000", "flag": "fi07", "hoverStop": true}, [

                    {
                        "p": "${pageContext.request.contextPath}/images/1.jpg",
                        "l": "#",
                        "t": "<span></span>"
                    },
                    {
                        "p": "${pageContext.request.contextPath}/images/2.jpg",
                        "l": "#",
                        "t": "<span></span>"
                    },

                    {
                        "p": "${pageContext.request.contextPath}/images/3.jpg",
                        "l": "#",
                        "t": "<span></span>"
                    }
                ]);
        </script>
    </div>
</div>
<div class="pc_main_box pub">
    <div class="px-class oveh">
        <div class="cut-title">
            <div class="l"><span><a href="#" target="_blank">课程列表</a></span></div>
        </div>
        <div class="center" id="slist">
            <%--<div style="width:220px;height:150px;float:left;text-align:center;padding:5px;margin: 0 5px;cursor:pointer;">
                <img src="http://image.jiandan100.cn/data/images/cover/879430_p.jpg" alt="2016-2017年度初二英语同步基础下学期课程(人教版)"
                     style="width:200px;height:120px;"><br>
                2016-2017年度初二英语同步基础下学期课程(人教版)
            </div>--%>
        </div>
    </div>
    <div class="cut-title">
        <div class="l"><span><a href="#" target="_blank">学习文档</a></span></div>
    </div>
    <div class="center">
        <div class="pic-group" style="text-align: center">
            <ul id="sd">
                <%--<li><a href="#" target="_blank"><img src="#"
                        style="width:110px;height:150px"><span
                        class="layer-txt"><i></i><em>2017年同步练习七年级语文下册人教版浙江教育出版社</em></span></a>
                </li>--%>
            </ul>
        </div>
    </div>
</div>
<jsp:include page="foot.jsp"/>
<%--<div class="clear"></div>
<div id="foot" class="pc_main_box">
    <div class="links"><a href="http://www.1010jiajiao.com/flink/">友情链接：</a><a href="http://www.koolearn.com/"
                                                                               target="_blank">新东方在线</a><a
            href="http://www.ynpxrz.com/" target="_blank">易贤网</a><a href="http://www.7wenta.com/" target="_blank">问他</a><a
            href="http://www.xuexila.com/" target="_blank">学习啦</a><a href="http://zuowen.mofangge.com/" target="_blank">作文网</a><a
            href="http://www.05wang.com/" target="_blank">零五网</a></div>
    <div class="foot_info">
        <p><a href="http://www.1010jiajiao.com/daan/baidu.php">百度致信</a></p>
        <span style="font-size:8px;color:grey">版权声明：本站所有文章，图片来源于网络，著作权及版权归原作者所有，转载无意侵犯版权，如有侵权，请作者速来函告知，我们将尽快处理，联系qq：800027063。</span>
        <br>ICP备案序号:<a href="http://www.miibeian.gov.cn">沪ICP备07509807号</a> <a style="color:red"
                                                                               href="http://www.1010jiajiao.com/daan/feedback.php"
                                                                               target="_blank">意见反馈箱</a>
    </div>
</div>--%>
</body>
</html>
<script>
    $(function () {

        //根据年级加载科目
        getCourseByGrade(1, "xc");
        getCourseByGrade(2, "cc");
        getCourseByGrade(3, "gc");

        //获取课程列表
        getSubjectList();
        //获取学习文档列表
        getStudyDocs();

    });

    function getCourseByGrade(id, domId) {
        $.ajax({
            url : "${pageContext.request.contextPath}/course/getCoursesByGrade",
            type : "get",
            data : "gradeId="+ id,
            success : function(data) {
                var gradeName = encodeURI(encodeURI($("#"+ domId).prev().text()));
                var obj = $.parseJSON(data);
                var str = "";
                for(var i = 0; i < obj.length; i++){
                    var courseName = encodeURI(encodeURI(obj[i].name));
                    str += "<a href=\"${pageContext.request.contextPath}/subjects.jsp?gradeName="+ gradeName +"&courseName="+ courseName +"&id="+ obj[i].id +"\">"+ obj[i].name +"</a>";
                }
                $("#"+domId).html(str);
            }
        });
    }

    function getSubjectList() {
        $.ajax({
            url : "${pageContext.request.contextPath}/subject/getSubjects",
            type : "get",
            data : "index=1",
            success : function(data) {
                var obj = $.parseJSON(data);
                var str = "";
                for(var i = 0; i < obj.length; i++) {
                    str += "<div style=\"width:220px;height:150px;float:left;text-align:center;padding:5px;margin: 0 5px;cursor:pointer;\"><a href=\"${pageContext.request.contextPath}/subjectInfo.jsp?id="+ obj[i].id +"\"><img src=\"${pageContext.request.contextPath}/images/test_subject.jpg\" style=\"width:200px;height:120px;\"><br>"+ obj[i].title +"</a></div>";
                }
                $("#slist").html(str);
            }
        });
    }

    function getStudyDocs() {
        $.ajax({
            url : "${pageContext.request.contextPath}/studyDoc/getStudyDocs",
            type : "get",
            data : "index=1",
            success : function(data) {
                var obj = $.parseJSON(data);
                var str = "";
                for(var i = 0; i < obj.length; i++) {
                    str += "<li><a href=\"${pageContext.request.contextPath}/studyDocInfo.jsp?id="+ obj[i].id +"\"><img src=\"${pageContext.request.contextPath}/images/test_studyDoc.jpg\" style=\"width:110px;height:150px\"><span class=\"layer-txt\"><i></i><em>"+ obj[i].title +"</em></span></a></li>";
                }
                $("#sd").html(str);
            }
        });
    }
</script>
