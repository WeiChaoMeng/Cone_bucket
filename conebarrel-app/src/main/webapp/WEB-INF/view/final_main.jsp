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
    <link rel="stylesheet" href="../../static/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../../static/css/common.css">
    <link rel="shortcut icon" href="../../static/img/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../../static/css/logo.css">
    <link rel="stylesheet" href="../../static/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../static/css/project.css">
    <link rel="stylesheet" href="../../static/css/nav.css">
    <link rel="stylesheet" href="../../static/css/style.css">
    <link rel="stylesheet" href="../../static/css/table-style.css">
    <link rel="stylesheet" type="text/css" href="../../static/plugin/paging/htmleaf-demo.css">
    <%--引入地图--%>
    <%--<script type="text/javascript" src="http://219.159.45.138:8087/gisServer4.0/getApi?key=86aa4f63dbc26d401fd9fadd24b659db45ca"></script>--%>
</head>
<body>

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
                <li title="首页"><a href="/toHome.do"><span>首页</span></a></li>
                <li title="智慧锥桶" class="jimu-list-ul-li-select">智慧锥桶</li>
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

<!--首页头部 end -->
<div class="container-bgcolor">
    <div class="row" style="height: 100%;">
        <%--开始--%>
        <div class="col-md-2 col-lg-2" style="height: 100%;">
            <div class="sub-nav-left">
                <div class="middle">
                    <div class="leftMenu scrollHide">
                        <div class="menu_list">
                            <ul class="sub-li ul_display" id="ul_yhgl" style="display: block;">

                                <li class="ahover">
                                    <%--<p class="fuMenu" style="background-color: #011F39" onclick="leftMenuClickEvent_ZHZD(this,'projectEnquiry')">工程查询</p>--%>
                                    <p id="engineeringQuery">工程查询</p>
                                </li>

                                <li>
                                    <%--<p class="fuMenu" style="background-color: #011F39" onclick="leftMenuClickEvent_ZHZD(this,'projectMessage')">工程管理</p>--%>
                                    <p id="projectManagement">工程管理</p>
                                </li>

                                <li>
                                    <%--<p class="fuMenu" style="background-color: #011F39" onclick="leftMenuClickEvent_ZHZD(this,'coneBarrelManage')">锥桶管理</p>--%>
                                    <p id="coneBucketManagement">锥桶管理</p>
                                </li>

                                <%--<li>--%>
                                    <%--<p class="fuMenu" style="background-color: #011F39">系统管理</p>--%>
                                    <%--<img class="xiala"--%>
                                         <%--src="../../static/img/xiala.png"--%>
                                         <%--style="transform: rotate(360deg);">--%>
                                    <%--<div class="div1" style="display: none;">--%>
                                        <%--<p class="zcd" onclick="leftMenuClickEvent_ZHZD(this,'userInfo')">用户管理</p>--%>
                                        <%--<p class="zcd" onclick="leftMenuClickEvent_ZHZD(this,'roleInfo')">角色管理</p>--%>
                                        <%--<p class="zcd" onclick="leftMenuClickEvent_ZHZD(this,'permissions')">权限管理</p>--%>
                                        <%--<p class="zcd" onclick="leftMenuClickEvent_ZHZD(this,'parameter')">参数管理</p>--%>
                                    <%--</div>--%>
                                <%--</li>--%>

                                <%--<li>--%>
                                    <%--<p class="fuMenu" style="background-color: #011F39">日志管理</p>--%>
                                    <%--<img class="xiala"--%>
                                         <%--src="../../static/img/xiala.png"--%>
                                         <%--style="transform: rotate(360deg);">--%>
                                    <%--<div class="div1" style="display: none;">--%>
                                        <%--<p class="zcd" onclick="leftMenuClickEvent_ZHZD(this,'engineeringLog')">工程日志</p>--%>
                                        <%--<p class="zcd" onclick="leftMenuClickEvent_ZHZD(this,'coneBarrelLog')">锥桶日志</p>--%>
                                        <%--<p class="zcd" onclick="leftMenuClickEvent_ZHZD(this,'warningLog')">预警日志</p>--%>
                                    <%--</div>--%>
                                <%--</li>--%>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-10 col-lg-10" style="height: 100%;">
            <iframe id="frame" frameborder="0" scrolling="no" height="100%" width="100%"></iframe>
            <%--<div class="sub-con-right" id="mainFrame"></div>--%>
        </div>
    </div>
</div>

<script src="../../static/js/jquery-1.12.4.min.js"></script>
<script src="../../static/js/bootstrap.min.js"></script>
<script src="../../static/js/common.js"></script>
<script src="../../static/js/menu.js"></script>
<script src="../../static/js/menuClick.js"></script>
<script src="../../static/plugin/layer/layer.js"></script>
<%--分页--%>
<script src="../../static/plugin/paging/jqPaginator.js" type="text/javascript"></script>
</body>
</html>
