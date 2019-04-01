<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2019/3/14
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
    <script src="../../../static/js/jquery.js"></script>
    <script src="../../../static/plugin/layer/layer.js"></script>
</head>

<body class="nav-md">
<div class="main_container">

    <!--流程图-->
    <div class="flow">
        <div class="flow-content">
            <svg id="svg" class="flow-svg" xmlns="http://www.w3.org/2000/svg" version="1.1">

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

                <rect onclick="rectButton(0)" x="90" y="20" width="100" height="50" r="10"
                      rx="10" ry="10"
                      fill="#ff7d2f" stroke="#ffffff" opacity="1"
                      fill-opacity="1" stroke-width="1" id="0"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1; fill-opacity: 1; stroke-width: 1px;"
                ></rect>

                <text x="140" y="50" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none"
                      fill="#000000"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 13px Arial;"
                      font-size="13px">
                    <tspan id="constructionSvg" onclick="rectButton(0)"
                           style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">施工上报(${notReported})条
                    </tspan>
                </text>

                <rect x="90" y="150" width="100" height="50" r="10" rx="10" ry="10"
                      fill="#3eaefd" stroke="#ffffff" opacity="1"
                      fill-opacity="1" stroke-width="1" id="1" onclick="rectButton(1)"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1; fill-opacity: 1; stroke-width: 1px;"
                ></rect>

                <text x="140" y="180" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none"
                      fill="#000000"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 13px Arial;"
                      font-size="13px">
                    <tspan id="industrySvg" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
                           onclick="rectButton(1)">行业审批(${industryApprovalNumber})条
                    </tspan>
                </text>

                <rect x="90" y="280" width="100" height="50" r="10" rx="10" ry="10"
                      fill="#3eaefd" stroke="#ffffff" opacity="1"
                      fill-opacity="1" stroke-width="1" id="2" onclick="rectButton(2)"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1; fill-opacity: 1; stroke-width: 1px;"
                ></rect>

                <text x="140" y="310" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none"
                      fill="#000000"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 13px Arial;"
                      font-size="13px">
                    <tspan id="policeSvg" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
                           onclick="rectButton(2)">交警确认(${policeConfirmationNumber})条
                    </tspan>
                </text>

                <rect x="90" y="410" width="100" height="50" r="10" rx="10" ry="10"
                      fill="#3eaefd" stroke="#ffffff" opacity="1"
                      fill-opacity="1" stroke-width="1" id="3" onclick="rectButton(3)"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1; fill-opacity: 1; stroke-width: 1px;"
                ></rect>

                <text x="140" y="440" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none"
                      fill="#000000"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 13px Arial;"
                      font-size="13px">
                    <tspan id="implementationSvg" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
                           onclick="rectButton(3)">工程实施(${projectImplementNumber})条
                    </tspan>
                </text>

                <rect x="90" y="540" width="100" height="50" r="10" rx="10" ry="10"
                      fill="#3eaefd" stroke="#ffffff" opacity="1"
                      fill-opacity="1" stroke-width="1" id="4" onclick="rectButton(4)"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1; fill-opacity: 1; stroke-width: 1px;"
                ></rect>

                <text x="140" y="570" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none"
                      fill="#000000"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font: 13px Arial;"
                      font-size="13px">
                    <tspan id="completionSvg" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
                           onclick="rectButton(4)">竣工完成(${completed})条
                    </tspan>
                </text>

                <path fill="none" stroke="#808080" d="M140,75L140,125L140,145" stroke-width="2"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); stroke-width: 2px;"></path>
                <path fill="#808080" stroke="#808080"
                      d="M140,145L143.46410161513776,139L136.53589838486224,139Z" stroke-width="2"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); stroke-width: 2px;"></path>

                <path fill="none" stroke="#808080" d="M140,270L140,270L140,205" stroke-width="2"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); stroke-width: 2px;"></path>
                <path fill="#808080" stroke="#808080"
                      d="M140,275L143.46410161513776,269L136.53589838486224,269Z" stroke-width="2"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); stroke-width: 2px;"></path>

                <path fill="none" stroke="#808080" d="M140,395L140,400L140,335" stroke-width="2"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); stroke-width: 2px;"></path>
                <path fill="#808080" stroke="#808080"
                      d="M140,405L143.46410161513776,399L136.53589838486224,399Z" stroke-width="2"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); stroke-width: 2px;"></path>

                <path fill="none" stroke="#808080" d="M140,520L140,530L140,465" stroke-width="2"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); stroke-width: 2px;"></path>
                <path fill="#808080" stroke="#808080"
                      d="M140,535L143.46410161513776,529L136.53589838486224,529Z" stroke-width="2"
                      style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); stroke-width: 2px;"></path>
            </svg>
        </div>
    </div>

    <!--表单-->
    <div class="table-content-style">

        <div class="panel panel-default query-criteria">
            <div class="panel-heading">查询条件</div>

            <div class="manage-query-field">
                <span class="condition-name">工程名称:</span>
                <div class="manage-condition-input">
                    <input type="hidden" id="proStatus" value="0">
                    <input type="text" class="form-control" id="proName" autocomplete="off">
                </div>

                <span class="condition-name">工程类型:</span>
                <div class="manage-condition-select">
                    <select class="form-control" id="proType">
                        <option value="">--请选择--</option>
                        <c:forEach items="${projectTypeList}" var="projectType">
                            <option value="${projectType.id}">${projectType.typeName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div id="proScheduleSelect">
                    <span class="condition-name">工程进度:</span>
                    <div class="manage-condition-select">
                        <select class="form-control" id="proSchedule">
                            <option value="">--请选择--</option>
                            <c:forEach items="${projectScheduleList}" var="projectSchedule">
                                <option value="${projectSchedule.id}">${projectSchedule.scheduleName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="manage-condition-btn">
                    <button type="button" id="btn_query" onclick="getProMessageByCondition()"
                            class="btn btn-primary btn-sm">查询
                    </button>
                </div>

            </div>
        </div>

        <!--table-->
        <div class="manage-table-style">
            <div class="table-style-padding">

                <div class="fixed-table-toolbar">

                    <shiro:hasPermission name="projectEntry">
                        <div class="bs-bars pull-left">
                            <div id="toolbar" class="btn-group">

                                <button id="btn_add" type="button" class="btn btn-default" onclick="add()">
                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                                </button>

                                <button id="btn_edit" type="button" class="btn btn-default" onclick="edit()">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                                </button>

                                <button id="btn_delete" type="button" class="btn btn-default" onclick="del()">
                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                                </button>

                            </div>
                        </div>
                    </shiro:hasPermission>

                    <div class="columns columns-right btn-group pull-right">
                        <button class="btn btn-default" type="button" name="refresh" aria-label="refresh"
                                onclick="reload()"
                                title="刷新"><i class="fa fa-refresh"></i></button>
                    </div>
                </div>

                <div class="x_content">

                    <table id="tbodyTab" class="table table-bordered">
                        <thead>
                        <tr>
                            <th style="width: 5%;"><input type="checkbox"></th>
                            <th style="width: 5%;">序号</th>
                            <th style="width: 27%;">工程名称</th>
                            <th style="width: 10%;">工程类型</th>
                            <th style="width: 15%;">工程编号</th>
                            <th style="width: 10%;">开始时间</th>
                            <th style="width: 10%;">结束时间</th>
                            <th style="width: 8%;">工程状态</th>
                            <th style="width: 10%;">操作</th>
                        </tr>
                        </thead>
                        <tbody id="tbody">
                        <tr>
                            <td><input type="checkbox"></td>
                            <td scope="row">1</td>
                            <td>892管道工程</td>
                            <td>大中修工程</td>
                            <td>2018031101</td>
                            <td>2019-03-12</td>
                            <td>2019-06-12</td>
                            <td>未上报</td>
                            <td>未进场</td>
                            <td style="text-align: center; width: 110px;padding: 0;line-height: 50px; ">
                                <button style=" text-align:right;" class="btn btn-primary btn-sm">详细
                                </button>
                                <button style=" text-align:right;" class="btn btn-primary btn-sm">上报
                                </button>
                            </td>
                        </tr>

                        </tbody>
                    </table>

                    <%--实施--%>
                    <table id="implementTab" class="table table-bordered">
                        <thead>
                        <tr>
                            <th style="width: 5%;"><input type="checkbox"></th>
                            <th style="width: 5%;">序号</th>
                            <th style="width: 21%;">工程名称</th>
                            <th style="width: 8%;">工程类型</th>
                            <th style="width: 15%;">工程编号</th>
                            <th style="width: 10%;">开始时间</th>
                            <th style="width: 10%;">结束时间</th>
                            <th style="width: 8%;">工程状态</th>
                            <th style="width: 8%;">工程进度</th>
                            <th style="width: 10%;">操作</th>
                        </tr>
                        </thead>
                        <tbody id="implement">
                        <tr>
                            <td><input type="checkbox"></td>
                            <td scope="row">1</td>
                            <td>892管道工程</td>
                            <td>大中修工程</td>
                            <td>2018031101</td>
                            <td>2019-03-12</td>
                            <td>2019-06-12</td>
                            <td>未上报</td>
                            <td>未进场</td>
                            <td>施工中</td>
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
    </div>

</div>
</body>

<%--分页--%>
<script src="../../../static/plugin/paging/jqPaginator.js" type="text/javascript"></script>
<script>

    //流程图按钮颜色切换
    function rectButton(parameter) {
        var page = 1;
        $("#svg rect").attr("fill", "#3eaefd");
        $('#' + parameter).attr("fill", "#ff7d2f");
        if (parameter === 0) {
            $('#proStatus').val(parameter);
            //施工上报
            constructionReport(page, parameter);
        } else if (parameter === 1) {
            $('#proStatus').val(parameter);
            //行业审批
            industryApproval(page, parameter);
        } else if (parameter === 2) {
            $('#proStatus').val(parameter);
            //交警确认
            policeConfirm(page, parameter);
        } else if (parameter === 3) {
            $('#proStatus').val(parameter);
            //工程实施
            projectImplement(page, parameter);
        } else if (parameter === 4) {
            $('#proStatus').val(parameter);
            //竣工完成
            completion(page, parameter);
        }
    }

    /*------------施工上报---------------*/
    //施工上报页面
    function constructionReport(page, parameter) {
        //删除按钮
        $('#toolbar').css('display', 'block');
        //工程进度筛选
        $('#proScheduleSelect').css('display', 'none');

        var proName = $("#proName").val();
        var proType = $("#proType").val();
        var proStatus = $("#proStatus").val();
        var proSchedule = '';

        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/projectMessage/notReported.do',
            data: {
                'page': page,
                'proName': proName,
                'proSchedule': proSchedule,
                'proType': proType,
                'proStatus': proStatus
            },
            async: false,
            success: function (data) {
                $('#tbodyTab').show();
                $('#implementTab').hide();

                var map = JSON.parse(data);
                $('#constructionSvg').text('施工上报(' + map.notReported + ')条');
                $('#industrySvg').text('行业审批(' + map.industryApprovalNumber + ')条');
                $('#policeSvg').text('交警确认(' + map.policeConfirmationNumber + ')条');
                $('#implementationSvg').text('工程实施(' + map.projectImplementNumber + ')条');
                $('#completionSvg').text('竣工完成(' + map.completed + ')条');

                var ProjectMessages = map.pageInfo;

                //总数
                $("#PageCount").val(ProjectMessages.total);
                //每页显示条数
                $("#PageSize").val("8");

                //基本数据
                //结果集
                var ProjectMessageList = ProjectMessages.list;
                //当前页
                var pageNum = ProjectMessages.pageNum;
                //插入tbody
                var ProjectMessage = '';
                if (ProjectMessageList.length === 0) {
                    ProjectMessage += '<tr>';
                    ProjectMessage += '<td colspan="9" style="text-align: center;">' + '暂无符合条件的数据' + '</td>';
                    ProjectMessage += '</tr>';
                } else {
                    for (var i = 0; i < ProjectMessageList.length; i++) {
                        ProjectMessage += '<tr>';
                        ProjectMessage += '<td><input type="checkbox" value="' + ProjectMessageList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                        ProjectMessage += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 8 + i + 1) + '</td>';
                        ProjectMessage += '<td class="table-td-content">' + ProjectMessageList[i].proName + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proTypeStr + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proNum + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proStartTimeStr + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proEndTimeStr + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proStatusStr + '</td>';
                        ProjectMessage += '<td style="text-align: center; width: 110px;">';
                        ProjectMessage += '<button class="btn btn-primary btn-sm" style="margin-right: 5px;" onclick="details(' + ProjectMessageList[i].id + ')">详细';
                        ProjectMessage += '</button>';
                        <shiro:hasPermission name="projectEntry">
                        ProjectMessage += '<button class="btn btn-primary btn-sm" onclick="report(' + ProjectMessageList[i].id + ')">上报';
                        ProjectMessage += '</button>';
                        </shiro:hasPermission>
                        ProjectMessage += '</td>';
                        ProjectMessage += '</tr>';
                    }
                }

                $('#tbody').html(ProjectMessage);

                loadPage(parameter);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    //流程-施工上报
    function report(id) {
        var status = 1;
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/projectMessage/projectReport.do',
            data: {'id': id, 'status': status},
            async: false,
            error: function (request) {
                alert("Connection error");
            },
            success: function (data) {
                if (data === "success") {
                    layer.msg('上报成功');
                    constructionReport(1, 0);
                } else {
                    layer.msg('上报失败');
                }
            }
        })
    }

    /*----------------行业审批-----------------*/

    //行业审批页面
    function industryApproval(page, parameter) {
        //删除
        $('#toolbar').css('display', 'none');
        //工程进度筛选
        $('#proScheduleSelect').css('display', 'none');

        var proName = $("#proName").val();
        var proType = $("#proType").val();
        var proStatus = $("#proStatus").val();
        var proSchedule = '';
        var assignee = 'industryApproval';

        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/projectMessage/getTaskByAssignee.do',
            data: {
                'assignee': assignee,
                'page': page,
                'proName': proName,
                'proSchedule': proSchedule,
                'proType': proType,
                'proStatus': proStatus
            },
            async: false,
            success: function (data) {
                $('#tbodyTab').show();
                $('#implementTab').hide();

                var map = JSON.parse(data);
                $('#constructionSvg').text('施工上报(' + map.notReported + ')条');
                $('#industrySvg').text('行业审批(' + map.industryApprovalNumber + ')条');
                $('#policeSvg').text('交警确认(' + map.policeConfirmationNumber + ')条');
                $('#implementationSvg').text('工程实施(' + map.projectImplementNumber + ')条');
                $('#completionSvg').text('竣工完成(' + map.completed + ')条');

                var ProjectMessages = map.pageInfo;

                var pro = '';
                if (ProjectMessages == "") {
                    pro += '<tr>';
                    pro += '<td colspan="9" style="text-align: center;">' + '暂无符合条件的数据' + '</td>';
                    pro += '</tr>';
                    $("#PageCount").val(0);
                    //每页显示条数
                    $("#PageSize").val("8");
                } else {
                    //总数
                    $("#PageCount").val(ProjectMessages.total);
                    //每页显示条数
                    $("#PageSize").val("8");

                    //基本数据
                    var ProjectMessageList = ProjectMessages.list;
                    //当前页
                    var pageNum = ProjectMessages.pageNum;

                    for (var i = 0; i < ProjectMessageList.length; i++) {
                        pro += '<tr>';
                        pro += '<td><input type="checkbox" value="' + ProjectMessageList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                        pro += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 8 + i + 1) + '</td>';
                        pro += '<td class="table-td-content">' + ProjectMessageList[i].proName + '</td>';
                        pro += '<td>' + ProjectMessageList[i].proTypeStr + '</td>';
                        pro += '<td>' + ProjectMessageList[i].proNum + '</td>';
                        pro += '<td>' + ProjectMessageList[i].proStartTimeStr + '</td>';
                        pro += '<td>' + ProjectMessageList[i].proEndTimeStr + '</td>';
                        pro += '<td>' + ProjectMessageList[i].proStatusStr + '</td>';
                        pro += '<td style="text-align: center; width: 110px;">';
                        pro += '<button class="btn btn-primary btn-sm" style="margin-right: 5px;" onclick="details(' + ProjectMessageList[i].id + ')">详细</button>';
                        <shiro:hasPermission name="IndustryApproval">
                        pro += '<button class="btn btn-primary btn-sm" onclick="industryPerform(' + ProjectMessageList[i].taskId + ',' + ProjectMessageList[i].id + ')">通过</button>';
                        </shiro:hasPermission>
                        pro += '</td>';
                        pro += '</tr>';
                    }
                }

                $('#tbody').html(pro);
                loadPage(parameter);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    //流程-行业审批通过处理
    function industryPerform(taskId, id) {
        var status = 2;
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/projectMessage/industryPerform.do',
            data: {'taskId': taskId, 'id': id, 'status': status},
            error: function (request) {
                alert("Connection error");
            },
            success: function (data) {
                if (data === "success") {
                    layer.msg('处理成功');
                    industryApproval(1, 1);
                } else {
                    layer.msg('处理失败');
                }
            }
        })
    }

    /*---------------交警确认--------------------*/
    //交警确认页面
    function policeConfirm(page, parameter) {
        //删除
        $('#toolbar').css('display', 'none');
        //工程进度筛选
        $('#proScheduleSelect').css('display', 'none');

        var proName = $("#proName").val();
        var proType = $("#proType").val();
        var proStatus = $("#proStatus").val();
        var proSchedule = '';
        var assignee = 'policeConfirmation';

        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/projectMessage/getTaskByAssignee.do',
            data: {
                'assignee': assignee,
                'page': page,
                'proName': proName,
                'proSchedule': proSchedule,
                'proType': proType,
                'proStatus': proStatus
            },
            async: false,
            success: function (data) {
                $('#tbodyTab').show();
                $('#implementTab').hide();

                var map = JSON.parse(data);
                $('#constructionSvg').text('施工上报(' + map.notReported + ')条');
                $('#industrySvg').text('行业审批(' + map.industryApprovalNumber + ')条');
                $('#policeSvg').text('交警确认(' + map.policeConfirmationNumber + ')条');
                $('#implementationSvg').text('工程实施(' + map.projectImplementNumber + ')条');
                $('#completionSvg').text('竣工完成(' + map.completed + ')条');

                var ProjectMessages = map.pageInfo;

                //插入tbody
                var ProjectMessage = '';
                if (ProjectMessages == "") {
                    ProjectMessage += '<tr>';
                    ProjectMessage += '<td colspan="9" style="text-align: center;">' + '暂无符合条件的数据' + '</td>';
                    ProjectMessage += '</tr>';
                    $("#PageCount").val(0);
                    //每页显示条数
                    $("#PageSize").val("8");
                } else {
                    //总数
                    $("#PageCount").val(ProjectMessages.total);
                    //每页显示条数
                    $("#PageSize").val("8");

                    //审批处理
                    //基本数据
                    var ProjectMessageList = ProjectMessages.list;
                    //当前页
                    var pageNum = ProjectMessages.pageNum;

                    for (var i = 0; i < ProjectMessageList.length; i++) {
                        ProjectMessage += '<tr>';
                        ProjectMessage += '<td><input type="checkbox" value="' + ProjectMessageList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                        ProjectMessage += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 8 + i + 1) + '</td>';
                        ProjectMessage += '<td class="table-td-content">' + ProjectMessageList[i].proName + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proTypeStr + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proNum + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proStartTimeStr + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proEndTimeStr + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proStatusStr + '</td>';
                        ProjectMessage += '<td style="text-align: center; width: 110px;">';
                        ProjectMessage += '<button class="btn btn-primary btn-sm" style="margin-right: 5px;" onclick="details(' + ProjectMessageList[i].id + ')">详细</button>';
                        <shiro:hasPermission name="policeConfirm">
                        ProjectMessage += '<button class="btn btn-primary btn-sm" onclick="policePerform(' + ProjectMessageList[i].taskId + ',' + ProjectMessageList[i].id + ')">通过</button>';
                        </shiro:hasPermission>
                        ProjectMessage += '</td>';
                        ProjectMessage += '</tr>';
                    }
                }

                $('#tbody').html(ProjectMessage);
                loadPage(parameter);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    //流程-交警审批通过处理
    function policePerform(taskId, id) {
        var status = 3;
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/projectMessage/policePerform.do',
            data: {'taskId': taskId, 'id': id, 'status': status},
            async: false,
            error: function (request) {
                alert("Connection error");
            },
            success: function (data) {
                if (data === "success") {
                    layer.msg('处理成功');
                    policeConfirm(1, 2);
                } else {
                    layer.msg('处理失败');
                }
            }
        })
    }

    /*-----------------工程实施------------------*/
    function projectImplement(page, parameter) {
        //删除
        $('#toolbar').css('display', 'none');
        //工程进度筛选
        $('#proScheduleSelect').css('display', 'block');

        var proName = $("#proName").val();
        var proSchedule = $("#proSchedule").val();
        var proType = $("#proType").val();
        var proStatus = $("#proStatus").val();
        var assignee = 'projectImplementation';

        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/projectMessage/getTaskByAssignee.do',
            data: {
                'assignee': assignee,
                'page': page,
                'proName': proName,
                'proSchedule': proSchedule,
                'proType': proType,
                'proStatus': proStatus
            },
            async: false,
            success: function (data) {
                $('#implementTab').show();
                $('#tbodyTab').hide();

                var map = JSON.parse(data);
                $('#constructionSvg').text('施工上报(' + map.notReported + ')条');
                $('#industrySvg').text('行业审批(' + map.industryApprovalNumber + ')条');
                $('#policeSvg').text('交警确认(' + map.policeConfirmationNumber + ')条');
                $('#implementationSvg').text('工程实施(' + map.projectImplementNumber + ')条');
                $('#completionSvg').text('竣工完成(' + map.completed + ')条');

                var ProjectMessages = map.pageInfo;

                //插入tbody
                var ProjectMessage = '';
                if (ProjectMessages == "") {
                    ProjectMessage += '<tr>';
                    ProjectMessage += '<td colspan="10" style="text-align: center;">' + '暂无符合条件的数据' + '</td>';
                    ProjectMessage += '</tr>';
                    $("#PageCount").val(0);
                    //每页显示条数
                    $("#PageSize").val("8");
                } else {
                    //总数
                    $("#PageCount").val(ProjectMessages.total);
                    //每页显示条数
                    $("#PageSize").val("8");

                    //基本数据
                    var ProjectMessageList = ProjectMessages.list;
                    //当前页
                    var pageNum = ProjectMessages.pageNum;

                    for (var i = 0; i < ProjectMessageList.length; i++) {
                        ProjectMessage += '<tr>';
                        ProjectMessage += '<td><input type="checkbox" value="' + ProjectMessageList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                        ProjectMessage += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 8 + i + 1) + '</td>';
                        ProjectMessage += '<td class="table-td-content">' + ProjectMessageList[i].proName + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proTypeStr + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proNum + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proStartTimeStr + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proEndTimeStr + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proStatusStr + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proScheduleStr + '</td>';
                        ProjectMessage += '<td style="text-align: center; width: 110px;">';
                        ProjectMessage += '<button class="btn btn-primary btn-sm" style="margin-right: 5px;" onclick="details(' + ProjectMessageList[i].id + ')">详细';
                        ProjectMessage += '</button>';
                        if (ProjectMessageList[i].proScheduleStr == "未进场") {
                            <shiro:hasPermission name="projectImplementation">
                            ProjectMessage += '<button class="btn btn-primary btn-sm" onclick="startWork(' + ProjectMessageList[i].id + ')">进场</button>';
                            </shiro:hasPermission>
                        } else {
                            <shiro:hasPermission name="projectImplementation">
                            ProjectMessage += '<button class="btn btn-primary btn-sm" onclick="implementPerform(' + ProjectMessageList[i].taskId + ',' + ProjectMessageList[i].id + ')">完工';
                            </shiro:hasPermission>
                        }
                        ProjectMessage += '</button>';
                        ProjectMessage += '</td>';
                        ProjectMessage += '</tr>';
                    }
                }

                $('#implement').html(ProjectMessage);
                loadPage(parameter);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    //进场
    function startWork(id) {
        var schedule = 1;
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/projectMessage/startWork.do',
            data: {'id': id, 'schedule': schedule},
            async: false,
            error: function (request) {
                alert("Connection error");
            },
            success: function (data) {
                if (data === "success") {
                    layer.msg('处理成功');
                    projectImplement(1, 3);
                } else {
                    layer.msg('处理失败');
                }
            }
        })
    }

    //流程-工程实施完工
    function implementPerform(taskId, id) {
        var schedule = 2;
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/projectMessage/implementationPerform.do',
            data: {'taskId': taskId, 'id': id, 'schedule': schedule},
            async: false,
            error: function (request) {
                alert("Connection error");
            },
            success: function (data) {
                if (data === "success") {
                    layer.msg('处理成功');
                    projectImplement(1, 3);
                } else {
                    layer.msg('处理失败');
                }
            }
        })
    }

    /*-----------------竣工完成------------------*/

    //竣工完成 页面
    function completion(page, parameter) {
        //删除按钮
        $('#toolbar').css('display', 'none');
        //工程进度筛选
        $('#proScheduleSelect').css('display', 'none');

        var proName = $("#proName").val();
        var proType = $("#proType").val();
        var proSchedule = 2;
        var proStatus = 3;

        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/projectMessage/completion.do',
            data: {
                'page': page,
                'proName': proName,
                'proSchedule': proSchedule,
                'proType': proType,
                'proStatus': proStatus
            },
            async: false,
            success: function (data) {
                $('#implementTab').show();
                $('#tbodyTab').hide();

                var map = JSON.parse(data);
                $('#constructionSvg').text('施工上报(' + map.notReported + ')条');
                $('#industrySvg').text('行业审批(' + map.industryApprovalNumber + ')条');
                $('#policeSvg').text('交警确认(' + map.policeConfirmationNumber + ')条');
                $('#implementationSvg').text('工程实施(' + map.projectImplementNumber + ')条');
                $('#completionSvg').text('竣工完成(' + map.completed + ')条');

                var ProjectMessages = map.pageInfo;

                var ProjectMessage = '';
                if (ProjectMessages == "") {
                    ProjectMessage += '<tr>';
                    ProjectMessage += '<td colspan="10" style="text-align: center;">' + '暂无符合条件的数据' + '</td>';
                    ProjectMessage += '</tr>';
                    $("#PageCount").val(0);
                    //每页显示条数
                    $("#PageSize").val("8");
                } else {
                    //总数
                    $("#PageCount").val(ProjectMessages.total);
                    //每页显示条数
                    $("#PageSize").val("8");

                    //结果集
                    var ProjectMessageList = ProjectMessages.list;
                    //当前页
                    var pageNum = ProjectMessages.pageNum;

                    for (var i = 0; i < ProjectMessageList.length; i++) {
                        ProjectMessage += '<tr>';
                        ProjectMessage += '<td><input type="checkbox" value="' + ProjectMessageList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                        ProjectMessage += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 8 + i + 1) + '</td>';
                        ProjectMessage += '<td class="table-td-content">' + ProjectMessageList[i].proName + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proTypeStr + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proNum + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proStartTimeStr + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proEndTimeStr + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proStatusStr + '</td>';
                        ProjectMessage += '<td>' + ProjectMessageList[i].proScheduleStr + '</td>';
                        ProjectMessage += '<td style="text-align: center; width: 110px;">';
                        ProjectMessage += '<button class="btn btn-primary btn-sm" onclick="details(' + ProjectMessageList[i].id + ')">详细';
                        ProjectMessage += '</button>';
                        ProjectMessage += '</td>';
                        ProjectMessage += '</tr>';
                    }
                }

                $('#implement').html(ProjectMessage);

                loadPage(parameter);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    //分页
    function exeData(page, type, parameter) {
        //施工上报
        if (parameter === 0) {
            constructionReport(page);

            //行业审批
        } else if (parameter === 1) {
            industryApproval(page);

            //交警确认
        } else if (parameter === 2) {
            policeConfirm(page);

            //工程实施
        } else if (parameter === 3) {
            projectImplement(page);

            //竣工完成
        } else if (parameter === 4) {
            completion(page);
        }

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

    //添加
    function add() {
        window.location.href = localStorage.getItem("ajaxUrl") + "/projectMessage/toAdd.do";
    }

    //删除
    function del() {
        var length = $("tbody input:checked").length;
        if (length != 1) {
            layer.msg('请选择数据!');
            return false;
        } else {
            var id = $("tbody input:checked").val();
            $.ajax({
                type: 'post',
                url: localStorage.getItem("ajaxUrl") + '/projectMessage/remove.do',
                data: {'id': id},
                error: function () {
                    layer.msg("Connection error");
                },
                success: function (result) {
                    if (result == 'success') {
                        layer.msg('删除成功!');
                        constructionReport(1, 0);
                    } else {
                        layer.msg('删除失败!');
                    }
                }
            });
        }
    }

    //修改
    function edit() {
        var length = $("tbody input:checked").length;
        if (length != 1) {
            layer.msg('请选择数据!');
            return false;
        } else {
            var id = $("tbody input:checked").val();
            window.location.href = localStorage.getItem("ajaxUrl") + "/projectMessage/toEdit.do?id=" + id;
        }
    }

    //条件查询方法
    function getProMessageByCondition() {
        var proStatus = $("#proStatus").val();

        if (proStatus == 0) {

            //施工上报
            constructionReport(1, 0);
        } else if (proStatus == 1) {

            //行业审批
            industryApproval(1, 1);
        } else if (proStatus == 2) {

            //交警确认
            policeConfirm(1, 2);
        } else if (proStatus == 3) {

            //工程实施
            projectImplement(1, 3);
        } else if (proStatus == 4) {

            //竣工完成
            completion(1, 4);
        }
    }

    //工程详情信息
    function details(id) {
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/projectMessage/details.do',
            data: {'id': id},
            async: false,
            success: function (data) {
                var mapObject = JSON.parse(data);
                parent.projectDetailed(mapObject);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        });
    }

    //重新加载页面
    function reload() {
        $('#tbody').html("");
        $('#implement').html("");
        setTimeout(function () {
            var proStatus = $("#proStatus").val();

            if (proStatus == 0) {

                //施工上报
                constructionReport(1, 0);
            } else if (proStatus == 1) {

                //行业审批
                industryApproval(1, 1);
            } else if (proStatus == 2) {

                //交警确认
                policeConfirm(1, 2);
            } else if (proStatus == 3) {

                //工程实施
                projectImplement(1, 3);
            } else if (proStatus == 4) {

                //竣工完成
                completion(1, 4);
            }
        }, 100)
    }

    /*function reload() {}*/

    //初始化工程管理页面
    $(function () {
        constructionReport(1, 0);
    });
</script>
</html>