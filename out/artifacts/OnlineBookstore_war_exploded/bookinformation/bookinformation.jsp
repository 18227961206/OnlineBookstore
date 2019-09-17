<%--
  Created by IntelliJ IDEA.
  User: MICHAEL
  Date: 2019/6/21
  Time: 12:35
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
    <title>书信息</title>
</head>
<body>
<%
    int n = 0;
%>
<div class="container" id="bookinformations">
    <div class="row" style="margin-left: 0;margin-right: 0;padding-top: 5%;padding-bottom: 5%;">
        <div id="content" style="width: 100%;height: 100%;">
            <div id="displayContent" style="width: 100%;height: 100%;">
                <c:forEach var="bookUserList" items="${bookUserList}">
                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 index_section" align="center">
                        <img src="${pageContext.request.contextPath}/image/psychology/${bookUserList.bookimage}"
                             class="img-responsive index_section_img" alt="">
                        <br>
                        <a href="${pageContext.request.contextPath}/Index?serial_number=${bookUserList.id}"
                           class="index_section_a">${bookUserList.bookname}</a>
                        <h4 style="text-align: center;" class="index_section_money">
                            <strong style="color: #991010;">￥</strong>
                            <strong class="index_section_moneys">${bookUserList.bookmoney}</strong>
                            &nbsp;&nbsp;
                            <span style="font-size: 1rem;" class="special_optimization">特价优选</span>
                        </h4>
                        <a href="${pageContext.request.contextPath}/Index?serial_number=${bookUserList.id}"
                           class="index_the_author">作者：${bookUserList.booktheauthor}</a>
                        <br>
                        <a href="javascript:void(0)" onclick="Addtocart(<%=n++%>);" class="add_to_cart">
                            <i class="fa fa-shopping-cart fa">加入购物车</i>
                        </a>
                        <br><br>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <div id="paging" style="width: 100%;padding-bottom: 5%;" align="center">
        <ul class="pagination" id="paging_ul" style="margin: 0;">
            <li><a id="prev-page">«</a></li>
            <c:forEach var="count" begin="1" end="${counts}">
                <li class="paging_ul_li">
                    <a href="javascript:void(0)" id="paging_ul_li_a${count}" class="paging_ul_li_a">${count}</a>
                </li>
            </c:forEach>
            <li><a id="next-page">»</a></li>
        </ul>
    </div>

    <div id="shopping_cart_tip">
        <div style="margin-top: 12%;" class="modal fade" id="myModal" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" data-backdrop="static">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #ac2925;border-radius: 4px">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true" style="color: white;">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel" style="color: white">提示</h4>
                    </div>
                    <div class="modal-body modal_information_div" align="center">
                        <h4>商品已成功添加到购物车！</h4>
                        <br>
                        <a href="${pageContext.request.contextPath}/theshoppingcart/theshoppingcart.jsp"
                           class="modal_information_div_a">去购物车并结算</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0)" class="modal_information_div_a" data-dismiss="modal"
                           style="background-color: #999999">继续购物</a>
                        <br><br>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>