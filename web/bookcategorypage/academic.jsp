<%--
  Created by IntelliJ IDEA.
  User: MICHAEL
  Date: 2019/6/21
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/header2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bookinformation.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/myDate.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/pageturn.js"></script>
    <title>学术学</title>
</head>
<body>
<%--学术学--%>

<%--引入顶部导航--%>
<jsp:include page="../header/header.jsp" flush="true"/>

<%--数据展示--%>
<jsp:include page="../bookinformation/bookinformation.jsp" flush="true"/>

<%--尾部导航--%>
<jsp:include page="../footer/footer.jsp" flush="true"/>

<script>
    $(document).ready(function () {
        $("#header_uls li").eq(6).css("background-color","#710e0f");
        $("#header_uls a").eq(6).css("color", "#ffd32f");
    })
</script>
</body>
</html>
