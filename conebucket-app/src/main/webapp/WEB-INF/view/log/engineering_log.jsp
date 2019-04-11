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
    <title>工程日志</title>
    <link rel="stylesheet" href="../../../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../static/css/log.css">
    <%--分页--%>
    <link rel="stylesheet" type="text/css" href="../../../static/plugin/paging/htmleaf-demo.css">
</head>
<body>

<div class="main_container">
    <!-- page content -->
    <%--<div class="panel panel-default query-criteria">
        <div class="panel-heading">查询条件</div>

        <div class="panel-body">
            <form id="formSearch" class="form-horizontal">
                <div class="row">

                    <label id="nickname" class="control-label col-sm-1" for="txt_search_road1">日志内容</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="txt_search_road1" autocomplete="off">
                    </div>

                    <label id="name" class="control-label col-sm-1" for="txt_search_road1">操作时间</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="txt_search_road2" autocomplete="off">
                    </div>

                    <label id="roadgrade" class="control-label col-sm-1" for="txt_search_road2">操作结果</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="txt_search_road3" autocomplete="off">
                    </div>

                    <div>
                        <button type="button" id="btn_query" class="btn btn-primary search-btn">查询
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>--%>

    <!--table-->
    <div class="table-style">
        <div class="table-style-padding">

            <div class="x_content">

                <table class="table table-bordered" style="border-left: none;border-right: none;">
                    <thead>
                    <tr>
                        <th style="width: 5%">序号</th>
                        <th style="width: 15%">操作日期</th>
                        <th style="width: 10%">日志类型</th>
                        <th style="width: 50%">日志内容</th>
                        <th style="width: 10%">用户</th>
                        <th style="width: 10%">状态</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">
                    <tr>
                        <th scope="row">1</th>
                        <td>2019-03-12 09:23:00</td>
                        <td>录入</td>
                        <td>新增工程：xxx</td>
                        <td>admin</td>
                        <td>成功</td>
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
<%--分页--%>
<script src="../../../static/plugin/paging/jqPaginator.js" type="text/javascript"></script>
<script>
    //初始化
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

    //加载数据
    function loadData(page) {
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/projectLog/index.do',
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
                layer.msg("出错！");
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
            obj += '<td colspan="6" style="text-align: center;">' + '暂无数据' + '</td>';
            obj += '</tr>';
        } else {
            for (var i = 0; i < objectInfoList.length; i++) {
                obj += '<tr>';
                obj += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 10 + i + 1) + '</td>';
                obj += '<td class="table-td-content">' + objectInfoList[i].operationTimeStr + '</td>';
                obj += '<td class="table-td-content">' + objectInfoList[i].logType + '</td>';
                obj += '<td class="table-td-content">' + objectInfoList[i].logContent + '</td>';
                obj += '<td class="table-td-content">' + objectInfoList[i].operationUser + '</td>';
                obj += '<td class="table-td-content">' + objectInfoList[i].state + '</td>';
                obj += '</tr>';
            }
        }

        $('#tbody').html(obj);
    }

    //搜索
    function search(page) {

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
</script>
</html>