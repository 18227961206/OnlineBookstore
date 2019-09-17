$(document).ready(function () {
    //设置全选
    $("#checkall").prop("checked", true);
    for (var a = 0; a < $(".checkboxs").length; a++) {
        $(".checkboxs").eq(a).attr("checked", true);
        var moneys = $(".the_shopping_moneys").eq(a).html() * 1.2;
        $(".the_shopping_cart_money").eq(a).html(moneys.toFixed(2));
    }

    //初始化订单页面
    OrderCalculate();

    //全选
    $("#checkall").click(function () {
        if ($(this).is(':checked')) {
            $(".checkboxs").each(function () {
                $(this).prop("checked", true);
            });
            OrderCalculate();
        } else {
            $(".checkboxs").each(function () {
                $(this).prop("checked", false);
            });
            OrderCalculate();
        }
    });

    //判断当全选时	若有一个不选 全选按钮为不选状态
    $(".checkboxs").click(function () {
        var checkedLength = $(".checkbox:checked").length;
        var checkLength = $(".checkboxs").length;
        if (checkLength === checkedLength) {
            $("#checkall").prop("checked", true);
            OrderCalculate();
            return true;
        } else {
            $("#checkall").prop("checked", false);
            OrderCalculate();
            return true;
        }
    });

    //每一个订单的数量
    var the_shopping_cart_count = $(".the_shopping_cart_count");
    for (var b = 0; b < the_shopping_cart_count.length; b++) {
        the_shopping_cart_count[b].index = b;
        the_shopping_cart_count[b].onclick = function () {
            if (the_shopping_cart_count.eq(this.index).val() <= 0) {
                the_shopping_cart_count.eq(this.index).val("0");
                OrderCalculate();
            } else {
                OrderCalculate();
            }
        }
    }

    //删除订单事件
    var deletes = $(".deletes");
    var shoppingids = $(".shoppingids");
    for (var n = 0; n < deletes.length; n++) {
        deletes[n].index = n;
        deletes[n].indexx = n;
        deletes[n].onclick = function () {
            $(".trs").eq(this.index).remove();
            OrderCalculate();
            $.ajax({
                type: "POST",
                url: "../TheShoppingDelete?shoppingids=" + shoppingids.eq(this.indexx).html(),
                dataType: "text",
                scriptCharset: "utf-8",
                success: function (data) {
                    if (data !== "true") {
                        alert("删除失败!");
                    }
                },
                error: function () {
                    alert("删除失败!");
                }
            })
        }
    }

    //商品结算
    $("#settlement").click(function () {
        var count = 0;//总数量
        var checkbox = $(".checkboxs");//订单选择
        var the_shopping_cart_count = $(".the_shopping_cart_count");//每一个订单的数量
        for (var i = 0; i < checkbox.length; i++) {
            if (checkbox.eq(i).prop("checked")) { //选中
                count += parseInt(the_shopping_cart_count.eq(i).val());
            }
        }
        if (count > 0) {
            alert("支付成功");
            window.location.href = "../index.jsp";
        } else {
            alert("请选择支付的商品");
        }
    })

});


//订单数量和总金额的计算
function OrderCalculate() {
    var checkbox = $(".checkboxs");//订单选择
    var the_shopping_cart_count = $(".the_shopping_cart_count");//每一个订单的数量
    var the_shopping_moneys = $(".the_shopping_moneys");//每一个订单的金额
    var counts = $("#counts");//每一个选中的订单数量
    var total_price = $(".total_price");//总金额

    var money = 0;//总金额
    var count = 0;//总数量
    for (var i = 0; i < checkbox.length; i++) {
        if (checkbox.eq(i).prop("checked")) { //选中
            count += parseInt(the_shopping_cart_count.eq(i).val());
            money += the_shopping_cart_count.eq(i).val() * parseFloat(the_shopping_moneys.eq(i).html());
        }
    }

    //设置选中订单数量和总金额
    counts.html(count);
    total_price.eq(0).html(money.toFixed(2));
    total_price.eq(1).html(money.toFixed(2));
}