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
    <title>无法访问</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 13px;
            background: #fff;
            font-family: '微软雅黑';
        }

        .content-version {
            text-align: center;
            padding-top: 15%;
        }

        .content-version-img {
            margin-bottom: 20px;
        }

        .content-version-tips {
            margin-bottom: 20px;
        }

        .content-version-tips span {
            font-size: 25px;
        }

        .content-version-link {
            text-align: center;
            display: inline-block;
            margin: 0 20px
        }

        .content-version-link span {
            display: block;
            font-size: 20px;
        }
    </style>
</head>
<body>
<div class="content-version">
    <div class="content-version-img">
        <img src="../../static/img/failure.png">
    </div>

    <div class="content-version-tips">
        <span>您正在使用的浏览器<span style="color:#0089ff;font-size:30px">版本过低</span>，可能导致部分功能将不能正常使用！</span>
    </div>

    <div class="content-version-link">
        <img src="../../static/img/google.png" alt="">
        <span>Chrome(推荐)</span>
    </div>

    <div class="content-version-link">
        <img src="../../static/img/firefox.png" alt="">
        <span>Firefox</span>
    </div>

    <div class="content-version-link">
        <img src="../../static/img/internet-explorer.png" alt="">
        <span>IE10及以上</span>
    </div>
</div>
</body>
</html>