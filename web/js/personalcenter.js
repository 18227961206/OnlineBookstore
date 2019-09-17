$(document).ready(function () {
    //用户退出点击事件
    var exits = $("#exits");
    exits.click(function () {
        $.ajax({
            type: "POST",
            url: "../Exits?exits=michael",
            dataType: "text",
            scriptCharset: "utf-8",
            success: function (data) {
                if (data === "true") {
                    window.location.href = "../index.jsp";
                } else {
                    alert("系统繁忙！");
                }
            },
            error: function () {
                alert("系统繁忙！");
            }
        })
    });

    /*提交信息事件*/
    var submit = $("#submit");
    submit.click(function () {
        var gender = $("select").eq(0).val();
        var professional = $("select").eq(1).val();
        var label = $("select").eq(2).val();
        var username = $("#username").val();
        var password = $("#password").val();
        var email = $("#email").val();
        var textarea = $("#textarea").val();
        if (gender === "请选择") {
            gender = "";
        }
        if (professional === "请选择") {
            professional = "";
        }
        if (label === "请选择") {
            label = "";
        }
        if ((username !== "") && (password !== "") && (email !== "")) {
            $.ajax({
                type: "POST",
                url: "../PersonalCenter?gender=" + gender + "&professional=" + professional +
                    "&label=" + label + "&username=" + username + "&password=" + password +
                    "&email=" + email + "&textarea=" + textarea,
                dataType: "text",
                scriptCharset: "utf-8",
                success: function (data) {
                    if (data === "true") {
                        window.location.reload();
                    } else {
                        alert("系统繁忙！");
                    }
                },
                error: function () {
                    alert("系统繁忙！");
                }
            })
        } else {
            alert("请输入正确的信息！");
        }
    })
});