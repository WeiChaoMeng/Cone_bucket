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
    <title>浏览器版本过低-请升级</title>
    <meta name="renderer" content="webkit">
    <link rel="shortcut icon" type="image/x-icon" href="../../static/img/favicon.ico">
    <style>
        * {
            margin: 0;
            padding: 0;
            border: none;
        }

        html {
            background: #eee;
            font-family:'Microsoft Yahei', "Microsoft YaHei UI", '微软雅黑', 'Avenir', Helvetica, Arial, sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        html, body {
            min-width: 1200px;
        }

        .lt-ie-10 {
            width: 1200px;
            margin: 0 auto;
        }

        .lt-ie-10 dl {
            font-size: 16px;
            line-height: 36px;
            color: #666;
        }

        .lt-ie-10 dt {
            font-size: 18px;
        }

        .lt-ie-10 .ui-g-orange {
            color: red;
        }

        .lt-ie-10 .tips {
            color: #999;
            font-size: 14px;
        }

        .lt-ie-10 .pics {
            margin-top: 50px;
        }

        .lt-ie-10 img {
            width: 120px;
            height: 120px;
        }

        .lt-ie-10 a {
            border: 1px solid transparent;
            display: inline-block;
            padding: 15px;
            text-decoration: none
        }

        .lt-ie-10 a:hover {
            border: 1px solid #ccc;
            -webkit-box-shadow: 0 0 5px #ccc;
            -moz-box-shadow: 0 0 5px #ccc;
            box-shadow: 0 0 5px #ccc;
        }

        .lt-ie-10 a span {
            display: block;
            text-align: center;
            color: #888;
            margin-top: 10px;
        }

        .container {
            margin-top: 50px;
            padding: 100px 0 100px 100px;
            background: #fff;
        }
    </style>
</head>
<body>

<div class="lt-ie-10">
    <div class="container">
        <dl>
            <dt class="ui-g-orange">温馨提示：</dt>
            <dd>您之所以看到这个页面，是因为当前使用浏览器版本过低，以致网站的功能无法使用；</dd>
            <dd>如果您使用的是IE浏览器，请升级版本至IE10+；</dd>
            <dd>为了不影响您的体验，我们推荐您使用下列的浏览器来访问网站：</dd>
            <dd>
                <p class="tips">* 如果遇到链接无法打开的情况，请尝试使用百度搜索浏览器名称，选择百度软件中心提供的软件版本下载即可。</p>
            </dd>
        </dl>
        <div class="pics">
            <a href="//www.google.cn/chrome/" target="_blank">
                <img src="../../static/img/guge.png" alt="谷歌浏览器"/>
                <span>谷歌浏览器</span>
            </a>
            <a href="//www.firefox.com.cn/" target="_blank">
                <img src="../../static/img/firefox.png" alt="火狐浏览器"/>
                <span>火狐浏览器</span>
            </a>
            <a href="//www.microsoft.com/zh-cn/windows/microsoft-edge" target="_blank">
                <img src="../../static/img/edge.jpg" alt="edge浏览器"/>
                <span>edge浏览器</span>
            </a>
            <a href="//ie.sogou.com/" target="_blank">
                <img src="../../static/img/sogou.jpg" alt="搜狗浏览器"/>
                <span>搜狗浏览器</span>
            </a>
            <a href="//browser.qq.com/" target="_blank">
                <img src="../../static/img/QQ.jpg" alt="QQ浏览器"/>
                <span>QQ浏览器</span>
            </a>
            <a href="//chrome.360.cn/" target="_blank">
                <img src="../../static/img/360.jpg" alt="360浏览器"/>
                <span>360极速浏览器</span>
            </a>
        </div>
    </div>
</div>
</body>
</html>