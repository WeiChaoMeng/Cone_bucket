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

<div style="height: 100%;width: 100%;background-color:#012038">

    <div class="main-con-title">
        <span class="main-tit-name">日志列表</span>
    </div>

    <div id="div_table" style="padding: 20px 20px 0;">
        <div class="bootstrap-table">
            <div class="fixed-table-container" style="padding-bottom: 0;">
                <div class="fixed-table-body">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th style="width: 5%;background: #052846;">序号</th>
                            <th style="width: 15%;background: #052846;">操作日期</th>
                            <th style="width: 10%;background: #052846;">日志类型</th>
                            <th style="width: 50%;background: #052846;">日志内容</th>
                            <th style="width: 10%;background: #052846;">用户</th>
                            <th style="width: 10%;background: #052846;">状态</th>
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
<script src="../../../static/js/log/warningLog.js"></script>
<%--分页--%>
<script src="../../../static/plugin/paging/jqPaginator.js" type="text/javascript"></script>
</body>
</html>
