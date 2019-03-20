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
    <title>工程查询</title>
    <link rel="stylesheet" href="../../../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../static/css/style.css">
    <link rel="stylesheet" href="../../../static/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../../static/css/project.css">
    <link rel="stylesheet" type="text/css" href="../../../static/plugin/paging/htmleaf-demo.css">
    <style>
        #container {
            width: 100%;
            height: 560px;
        }
    </style>
</head>

<body>
<div class="main_container">
    <!-- page content -->
    <div class="panel panel-default">
        <div class="panel-heading">查询条件</div>

        <div class="panel-body">

            <form id="formSearch" class="form-horizontal">
                <div class="form-group row" style="margin:auto">

                    <label  class="control-label col-sm-1">工程名称:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="proName" autocomplete="off">
                    </div>

                    <label id="bucket" class="control-label col-sm-1">工程状态:</label>
                    <div class="col-sm-4">
                        <select class="form-control" id="proStatus">
                            <option value="3">--请选择--</option>
                            <option value="0">未审批</option>
                            <option value="1">未确认</option>
                        </select>
                    </div>
                </div>


                <div class="form-group row" style="margin:10px auto">

                    <label class="control-label col-sm-1">工程类型:</label>
                    <div class="col-sm-4">
                        <select class="form-control" id="proType">
                            <option value="3">--请选择--</option>
                            <option value="0">大中修工程</option>
                            <option value="1">应急抢险</option>
                            <option value="2">日常维修</option>
                        </select>
                    </div>
                    <label id="time" class="control-label col-sm-1">工程进度:</label>
                    <div class="col-sm-4">
                        <select class="form-control" id="proSchedule">
                            <option value="3">--请选择--</option>
                            <option value="0">未进场</option>
                            <option value="1">施工中</option>
                            <option value="2">已完工</option>
                        </select>
                    </div>

                    <div class="col-sm-1" style="text-align:center;">
                        <button type="button" id="btn_query" onclick="getProMessageByCondition(1)" class="btn btn-primary btn-sm">查询
                        </button>
                    </div>
                </div>

            </form>
        </div>
    </div>

    <!--table-->
    <div class="table-style" style="min-height: 650px;">
        <div class="table-style-padding">

            <div class="fixed-table-toolbar">
                <div class="columns columns-right btn-group pull-right">
                    <button class="btn btn-default" type="button" name="refresh" aria-label="refresh"
                            title="刷新" style="padding: 9px 15px;"><i class="fa fa-refresh"></i></button>
                    <button class="btn btn-default" type="button" name="refresh" aria-label="refresh"
                            title="切换" onclick="handover()">切换
                    </button>
                </div>
            </div>

            <div id="tableShow" style="display: none" class="x_content">

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
                        <th><input type="checkbox"></th>
                        <th scope="row">1</th>
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

                <div id="paging" style="right: 10px;height: 35px;bottom: 10px;margin-right: 20px">
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

            <div id="mapShow">
                <div id="container"></div>
            </div>
        </div>
    </div>
    <!-- /page content -->
</div>
</body>
<script src="../../../static/js/jquery-1.12.4.min.js"></script>
<%--分页--%>
<script src="../../../static/plugin/paging/jqPaginator.js" type="text/javascript"></script>
<%--引入腾讯地图--%>
<script charset="utf-8" src="https://map.qq.com/api/js?v=2.exp&key=UTKBZ-2XGL4-KFHUB-XO2FA-7JCX5-CUFQ4"></script>
<script>

    //腾讯地图
    var map = new qq.maps.Map(document.getElementById("container"), {
        center: new qq.maps.LatLng(39.916527, 116.397128),      // 地图的中心地理坐标。
        zoom: 11                                                 // 地图的中心地理坐标。
    });

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


    //分页
    $(function () {
        loadData(1);
        loadPage(1);
    });

    //分页
    function exeData(page, type, parameter) {
        //全部
        if (parameter === 1) {
            loadData(page);
            loadPage(parameter);

            //类型
        } else if (parameter === 2) {
            typeFilter(page);
            loadPage(parameter);

            //搜索
        } else if (parameter === 3) {
            searchButton(page);
            loadPage(parameter);
        }

    }

    function loadPage(parameter) {
        var myPageCount = parseInt($("#PageCount").val());
        var myPageSize = parseInt($("#PageSize").val());
        var countindex = Math.ceil(myPageCount / myPageSize);
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
            url: '/projectMessage/projectQueryIndex.do',
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

                //施工范围
                var list = ProjectMessages.list;

                //projectMessage
                for (var i = 0; i < list.length; i++) {
                    if (list[i].proScheduleStr === "未进场") {
                        projectRange(list, i, '#FF0000DD');
                    } else if (list[i].proScheduleStr === "施工中") {
                        projectRange(list, i, '#e1ef00');
                    } else if (list[i].proScheduleStr === "已完工") {
                        projectRange(list, i, '#00be8d');
                    }
                }
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }

    //加载所有工程展示在地图
    function projectRange(pro, index, color) {
        var path = [];
        //projectLocation
        for (var j = 0; j < pro[index].projectLocation.length; j++) {
            //点
            var marker = new qq.maps.Marker({
                position: new qq.maps.LatLng(pro[index].projectLocation[j].latitude, pro[index].projectLocation[j].longitude),
                map: map
            });

            //点
            var anchor = new qq.maps.Point(10, 24),
                size = new qq.maps.Size(20, 26),
                origin = new qq.maps.Point(0, 0),
                markerIcon = new qq.maps.MarkerImage(
                    "../../static/img/marker.png",
                    size,
                    origin,
                    anchor
                );
            marker.setIcon(markerIcon);

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
                ProjectMessage += '<td>' + ProjectMessageList[i].proName + '</td>';
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

    //工程详情
    function details(id) {
        window.location.href = "http://localhost:8080/projectMessage/toDetails.do?id=" + id;
    }


    //条件查询方法
    function getProMessageByCondition(page) {
        var proName =$ ("#proName").val();
        var proSchedule =$ ("#proSchedule").val();
        var proType =$ ("#proType").val();
        var proStatus =$ ("#proStatus").val();

        $.ajax({
            type: "post",
            url: '/projectMessage/getProMessageByCondition.do',
            data: {
                'page': page,
                'proName':proName,
                'proSchedule':proSchedule,
                'proType':proType,
                'proStatus':proStatus
            },
            success: function (data) {
                var ProjectMessages = JSON.parse(data);
                //总数
                $("#PageCount").val(ProjectMessages.total);
                //每页显示条数
                $("#PageSize").val("10");

                //基本数据
                parseResult(ProjectMessages);

                //施工范围
                var list = ProjectMessages.list;

                //projectMessage
                for (var i = 0; i < list.length; i++) {
                    if (list[i].proScheduleStr === "未进场") {
                        projectRange(list, i, '#FF0000DD');
                    } else if (list[i].proScheduleStr === "施工中") {
                        projectRange(list, i, '#e1ef00');
                    } else if (list[i].proScheduleStr === "已完工") {
                        projectRange(list, i, '#00be8d');
                    }
                }
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }

</script>
</html>