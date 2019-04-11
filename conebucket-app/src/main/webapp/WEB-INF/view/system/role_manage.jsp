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
    <title>角色管理</title>
    <link rel="stylesheet" href="../../../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../static/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../../static/css/system.css">
    <%--分页--%>
    <link rel="stylesheet" type="text/css" href="../../../static/plugin/paging/htmleaf-demo.css">
</head>
<body>

<div id='windowBackgroundColor' onclick="closeWin()"
     style=" width: 100%;height: 100%;z-index: 8888;background-color: #000000;position: absolute;opacity: 0.3;display: none;left: 0;"></div>

<div class="main_container">
    <!-- page content -->
    <div class="panel panel-default query-criteria">
        <div class="panel-heading">查询条件</div>

        <div class="panel-body">
            <div class="row">
                <span id="nickname" class="query-criteria-name">角色名称</span>
                <div class="query-criteria-input">
                    <input type="text" class="form-control" id="characterName" autocomplete="off">
                </div>

                <div>
                    <button type="button" id="btn_query" onclick="search(1)" class="btn btn-primary search-btn">查询
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="table-style">
        <div class="table-style-padding">

            <div class="fixed-table-toolbar">
                <div class="bs-bars pull-left">
                    <div id="toolbar" class="btn-group">

                        <button id="btn_add" type="button" class="btn btn-default" onclick="add()">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                        </button>
                    </div>
                </div>
                <%--<div class="columns columns-right btn-group pull-right">
                    <button class="btn btn-default" type="button" name="refresh" aria-label="refresh"
                            title="刷新"><i class="fa fa-refresh"></i></button>
                </div>--%>
            </div>

            <div class="x_content">

                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="width: 5%">序号</th>
                        <th style="width: 35%">角色名称</th>
                        <th style="width: 40%">角色描述</th>
                        <th style="width: 20%">操作</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">
                    <tr>
                        <th scope="row">1</th>
                        <td>超级管理员</td>
                        <td>拥有所有权限</td>
                        <td>操作</td>
                    </tr>
                    </tbody>
                </table>

                <%--分页--%>
                <div id="paging" class="paging-table-div">
                    <div class="">
                        <div class="" style="float: right;">
                            <ul class="pagination" id="pagination" style="margin: 0"></ul>
                            <input type="hidden" id="PageCount" runat="server"/>
                            <input type="hidden" id="PageSize" runat="server"/>
                            <input type="hidden" id="countindex" runat="server"/>
                            <!--设置最多显示的页码数 可以手动设置 默认为10-->
                            <input type="hidden" id="visiblePages" runat="server" value="10"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- /page content -->

    <div id="win"
         style="display:none;background: rgb(255, 255, 255);width: 700px;position: absolute;top: 50px;left: 28%;z-index: 9999;border-radius: 10px;min-height: 400px;max-height: 600px">

        <div style="height: 42px;padding: 0 0 0 20px;line-height: 42px;background: #efefef;border-radius: 10px 10px 0 0;">
            <span style="font-size: 16px;">添加角色</span>
        </div>

        <div style="padding: 10px 30px;">
            <table class="table table-bordered" style="margin: 0;">
                <tbody>
                <tr>
                    <td style="width: 12%;text-align: center;">角色名称
                    </td>
                    <td><input type="text" id="roleName" class="form-control"></td>
                    <td style="width: 12%;text-align: center;">角色描述
                    </td>
                    <td><input type="text" id="description" class="form-control"></td>
                </tr>
                </tbody>
            </table>
        </div>

        <div style="height: 42px;padding: 0 0 0 20px;line-height: 42px;">
            <span style="font-size: 16px;">权限信息</span>
        </div>

        <div style="padding: 10px 30px;">
            <table class="table table-bordered" style="margin: 0;border: none">
                <tbody id="permissionTbody">
                <c:forEach items="${permissionList}" var="permission">
                    <tr>
                        <td style="text-align: center;width: 10%;border: none;">
                            <input type="checkbox" value="${permission.id}">
                        </td>
                        <td style="border: none;">${permission.description}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div style="text-align: center">
            <input class="btn btn-primary btn-sm" type="button" onclick="commit()" value="提交">
            <input class="btn btn-primary btn-sm" type="button" onclick="closeWin()" value="取消">
        </div>
    </div>

</div>
</body>
<script src="../../../static/js/jquery.js"></script>
<script src="../../../static/plugin/layer/layer.js"></script>
<%--分页--%>
<script src="../../../static/plugin/paging/jqPaginator.js" type="text/javascript"></script>
<script src="../../../static/js/systemManager/roleInfo.js"></script>
</html>