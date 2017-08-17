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

<div style="width:1000px; line-height:28px;margin:10px auto;">
    <style>.cctxt{font-size:12px; position:relative;line-height: 21px;max-width: 540px;}</style>
    <div><img src="http://thumb.1010pic.com/images/hd/zhaopin8.png" width="800px"></div>
    <div class="cctxt" style="margin-top:-1010px; margin-left:170px; width:470px;line-height: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;武汉青夏网络科技有限公司是一家行业领先的在线教育公司（简称”青夏
        教育“），公司以“培养青年英才，铸就华夏未来”为使命，致力于传统教育
        培训行业的互联网+革命，作为互联网+教育的先行者，通过网站、手机APP、
        微信公众号等多种渠道，为中小学生提供在线练习、在线搜题、在线答疑、在
        线测评、在线视频授课、在线一对一辅导等全方位、多维度服务，帮助学生从
        学习态度、学习计划、学习习惯、学习方法等全面进行改进，从而提高学习成
        绩，提升综合素质。</div>
    <p style="height:85px;"></p>
    <div class="cctxt" style="margin-left:140px;">工作性质：兼职 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        招聘人数：若干名。<br>
        工资待遇：每段视频10-20分钟，费用50元，日收入可达500到1000元左右。<br>
        工作时间：双方协商。&nbsp;&nbsp;&nbsp;&nbsp;地区要求：武汉<br>
        联系电话：027-59710596 QQ：<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=3310059649&amp;site=qq&amp;menu=yes"><img style="vertical-align: bottom;" src="http://wpa.qq.com/pa?p=2:3310059649:51" border="0"></a>（有意者可加QQ了解招聘详情，加好友验证请认真填写自己的学校+擅长科目，否则不予通过验证）<br>
        工作地点：武汉市东湖高新区武大科技园徽商大厦A座507青夏网络科技有限公司<br>
    </div>
    <p style="height:70px;"></p>
    <div class="cctxt" style="margin-left:140px;">1．年龄在18-35岁，要求在读或毕业院校为985或211重点大学； <br>
        2．形象气质佳，普通话标准，发音清晰，语言表达能力强；<br>
        3 . 思维灵活，富有亲和力，有耐心，有责任心，有师德，擅长与学生进行沟通交流。<br>
        4．熟悉中小学生的生活及学习特点，善于因材施教，能开拓发掘组织多种教学方式，灵活教学；<br>
        5．热爱教师工作，有教学经验者优先；<br>
    </div>
    <p style="height:75px;"></p>
    <div class="cctxt" style="margin-left:140px;">1、最初主要是讲解苏教版四年级至九年级《补充习题》，《练习与测试》《课课练》《同步练习》《伴你学》
        上面的易错题。<br>
        2、按照章节进行讲解，每次讲解一个章节的内容。<br>
        3、讲解内容需要包含知识点分析，错题讲解，知识巩固等模块。<br>
        4、视频时长10-20分钟左右。<br>
        5、重难点突出、逻辑思维清晰、气氛活跃、语言生动形象。<br>
        6、至少要求能讲完一本练习册。<br>
    </div>
    <p style="height:275px;"></p>
</div>

<jsp:include page="foot.jsp"/>
</body>
</html>
<script>
    $(function () {

        getStudyDocs(1);

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
                    str += "<li><a class=\"flimg\" href=\"javascript:void(0)\"><img src=\"${pageContext.request.contextPath}/images/test_subject.jpg\"></a><div class=\"rbox\"><p class=\"title\"><a href=\"${pageContext.request.contextPath}/teacherInfo.jsp?id="+ obj[i].id +"\">" + obj[i].title + "</a></p></li>";
                }
                $("#subs").html(str);
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
