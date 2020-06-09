<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>道路施工在线监管系统</title>
    <meta charset="UTF-8">
    <meta name="google" value="notranslate"><!-- 禁止Chrome 浏览器中自动提示翻译 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"><!--IE=edge：保持使用最高级别模式显示内容-->
    <meta name="renderer" content="webkit"><!--360浏览器-->
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <link rel="stylesheet" href="../../../static/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../../../static/css/project-manage.css">
    <link rel="stylesheet" type="text/css" href="../../../static/plugin/paging/htmleaf-demo.css">
    <script src="../../../static/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="http://219.159.45.138:8087/gisServer4.0/getApi?key=86aa4f63dbc26d401fd9fadd24b659db45ca"></script>

<%--<link rel="stylesheet" type="text/css" href="../../../static/css/popup-style.css">--%>
<%--<link rel="stylesheet" type="text/css" href="../../../static/css/right.css">--%>
    <%--<link rel="stylesheet" href="../../../static/css/common.css">--%>
    <%--<link rel="shortcut icon" href="../../../static/img/favicon.ico" type="image/x-icon"/>--%>
    <%--<link rel="stylesheet" href="../../../static/css/logo.css">--%>
    <%--<link rel="stylesheet" href="../../../static/css/font-awesome.min.css">--%>
    <%--<link rel="stylesheet" href="../../../static/css/project.css">--%>
    <%--<link rel="stylesheet" href="../../../static/css/nav.css">--%>
    <%--<link rel="stylesheet" href="../../../static/css/style.css">--%>
    <%--<link rel="stylesheet" href="../../../static/css/table-style.css">--%>
    <%--分页--%>
</head>
<body>

<%--模态窗（工程详情）--%>
<div id="projectDetailed" class="model-dis">
    <div class="content" style="width: 100%">
        <table class="table table-bordered" style="text-align: center;font-size: 13px;margin: 0;height: 100%">
            <tbody id="tbo"></tbody>
        </table>
    </div>
</div>

