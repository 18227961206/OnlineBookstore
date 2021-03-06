<%@ page import="bean.User" %><%--
  Created by IntelliJ IDEA.
  User: MICHAEL
  Date: 2019/6/5
  Time: 21:19
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
    <title>头部导航</title>
    <script>
        $(document).ready(function () {
            //判断是否登录，跳转购物车
            $("#shoppingcarts").click(function () {
                if ($("#search_as_username").html() != null) {
                    window.location.href = "${pageContext.request.contextPath}/theshoppingcart/theshoppingcart.jsp";
                }else {
                    alert("你尚未登录，请登录！");
                }
            });
        });
    </script>
</head>
<body>
<header>
    <!--顶部导航-->
    <div class="container-fluid" style="background-color: #991010;">
        <div class="row">
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 header_div1" align="right">
                <img src="${pageContext.request.contextPath}/image/logo.png" class="img-responsive header_logo_img"
                     alt="">
            </div>

            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 header_div1" align="right">
                <input type="text" class="search" placeholder="输入书名/类别">
                <a href="" class="search_a" style="text-decoration: none">
                    <i class="fa fa-search fa-lg"></i>
                </a>

                <a href="javascript:void(0)" id="shoppingcarts" class="search_as header_ass" style="text-decoration: none">
                    <i class="fa fa-shopping-cart fa-lg"></i>
                </a>
                <%--<a href="javascript:void(0)" class="search_as" style="text-decoration: none">
                    <i class="fa fa-question-circle-o fa-lg"></i>
                </a>--%>
                <c:choose>
                    <c:when test="${usernames eq null}">
                        <a href="javascript:void(0)" class="search_as" data-toggle="modal" data-target="#exampleModal"
                           data-whatever="@mdo" style="margin-right: 3%;text-decoration: none;">
                            <i class="fa fa-user-circle-o fa-lg"></i>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/personalcenter/personalcenter.jsp" class="search_as buyjudgment" id="search_as_username" style="color: white;margin-right: 3%;text-decoration: none;">${usernames}</a>
                    </c:otherwise>
                </c:choose>

            </div>

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 header_div2" align="left" style="padding-right: 0;padding-left: 0">
                <ul class="header_div2_ul_navicon">
                    <li class="navicon"><a href="javascript:void(0)"><i class="fa fa-navicon fa-lg"></i></a></li>
                </ul>
                <ul class="header_div2_ul" id="header_uls">
                    <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/bookcategorypage/psychology.jsp">心理学</a></li>
                    <li><a href="${pageContext.request.contextPath}/bookcategorypage/livetolearn.jsp">生活学</a></li>
                    <li><a href="${pageContext.request.contextPath}/bookcategorypage/foreignlanguagelearning.jsp">外语学</a></li>
                    <li><a href="${pageContext.request.contextPath}/bookcategorypage/motivational.jsp">励志学</a></li>
                    <li><a href="${pageContext.request.contextPath}/bookcategorypage/socialscience.jsp">社科学</a></li>
                    <li><a href="${pageContext.request.contextPath}/bookcategorypage/academic.jsp">学术学</a></li>
                    <li><a href="${pageContext.request.contextPath}/bookcategorypage/technology.jsp">科技学</a></li>
                </ul>
            </div>
        </div>
    </div>

    <!--登录模态框-->
    <div class="the_login">
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" data-backdrop="static">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="text-align: center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                        </button>
                        <img src="${pageContext.request.contextPath}/image/bookstore_logo.jpg" alt=""
                             style="margin-left: 3%;width: 20%;">
                        <h5 style="color: #991010;margin: 0;">账号登录</h5>
                    </div>
                    <div class="modal-body the_login_div">
                        <input type="text" class="form-control" id="username" name="username"
                               placeholder="请输入正确的手机号/QQ邮箱" style="letter-spacing: 1px">
                        <h6>手机号或邮件地址不正确</h6>
                        <input type="password" class="form-control" id="password" name="password"
                               placeholder="请输入正确的密码" style="letter-spacing: 2px;">
                        <!--<input type="checkbox" name="automaticLogin" value="" style="width: 15px;height: 15px;margin-left: 5%;">两周内自动登录-->
                        <h6>密码不正确</h6>
                        <input type="button" class="form-control" id="login" value="登 录">
                        <a href="javascript:void(0)" style="text-decoration: none;">
                            <h6 style="color: black;visibility: visible;">忘记密码？</h6>
                        </a>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" style="float: left;">取消
                        </button>
                        <div style="text-align: right;">
                            <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal"
                                    data-target="#exampleModals" data-whatever="@mdo">注册
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--注册模态框-->
    <div class="registered">
        <div class="modal fade" id="exampleModals" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" data-backdrop="static">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="text-align: center;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                        </button>
                        <h4 style="color: #991010;margin: 0;">账号注册</h4>
                    </div>
                    <div class="modal-body the_registered_div">
                        <input type="text" name="username" class="form-control the_registered_div_input" id="name"
                               placeholder="请输入手机号"
                               style="letter-spacing: 1px" onkeyup="registered(0)">
                        <h6 class="the_registered_div_h6">请输入正确的手机号</h6>

                        <input type="text" name="email" class="form-control the_registered_div_input" id="email"
                               placeholder="请输入QQ邮箱"
                               style="letter-spacing: 1px" onkeyup="registered(1)">
                        <h6 class="the_registered_div_h6">请输入正确的QQ邮箱</h6>

                        <input type="text" name="password01" class="form-control the_registered_div_input"
                               id="passwords01"
                               placeholder="请输入密码" onkeyup="registered(2)">
                        <h6 class="the_registered_div_h6">请输入密码,以字母开头和数字组合(6位字符以上)</h6>

                        <input type="text" name="password02" class="form-control the_registered_div_input"
                               id="passwords02"
                               placeholder="请再次确认密码" onkeyup="registered(3)">
                        <h6 class="the_registered_div_h6">二次密码不正确</h6>

                        <input type="text" name="verification_code" style="width: 50%;float: left;"
                               class="form-control the_registered_div_input"
                               id="verification_code" placeholder="QQ邮箱验证码" onkeyup="registered(4)">
                        <input type="button" class="form-control" id="get_verification_code" style="width: 50%;"
                               value="获取验证码">
                        <h6 style="text-align: left;" class="the_registered_div_h6">验证码错误</h6>

                        <input type="button" class="form-control" id="registered" value="注 册">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" data-toggle="modal"
                                data-target="#exampleModal" data-whatever="@mdo" style="float: left;">返回登录
                        </button>
                        <div style="text-align: right;">
                            <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal"
                                    data-target="#exampleModal" data-whatever="@mdo">已有帐号?
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</header>
</body>
</html>