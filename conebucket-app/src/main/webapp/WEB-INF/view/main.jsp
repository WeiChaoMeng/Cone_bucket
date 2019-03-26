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
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>道路施工在线监管系统</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon-->
    <link rel="shortcut icon" type="image/x-icon" href="../../static/img/favicon.ico">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="../../static/css/bootstrap.min.css">

    <link rel="stylesheet" href="../../static/css/main.css">
</head>

<body>
<!-- Start Header Top Area -->
<div class="header-top-area">
    <div class="container">
        <!--logo-->
        <div class="logo-div">
            <img src="../../static/img/login-logo.jpg" alt="" style="width: 40px;">
            <span style="padding-left: 10px;font-size: 16px">道路施工在线监管系统</span>
        </div>

        <!--功能(主菜单)-->
        <div class="action" id="mainMenu">
            <div class="action-div action-div-border" id="engineeringQuery"><span>工程查询</span></div>
            <div class="action-div" id="engineeringManage"><span>工程管理</span></div>
            <div class="action-div" id="device"><span>设备管理</span></div>
            <div class="action-div " id="system"><span>系统管理</span></div>
            <div class="action-div" id="log"><span>日志管理</span></div>
        </div>

        <!--退出-->
        <div class="exit-div">
            <span onclick="exit()">退出</span>
        </div>
    </div>

    <!--二级菜单-->
    <div class="secondary-menu-outer">
        <div class="secondary-menu-style" id="secondaryMenu">

        </div>
    </div>
</div>

<!--content-->
<div class="content-iframe">
    <iframe src="projectMessage/toProjectQueryIndex.do" id="inlineFrame" name="right" width="100%" style="height: 100%;"
            frameborder="0" scrolling="auto"></iframe>
</div>

<%--模态窗（锥桶）--%>
<div class="content"  id="addFrom" style="padding: 20px;background: #fff;display:none">

    <form id="streetlightDiseaseForm"  >
        <table class="table table-condensed table-bordered table-hover">
            <tbody>
            <tr>
                <td style="width: 10%">锥桶编号</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="cbNum" name="diseaseNumber" value="" autocomplete="off"
                           required="true">
                </td>

                <td style="width: 10%">锥桶类型</td>
                <td style="width: 40%">
                    <select class="form-control" id="roadName" name="roadName" required="true">
                        <option value="0" selected="selected">内部监管</option>
                        <option value="1">高德平台</option>
                    </select>
                </td>
            </tr>

            </tbody>
        </table>
        <div style="text-align: center">
            <input class="btn btn-primary btn-sm" type="button" onclick="addSubmit();" value="提交">
            <input class="btn btn-primary btn-sm" type="button" onclick="backOff()" value="返回">
        </div>
    </form>
</div>

</body>


<!-- jquery -->
<script src="../../static/js/jquery-1.12.4.min.js"></script>
<!-- bootstrap JS-->
<script src="../../static/js/bootstrap.min.js"></script>
<script src="../../static/js/main.js"></script>
<script src="../../../static/plugin/layer/layer.js"></script>
</html>