<div class="sub-con-right">

    <div class="main-con-title">
        <span class="main-tit-name">条件查询</span>
    </div>

    <%--流程图--%>
    <div id="node_div">
        <div class="qm_b">
            <table style="margin: auto; width: 60%" border="0" cellspacing="0" cellpadding="0" class="qm_tab">
                <tbody>
                <tr class="qm_to">
                    <td>
                        <div id="constructionSvg" nodeid="initialization" class="lc_b styb"
                             onclick="rectButton(0)">施工上报<br>(${notReported})条
                        </div>
                    </td>

                    <td>
                        <div class="r"></div>
                    </td>

                    <td>
                        <div id="industrySvg" nodeid="60FF46D2-127A-48ED-BABC-B9567E3717D0" class="lc_b styb"
                             onclick="rectButton(1)">内部审批<br>(${industryApprovalNumber})条
                        </div>
                    </td>

                    <td>
                        <div class="r"></div>
                    </td>

                    <td>
                        <div id="implementationSvg" nodeid="C71AB4CC-97BF-48CF-A2D2-98CE2A2E95B5" class="lc_b styb"
                             onclick="rectButton(2)">工程实施<br>(${projectImplementNumber})条
                        </div>
                    </td>

                    <td>
                        <div class="r"></div>
                    </td>

                    <td>
                        <div id="completionSvg" nodeid="47BD1320-D375-4405-885E-64F9C3745FFB" class="lc_b styb"
                             onclick="rectButton(3)">施工完成<br>(${completed})条
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <script type="text/javascript">
            $("div[nodeId='initialization']").removeClass("styb").addClass("styc");
            var curr;
            $(".styb").click(function () {
                $(".styc").addClass("styb");
                $(this).removeClass("styb").addClass("styc");
                curr = $(this).attr("id");
            })
            $(".styc").click(function () {
                $(".styc").addClass("styb");
                $(this).removeClass("styb").addClass("styc");
                curr = $(this).attr("id");
            });
        </script>
    </div>

    <%--查询--%>
    <div class="panel-body">

        <span class="query-criteria-name">工程名称</span>
        <div class="query-criteria-input">
            <input type="hidden" id="proStatus" value="0">
            <input type="text" class="form-control" id="proName" autocomplete="off">
        </div>

        <span class="query-criteria-name" style="margin-left: 15px;">工程类型</span>
        <div class="query-criteria-select">
            <select class="form-control" id="proType">
                <option value="">--请选择--</option>
                <c:forEach items="${projectTypeList}" var="projectType">
                    <option value="${projectType.id}">${projectType.typeName}</option>
                </c:forEach>
            </select>
        </div>

        <div id="proScheduleSelect">
            <span class="query-criteria-name" style="margin-left: 15px;">工程进度</span>
            <div class="query-criteria-select">
                <select class="form-control" id="proSchedule">
                    <option value="">--请选择--</option>
                    <c:forEach items="${projectScheduleList}" var="projectSchedule">
                        <option value="${projectSchedule.id}">${projectSchedule.scheduleName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <button type="button" id="btn_add" class="btn btn-primary search-btn" style="margin: 0" onclick="add()">
            <img src="../../../static/img/add.png" style="margin-right: 3px;">新增
        </button>

        <button type="button" id="btn_query" class="btn btn-primary search-btn" style="margin-right: 10px"
                onclick="getProMessageByCondition(1)">
            <img src="../../../static/img/search.png" style="margin-right: 3px;">查询
        </button>
    </div>

    <div id="div_table" style="padding: 0 20px;">
        <table id="constructionTab" class="table table-bordered">
            <thead class="t-head">
            <tr>
                <th style="width: 5%;">序号</th>
                <th style="width: 20%;">工程名称</th>
                <th style="width: 10%;">工程类型</th>
                <th style="width: 12%;">工程编号</th>
                <th style="width: 11%;">开始时间</th>
                <th style="width: 11%;">结束时间</th>
                <th style="width: 8%;">工程状态</th>
                <th style="width: 23%;">操作</th>
            </tr>
            </thead>
            <tbody id="conTab">
            <tr>
                <td colspan="8" style="text-align: center;">暂无符合条件的数据</td>
            </tr>

            </tbody>
        </table>

        <table id="tbodyTab" class="table table-bordered">
            <thead  class="t-head">
            <tr>
                <th style="width: 5%;">序号</th>
                <th style="width: 27%;">工程名称</th>
                <th style="width: 10%;">工程类型</th>
                <th style="width: 12%;">工程编号</th>
                <th style="width: 11%;">开始时间</th>
                <th style="width: 11%;">结束时间</th>
                <th style="width: 12%;">工程状态</th>
                <th style="width: 12%;">操作</th>
            </tr>
            </thead>
            <tbody id="tbody">
            <tr>
                <td colspan="8" style="text-align: center;">暂无符合条件的数据</td>
            </tr>

            </tbody>
        </table>

        <%--实施--%>
        <table id="implementTab" class="table table-bordered">
            <thead  class="t-head">
            <tr>
                <th style="width: 5%;">序号</th>
                <th style="width: 20%;">工程名称</th>
                <th style="width: 10%;">工程类型</th>
                <th style="width: 10%;">工程编号</th>
                <th style="width: 11%;">开始时间</th>
                <th style="width: 11%;">结束时间</th>
                <th style="width: 12%;">工程状态</th>
                <th style="width: 8%;">工程进度</th>
                <th style="width: 13%;">操作</th>
            </tr>
            </thead>
            <tbody id="implement">
            <tr>
                <td colspan="9" style="text-align: center;">暂无符合条件的数据</td>
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

<script src="../../../static/plugin/layer/layer.js"></script>
<script src="../../../static/js/systemManager/projectManage.js"></script>
<%--分页--%>
<script src="../../../static/plugin/paging/jqPaginator.js" type="text/javascript"></script>
</body>
</html>
