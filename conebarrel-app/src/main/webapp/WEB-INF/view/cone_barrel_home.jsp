<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>道路施工在线监管系统</title>
    <meta charset="utf-8">
    <!-- 禁止Chrome 浏览器中自动提示翻译 -->
    <meta name="google" value="notranslate">
    <!--IE=edge：保持使用最高级别模式显示内容-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit"><!--360浏览器-->
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <link rel="stylesheet" href="../../static/css/bootstrap/bootstrap.css">
    <link rel="shortcut icon" href="../../static/img/icon/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../../static/css/cone-barrel-home.css">
</head>
<body>

<div class="container-zhzt-color">
    <div class="row">
        <div class="col-md-2 col-lg-2">
            <div class="menu_list">
                <ul class="sub-li ul_display" id="ul_yhgl" style="display: block;">

                    <li class="ahover">
                        <p id="engineeringQuery">工程查询</p>
                    </li>

                    <li>
                        <p id="projectManagement">工程管理</p>
                    </li>

                    <li>
                        <p id="coneBucketManagement">锥桶管理</p>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-md-10 col-lg-10">
            <iframe id="frame" frameborder="0" scrolling="no" height="100%" width="100%"></iframe>
        </div>
    </div>
</div>

<script src="../../static/js/jquery-1.12.4.min.js"></script>
<script src="../../static/js/menuClick.js"></script>
<script src="../../static/plugin/layer/layer.js"></script>
</body>
</html>
