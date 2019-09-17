<%--
  Created by IntelliJ IDEA.
  User: MICHAEL
  Date: 2019/6/13
  Time: 16:58
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/theshoppingcart.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/header.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/theshoppingcart.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/myDate.js"></script>
    <title>购物车</title>
    <script>

    </script>
</head>
<body>
<%--引入顶部导航--%>
<jsp:include page="../header/header.jsp" flush="true"/>

<%--内容--%>
<section>
    <div class="container" style="padding-top: 5%;padding-bottom: 5%">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">

                <div class="table-responsive" style="margin-bottom: 0;padding-bottom: 0;">
                    <table style="margin-bottom: 0;border: 3px solid #999999;" border="1" id="the_shopping_cart"
                           class="table table-hover">
                        <tr>
                            <th style="width: 5%">选择</th>
                            <th>商品</th>
                            <th style="width: 10%;">定价</th>
                            <th style="width: 10%;">您的价格</th>
                            <th style="width: 10%;">数量</th>
                            <th style="width: 10%;">单品总价</th>
                            <th style="width: 5%;">操作</th>
                        </tr>
                        <c:forEach var="bookShoppingCartList" items="${bookShoppingCartList}">
                            <tr class="trs">
                                <td>
                                    <input type="checkbox" name="checkbox" class="checkboxs"
                                           style="width: 15px;height: 15px;">
                                </td>
                                <td class="book_information">
                                    <img src="${pageContext.request.contextPath}/image/psychology/${bookShoppingCartList.bookimage}"
                                         class="book_information_img" alt="">
                                    <a href="javascript:void(0)" style="margin-left: 2%;"
                                       class="book_information_a">${bookShoppingCartList.bookname}</a>
                                    <h5 class="ordernumber">订单编号：${bookShoppingCartList.booktheordernumber}</h5>
                                </td>
                                <td>
                                    <h5 class="the_shopping_cart_money_h5" style="color: #999999;">￥<span
                                            class="the_shopping_cart_money">104.23</span></h5>
                                </td>
                                <td>
                                    <h4 class="the_shopping_money" style="color: red;">
                                        <strong>￥</strong>
                                        <strong class="the_shopping_money">${bookShoppingCartList.bookmoney}</strong>
                                    </h4>
                                </td>
                                <td>
                                    <input class="quantity-label the_shopping_cart_count" type="number" value="1">
                                </td>
                                <td>
                                    <h4 class="the_shopping_money" style="color: red;">
                                        <strong>￥</strong>
                                        <strong class="the_shopping_moneys">${bookShoppingCartList.bookmoney}</strong>
                                    </h4>
                                </td>
                                <td>
                                    <span style="display: none;" class="shoppingids">${bookShoppingCartList.id}</span>
                                    <a href="javascript:void(0)" class="deletes">
                                        <i class="fa fa-trash-o fa-lg"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>

                <table style="margin-top: 0;padding-top: 0;width: 100%;border: 3px solid #999999;" id="the_shopping_cart02" class="table">
                    <tr style="width: 100%;">
                        <td style="width: 10%;">
                            <input type="checkbox" name="checkbox" id="checkall"
                                   style="margin-top: 15%;margin-left: 1%;width: 15px;height: 15px;margin-right: 1%;">
                            全选
                        </td>
                        <td style="text-align: right;padding-right: 5%">
                            <h5>
                                共 <strong style="color: red;font-size: 1.5rem;" id="counts">2</strong>件商品，商品金额共计：
                                <strong style="color: red;font-size: 1.5rem;" class="total_price">￥85.00</strong>
                            </h5>
                            <h5>
                                总计：<strong style="color: red;font-size: 2rem;" class="total_price">￥85.00</strong>
                            </h5>
                        </td>
                    </tr>
                </table>

                <div id="operation" style="width: 100%;padding: 2%;" align="center">
                    <a href="${pageContext.request.contextPath}/index.jsp" class="operation_a01"><i
                            class="fa fa-angle-double-left fa-lg"></i>&nbsp;&nbsp;&nbsp;继续购物</a>
                    <a href="javascript:void(0)" class="operation_a02" id="settlement">￥&nbsp;&nbsp;&nbsp;商品结算</a>
                </div>
            </div>
        </div>
    </div>
</section>

<%--尾部导航--%>
<jsp:include page="../footer/footer.jsp" flush="true"/>

<script>
    $(document).ready(function () {
        $("#shoppingcarts").css("background-color","#710e0f");
    })
</script>
</body>
</html>
