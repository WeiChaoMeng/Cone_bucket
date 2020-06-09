// $(function () {
//     //存入全局Ajax地址
    //本地
    // localStorage.setItem('ajaxUrl', 'http://localhost:8080');
    // 线上
    localStorage.setItem('ajaxUrl', 'http://47.105.114.70:8484');
// });

function login() {
    var username = $('#username').val();
    var password = $('#password').val();
    if (username === "") {
        layer.msg('用户名不可以是空的');
    } else {
        if (password === "") {
            layer.msg("密码不可以是空的");
        } else {
            $.ajax({
                cache: true,
                type: "POST",
                url: localStorage.getItem("ajaxUrl") + '/login/login.do',
                data: {"username": username, "password": password},
                error: function (request) {
                    alert("Connection error");
                },
                success: function (result) {
                    if (result === "success") {
                        window.location.href = localStorage.getItem("ajaxUrl") + "/toHome.do";
                    } else {
                        layer.msg("您输入的账号密码不匹配");
                    }
                }
            });
        }
    }
}

//Cookie失效后跳转的登录页
if (top != window)
    top.location.href = window.location.href;