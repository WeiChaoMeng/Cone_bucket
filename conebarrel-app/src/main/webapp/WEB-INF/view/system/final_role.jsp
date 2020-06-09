<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>道路施工在线监管系统</title>
    <meta charset="UTF-8">
    <meta name="google" value="notranslate"><!-- 禁止Chrome 浏览器中自动提示翻译 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"><!--IE=edge：保持使用最高级别模式显示内容-->
    <meta name="renderer" content="webkit"><!--360浏览器-->
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <link rel="stylesheet" type="text/css" href="../../../static/css/popup-style.css">
    <%--分页--%>
    <link rel="stylesheet" type="text/css" href="../../../static/plugin/paging/htmleaf-demo.css">
</head>
<body>
<%--模态窗（添加角色）--%>
<div id="addRole" class="model-dis"></div>

<%--模态窗（编辑角色）--%>
<div id="editRole" class="model-dis"></div>

<%--模态窗（用户详情）--%>
<div id="roleDetails" class="model-dis"></div>

<%--模态窗（角色绑定权限）--%>
<div id="bindingPermission" class="model-dis">
    <div class="model-style">
        <table class="roleList-table">
            <tbody id="permissionBody"></tbody>
        </table>
        <div class="roleList-commit-div">
            <input class="btn btn-primary btn-sm" type="button" onclick="commitBindingPermission()" value="提交">
        </div>
    </div>
</div>

<div style="height: 100%;width: 100%;background-color:#012038">

    <div class="main-con-title">
        <span class="main-tit-name">条件查询</span>
    </div>

    <div class="panel-body" style="margin: 10px 20px 20px;padding: 0">

        <span id="nickname" class="query-criteria-name" style="float: left;line-height: 34px;color: #fff;width: 70px;">角色名称</span>
        <div class="query-criteria-input" style="width: 20%;float: left;">
            <input type="text" class="form-control" id="characterName" autocomplete="off">
        </div>

        <button type="button" id="btn_add" class="btn btn-primary search-btn" style="margin: 0" onclick="add()">
            <img src="../../../static/img/add.png" style="margin-right: 3px;">新增
        </button>

        <button type="button" id="btn_query" class="btn btn-primary search-btn" style="margin-right: 10px"
                onclick="search(1)">
            <img src="../../../static/img/search.png" style="margin-right: 3px;">查询
        </button>
    </div>

    <div id="div_table" style="padding: 0 20px;">
        <div class="bootstrap-table">
            <div class="fixed-table-container" style="padding-bottom: 0;">
                <div class="fixed-table-body">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th style="width: 5%;background: #052846;">序号</th>
                            <th style="width: 32%;background: #052846;">角色名称</th>
                            <th style="width: 33%;background: #052846;">角色描述</th>
                            <th style="width: 30%;background: #052846;">操作</th>
                        </tr>
                        </thead>

                        <tbody id="tbody"></tbody>
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

<script src="../../../static/js/jquery-1.12.4.min.js"></script>
<script src="../../../static/plugin/layer/layer.js"></script>
<script src="../../../static/js/systemManager/roleInfo.js"></script>
<%--分页--%>
<script src="../../../static/plugin/paging/jqPaginator.js" type="text/javascript"></script>
</body>
</html>
