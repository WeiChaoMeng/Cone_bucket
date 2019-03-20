<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2019/3/14
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <link rel="stylesheet" href="../../static/css/login.css" type="text/css">
</head>

<body>
<div class="content">

    <div class="content-left">
        <div class="area-text">
            广州市开发区
        </div>

        <div class="system-style">
            <div class="system-text">
                道路施工作业点在线监管系统
            </div>
        </div>

        <div class="copyright">
            <img class="copyright-logo" src="../../static/img/login-logo.jpg">
            <span class="copyright-text">北京市政路桥管理养护集团 V1.0</span>
        </div>
    </div>

    <div class="content-right">
        <div class="login">
            <div class="username">
                <img class="username-img" src="../../static/img/user.png">
                <input class="username-input" id="username" name="username" type="text" placeholder="用户名"
                       autocomplete="off">
            </div>

            <div class="pwd">
                <img class="pwd-img" src="../../static/img/pwd.png">
                <input class="pwd-input" id="password" name="password" type="password" placeholder="密码">
            </div>
            <div>
                <button class="login-btn" onclick="login()">登录</button>
            </div>

        </div>
    </div>
</div>

</body>
<script src="../../static/js/jquery-1.12.4.min.js"></script>
<script>
    function login() {
        window.location.href = localStorage.getItem("ajaxUrl") + "/main.do";
    }
</script>
</html>
