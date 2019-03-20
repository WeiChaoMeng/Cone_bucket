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
    <title>用户管理</title>
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

                    <label id="nickname" class="control-label col-sm-1" for="txt_search_road1">显示名称</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="txt_search_road1" autocomplete="off">
                    </div>

                    <label id="name" class="control-label col-sm-1" for="txt_search_road1">用户名</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="txt_search_road2" autocomplete="off">
                    </div>

                    <label id="roadgrade" class="control-label col-sm-1" for="txt_search_road2">角色</label>
                    <div class="col-sm-2">
                        <select class="form-control" id="txt_search_road3">
                            <option style="height:30px;width:160px;" value="">--请选择--</option>

                            <option value="1">超级管理员</option>

                            <option value="2">管理员</option>

                        </select>
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

                        <button id="btn_add" type="button" class="btn btn-default" onclick="addUser()">
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
                        <th style="width: 5%"><input type="checkbox"></th>
                        <th style="width: 5%">序号</th>
                        <th style="width: 20%">显示名称</th>
                        <th style="width: 20%">用户名</th>
                        <th style="width: 13%">密码</th>
                        <th style="width: 13%">角色</th>
                        <th style="width: 14%">联系方式</th>
                        <th style="width: 10%">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th scope="row">1</th>
                        <td>超级管理员</td>
                        <td>superAdmin</td>
                        <td>superAdmin</td>
                        <td>超级管理员</td>
                        <td>16572636661</td>
                        <td style="text-align: center; width: 110px;padding: 0;line-height: 50px; ">
                            <button style=" text-align:right;" class="btn btn-primary btn-sm">详细
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th scope="row">2</th>
                        <td>管理员</td>
                        <td>admin</td>
                        <td>admin</td>
                        <td>管理员</td>
                        <td>18737264223</td>
                        <td style="text-align: center; width: 110px;padding: 0;line-height: 50px; ">
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

<div class="content"  id="addFrom" style="padding: 20px;background: #fff;display:none">

    <form id="streetlightDiseaseForm"  >
        <table class="table table-condensed table-bordered table-hover">
            <tbody>
            <tr>
                <td style="width: 10%">用户名</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="userName" name="userName" value="" autocomplete="off"
                           required="true">
                </td>

                <td style="width: 10%">密码</td>
                <td style="width: 40%">
                    <input class="form-control" type="password" id="passwords" name="password" value="" autocomplete="off"
                           required="true">
                </td>

            </tr>
            <tr>
                <td style="width: 10%">电话</td>
                <td colspan="3">
                    <input class="form-control" type="text" id="phone" name="phone" required="true"
                           autocomplete="off">
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
<script src="../../../static/js/jquery-1.12.4.min.js"></script>
<!-- bootstrap JS-->
<script src="../../../static/js/bootstrap.min.js"></script>
<script src="../../../static/js/bootstrap.min.js"></script>
<script src="../../../static/js/systemManager/userInfo.js"></script>
<script src="../../../static/plugin/layer/layer.js"></script>
<script>
</script>
</html>