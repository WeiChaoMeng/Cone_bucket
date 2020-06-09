<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>道路施工在线监管系统</title>
    <meta charset="utf-8">
    <meta name="google" value="notranslate"><!-- 禁止Chrome 浏览器中自动提示翻译 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"><!--IE=edge：保持使用最高级别模式显示内容-->
    <meta name="renderer" content="webkit"><!--360浏览器-->
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <link rel="stylesheet" href="../../static/css/common.css">
    <link rel="shortcut icon" href="../../static/img/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../../static/css/logo.css">
    <link rel="stylesheet" href="../../static/css/style.css">
    <link rel="stylesheet" href="../../static/css/table-style.css">
</head>
<body>

<!--首页头部 sta -->
<div class="jimu-main-header" id="Header-Panel"
     style="left: 10px; top: 10px; width: 313px; height: 36px; right: auto; bottom: auto;">
    <div class="jimu-head">
        <div class="jimu-head-content" id="jimu-head-content" style="line-height: 33px;">
            <div class="jimu-head-leftTopBg" id="leftTopBg"></div>
            <div class="jimu-head-title jimu-head-title-light" id="titleNode">道路施工在线监管系统</div>

            <i class="jimu-head-masked"></i>
            <div class="jimu-head-rightBottomBg" id="rightBottomBg"></div>
        </div>
    </div>
</div>
<div id="ToolBar-Panel">
    <div class="jimu-toolbar" id="jimu-toolbar-content">
        <div class="jimu-toolbar-left"></div>
        <div class="jimu-list jimu-toolbar-middle" id="jimu-list">
            <ul id="jimu-list-ul" class="jimu-list-ul">
                <li title="首页" class="jimu-list-ul-li-select">首页</li>
                <li title="智慧锥桶"><a href="/toConeBarrelHome.do"><span>智慧锥桶</span></a></li>
                <li><a href="/logout">退出</a></li>
            </ul>
        </div>
        <div class="jimu-toolbar-right"></div>
    </div>
</div>

<div id="Clock-Panel" class="jimu-main-absolute"
     style="width: 210px; height: 36px; left: auto; right: 170px; top: 10px; bottom: auto;">
    <div class="jimu-clock">
        <div class="jimu-clock-content" id="jimu-clock-content">
            <div class="jimu-clock-hours" style="line-height: 36px;"></div>
            <ul>
                <li>
                    <div id="head-time" class="jimu-clock-day"></div>
                </li>
                <li>
                    <div id="head-date" class="jimu-clock-week"></div>
                </li>
            </ul>
        </div>
    </div>
</div>

<div id="afoot-Panel" class="jimu-main-absolute"
     style="width: 380px; height: 30px; left: 39%; right: auto; top: auto; bottom: 0.1px;">
    <div class="jimu-foot-content" id="jimu-foot-content">
        <div class="jimu-foot-bg">
            <div class="jimu-foot-name"></div>
        </div>
    </div>
</div>

<!--4个角-->
<div class="i-common-top i-top-left"></div>
<div class="i-common-top i-top-right"></div>
<div class="i-common-bottom i-left-bottom"></div>
<div class="i-common-bottom i-right-bottom"></div>

<script src="../../static/js/jquery-1.12.4.min.js"></script>
<script src="../../static/js/bootstrap.min.js"></script>
<script src="../../static/js/common.js"></script>
</body>
</html>
