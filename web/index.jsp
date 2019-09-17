<%--
  Created by IntelliJ IDEA.
  User: MICHAEL
  Date: 2019/6/5
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon " type="images/x-icon" href="${pageContext.request.contextPath}/image/bookstore_logo.jpg">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookinformation.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/header.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/myDate.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/pageturn.js"></script>
    <title>书城首页</title>
    <%--轮播图图片控制--%>
    <style type="text/css">
        #carousel-example-generic img {
            width: 100%;
        }
    </style>
    <%--轮播图时间控制--%>
    <script>
        $(function () {
            $('#carousel-example-generic').carousel({interval: 2000});

        });
    </script>
</head>
<body>
<%--书城首页--%>

<%--引入顶部导航--%>
<jsp:include page="header/header.jsp" flush="true"/>

<%--首页轮播图--%>
<div style="width: 100%;">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            <li data-target="#carousel-example-generic" data-slide-to="4"></li>
            <li data-target="#carousel-example-generic" data-slide-to="5"></li>
        </ol>

        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="image/shufflingfigure01.jpg" alt="">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img src="image/shufflingfigure02.jpg" alt="">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img src="image/shufflingfigure03.jpg" alt="">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img src="image/shufflingfigure04.jpg" alt="">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img src="image/shufflingfigure05.jpg" alt="">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img src="image/shufflingfigure06.jpg" alt="">
                <div class="carousel-caption">
                </div>
            </div>

            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <script>
        $(function () {
            $('#carousel-example-generic').carousel({interval: 2000});
        });
    </script>
</div>

<%--数据展示--%>
<jsp:include page="bookinformation/bookinformation.jsp" flush="true"/>

<%--尾部导航--%>
<jsp:include page="footer/footer.jsp" flush="true"/>

<script>
    $(document).ready(function () {
        $("#header_uls li").eq(0).css("background-color", "#710e0f");
        $("#header_uls a").eq(0).css("color", "#ffd32f");
    })
</script>
</body>
</html>
