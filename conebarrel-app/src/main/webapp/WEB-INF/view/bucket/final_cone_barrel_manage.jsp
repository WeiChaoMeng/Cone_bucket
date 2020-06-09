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
    <link rel="stylesheet" href="../../../static/css/cone-barrel-manage.css">
    <link rel="stylesheet" href="../../../static/plugin/paging/htmleaf-demo.css">
</head>
<body>

<%--模态窗（锥桶）--%>
<div id="addFrom" class="model-dis">
    <div class="model-style" style="padding: 15px;">
        <div class="user-add-div">
            <label class="user-add-label" style="width: 23%;">锥桶编号：</label>
            <div class="user-add-div-div" style="width: 75%;display: inline-block;">
                <input type="text" id="coneBarrelNumbering" class="form-control"
                       oninput="value=value.replace(/[\W]/g,'')" autocomplete="off">
            </div>
        </div>

        <div class="user-add-div">
            <label class="user-add-label" style="width: 23%;">锥桶类型：</label>
            <select class="form-control" id="servicePlatform" style="width: 75%;display: inline-block;">
                <option value="0" selected>高德平台</option>
                <option value="1">内部监管</option>
            </select>
        </div>

        <div class="user-add-but-div" style="margin-top: 30px;">
            <button class="btn btn-primary btn-sm" onclick="addSubmit()">提交</button>
        </div>
    </div>
</div>

<div id="coneBarrelDom" class="sub-con-right">

    <div class="main-con-title">
        <span class="main-tit-name">条件查询</span>
    </div>

    <div class="search-condition-column">

        <span id="nickname" class="condition-search-1">锥桶编号</span>
        <div class="search-bar-input-style">
            <input type="text" class="form-control" id="coneBarrelNum" autocomplete="off">
            <input type="hidden" value="${currentPage}" id="currentPage">
        </div>

        <span id="roadgrade" class="condition-search-2">锥桶类型</span>
        <div class="search-bar-select-style">
            <select class="form-control" id="coneBarrelType">
                <option value="0">高德平台</option>
                <option value="1">内部监管</option>
            </select>
        </div>

        <%--<button type="button" id="btn_delete" class="btn btn-primary search-btn" style="margin: 0;"--%>
                <%--onclick="dellectConeBucket()">--%>
            <%--<img src="../../../static/img/del.png" style="margin-right: 3px;">删除--%>
        <%--</button>--%>

        <button type="button" id="btn_add" class="btn btn-primary search-btn" style="margin-right: 10px"
                onclick="add()">
            <img src="../../../static/img/add.png" style="margin-right: 3px;">新增
        </button>

        <button type="button" id="btn_query" class="btn btn-primary search-btn" style="margin-right: 10px"
                onclick="criteriaQueries(1,2)">
            <img src="../../../static/img/search.png" style="margin-right: 3px;">查询
        </button>
    </div>

    <div id="div_table" style="padding: 0 20px;">
        <table class="table table-bordered">
            <thead class="t-head">
            <tr>
                <th style="width: 12%;">设备编号</th>
                <th style="width: 12%;">设备状态</th>
                <th style="width: 10%;">剩余电量</th>
                <th style="width: 12%;">开机时长</th>
                <th style="width: 15%;">最后上报时间</th>
                <th style="width: 15%;">按键状态</th>
                <th style="width: 12%;">使用状态</th>
                <th style="width: 12%;">接入平台</th>
            </tr>
            </thead>

            <tbody id="tBo"></tbody>
        </table>

        <%--分页--%>
        <div id="paging">
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

<script src="../../../static/js/jquery-1.12.4.min.js"></script>
<script src="../../../static/plugin/layer/layer.js"></script>
<script src="../../../static/js/coneBarrelManager.js"></script>
<%--分页--%>
<script src="../../../static/plugin/paging/jqPaginator.js" type="text/javascript"></script>
</body>
</html>
