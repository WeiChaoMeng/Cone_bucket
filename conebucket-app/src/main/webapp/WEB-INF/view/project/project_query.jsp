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
    <meta charset="UTF-8">
    <title>工程查询-表单</title>
    <link rel="stylesheet" href="../../../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../static/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../../static/css/project.css">
    <link rel="stylesheet" type="text/css" href="../../../static/plugin/paging/htmleaf-demo.css">
</head>

<body>
<div class="main_container">
    <!--table-->
    <div class="table-style">
        <div class="table-style-padding">

            <div class="query-field">
                <span class="condition-name">工程名称:</span>
                <div class="condition-input">
                    <input type="text" class="form-control" id="proName" autocomplete="off">
                </div>

                <span class="condition-name">工程类型:</span>
                <div class="condition-select">
                    <select class="form-control" id="proType">
                        <option value="">--请选择--</option>
                        <c:forEach items="${projectTypeList}" var="projectType">
                            <option value="${projectType.id}">${projectType.typeName}</option>
                        </c:forEach>
                    </select>
                </div>

                <span class="condition-name">工程状态:</span>
                <div class="condition-select">
                    <select class="form-control" id="proStatus">
                        <option value="">--请选择--</option>
                        <c:forEach items="${projectStatusList}" var="projectStatus">
                            <option value="${projectStatus.id}">${projectStatus.statusName}</option>
                        </c:forEach>
                    </select>
                </div>

                <span class="condition-name">工程进度:</span>
                <div class="condition-select">
                    <select class="form-control" id="proSchedule">
                        <option value="">--请选择--</option>
                        <c:forEach items="${projectScheduleList}" var="projectSchedule">
                            <option value="${projectSchedule.id}">${projectSchedule.scheduleName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="condition-btn">
                    <button type="button" id="btn_query" onclick="getProMessageByCondition(1,2)"
                            class="btn btn-primary btn-sm">查询
                    </button>
                </div>

                <div class="columns columns-right btn-group pull-right">
                    <button class="btn btn-default" type="button" name="refresh" aria-label="refresh" title="刷新"
                            onclick="reload()" style="padding: 9px 15px;"><i class="fa fa-refresh"></i></button>
                    <button class="btn btn-default" type="button" name="refresh" aria-label="refresh" title="切换"
                            onclick="handover()">切换
                    </button>
                </div>
            </div>

            <div id="tableShow" class="pro-query-table">

                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="width: 5%;">序号</th>
                        <th style="width: 25%;">工程名称</th>
                        <th style="width: 10%;">工程类型</th>
                        <th style="width: 10%;">工程编号</th>
                        <th style="width: 10%;">开始时间</th>
                        <th style="width: 10%;">结束时间</th>
                        <th style="width: 10%;">工程状态</th>
                        <th style="width: 10%;">工程进度</th>
                        <th style="width: 10%;">操作</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">
                    <tr>
                        <td><input type="checkbox"></td>
                        <td scope="row">1</td>
                        <td>xxx工程</td>
                        <td>应急抢险</td>
                        <td>2019-03-14 10:00:00</td>
                        <td>2019-03-13 11:00:00</td>
                        <td>未确认</td>
                        <td>未进场</td>
                        <td style="text-align: center; width: 110px;">
                            <button style=" text-align:right;" class="btn btn-primary btn-sm">详细
                            </button>
                        </td>
                    </tr>

                    </tbody>
                </table>

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

            <div id="mapShow" class="map-content">
                <div id="container"></div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="../../../static/js/jquery-1.12.4.min.js"></script>
<%--分页--%>
<script src="../../../static/plugin/paging/jqPaginator.js" type="text/javascript"></script>
<%--引入腾讯地图--%>
<script charset="utf-8" src="https://map.qq.com/api/js?v=2.exp&key=UTKBZ-2XGL4-KFHUB-XO2FA-7JCX5-CUFQ4"></script>
<script>
    //地图与表单切换
    function handover() {
        if ($('#mapShow').css('display') === 'block') {
            $('#mapShow').css('display', 'none');
            $('#tableShow').css('display', 'block');
        } else {
            $('#mapShow').css('display', 'block');
            $('#tableShow').css('display', 'none');
        }
    }

    //重新加载页面
    function reload() {
        window.location.reload();
    }

    //分页
    function exeData(page, type, parameter) {
        //全部
        if (parameter === 1) {
            loadData(page);

            //搜索
        } else if (parameter === 2) {
            getProMessageByCondition(page, parameter);
        }

    }

    function loadPage(parameter) {
        var myPageCount = parseInt($("#PageCount").val());
        var myPageSize = parseInt($("#PageSize").val());
        var countindex = myPageCount === 0 ? 1 : Math.ceil(myPageCount / myPageSize);
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

    //加载数据
    function loadData(page) {
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/projectMessage/projectQueryIndex.do',
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

                //腾讯地图
                var map = new qq.maps.Map(document.getElementById("container"), {
                    center: new qq.maps.LatLng(39.916527, 116.397128),      // 地图的中心地理坐标。
                    zoom: 10                                                 // 地图的中心地理坐标。
                });

                //施工范围
                var list = ProjectMessages.list;

                //projectMessage
                for (var i = 0; i < list.length; i++) {
                    if (list[i].proScheduleStr === "未进场") {
                        projectRange(map, list, i, '#FF0000DD');
                    } else if (list[i].proScheduleStr === "施工中") {
                        projectRange(map, list, i, '#e1ef00');
                    } else if (list[i].proScheduleStr === "已完工") {
                        projectRange(map, list, i, '#00be8d');
                    }
                }

                loadPage(1);
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }

    //加载所有工程展示在地图
    function projectRange(map, pro, index, color) {

        if (pro[index].projectLocation.length == 0) {
            return;
        }
        var path = [];
        //projectLocation
        for (var j = 0; j < pro[index].projectLocation.length; j++) {
            //线
            path.push(new qq.maps.LatLng(pro[index].projectLocation[j].latitude, pro[index].projectLocation[j].longitude));
        }

        //线
        var polyline = new qq.maps.Polyline({
            path: path,
            strokeColor: color,
            strokeWeight: 2,
            editable: false,
            map: map
        });

        //添加到提示窗
        var info = new qq.maps.InfoWindow({
            visible: true,
            content: pro[index].proName,
            position: path[Math.ceil(path.length / 2 - 1)],
            close: false,
            map: map
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
                ProjectMessage += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 10 + i + 1) + '</td>';
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

        $('#tbody').html(ProjectMessage);
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

    //条件查询方法
    function getProMessageByCondition(page, parameter) {
        var proName = $("#proName").val();
        var proSchedule = $("#proSchedule").val();
        var proType = $("#proType").val();
        var proStatus = $("#proStatus").val();
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/projectMessage/getProMessageByCondition.do',
            data: {
                'page': page,
                'proName': proName,
                'proSchedule': proSchedule,
                'proType': proType,
                'proStatus': proStatus
            },
            async: false,
            success: function (data) {
                var ProjectMessages = JSON.parse(data);
                //总数
                $("#PageCount").val(ProjectMessages.total);
                //每页显示条数
                $("#PageSize").val("10");

                //基本数据
                parseResult(ProjectMessages);

                var map = new qq.maps.Map(document.getElementById("container"), {
                    center: new qq.maps.LatLng(39.916527, 116.397128),      // 地图的中心地理坐标。
                    zoom: 10                                                 // 地图的中心地理坐标。
                });

                //施工范围
                var list = ProjectMessages.list;

                //projectMessage
                for (var i = 0; i < list.length; i++) {
                    if (list[i].proScheduleStr === "未进场") {
                        projectRange(map, list, i, '#FF0000DD');
                    } else if (list[i].proScheduleStr === "施工中") {
                        projectRange(map, list, i, '#e1ef00');
                    } else if (list[i].proScheduleStr === "已完工") {
                        projectRange(map, list, i, '#00be8d');
                    }
                }

                loadPage(parameter);
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }

    //分页
    $(function () {
        loadData(1);
    });

</script>
</html>