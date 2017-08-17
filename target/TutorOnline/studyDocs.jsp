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
    <div class="gbox">
        <p class="sty1"><a id="t" href="#">学习文档</a></p>
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
    $(function () {

        getStudyDocs(1);
        getPage();

    });

    function getStudyDocs(index) {
        $.ajax({
            url: "${pageContext.request.contextPath}/studyDoc/getStudyDocs",
            type: "get",
            data: "index="+ index,
            success: function (data) {
                var obj = $.parseJSON(data);
                var str = "";
                for (var i = 0; i < obj.length; i++) {
                   str += "<li><a class=\"flimg\" href=\"javascript:void(0)\"><img src=\"${pageContext.request.contextPath}/images/test_subject.jpg\"></a><div class=\"rbox\"><p class=\"title\"><a href=\"${pageContext.request.contextPath}/studyDocInfo.jsp?id="+ obj[i].id +"\">" + obj[i].title + "</a></p><div class=\"des\"></div><div class=\"btn5\" onclick=\"download("+ obj[i].id +")\">免费下载</div></div></li>";
                }
                $("#subs").html(str);
            }
        });
    }

    function getPage() {
        $.ajax({
            url: "${pageContext.request.contextPath}/studyDoc/getStudyDocsPage",
            type: "get",
            success: function (data) {
                var str = "";
                for (var i = 1; i <= data; i++) {
                    str += "<a href=\"#\" onclick=\"getStudyDocs("+ i +")\">"+ i +"</a>&nbsp";
                }
                $("#page").html(str);
            }
        });
    }

    function download(id) {
        location.href = "${pageContext.request.contextPath}/studyDoc/download?id="+ id;
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
