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
    <title>权限管理</title>
    <link rel="stylesheet" href="../../../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../static/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../../static/css/system.css">
</head>
<body>

<div class="main_container">
    <!-- page content -->
    <div class="panel panel-default">
        <div class="panel-heading">查询条件</div>

        <div class="panel-body">
            <form id="formSearch" class="form-horizontal">
                <div class="row">

                    <label id="nickname" class="control-label col-sm-1" for="txt_search_road1">权限名称</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="txt_search_road1" autocomplete="off">
                    </div>

                    <div>
                        <button type="button" id="btn_query" class="btn btn-primary search-btn">查询
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!--table-->
    <div class="table-style">
        <div class="table-style-padding">

            <div class="fixed-table-toolbar">
                <div class="bs-bars pull-left">
                    <div id="toolbar" class="btn-group">

                        <button id="btn_add" type="button" class="btn btn-default" onclick="Add()">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                        </button>

                        <button id="btn_edit" type="button" class="btn btn-default" onclick="Modify()">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                        </button>


                        <button id="btn_delete" type="button" class="btn btn-default" onclick="del()">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                        </button>

                    </div>
                </div>
                <div class="columns columns-right btn-group pull-right">
                    <button class="btn btn-default" type="button" name="refresh" aria-label="refresh"
                            title="刷新"><i class="fa fa-refresh"></i></button>
                </div>
            </div>

            <div class="x_content">

                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="width: 5%;"><input type="checkbox"></th>
                        <th style="width: 5%;">序号</th>
                        <th style="width: 20%;">权限名称</th>
                        <th style="width: 20%;">权限标识</th>
                        <th style="width: 40%;">权限说明</th>
                        <th style="width: 10%;">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th scope="row">1</th>
                        <td>用户-新增</td>
                        <td>/userManage/add</td>
                        <td>系统管理-新增用户</td>
                        <td style="text-align: center; width: 110px;">
                            <button style=" text-align:right;" class="btn btn-primary btn-sm">详细
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th scope="row">2</th>
                        <td>用户-修改</td>
                        <td>/userManage/edit</td>
                        <td>系统管理-修改用户</td>
                        <td style="text-align: center; width: 110px;">
                            <button style=" text-align:right;" class="btn btn-primary btn-sm">详细
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th scope="row">3</th>
                        <td>用户-删除</td>
                        <td>/userManage/delete</td>
                        <td>系统管理-删除用户</td>
                        <td style="text-align: center; width: 110px;">
                            <button style=" text-align:right;" class="btn btn-primary btn-sm">详细
                            </button>
                        </td>
                    </tr>

                    </tbody>
                </table>

            </div>
        </div>
    </div>
    <!-- /page content -->
</div>
</body>
</html>