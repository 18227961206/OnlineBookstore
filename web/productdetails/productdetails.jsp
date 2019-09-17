<%--
  Created by IntelliJ IDEA.
  User: MICHAEL
  Date: 2019/6/12
  Time: 17:20
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productdetails.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/header.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/productdetails.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/myDate.js"></script>
    <title>商品详情</title>
    <style type="text/css">

    </style>
    <script>
        $(document).ready(function () {
            /*收藏事件*/
            var oA = $(".collection");
            var oIs = $(".collections");
            for (var a = 0; a < oA.length; a++) {
                oA[a].index = a;
                oA[a].onclick = function () {
                    if (oIs.eq(this.index).html() === "收藏") {
                        oIs.eq(this.index).html("已收藏");
                        oIs.eq(this.index).css("color", "#FF0000");
                    } else {
                        oIs.eq(this.index).html("收藏");
                        oIs.eq(this.index).css("color", "#ffffff");
                    }
                }
            }

            /*评分事件*/
            var oH5_oI = $(".score");
            for (var b = 0; b < oH5_oI.length; b++) {
                oH5_oI[b].indexs = b;
                oH5_oI[b].onclick = function () {
                    if (this.indexs === 0) {
                        oH5_oI.eq(0).css("color", "#FF0000");
                    } else {
                        for (var j = 0; j < this.indexs + 1; j++) {
                            oH5_oI.eq(j).css("color", "#FF0000");
                        }
                    }
                }
            }

            //加入购物车事件
            var bookname = $("#productdetails_book_name");//书名
            var bookimage = $("#productdetailsimg");//书图片
            var bookmoney = $("#money");//书定价
            //获取图片名称
            var img = bookimage.attr("src");
            var bookimagefilename = img.substring(img.lastIndexOf("/") + 1, img.length);
            $("#add_to_cart").click(function () {
                    if ($("#search_as_username").html() != null) {
                        $.ajax({
                            type: "POST",
                            url: "TheShoppingCart?booknamecart=" + bookname.html() + "&bookimagecart=" + bookimagefilename +
                                "&bookmoneycart=" + bookmoney.html() + "&booktheordernumber=" + Dates(),
                            dataType: "text",
                            scriptCharset: "utf-8",
                            success: function (data) {
                                if (data === "true") {
                                    window.location.href = "${pageContext.request.contextPath}/theshoppingcart/theshoppingcart.jsp";
                                } else {
                                    alert("加入购物车失败！");
                                }
                            },
                            error: function () {
                                alert("加入购物车失败");
                            }
                        });
                    }else {
                        alert("你尚未登录，请登录");
                    }
                }
            );
        });
    </script>
</head>
<body>

<%--引入顶部导航--%>
<jsp:include page="../header/header.jsp" flush="true"/>

<%--内容--%>
<section>
    <div class="container productdetails">
        <div class="row">
            <c:forEach var="bookInformationList" items="${bookInformationList}">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 productdetails_div">
                    <br><br><br>
                    <h4 class="productdetails_book_name"
                        id="productdetails_book_name">${bookInformationList.bookname}</h4>
                    <br>
                    <div class="row productdetails_divs">
                        <div class="col-lg-5 col-md-5 col-sm-4 col-xs-12 productdetails_div01" align="center">
                            <img src="${pageContext.request.contextPath}/image/psychology/${bookInformationList.bookimage}"
                                 class="img-responsive" id="productdetailsimg" alt="">
                        </div>
                        <div class="col-lg-7 col-md-7 col-sm-8 col-xs-12 productdetails_div02" style="padding: 0;"
                             align="left">
                            <h5 class="productdetails_div02_h501" style="color: #999999;">
                                定价：￥
                                <span id="pricing">101.32</span>
                            </h5>
                            <h5 class="productdetails_div02_h502">
                                会员价：<span style="color: red;">￥</span>
                                <strong id="money">${bookInformationList.bookmoney}</strong>
                            </h5>
                            <h5 class="productdetails_div02_h503">
                                校园优惠价：
                                <strong>￥${bookInformationList.bookmoney}</strong>
                            </h5>
                            <h5 class="productdetails_div02_h504">
                                评分：
                                <a href="javascript:void(0)" class="productdetails_div02_h504_a">
                                    <i class="fa fa-star fa-lg score"></i>
                                    <i class="fa fa-star fa-lg score"></i>
                                    <i class="fa fa-star fa-lg score"></i>
                                    <i class="fa fa-star fa-lg score"></i>
                                    <i class="fa fa-star fa-lg score"></i>
                                </a>
                            </h5>
                            <div class="productdetails_div02_01">
                                <a href="javascript:void(0)" class="add_to_cart" id="add_to_cart">
                                    <i class="fa fa-shopping-cart">加入购物车</i>
                                </a>
                                <a href="javascript:void(0)" class="collection">
                                    <i class="fa fa-star collections">收藏</i>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="row productdetails_divs">
                        <h6 class="" style="padding: 1%;width: 100%;background-color: #E4F0FE">基本信息</h6>
                        <h5>
                            作者：
                            <a href="javascript:void(0)">
                                    ${bookInformationList.booktheauthor}
                            </a>
                        </h5>
                        <h5>书名：<a href="javascript:void(0)">${bookInformationList.bookname}</a></h5>
                        <h5>上架时间：<a href="javascript:void(0)">${bookInformationList.bookshelftime}</a></h5>
                        <h5>出版日期：${bookInformationList.bookdateofpublication}</h5>
                        <h5>开本：${bookInformationList.booksize}</h5>
                        <h5>版次：${bookInformationList.bookedition}</h5>
                        <h5>所属分类：${bookInformationList.bookcategorys}</h5>
                    </div>

                    <div class="row productdetails_divs">
                        <h6 class="" style="padding: 1%;width: 100%;background-color: #E4F0FE">内容简介</h6>
                        <h5 style="letter-spacing: 2px;line-height: 1.5em;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bookInformationList.bookinformation}
                        </h5>
                    </div>
                    <br><br><br>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<%--尾部导航--%>
<jsp:include page="../footer/footer.jsp" flush="true"/>

<script>
    var pricing = $("#pricing");
    var money = $("#money");
    pricing.html((money.html() * 1.2).toFixed(2))
</script>

</body>
</html>
