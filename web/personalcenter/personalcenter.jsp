<%--
  Created by IntelliJ IDEA.
  User: MICHAEL
  Date: 2019/6/22
  Time: 15:29
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalcenter.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/personalcenter.js"></script>
    <title>个人中心</title>
</head>
<body>

<c:forEach var="centerUsers" items="${centerUsers}">
    <header>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="height: 50px;background-color: #991010;">
                    <div class="container" style="height: 100%;padding: 0">
                        <div class="row" style="height: 100%;">

                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-2 centers"
                                 style="padding-left: 10px;height: 100%;">
                                <img src="${pageContext.request.contextPath}/image/bookstore_logo.jpg" alt=""
                                     style="height: 80%;margin-top: 1%;border-radius: 50%;float: left;margin-right: 10px">
                                <strong class="logos">
                                <span style="color: white;display: block;margin-top: 3%;letter-spacing: 2px;font-size: 1.1em;">
                                    书城网--找书籍(会员中心)
                                </span>
                                </strong>
                            </div>

                            <div id="center" class="col-lg-7 col-md-7 col-sm-7 col-xs-10"
                                 style="padding-right: 0;height: 100%;" align="right">
                                <a href="javascript:void(0)" id="exits">退出</a>
                                <a href="javascript:void(0)"
                                   style="background-color: #710e0f">${centerUsers.username}</a>
                                <a href="${pageContext.request.contextPath}/theshoppingcart/theshoppingcart.jsp">购物车</a>
                                <a href="${pageContext.request.contextPath}/index.jsp" id="home_page">首页</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <section>
        <div class="container-fluid" style="padding: 5%;margin: 0;background-color: #F1F1F1;">
            <div class="row" style="padding: 0;margin: 0;">
                <h6>当前位置：会员中心 > 个人资料</h6>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 section_div"
                     style="padding: 3%;background-color: white;border: 2px solid #E5E5E5;">
                    <h3>基本信息</h3>
                    <br>
                    <h4>
                        &nbsp;&nbsp;&nbsp;&nbsp;用户名：
                        <strong>${centerUsers.username}</strong>
                    </h4>
                    <h4>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱：
                        <strong>2280514662@qq.com</strong>
                    </h4>
                    <h4>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别：
                        <label>
                            <select>
                                <c:choose>
                                    <c:when test="${centerUsers.gender eq null}">
                                        <option style="display: none">请选择</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option style="display: none">${centerUsers.gender}</option>
                                    </c:otherwise>
                                </c:choose>
                                <option>男</option>
                                <option>女</option>
                            </select>
                        </label>
                    </h4>

                    <h4>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职业：
                        <label>
                            <select>
                                <c:choose>
                                    <c:when test="${centerUsers.professional eq null}">
                                        <option style="display: none">请选择</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option style="display: none">${centerUsers.professional}</option>
                                    </c:otherwise>
                                </c:choose>
                                <option>学生</option>
                                <option>作者</option>
                                <option>老师</option>
                                <option>学习者</option>
                                <option>设计师</option>
                                <option>灵魂师</option>
                            </select>
                        </label>
                    </h4>
                    <h4>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标签：
                        <label>
                            <select>
                                <c:choose>
                                    <c:when test="${centerUsers.label eq null}">
                                        <option style="display: none">请选择</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option style="display: none">${centerUsers.label}</option>
                                    </c:otherwise>
                                </c:choose>
                                <option>画册</option>
                                <option>名片</option>
                                <option>海报</option>
                                <option>插画</option>
                                <option>标志</option>
                                <option>包装</option>
                                <option>摄影</option>
                                <option>服装</option>
                                <option>界面</option>
                                <option>网页</option>
                                <option>产品</option>
                                <option>建筑</option>
                                <option>广告</option>
                            </select>
                        </label>
                    </h4>
                    <h4>
                        &nbsp;&nbsp;&nbsp;&nbsp;用户名：
                        <input type="text" name="username" id="username" value="${centerUsers.username}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;可修改
                    </h4>
                    <h4>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码：
                        <input type="text" name="password" id="password" value="${centerUsers.password}">
                        &nbsp;&nbsp;&nbsp;&nbsp;可修改
                    </h4>
                    <h4>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱：
                        <input type="email" name="email" id="email" value="${centerUsers.email}">
                        &nbsp;&nbsp;&nbsp;&nbsp;可修改
                    </h4>
                    <h4>
                        &nbsp;个性签名：
                        <textarea style="overflow: hidden" id="textarea" class="textarea" name="signature"
                                  placeholder="50字以内">${centerUsers.textarea}</textarea>
                        &nbsp;&nbsp;&nbsp;&nbsp;可修改
                    </h4>
                    <h4>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" id="submit" name="button" value="提 交">
                    </h4>
                </div>
            </div>
        </div>
    </section>
</c:forEach>

<%--尾部导航--%>
<jsp:include page="../footer/footer.jsp" flush="true"/>

</body>
</html>