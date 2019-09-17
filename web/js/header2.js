//定义全局的验证码
var verificationCode = null;
//获取验证码时间间隔
var timer = 59;

//注册表单验证
function registered(number) {
    //正则表达式
    var email01_regular = new RegExp("^[0-9]+@[q]+[q]+(.[com]{3})$");
    var email02_regular = new RegExp("^[0-9]{6,10}");
    var phone_regular = new RegExp("^1([34578])[0-9]{9}$");
    var pass01_regular = new RegExp("^[a-zA-Z][a-zA-Z0-9]{5,17}$");
    var pass02_regular = new RegExp("^[a-zA-Z]{1,16}");
    //获取输入框中的字符串
    var name = $(" #name ").val();
    var email = $(" #email ").val();
    var password01 = $(" #passwords01 ").val();
    var password02 = $(" #passwords02 ").val();
    var verification_code = $(" #verification_code ").val();

    var the_registered_h6 = $(".the_registered_div_h6");

    switch (number) {
        case 0:
            if (phone_regular.test(name)) {
                the_registered_h6.eq(number).css("visibility", "hidden");
            } else {
                the_registered_h6.eq(number).css("visibility", "visible");
            }
            break;
        case 1:
            if ((email.length > 5 && email.length < 18) && ((email01_regular.test(email)) && (email02_regular.test(email)))) {
                the_registered_h6.eq(number).css("visibility", "hidden");
            } else {
                the_registered_h6.eq(number).css("visibility", "visible");
            }
            break;
        case 2:
            if ((pass01_regular.test(password01)) && (pass02_regular.test(password01))) {
                the_registered_h6.eq(number).css("visibility", "hidden");
            } else {
                the_registered_h6.eq(number).css("visibility", "visible");
            }
            break;
        case 3:
            if (password01 === password02) {
                the_registered_h6.eq(number).css("visibility", "hidden");
            } else {
                the_registered_h6.eq(number).css("visibility", "visible");
            }
            break;
        case 4:
            if (verification_code === verificationCode) {
                the_registered_h6.eq(number).css("visibility", "hidden");
            } else {
                the_registered_h6.eq(number).css("visibility", "visible");
            }
            break;
    }

    //设置注册按钮可用和不可用
    var count = 0;
    $(".the_registered_div_h6").each(function (i) {
        if (($(".the_registered_div_h6")[i].style.visibility === "hidden")
            && ($(".the_registered_div_input")[i].value !== "")) {
            count++;
        }
    });
    if (count === 5) {
        $("#registered").attr("disabled", false);
    } else {
        $("#registered").attr("disabled", true);
    }
}

//验证码事件
function get_verification_code() {
    var oBtn = $("#get_verification_code");
    var email = $(" #email ").val();
    if (email === "") {
        $(".the_registered_div_h6").eq(1).css("visibility", "visible");
    } else {
        if (timer === 0) {
            oBtn.attr("disabled", false);
            oBtn.val("获取验证码");
            oBtn.removeClass("disabled");
            timer = 59;
            return;
        } else {
            oBtn.addClass("disabled");
            oBtn.attr("disabled", true);
            oBtn.val("重新发送(" + timer + ")秒");
            timer--;
        }
        setTimeout(get_verification_code, 1000);
    }

}

$(document).ready(function () {

    //响应式导航的点击事件
    var oLiNavicon = $(".navicon").eq(0);
    var oUlNavicon = $(".header_div2_ul").eq(0);
    oLiNavicon.click(function () {
        if (!oUlNavicon.is(':hidden')) {
            oUlNavicon.hide();
        } else {
            oUlNavicon.show();
        }
    });

    //设置登录注册按钮不可用
    //$("#login").attr("disabled", true);
    $("#registered").attr("disabled", true);

    //邮箱验证码事件
    $("#get_verification_code").click(function () {
        //验证码事件
        get_verification_code();

        //发送邮箱验证码提交事件
        if ($("#email").val() !== "") {
            $.ajax({
                type: "POST",
                url: "../EmailVerificationCode?email=" + $("[name=email]").val(),
                dataType: "text",
                success: function (data) {
                    //返回的验证码data
                    if (data !== "false") {
                        verificationCode = data;
                    } else {
                        alert("获取验证码失败")
                    }
                },
                error: function () {
                    alert("获取验证码失败");
                }
            });
        }
    });

    //注册事件
    $("#registered").click(function () {
        $.ajax({
            type: "POST",
            url: "../Registered?username=" + $("#name").val() + "&email=" + $("#email").val() + "&password=" + $("#passwords01").val(),
            dataType: "text",
            success: function (data) {
                if (data === "true") {
                    alert("注册成功，请登录。");
                    for (var i = 0; i < 5; i++) {
                        $(".the_registered_h6").eq(i).css("visibility", "hidden");
                        $(".the_registered_div_input").eq(i).val("");
                    }
                    $("#registered").attr("disabled", true);
                    $('#exampleModals').modal('hide');
                    $('.modal-backdrop').remove();
                    $('#exampleModal').modal('show');
                } else {
                    alert("注册失败！用户名重名！");
                }
            },
            error: function () {
                alert("注册失败!");
            }
        });
    });

    //登录事件
    $("#login").click(function () {
        //获取输入框中的字符串
        var username = $(" #username ").val();
        var password = $(" #password ").val();
        if (username === "" || password === "") {
            alert("请输入用户名和密码!");
        } else {
            $.ajax({
                type: "POST",
                url: "../TheLogin?username=" + username + "&password=" + password,
                dataType: "text",
                success: function (data) {
                    if (data === "true") {
                        alert("登录成功");
                        $('#exampleModal').modal('hide');
                        $('.modal-backdrop').remove();
                        window.location.reload();
                    } else {
                        alert("用户名或密码不正确！");
                    }
                },
                error: function () {
                    alert("登录失败!");
                }
            });
        }
    });
});
