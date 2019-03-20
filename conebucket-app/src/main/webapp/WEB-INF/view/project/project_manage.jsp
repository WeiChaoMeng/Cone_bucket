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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>工程管理</title>

    <link rel="stylesheet" href="../../../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../static/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../../static/css/project.css">
    <link rel="stylesheet" type="text/css" href="../../../static/plugin/paging/htmleaf-demo.css">
    <style>
        .but-color {
            fill: #ff7d2f;
        }

        .form-control {
            border-radius: 0;
            width: 100%;
            display: inline-block;
        }

        .title-tr th {
            padding: 8px;
            line-height: 24px;
            vertical-align: top;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            text-align: center;
        }

        /*overflow滚动条样式*/
        ::-webkit-scrollbar {
            width: 6px;
            height: 6px;
        }

        ::-webkit-scrollbar-thumb {
            background-color: #E5E8EC;
            background-clip: padding-box;
            border: 1px solid #E6E5E6;
            min-height: 28px;
            border-radius: 4px;
        }

        ::-webkit-scrollbar-track-piece {
            background-color: #fff;
        }
    </style>
</head>

<body class="nav-md">
<div class="container body" style="margin: 0;padding: 0;width: 100%">
    <div class="main_container">
        <!-- page content -->
        <div class="right_col" style="margin: 0;padding: 0;" role="main">

            <!--流程图-->
            <div class="flow" style="float: left;width: 20%;margin-right: 2%;">
                <div class="panel" id="all_LC" style="height: 650px;">
                    <!---------------->
                    <div id="myflow">
                        <svg id="svg" xmlns="http://www.w3.org/2000/svg" version="1.1" width="2023.5" height="1009.5"
                             style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);width: 100%">

                            <defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                                <linearGradient id="r-071577f81fc6441ea882f877fea2a77e" x1="0.2493280028431808" y1="0"
                                                x2="0" y2="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                                    <stop offset="0%" stop-color="#81b7f7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                    <stop offset="50%" stop-color="#4992e7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                    <stop offset="100%" stop-color="#81b7f7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
                                          stop-opacity="1"></stop>
                                </linearGradient>
                                <linearGradient id="r-a3859e75978b45db9fc0865483ada749" x1="0.2493280028431808" y1="0"
                                                x2="0" y2="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                                    <stop offset="0%" stop-color="#81b7f7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                    <stop offset="50%" stop-color="#4992e7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                    <stop offset="100%" stop-color="#81b7f7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                </linearGradient>
                                <linearGradient id="r-f7d2586300d24737bd1d5605a6fd09d3" x1="0.2493280028431808" y1="0"
                                                x2="0" y2="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                                    <stop offset="0%" stop-color="#f9ac72"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                    <stop offset="50%" stop-color="#d97f38"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                    <stop offset="100%" stop-color="#f9ac72"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                </linearGradient>
                                <linearGradient id="r-51d84c516dba443da3220ac969411c41" x1="0.2493280028431808" y1="0"
                                                x2="0" y2="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                                    <stop offset="0%" stop-color="#81b7f7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                    <stop offset="50%" stop-color="#4992e7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                    <stop offset="100%" stop-color="#81b7f7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                </linearGradient>
                                <linearGradient id="r-bc6f349ea00b4837ae906284eb32feae" x1="0.2493280028431808" y1="0"
                                                x2="0" y2="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                                    <stop offset="0%" stop-color="#81b7f7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                    <stop offset="50%" stop-color="#4992e7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                    <stop offset="100%" stop-color="#81b7f7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                </linearGradient>
                                <linearGradient id="r-ba0ca264cb2643fa92e60eee13f4641b" x1="0.2493280028431808" y1="0"
                                                x2="0" y2="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                                    <stop offset="0%" stop-color="#81b7f7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                    <stop offset="50%" stop-color="#4992e7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                    <stop offset="100%" stop-color="#81b7f7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                </linearGradient>
                                <linearGradient id="r-4b17320cec264f688332b87a826d9aff" x1="0.2493280028431808" y1="0"
                                                x2="0" y2="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                                    <stop offset="0%" stop-color="#81b7f7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                    <stop offset="50%" stop-color="#4992e7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                    <stop offset="100%" stop-color="#81b7f7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                </linearGradient>
                                <linearGradient id="r-44ee27b9bee64da982b18cb712e8c95e" x1="0.2493280028431808" y1="0"
                                                x2="0" y2="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                                    <stop offset="0%" stop-color="#81b7f7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                    <stop offset="50%" stop-color="#4992e7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                    <stop offset="100%" stop-color="#81b7f7"
                                          style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></stop>
                                </linearGradient>
                            </defs>

                            <rect class="but-color" onclick="rectButton(1)" x="70" y="20" width="100" height="50" r="10"
                                  rx="10" ry="10"
                                  fill="#00a1ffbd" stroke="#ffffff" opacity="1"
                                  fill-opacity="1" stroke-width="1" id="1"
                                  style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1; fill-opacity: 1; stroke-width: 1px;"
                            ></rect>

                            <text x="120" y="50" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none"
                                  fill="#000000"
                                  style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 13px Arial;"
                                  font-size="13px">
                                <tspan id="goRepair" onclick="rectButton(1,1)"
                                       style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">施工上报0条
                                </tspan>
                            </text>

                            <rect x="70" y="150" width="100" height="50" r="10" rx="10" ry="10"
                                  fill="#00a1ffbd" stroke="#ffffff" opacity="1"
                                  fill-opacity="1" stroke-width="1" id="2" onclick="rectButton(2)"
                                  style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1; fill-opacity: 1; stroke-width: 1px;"
                            ></rect>

                            <text x="120" y="180" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none"
                                  fill="#000000"
                                  style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 13px Arial;"
                                  font-size="13px">
                                <tspan id="received" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
                                       onclick="rectButton(1,2)">行业审批0条
                                </tspan>
                            </text>

                            <rect x="70" y="280" width="100" height="50" r="10" rx="10" ry="10"
                                  fill="#00a1ffbd" stroke="#ffffff" opacity="1"
                                  fill-opacity="1" stroke-width="1" id="3" onclick="rectButton(3)"
                                  style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1; fill-opacity: 1; stroke-width: 1px;"
                            ></rect>

                            <text x="120" y="310" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none"
                                  fill="#000000"
                                  style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 13px Arial;"
                                  font-size="13px">
                                <tspan id="repair" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
                                       onclick="rectButton(1,3)">交警确认0条
                                </tspan>
                            </text>

                            <rect x="70" y="410" width="100" height="50" r="10" rx="10" ry="10"
                                  fill="#00a1ffbd" stroke="#ffffff" opacity="1"
                                  fill-opacity="1" stroke-width="1" id="4" onclick="rectButton(4)"
                                  style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1; fill-opacity: 1; stroke-width: 1px;"
                            ></rect>

                            <text x="120" y="440" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none"
                                  fill="#000000"
                                  style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 13px Arial;"
                                  font-size="13px">
                                <tspan id="repair" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
                                       onclick="rectButton(1,4)">竣工完成0条
                                </tspan>
                            </text>

                            <path fill="none" stroke="#808080" d="M120,75L120,125L120,145" stroke-width="2"
                                  style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); stroke-width: 2px;"></path>
                            <path fill="#808080" stroke="#808080"
                                  d="M120,145L123.46410161513776,139L116.53589838486224,139Z" stroke-width="2"
                                  style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); stroke-width: 2px;"></path>

                            <path fill="none" stroke="#808080" d="M120,270L120,270L120,205" stroke-width="2"
                                  style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); stroke-width: 2px;"></path>
                            <path fill="#808080" stroke="#808080"
                                  d="M120,275L123.46410161513776,269L116.53589838486224,269Z" stroke-width="2"
                                  style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); stroke-width: 2px;"></path>

                            <path fill="none" stroke="#808080" d="M120,395L120,400L120,335" stroke-width="2"
                                  style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); stroke-width: 2px;"></path>
                            <path fill="#808080" stroke="#808080"
                                  d="M120,405L123.46410161513776,399L116.53589838486224,399Z" stroke-width="2"
                                  style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); stroke-width: 2px;"></path>
                        </svg>
                    </div>
                    <!---------------->
                </div>
            </div>

            <!--表单-->
            <div class=""
                 style="float:left; height: 812px;   width:78%; overflow-y: auto;overflow-x: hidden">

                <div class="panel panel-default ">
                    <div class="panel-heading">查询条件</div>
                    <div class="panel-body">

                        <form id="formSearch" class="form-horizontal">
                            <div class="form-group row" style="margin:auto">

                                <span style="margin-top:10px;float: left">工程名称:</span>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="proName" autocomplete="off">
                                </div>

                                <span style="margin:10px 0 0 20px;float: left">工程进度:</span>
                                <div class="col-sm-4">

                                    <select class="form-control" id="proSchedule">
                                        <option value="3">--请选择--</option>
                                        <option value="0">未进场</option>
                                        <option value="1">施工中</option>
                                        <option value="2">已完工</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row" style="margin:10px auto">
                                <span style="margin-top:10px;float: left">工程状态:</span>
                                <div class="col-sm-4">
                                    <select class="form-control" id="proStatus">
                                        <option value="3">--请选择--</option>
                                        <option value="0">未审批</option>
                                        <option value="1">未确认</option>
                                    </select>
                                </div>

                                <span style="margin:10px 0 0 20px;float: left">工程类型:</span>
                                <div class="col-sm-4">
                                    <select class="form-control"  id="proType">
                                        <option value="3">--请选择--</option>
                                        <option value="0">大中修工程</option>
                                        <option value="1">应急抢险</option>
                                        <option value="2">日常维修</option>
                                    </select>
                                </div>

                                <div class="col-sm-1" style="text-align:center;">
                                    <button type="button" id="btn_query" class="btn btn-primary btn-sm"
                                            onclick="getProMessageByCondition(1)">查询
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
                                    <th style="width: 5%;"><input type="checkbox"></th>
                                    <th style="width: 5%;">序号</th>
                                    <th style="width: 23%;">工程名称</th>
                                    <th style="width: 8%;">工程类型</th>
                                    <th style="width: 13%;">工程编号</th>
                                    <th style="width: 10%;">开始时间</th>
                                    <th style="width: 10%;">结束时间</th>
                                    <th style="width: 8%;">工程状态</th>
                                    <th style="width: 8%;">工程进度</th>
                                    <th style="width: 10%;">操作</th>
                                </tr>
                                </thead>
                                <tbody id="tbody">
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th scope="row">1</th>
                                    <td>2018031101</td>
                                    <td>892管道工程</td>
                                    <td>大中修工程</td>
                                    <td>2019-03-12</td>
                                    <td>2019-06-12</td>
                                    <td>内部监管</td>
                                    <td style="text-align: center; width: 110px;padding: 0;line-height: 50px; ">
                                        <button style=" text-align:right;" class="btn btn-primary btn-sm">详细
                                        </button>
                                        <button style=" text-align:right;" class="btn btn-primary btn-sm">上报
                                        </button>
                                    </td>
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
            </div>

        </div>
        <!-- /page content -->
    </div>
