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
    <!--table-->
    <c:if test="${empty logList}">
        当前锥桶无日志
    </c:if>

    <c:if test="${not empty logList}">
        <div class="table-style">
            <div class="table-style-padding">

                <div class="x_content">

                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th style="width: 15%">锥桶编号</th>
                            <th style="width: 15%">锥桶类型</th>
                            <th style="width: 10%">日志内容</th>
                            <th style="width: 10%">道路名称</th>
                            <th style="width: 15%">开始时间</th>
                            <th style="width: 15%">结束时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach  items="${logList}" var="item" >
                            <tr>
                                <th scope="row">${item.cone_bucket_num}</th>
                                <td>${item.type_name}</td>
                                <td>${item.cone_bucket_status}</td>
                                <td>${item.road_name}</td>
                                <td>${item.start_time}</td>
                                <td>${item.end_time}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </c:if>
    <!-- /page content -->
</div>
</body>
</html>