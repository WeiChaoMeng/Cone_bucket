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
    <%--分页--%>
    <link rel="stylesheet" type="text/css" href="../../../static/plugin/paging/htmleaf-demo.css">
</head>
<body>

<div class="main_container">

    <!--table-->
    <div class="table-style">
        <div class="table-style-padding">

            <div class="x_content">

                <table class="table table-bordered" style="border-left: none;border-right: none;">
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
                    <tbody id="tbodys" >
                    <c:forEach items="${pageBean.pageData}" var="item">
                        <tr>
                            <th scope="row">${item.coneBucketNum}</th>
                            <td>${item.coneBucketName}</td>
                            <td>${item.coneBucketStatus}</td>
                            <td>${item.roadName}</td>
                            <td>${item.startTime}</td>
                            <td>${item.endTime}</td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>

            </div>
        </div>
        <!--pagination start-->
        <div class="paging-table-div">
            <ul class="pagination">
                <%--首页--%>
                <!-- 因为首页也是第一页,所以我们没有加当前页码参数,servlet会自动认为是第一页 判断是否为第一页后增加css样式 -->
                <c:choose>
                    <c:when test="${pageBean.currentPageNum == 1}">
                        <li><a href="<c:url value="${pageBean.url}"></c:url> " class="first disabled">首页</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="<c:url value="${pageBean.url}"></c:url> " class="first disabled"  >首页</a></li>
                    </c:otherwise>
                </c:choose>

                <%-- 上一页 --%>
                <!-- 如果当前页面是第一页的话就禁用上一页 -->
                <c:if test="${pageBean.currentPageNum > 1}">
                    <li><a class="prev disabled" href="<c:url value="${pageBean.url}currentPageNum=${pageBean.currentPageNum - 1 }"></c:url> "><i class="iconfont">&#xe68a;</i></a></li>
                </c:if>

                <c:choose>
                    <c:when test="${pageBean.pageCount <= 10 }">
                        <c:set var="begin" value="1"></c:set>
                        <c:set var="end" value="${pageBean.pageCount}"></c:set>
                    </c:when>
                    <c:otherwise>
                        <c:set var="begin" value="${pageBean.currentPageNum - 4}"></c:set>
                        <c:set var="end" value="${pageBean.currentPageNum + 5}"></c:set>
                        <c:choose>

                            <c:when test="${begin < 1}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="10"/>
                            </c:when>

                            <c:when test="${end > pageBean.pageCount}">
                                <c:set var="begin" value="${pageBean.pageCount - 9}"></c:set>
                                <c:set var="end" value="${pageBean.pageCount}"></c:set>
                            </c:when>
                        </c:choose>
                    </c:otherwise>
                </c:choose>

                <!-- 通过上面的操作我们可以得到正确的begin和end了下面我们就对其进行遍历 -->
                <c:forEach begin="${begin}" end="${end}" var="i">
                    <c:choose>
                        <c:when test="${i == pageBean.currentPageNum }">
                            <!-- 当前页面显示为选择的css样式同时不能跳转 -->
                            <li><a href="#" class="selected pageico" >${i}</a></li>
                        </c:when>
                        <c:otherwise>
                            <!-- 其他页面显示为超链接 -->
                            <li><a href="<c:url value="${pageBean.url}currentPageNum=${i}"></c:url>">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <%--下一页--%>
                <!-- 如果当前页面时最后一页的话，我们就禁用下一页 -->
                <c:if test="${pageBean.currentPageNum < pageBean.pageCount}">
                    <li><a class="prev disabled" href="<c:url value="${pageBean.url}currentPageNum=${pageBean.currentPageNum + 1 }" ></c:url> " class="pageico"><i class="iconfont">&#xe673;</i></a></li>
                </c:if>

                <%--尾页--%>
                <!-- 如果当前页面是最后一页的话就禁用尾页 -->
                <c:choose>
                    <c:when test="${pageBean.currentPageNum == pageBean.pageCount}">
                        <li><a href="#" class="last disabled">尾页</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a class="last disabled" href="<c:url value="${pageBean.url}currentPageNum=${pageBean.pageCount}"  ></c:url>  " >尾页</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
    <!-- /page content -->


</div>
</body>
    <script src="../../static/js/jquery-1.12.4.min.js"></script>
    <script src="../../../static/plugin/layer/layer.js"></script>
    <script src="../../../static/js/log/log.js"></script>
</html>