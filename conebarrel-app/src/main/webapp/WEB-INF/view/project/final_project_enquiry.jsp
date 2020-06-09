<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script type="text/javascript" src="http://219.159.45.138:8087/gisServer4.0/getApi?key=86aa4f63dbc26d401fd9fadd24b659db45ca"></script>
    <title>道路施工在线监管系统</title>
    <meta charset="utf-8">
    <!-- 禁止Chrome 浏览器中自动提示翻译 -->
    <meta name="google" value="notranslate">
    <!--IE=edge：保持使用最高级别模式显示内容-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit"><!--360浏览器-->
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <link rel="stylesheet" type="text/css" href="../../../static/css/popup-style.css">
    <link rel="stylesheet" href="../../../static/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../../../static/plugin/paging/htmleaf-demo.css">
    <link rel="stylesheet" href="../../../static/css/project-enquiry.css">
</head>
<body>

<%--模态窗（工程详情）--%>
<div id="projectDetailedShow" class="model-dis">
    <div class="content">
        <table class="table table-bordered" style="text-align: center;font-size: 13px;margin: 0">
            <tbody id="tboShow"></tbody>
        </table>
    </div>
</div>

<div class="sub-con-right">
    <div class="main-con-title">
        <span class="main-tit-name">条件查询</span>
    </div>

    <div class="search-condition-column">
        <div style="height: 30px">
            <span class="condition-name">工程名称</span>
            <div class="condition-input">
                <input type="text" class="form-control" id="proName" autocomplete="off">
            </div>

            <span class="condition-name">工程类型</span>
            <div class="condition-select">
                <select class="form-control" id="proType">
                    <option value="">--请选择--</option>
                    <c:forEach items="${projectTypeList}" var="projectType">
                        <option value="${projectType.id}">${projectType.typeName}</option>
                    </c:forEach>
                </select>
            </div>

            <span class="condition-name">工程状态</span>
            <div class="condition-select">
                <select class="form-control" id="proStatus">
                    <option value="">--请选择--</option>
                    <c:forEach items="${projectStatusList}" var="projectStatus">
                        <option value="${projectStatus.id}">${projectStatus.statusName}</option>
                    </c:forEach>
                </select>
            </div>

            <span class="condition-name">工程进度</span>
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

            <div class="refresh-switch-btn">
                <button class="btn btn-primary btn-sm" type="button" name="refresh" aria-label="refresh"
                        title="刷新" onclick="reload()" style="padding: 6px 15px;margin-right: -5px;">
                    <img src="../../../static/img/refresh.png" style="width: 17px">
                    <%--<i class="fa fa-refresh"></i>--%>
                </button>
                <button class="btn btn-primary btn-sm" type="button" name="refresh"
                        aria-label="refresh" title="切换" onclick="handover()">切换
                </button>
            </div>
        </div>
    </div>

    <div id="tableShow" class="pro-query-table">

        <table class="table table-bordered">
            <thead class="t-head">
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
        <div class="map-legend-con">
            <span class="map-legend-con-text">未进场</span>
            <hr class="map-legend-con-pictured" style="background: #008bf9;">
            <span class="map-legend-con-text">施工中</span>
            <hr class="map-legend-con-pictured" style="background: #e1ef00;">
            <span class="map-legend-con-text">已完工</span>
            <hr class="map-legend-con-pictured" style="background: #00be8d;">
        </div>
    </div>

</div>
</body>

