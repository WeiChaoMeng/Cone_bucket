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
    <link rel="stylesheet" href="../../../static/css/engineering.css">
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
                                <tspan id="goRepair" onclick="rectButton(1)"
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
                                       onclick="rectButton(2)">行业审批0条
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
                                       onclick="rectButton(3)">交警确认0条
                                </tspan>
                            </text>

                            <rect x="70" y="410" width="100" height="50" r="10" rx="10" ry="10"
                                  fill="#00a1ffbd" stroke="#ffffff" opacity="1"
                                  fill-opacity="1" stroke-width="1" id="3" onclick="rectButton(3)"
                                  style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1; fill-opacity: 1; stroke-width: 1px;"
                            ></rect>

                            <text x="120" y="440" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none"
                                  fill="#000000"
                                  style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 13px Arial;"
                                  font-size="13px">
                                <tspan id="repair" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
                                       onclick="rectButton(3)">竣工完成0条
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
                                    <input type="text" class="form-control" id="txt_search_road2" autocomplete="off">
                                </div>

                                <span style="margin:10px 0 0 20px;float: left">工程类型:</span>
                                <div class="col-sm-4">
                                    <select class="form-control" id="facilityCategory">
                                        <option value="">--请选择--</option>
                                        <option value="">大中修工程</option>
                                        <option value="">应急抢险</option>
                                        <option value="">日常维修</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row" style="margin:10px auto">
                                <span style="margin-top:10px;float: left">工程时间:</span>
                                <div class="col-sm-2">
                                    <input placeholder="开始时间" type="text" class="form-control " id="star"
                                           onfocus="WdatePicker({lang:'zh-cn'})" readonly="">
                                </div>
                                <div class="col-sm-2">
                                    <input placeholder="结束时间" type="text" class="form-control " id="end"
                                           onfocus="WdatePicker({lang:'zh-cn'})" readonly="">
                                </div>

                                <span style="margin:10px 0 0 20px;float: left">锥桶类型:</span>
                                <div class="col-sm-4">
                                    <select class="form-control" id="search">
                                        <option value="">--请选择--</option>
                                        <option value="">内部监管</option>
                                        <option value="">高德平台</option>
                                    </select>
                                </div>

                                <div class="col-sm-1" style="text-align:center;">
                                    <button type="button" id="btn_query" class="btn btn-primary btn-sm"
                                            onclick="query()">查询
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
                                    <th><input type="checkbox"></th>
                                    <th>序号</th>
                                    <th>工程编号</th>
                                    <th>工程名称</th>
                                    <th>工程类型</th>
                                    <th>开始时间</th>
                                    <th>结束时间</th>
                                    <th>锥桶类型</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
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
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th scope="row">2</th>
                                    <td>2018031102</td>
                                    <td>路面维护</td>
                                    <td>日常维修</td>
                                    <td>2019-03-12</td>
                                    <td>2019-03-15</td>
                                    <td>无</td>
                                    <td style="text-align: center; width: 110px;padding: 0;line-height: 50px; ">
                                        <button style=" text-align:right;" class="btn btn-primary btn-sm">详细
                                        </button>
                                        <button style=" text-align:right;" class="btn btn-primary btn-sm">上报
                                        </button>
                                    </td>
                                </tr>

                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- /page content -->
    </div>
</div>
</body>

<script src="../../../static/js/jquery-1.12.4.min.js"></script>
<script>
    function add() {
        window.location.href = "http://localhost:8080/addEngineering.do";
    }
</script>
</html>