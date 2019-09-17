/*$(document).ready(function () {
    /!*收藏事件*!/
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

    /!*评分事件*!/
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
});*/