<script src="../../../static/js/jquery-1.12.4.min.js"></script>
<script src="../../../static/plugin/layer/layer.js"></script>
<script src="../../../static/plugin/paging/jqPaginator.js" type="text/javascript"></script>
<script type="text/javascript">

    //变量
    var projectMessagesList = "";

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

                projectMessagesList = ProjectMessages.list;

                loadPage(1);
            },
            error: function (result) {
                alert("出错！");
            }
        })
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

                projectMessagesList = ProjectMessages.list;

                projectLocationShow(projectMessagesList);

                loadPage(parameter);
            },
            error: function (result) {
                alert("出错！");
            }
        })
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
                ProjectMessage += '<button class="btn btn-primary btn-sm" style="padding: 2px 10px;" onclick="details(' + ProjectMessageList[i].id + ')">详细';
                ProjectMessage += '</button>';
                ProjectMessage += '</td>';
                ProjectMessage += '</tr>';
            }
        }

        $('#tbody').html(ProjectMessage);
    }

    //分页
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

    //重新加载页面
    function reload() {
        window.location.reload();
    }

    //工程详情信息
    function details(id) {
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/projectMessage/details.do',
            data: {'id': id},
            async: false,
            success: function (data) {
                var projectMessage = JSON.parse(data);
                // parent.projectDetailed(mapObject);

                window.lar = layer.open({
                    title: '工程详情信息',
                    type: 1,
                    area: ['80%', '91%'],
                    skin: 'layer-ext-yourskin',
                    shade: [0.8, '#393D49'],
                    shadeClose: true, //点击遮罩关闭
                    content: $("#projectDetailedShow"),
                    offset: "5%"
                });

                var detailedInfo = "";
                detailedInfo += '<tr>';
                detailedInfo += '<td style="background: #052846;">工程名称</td>';
                detailedInfo += '<td class="table-td-content" style="background: #011f39;" colspan="5">' + projectMessage.proName + '</td>';
                detailedInfo += '<td style="width: 10%;background: #052846;">工程类型</td>';
                detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.proTypeStr + '</td>';
                detailedInfo += '</tr>';
                detailedInfo += '<tr>';
                detailedInfo += '<td style="background: #052846;">工程概述</td>';
                detailedInfo += '<td class="table-td-content" style="background: #011f39;" colspan="7">' + projectMessage.proSummarize + '</td>';
                detailedInfo += '</tr>';
                detailedInfo += '<tr>';
                detailedInfo += '<td style="width: 10%;background: #052846;">开始时间</td>';
                detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.proStartTimeStr + '</td>';
                detailedInfo += '<td style="width: 10%;background: #052846;">结束时间</td>';
                detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.proEndTimeStr + '</td>';
                detailedInfo += '<td style="width: 10%;background: #052846;">主管单位</td>';
                detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.governorUnit + '</td>';
                detailedInfo += '<td style="width: 10%;background: #052846;">联系方式</td>';
                detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.governorUnitPhone + '</td>';
                detailedInfo += '</tr>';
                detailedInfo += '<tr>';
                detailedInfo += '<td style="background: #052846;">施工单位</td>';
                detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.constructionUnit + '</td>';
                detailedInfo += '<td style="background: #052846;">联系方式</td>';
                detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.constructionUnitPhone + '</td>';
                detailedInfo += '<td style="background: #052846;">监理单位</td>';
                detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.constructionUnit + '</td>';
                detailedInfo += '<td style="background: #052846;">联系方式</td>';
                detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.supervisorUnitPhone + '</td>';
                detailedInfo += '</tr>';
                detailedInfo += '<tr>';
                detailedInfo += '<td style="background: #052846;">工程位置</td>';
                detailedInfo += '<td class="table-td-content" style="background: #011f39;" colspan="7">' + projectMessage.proLocation + '</td>';
                detailedInfo += '</tr>';
                detailedInfo += '<tr>';

                //锥桶信息
                detailedInfo += '<td style="background: #052846;">锥桶类型</td>';
                detailedInfo += '<td class="table-td-content" style="background: #011f39;" id="coneBucketTypeStr">';
                var coneBarrelManageList = projectMessage.coneBarrelManages;
                if (coneBarrelManageList.length < 1) {
                    detailedInfo += '无';
                } else {
                    detailedInfo += coneBarrelManageList[0].servicePlatform;
                }
                detailedInfo += '</td>';
                detailedInfo += '<td style="background: #052846;">锥桶编号</td>';
                detailedInfo += '<td class="table-td-content" style="background: #011f39;" id="coneBucketNum">';
                if (coneBarrelManageList.length < 1) {
                    detailedInfo += '无';
                } else {
                    for (var i = 0; i < coneBarrelManageList.length; i++) {
                        detailedInfo += coneBarrelManageList[i].deviceId;
                        if (coneBarrelManageList.length - 1 !== i) {
                            detailedInfo += ",";
                        }
                    }
                }
                detailedInfo += '</td>';
                detailedInfo += '<td style="background: #052846;">工程状态</td>';
                detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.proStatusStr + '</td>';
                detailedInfo += '<td style="background: #052846;">工程进度</td>';
                detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.proScheduleStr + '</td>';
                detailedInfo += '</tr>';
                detailedInfo += '<tr>';
                detailedInfo += '<td class="table-td-title" style="background: #011f39;" colspan="8">施工范围</td>';
                detailedInfo += '</tr>';
                detailedInfo += '<tr>';
                detailedInfo += '<td colspan="8" style="height: 350px;">';
                detailedInfo += '<div id="containersEnquiryDetails"></div>';
                detailedInfo += '</td>';
                detailedInfo += '</tr>';

                $("#tboShow").html(detailedInfo);

                var projectLocationList = projectMessage.projectLocation;
                var latitude;
                var longitude;
                if (projectLocationList.length > 1) {
                    for (var i = 0; i < projectLocationList.length; i++) {
                        longitude = projectLocationList[0].longitude;
                        latitude = projectLocationList[0].latitude;
                    }
                }

                tgisServer.initServer("containersEnquiryDetails", tgisServer.EnumObject.SceneModeEnum.SCENE2D,3);
                tgisServer.Event.serverStartFinished = function () {

                    //关闭状态栏和导航栏
                    tgisServer.Component.Navigation.visibility = false;
                    tgisServer.Component.CenterInfoBar.visibility = false;

                    //初始化位置（二维）
                    tgisServer.centerAndZoom(longitude, latitude, 12);

                    //施工范围
                    var pathEnquiryDetails = [];

                    for (var i = 0; i < projectLocationList.length; i++) {
                        var config = {
                            iconPath: "../../static/img/marker.png",
                            lon: projectLocationList[i].longitude,
                            lat: projectLocationList[i].latitude,
                            alt: 0
                        };
                        marker = tgisServer.Entity.Marker.create(config);

                        pathEnquiryDetails.push({
                            lon: projectLocationList[i].longitude,
                            lat: projectLocationList[i].latitude,
                            alt: 0
                        });
                    }

                    //线
                    var config22 = {
                        id: tgisServer.createGuid(),
                        lineWidth: 2,
                        lineOpacity: 1,
                        lineColor: "#0500ff",
                        points: pathEnquiryDetails
                    };
                    polyline = tgisServer.Entity.Polyline.create(config22);
                };
            },
            error: function () {
                layer.msg("出错！");
            }
        });
    }

    //地图与表单切换
    function handover() {
        if ($('#mapShow').css('display') === 'block') {
            $('#mapShow').css('display', 'none');
            $('#tableShow').css('display', 'block');
        } else {
            $('#mapShow').css('display', 'block');
            $('#tableShow').css('display', 'none');
            projectLocationShow(projectMessagesList);
        }
    }

    //地图展示
    function projectLocationShow(proMessageAllList) {
        tgisServer.initServer("container", tgisServer.EnumObject.SceneModeEnum.SCENE2D,3);
        tgisServer.Event.serverStartFinished = function () {

            //关闭状态栏，导航栏
            tgisServer.Component.Navigation.visibility = false;
            tgisServer.Component.CenterInfoBar.visibility = false;

            //初始化位置（二维）
            tgisServer.centerAndZoom(118.927711,42.26859, 12);

            projectDetails(proMessageAllList);

            //加载锥桶信息
            $.ajax({
                type: "post",
                url: localStorage.getItem("ajaxUrl") + '/coneBarrelManage/gatAllData',
                async: false,
                dataType:'json',
                success: function (data) {

                    if (coneBarrelPosition.length > 0) {
                        tgisServer.Entity.removeAll();
                        coneBarrelPosition = [];

                        //从新渲染工程数据
                        var projectMessageList = JSON.parse('${projectMessageList}');
                        projectDetails(projectMessageList);
                    }

                    for (var i = 0; i < data.length; i++) {
                        //设备使用状态，0 停用、1 起用
                        if (data[i].onlineSwitch === "1"){
                            var timestamp = (new Date()).getTime();
                            var modifiedTime = data[i].modifiedTime;
                            var resultTime = timestamp - modifiedTime;
                            if (resultTime < 600000){

                                var deviceId = data[i].deviceId;
                                deviceId = {
                                    iconPath: "../../../static/img/mark/marker-"+deviceId.substring(deviceId.length -2)+".png",
                                    lon: (data[i].lng  / 1000000),
                                    lat: (data[i].lat / 1000000),
                                    alt: 30
                                };

                                tgisServer.Entity.Marker.create(deviceId);
                                coneBarrelPosition.push(deviceId);
                            }
                        }
                    }

                },error:function (request) {
                    console.log(request);
                }
            });

            //定时任务-调取锥桶信息
            dynamicConeBarrel();
        };

    }

    //将工程数据加入地图中
    function projectDetails(proMessageAllList) {
        //加载工程数据
        for (var i = 0; i < proMessageAllList.length; i++) {

            var location = proMessageAllList[i].projectLocation;

            var path = [];
            //projectLocation
            for (var j = 0; j < location.length; j++) {
                //线
                path.push({lon: location[j].longitude, lat: location[j].latitude, alt: 0});
            }

            var color;

            if (proMessageAllList[i].proScheduleStr === "未进场") {
                color = '#008bf9';
            } else if (proMessageAllList[i].proScheduleStr === "施工中") {
                color = '#e1ef00';
            } else if (proMessageAllList[i].proScheduleStr === "已完工") {
                color = '#00be8d';
            }

            var config2 = {
                id: tgisServer.createGuid(),
                lineWidth: 2,
                lineOpacity: 1,
                lineColor: color,
                points: path
            };
            tgisServer.Entity.Polyline.create(config2);

            if (path.length === 2) {
                var lats = 0;
                var lons = 0;

                for (var k = 0; k < path.length; k++) {
                    lats += parseFloat(path[k].lat);
                    lons += parseFloat(path[k].lon);
                }

                lats /= path.length;
                lons /= path.length;

                var config1 = {
                    text: proMessageAllList[i].proName,
                    textSize: 13,
                    textColor: color,
                    lon: lons,
                    lat: lats,
                    alt: 0
                };
                tgisServer.Entity.Marker.create(config1);
            } else {

                var config3 = {
                    text: proMessageAllList[i].proName,
                    textSize: 13,
                    textColor: color,
                    lon: path[Math.ceil(path.length / 2 - 1)].lon,
                    lat: path[Math.ceil(path.length / 2 - 1)].lat,
                    alt: 0
                };
                tgisServer.Entity.Marker.create(config3);
            }
        }
    }

    //页面加载完成后调取实时锥桶数据
    //定时器
    var refreshIntervalId;
    //记录动态添加的mark
    var coneBarrelPosition = [];

    function dynamicConeBarrel(){
        refreshIntervalId = window.setInterval(function () {

            $.ajax({
                type: "post",
                url: localStorage.getItem("ajaxUrl") + '/coneBarrelManage/gatAllData',
                async: false,
                dataType:'json',
                success: function (data) {

                    if (coneBarrelPosition.length > 0) {
                        tgisServer.Entity.removeAll();
                        coneBarrelPosition = [];

                        //从新渲染工程数据
                        var projectMessageList = JSON.parse('${projectMessageList}');
                        projectDetails(projectMessageList);
                    }

                    for (var i = 0; i < data.length; i++) {
                        //设备使用状态，0 停用、1 起用
                        if (data[i].onlineSwitch === "1"){
                            var timestamp = (new Date()).getTime();
                            var modifiedTime = data[i].modifiedTime;
                            var resultTime = timestamp - modifiedTime;
                            if (resultTime < 600000){

                                var deviceId = data[i].deviceId;
                                deviceId = {
                                    iconPath: "../../../static/img/mark/marker-"+deviceId.substring(deviceId.length -2)+".png",
                                    lon: (data[i].lng  / 1000000),
                                    lat: (data[i].lat / 1000000),
                                    alt: 30
                                };

                                tgisServer.Entity.Marker.create(deviceId);
                                coneBarrelPosition.push(deviceId);
                            }
                        }
                    }

                },error:function (request) {
                    console.log(request);
                }
            })

        },90000);//1000 毫秒= 1 秒
    }

    //初始化
    $(function () {
        var projectMessageAllList = '${projectMessageList}';
        var projectMessageList = JSON.parse(projectMessageAllList);
        projectLocationShow(projectMessageList);
        loadData(1);
    });

    /*退出页面-关闭定时器*/
    window.onbeforeunload = function (e) {
        window.clearInterval(refreshIntervalId);
    };
</script>
</html>
