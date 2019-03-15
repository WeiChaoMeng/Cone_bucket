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
    <meta charset="UTF-8">
    <title>锥桶日志</title>
    <link rel="stylesheet" href="../../../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../static/css/log.css">
</head>
<body>

<div class="main_container">
    <!-- page content -->
    <div class="panel panel-default">
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
    </div>

    <!--table-->
    <div class="table-style">
        <div class="table-style-padding">

            <div class="x_content">

                <table class="table table-bordered">
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
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>2019-03-12 09:23:00</td>
                        <td>录入</td>
                        <td>锥桶：xxx</td>
                        <td>admin</td>
                        <td>成功</td>
                    </tr>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
    <!-- /page content -->
</div>
</body>
</html>