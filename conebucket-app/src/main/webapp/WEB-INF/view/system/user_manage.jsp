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
    <%--分页--%>
    <link rel="stylesheet" type="text/css" href="../../../static/plugin/paging/htmleaf-demo.css">
</head>
<body>

<div class="main_container">
    <!-- page content -->
    <div class="panel panel-default query-criteria">
        <div class="panel-heading">查询条件</div>

        <div class="panel-body">
            <div class="row">
                <span id="nickname" class="query-criteria-name">用户名</span>
                <div class="query-criteria-input">
                    <input type="text" class="form-control" id="name" autocomplete="off">
                </div>

                <div>
                    <button type="button" id="btn_query" class="btn btn-primary search-btn" onclick="search(1)">查询
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!--table-->
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
                        <th style="width: 40%">用户名</th>
                        <th style="width: 35%">电话</th>
                        <th style="width: 20%">操作</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">

                    <tr>
                        <th><input type="checkbox"></th>
                        <th scope="row">1</th>
                        <td>admin</td>
                        <td>16572636661</td>
                        <td style="text-align: center; width: 110px;padding: 0;line-height: 50px; ">
                            <button style=" text-align:right;" class="btn btn-primary btn-sm">详细
                            </button>
                        </td>
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
</div>

</body>
<script src="../../../static/js/jquery-1.12.4.min.js"></script>
<script src="../../../static/plugin/layer/layer.js"></script>
<!-- bootstrap JS-->
<script src="../../../static/js/bootstrap.min.js"></script>
<script src="../../../static/js/systemManager/userInfo.js"></script>
<%--分页--%>
<script src="../../../static/plugin/paging/jqPaginator.js" type="text/javascript"></script>
</html>