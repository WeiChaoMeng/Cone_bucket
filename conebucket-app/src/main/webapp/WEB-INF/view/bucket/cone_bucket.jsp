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
    <title>锥桶管理</title>
    <link rel="stylesheet" href="../../../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../static/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../../static/css/cone_bucket.css">
    <link rel="stylesheet" type="text/css" href="../../../static/plugin/paging/htmleaf-demo.css">
    <style>
        .offline-style {
            background: #555e65;
            width: 40%;
            margin: 0 auto;
            font-weight: 600;
            font-size: 12px;
            line-height: 25px;
            color: #fff;
            text-align: center;
        }

        .online-style {
            background: #ff7d2f;
            width: 40%;
            margin: 0 auto;
            font-weight: 600;
            font-size: 12px;
            line-height: 25px;
            color: #fff;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="main_container">
    <!-- page content -->
    <div class="panel panel-default query-criteria">
        <div class="panel-heading">查询条件</div>

        <div class="panel-body">
            <form id="formSearch" class="form-horizontal">
                <div class="row">

                    <label class="control-label col-sm-1">锥桶编号</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="coneBucketNum" autocomplete="off">
                    </div>

                    <label id="roadgrade" class="control-label col-sm-1">锥桶类型</label>
                    <div class="col-sm-2">
                        <select class="form-control" id="coneBucketType">
                            <option value="0">内部监管</option>
                            <option value="1">高德平台</option>
                        </select>
                    </div>

                    <div>
                        <button type="button" id="btn_query" onclick="getConeBucketByCondition()"
                                class="btn btn-primary search-btn">查询
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
                        <th style="width: 20%">设备编号</th>
                        <th style="width: 20%">设备名称</th>
                        <th style="width: 15%">使用状态</th>
                        <th style="width: 20%">设备最后在线时间</th>
                        <th style="width: 10%">设备类型</th>
                        <th style="width: 10%">操作</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">


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
                            <input type="hidden" id="page" value="1"/>
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
<script src="../../../static/plugin/layer/layer.js"></script>
<script src="../../../static/plugin/paging/jqPaginator.js" type="text/javascript"></script>
<script type="text/javascript">
    var refreshIntervalId;
    var currentPageNum = JSON.parse('${currentPage}');

    //初始化
    $(function () {
        $('#page').val(currentPageNum);
        loadData(currentPageNum);
        loadPage(1);

        //定时器-查询锥桶状态
        scheduledTasks();
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
            url: localStorage.getItem("ajaxUrl") + '/coneBucket/loadData',
            data: {'page': page},
            async: false,
            success: function (data) {
                var objectInfo = JSON.parse(data);
                //总数
                $("#PageCount").val(objectInfo.total);
                //每页显示条数
                $("#PageSize").val("9");

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
            obj += '<td colspan="7" style="text-align: center;">' + '暂无数据' + '</td>';
            obj += '</tr>';
        } else {
            for (var i = 0; i < objectInfoList.length; i++) {
                obj += '<tr>';
                obj += '<td style="text-align: center;">' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 10 + i + 1) + '</td>';
                obj += '<td class="table-td-content">' + objectInfoList[i].id + '</td>';
                obj += '<td class="table-td-content">' + objectInfoList[i].name + '</td>';
                if ((objectInfoList[i].lastLocation).length < 5) {
                    obj += '<td class="table-td-content"><div class="offline-style">离线</div></td>';
                } else {
                    if ((objectInfoList[i].roadInfo).roadId === undefined){
                        obj += '<td class="table-td-content"><div class="offline-style">离线</div></td>';
                    } else {
                        obj += '<td class="table-td-content"><div class="online-style">在线</div></td>';
                    }
                }
                obj += '<td class="table-td-content">' + objectInfoList[i].lastTime + '</td>';
                obj += '<td class="table-td-content">' + objectInfoList[i].coneBucketTypeId + '</td>';
                obj += '<td style="text-align: center;padding: 5px 0">';
                obj += '<button class="btn btn-primary btn-sm" style="margin-left: 10px" onclick="del(' + objectInfoList[i].id + ')">删除</button>';
                obj += '</td>';
                obj += '</tr>';
            }
        }

        $('#tbody').html(obj);
    }

    //搜索
    function search(page) {
        var userName = $('#name').val();
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/userInfo/search.do',
            data: {'page': page, 'userName': userName},
            async: false,
            success: function (data) {
                var objectInfo = JSON.parse(data);
                //总数
                $("#PageCount").val(objectInfo.total);
                //每页显示条数
                $("#PageSize").val("9");

                //基本数据
                parseResult(objectInfo);
                loadPage(2);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
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
            currentPage: currentPageNum,
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

    //添加用户
    function add() {
        parent.addConeBucket();
    }

    //提交添加用户
    function commitConeBucket(deviceId, coneBucketType) {
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/coneBucket/add',
            data: {'deviceId': deviceId, 'coneBucketType': coneBucketType},
            dataType: "json",
            success: function (data) {
                parent.closeWin();
                layer.msg(data);
                loadData(1);
                // if (data === "success") {
                //     parent.closeWin();
                //     layer.msg("添加成功！");
                //     loadData(1);
                // } else {
                //     layer.msg("添加失败！")
                // }
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    //删除用户
    function del(id) {
        parent.deleteConeBucket(id);
    }

    //重载页面
    function reloadConeBucketPage(page) {
        window.location.href = localStorage.getItem("ajaxUrl") + '/coneBucket/toIndex?page=' + page;
    }


    /*进入页面-开启定时器*/
    function scheduledTasks(){
        refreshIntervalId = window.setInterval(function () {
            console.log("js定时任务");
            var currentPageNumber = $('#page').val();
            $.ajax({
                type: "post",
                url: localStorage.getItem("ajaxUrl") + '/coneBucket/loadData',
                data: {'page': currentPageNumber},
                async: false,
                dataType: "json",
                success: function (data) {
                    //总数
                    $("#PageCount").val(data.total);
                    //每页显示条数
                    $("#PageSize").val("9");
                    parseResult(data);
                    loadPage(1);
                },
                error: function (e) {
                    layer.msg("加载锥桶信息出现错误！");
                }
            })
        },300000);//1000 毫秒= 1 秒
    }

    /*退出页面-关闭定时器*/
    window.onbeforeunload = function (e) {
        window.clearInterval(refreshIntervalId);
    };
</script>
</html>