</div>
</body>

<script src="../../../static/js/jquery.js"></script>
<%--分页--%>
<script src="../../../static/plugin/paging/jqPaginator.js" type="text/javascript"></script>
<script>
    //添加
    function add() {
        window.location.href = "http://localhost:8080/projectMessage/toAdd.do";
    }

    //流程图按钮颜色切换
    function rectButton(page, parameter) {
        $("#svg rect").removeClass("but-color");
        $('#' + parameter).addClass('but-color');
        if (parameter == 1) {
            //施工上报
            constructionReport(page, parameter);
        } else if (parameter == 2) {
            //行业审批
            industryApproval(page, parameter);
        } else if (parameter == 3) {
            //交警确认
            policeConfirm(page, parameter);
        } else if (parameter == 4) {
            //竣工完成
            completion(page, parameter);
        }
    }

    //上报
    function report(id) {

    }

    //施工上报
    function constructionReport(page, parameter) {
        $.ajax({
            type: "post",
            url: '/projectMessage/projectQueryIndex.do',
            data: {'page': page},
            async: false,
            success: function (data) {
                var ProjectMessages = JSON.parse(data);
                //总数
                $("#PageCount").val(ProjectMessages.total);
                //每页显示条数
                $("#PageSize").val("10");

                //基本数据
                parseResult(ProjectMessages);
                loadPage(parameter);
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }

    //行业审批
    function industryApproval(page, parameter) {
        $.ajax({
            type: "post",
            url: '/projectMessage/industryApproval.do',
            data: {'page': page},
            async: false,
            success: function (data) {
                var ProjectMessages = JSON.parse(data);
                //总数
                $("#PageCount").val(ProjectMessages.total);
                //每页显示条数
                $("#PageSize").val("10");

                //基本数据
                parseResult(ProjectMessages);
                loadPage(parameter);
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }

    //交警确认
    function policeConfirm(page, parameter) {
        $.ajax({
            type: "post",
            url: '/projectMessage/policeConfirm.do',
            data: {'page': page},
            async: false,
            success: function (data) {
                var ProjectMessages = JSON.parse(data);
                //总数
                $("#PageCount").val(ProjectMessages.total);
                //每页显示条数
                $("#PageSize").val("10");

                //基本数据
                parseResult(ProjectMessages);
                loadPage(parameter);
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }

    //竣工完成
    function completion(page, parameter) {

    }

    //分页
    function exeData(page, type, parameter) {
        //施工上报
        if (parameter === 1) {
            constructionReport(page);

            //行业审批
        } else if (parameter === 2) {
            industryApproval(page);

            //交警确认
        } else if (parameter === 3) {
            policeConfirm(page);

            //竣工完成
        }else if (parameter === 4) {
            completion(page);
        }

    }

    //加载页面
    function loadPage(parameter) {
        var myPageCount = parseInt($("#PageCount").val());
        var myPageSize = parseInt($("#PageSize").val());
        var countindex = Math.ceil(myPageCount / myPageSize);
        $("#countindex").val(countindex);

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

    //解析list
    function parseResult(ProjectMessages) {
        //结果集
        var ProjectMessageList = ProjectMessages.list;
        //当前页
        var pageNum = ProjectMessages.pageNum;
        //插入tbody
        var ProjectMessage = '';
        if (ProjectMessageList.length === 0) {
            ProjectMessage += '<tr>';
            ProjectMessage += '<td colspan="9">' + '暂无数据' + '</td>';
            ProjectMessage += '</tr>';
        } else {
            for (var i = 0; i < ProjectMessageList.length; i++) {
                ProjectMessage += '<tr>';
                ProjectMessage += '<th><input type="checkbox" value="' + ProjectMessageList[i].id + '" onclick="window.event.cancelBubble=true;"></th>';
                ProjectMessage += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 10 + i + 1) + '</td>';
                ProjectMessage += '<td>' + ProjectMessageList[i].proName + '</td>';
                ProjectMessage += '<td>' + ProjectMessageList[i].proTypeStr + '</td>';
                ProjectMessage += '<td>' + ProjectMessageList[i].proNum + '</td>';
                ProjectMessage += '<td>' + ProjectMessageList[i].proStartTimeStr + '</td>';
                ProjectMessage += '<td>' + ProjectMessageList[i].proEndTimeStr + '</td>';
                ProjectMessage += '<td>' + ProjectMessageList[i].proStatusStr + '</td>';
                ProjectMessage += '<td>' + ProjectMessageList[i].proScheduleStr + '</td>';
                ProjectMessage += '<td style="text-align: center; width: 110px;">';
                ProjectMessage += '<button class="btn btn-primary btn-sm" onclick="details(' + ProjectMessageList[i].id + ')">详细';
                ProjectMessage += '</button>';
                ProjectMessage += '<button class="btn btn-primary btn-sm" onclick="report(' + ProjectMessageList[i].id + ')">上报';
                ProjectMessage += '</button>';
                ProjectMessage += '</td>';
                ProjectMessage += '</tr>';
            }
        }

        $('#tbody').html(ProjectMessage);
    }

    //工程详情
    function details(id) {
        window.location.href = "http://localhost:8080/projectMessage/toDetails.do?id=" + id;
    }

    //删除
    function remove() {
        var length = $("tbody input:checked").length;
        if (length != 1) {
            alert("一次只能选择一条数据");
            return false;
        } else {
            var id = $("tbody input:checked").val();
            $.ajax({
                type: 'post',
                url: '/projectMessage/remove.do',
                data: {'id': id},
                error: function () {
                    alert("Connection error");
                },
                success: function (result) {
                    if (result == 'success') {
                        alert("删除成功");
                        window.location.reload();
                    } else {
                        alert("删除失败");
                    }
                }
            });
        }
    }

    //修改
    function edit() {
        var length = $("tbody input:checked").length;
        if (length != 1) {
            alert("一次只能选择一条数据");
            return false;
        } else {
            var id = $("tbody input:checked").val();
            window.location.href = "http://localhost:8080/projectMessage/toEdit.do?id=" + id;
        }
    }



    //条件查询方法
    function getProMessageByCondition(page) {
        var proName =$ ("#proName").val();
        var proSchedule =$ ("#proSchedule").val();
        var proType =$ ("#proType").val();
        var proStatus =$ ("#proStatus").val();

        $.ajax({
            type: "post",
            url: '/projectMessage/getProMessageByCondition.do',
            data: {
                'page': page,
                'proName':proName,
                'proSchedule':proSchedule,
                'proType':proType,
                'proStatus':proStatus
            },
            success: function (data) {
                var ProjectMessages = JSON.parse(data);
                //总数
                $("#PageCount").val(ProjectMessages.total);
                //每页显示条数
                $("#PageSize").val("10");

                //基本数据
                parseResult(ProjectMessages);

            },
            error: function (result) {
                alert("出错！");
            }
        })
    }
</script>
</html>