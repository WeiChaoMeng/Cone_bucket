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

<div class="main_container">
    <!-- page content -->
    <div class="panel panel-default">
        <div class="panel-heading">查询条件</div>

        <div class="panel-body">
            <form id="formSearch" class="form-horizontal">
                <div class="row">

                    <label id="nickname" class="control-label col-sm-1">角色名称</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="roleName" autocomplete="off">
                    </div>

                    <div>
                        <button type="button" id="btn_query" onclick="search(1)" class="btn btn-primary search-btn">查询
                        </button>
                    </div>
                </div>
            </form>
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

                        <button id="btn_edit" type="button" class="btn btn-default" onclick="edit()">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                        </button>

                        <button id="btn_delete" type="button" class="btn btn-default" onclick="remove()">
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
                        <th style="width: 10%">序号</th>
                        <th style="width: 40%">角色名称</th>
                        <th style="width: 45%">角色描述</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">
                    <tr>
                        <th><input type="checkbox"></th>
                        <th scope="row">1</th>
                        <td>超级管理员</td>
                        <td>拥有所有权限</td>
                    </tr>
                    </tbody>
                </table>

                <%--分页--%>
                <div id="paging" style="right: 10px;height: 35px;bottom: 10px;margin-right: 20px">
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
<script src="../../../static/js/jquery.js"></script>
<%--分页--%>
<script src="../../../static/plugin/paging/jqPaginator.js" type="text/javascript"></script>
<script>
    //初始化工程管理页面
    $(function () {
        loadData(1);
        loadPage(1);
    });

    function exeData(page, type, parameter) {
        //全部
        if (parameter === 1) {
            loadData(page);

            //搜索
        } else if (parameter === 2) {
            search(page);
        }
    }

    function loadData(page) {
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/roleInfo/index.do',
            data: {'page': page},
            async: false,
            success: function (data) {
                var objectInfo = JSON.parse(data);
                //总数
                $("#PageCount").val(objectInfo.total);
                //每页显示条数
                $("#PageSize").val("10");

                //基本数据
                parseResult(objectInfo);
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }

    //解析list
    function parseResult(objectInfo) {
        //结果集
        var objectInfoList = objectInfo.list;
        //当前页
        var pageNum = objectInfo.pageNum;
        //插入tbody
        var obj = '';
        if (objectInfoList.length === 0) {
            obj += '<tr>';
            obj += '<td colspan="4" style="text-align: center;">' + '暂无数据' + '</td>';
            obj += '</tr>';
        } else {
            for (var i = 0; i < objectInfoList.length; i++) {
                obj += '<tr>';
                obj += '<th><input type="checkbox" value="' + objectInfoList[i].id + '"></th>';
                obj += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 10 + i + 1) + '</td>';
                obj += '<td>' + objectInfoList[i].roleName + '</td>';
                obj += '<td>' + objectInfoList[i].description + '</td>';
                obj += '</tr>';
            }
        }

        $('#tbody').html(obj);
    }

    //加载页面
    function loadPage(parameter) {
        var myPageCount = parseInt($("#PageCount").val());
        var myPageSize = parseInt($("#PageSize").val());
        var totalPageNum = myPageCount === 0 ? 1 : Math.ceil(myPageCount / myPageSize);
        $("#countindex").val(totalPageNum);

        $.jqPaginator('#pagination', {
            totalPages: parseInt($("#countindex").val()),
            visiblePages: parseInt($("#visiblePages").val()),
            currentPage: 1,
            first: '<li class="first"><a href="javascript:;">首页</a></li>',
            prev: '<li class="prev"><a href="javascript:;"><i class="arrow arrow2"></i>上一页</a></li>',
            next: '<li class="next"><a href="javascript:;">下一页<i class="arrow arrow3"></i></a></li>',
            last: '<li class="last"><a href="javascript:;">末页</a></li>',
            page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
            onPageChange: function (page, type) {
                if (type == "change") {
                    exeData(page, type, parameter);
                }
            }
        });
    }

    //搜索
    function search(page) {
        var roleName = $('#roleName').val();
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/roleInfo/search.do',
            data: {'page': page, 'roleName': roleName},
            async: false,
            success: function (data) {
                var objectInfo = JSON.parse(data);
                //总数
                $("#PageCount").val(objectInfo.total);
                //每页显示条数
                $("#PageSize").val("10");

                //基本数据
                parseResult(objectInfo);
                loadPage(2);
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }
</script>
</html>