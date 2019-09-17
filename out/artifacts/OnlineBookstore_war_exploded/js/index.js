$(document).ready(function () {
    //分页区翻页事件
    for (var i = 3; i < $(".paging_ul_li_a").length; i++) {//显示前三个
        $(".paging_ul_li_a").eq(i).css("display", "none");
    }
    var size = $(".paging_ul_li").length;//获取一共多少页
    var aid = "paging_ul_li_a"; //每一页a标签id的前缀
    var prev_click = true;
    var next_click = true;
    $('#prev-page').bind('click', function () {
        if (prev_click) {
            prev_click = false;
            var get_value = get_segment(aid, size);
            var start = get_value[0], end = get_value[1];

            if (start > 1) {
                prev_page_turn(aid, start, end, 3);
            }
            setTimeout(function () {
                prev_click = true;
            }, 200);
        }
    });

    $('#next-page').bind('click', function () {
        if (next_click) {
            next_click = false;
            var get_value = get_segment(aid, size);
            var start = get_value[0], end = get_value[1];

            if (end < size) {
                next_page_turn(aid, start, end, 3, size);
            }
            setTimeout(function () {
                next_click = true;
            }, 200);
        }
    });

    //页数点击事件,数据刷新
    var paging_ul_li_a = $("#paging .paging_ul_li_a");
    paging_ul_li_a.eq(0).css("background-color", "#d3dcff");
    for (var i = 0; i < paging_ul_li_a.length; i++) {
        paging_ul_li_a[i].index = i;
        paging_ul_li_a[i].indexs = i;
        paging_ul_li_a[i].onclick = function () {
            for (var j = 0; j < paging_ul_li_a.length; j++) {
                paging_ul_li_a.eq(j).css("background-color", "#ffffff");
            }
            paging_ul_li_a.eq(this.index).css("background-color", "#d3dcff");
            $.ajax({
                type: "POST",
                url: "Paging?countPaging=" + this.indexs,
                dataType: "text",
                scriptCharset: "utf-8",
                success: function (data) {
                    if (data === "true") {
                        $("#content").load(location.href + " #displayContent");
                        as();
                    } else {
                        alert("服务器繁忙！");
                    }
                },
                error: function () {
                    alert("服务器繁忙！");
                }
            })
        }
    }
});

function Addtocart(n) {
    //数据加入购物车事件
    var bookname = $(".index_section_a");//书名
    var bookimage = $(".index_section_img");//书图片
    var bookmoney = $(".index_section_moneys");//书定价
    if ($("#search_as_username").html() != null) {
        //获取图片名称
        var img = bookimage.eq(n).attr("src");
        var bookimagefilename = img.substring(img.lastIndexOf("/") + 1, img.length);
        $.ajax({
            type: "POST",
            url: "TheShoppingCart?booknamecart=" + bookname.eq(n).html() + "&bookimagecart=" + bookimagefilename +
                "&bookmoneycart=" + bookmoney.eq(n).html() + "&booktheordernumber=" + Dates(),
            dataType: "text",
            scriptCharset: "utf-8",
            success: function (data) {
                if (data === "true") {
                    $('#myModal').modal('show');
                } else {
                    alert("加入购物车失败！");
                }
            },
            error: function () {
                alert("加入购物车失败！");
            }
        });
    } else {
        alert("你尚未登录，请登录！");
    }
}