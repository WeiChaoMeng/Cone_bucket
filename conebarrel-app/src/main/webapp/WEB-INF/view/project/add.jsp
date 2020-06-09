<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新增工程</title>
    <link rel="stylesheet" href="../../../static/css/project-add.css">
    <link rel="stylesheet" href="../../../static/css/bootstrap/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="../../../static/js/jeDate/skin/jedate.css">
    <script type="text/javascript" src="http://219.159.45.138:8087/gisServer4.0/getApi?key=86aa4f63dbc26d401fd9fadd24b659db45ca"></script>
</head>
<body>

<div class="sub-con-right">

    <div class="main-con-title">
        <span class="main-tit-name">新增工程</span>
    </div>

    <div class="content">
        <form id="projectMessage">
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="td-title">工程名称</td>
                    <td class="td-value">
                        <input class="form-control" type="text" id="proName" name="proName" value="" autocomplete="off"
                               onkeyup="this.value=this.value.replace(/\s+/g,'')">
                    </td>

                    <td class="td-title">工程类型</td>
                    <td class="td-value">
                        <select class="form-control" id="proType" name="proType">
                            <c:forEach items="${projectTypeList}" var="projectType">
                                <option value="${projectType.id}">${projectType.typeName}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td class="td-title">工程概述</td>
                    <td class="td-value" colspan="3">
                        <input class="form-control" type="text" name="proSummarize" autocomplete="off">
                    </td>
                </tr>

                <tr>
                    <td class="td-title">开始时间</td>
                    <td class="td-value">
                        <input class="form-control je-start-date" style="background-color: #183f5e" type="text" id="proStartTimeStr"
                               name="proStartTimeStr" readonly="readonly" autocomplete="off">
                    </td>

                    <td class="td-title">结束时间</td>
                    <td class="td-value">
                        <input class="form-control je-end-date" style="background-color: #183f5e" type="text" id="proEndTimeStr"
                               name="proEndTimeStr" autocomplete="off" readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td class="td-title">主管单位</td>
                    <td class="td-value">
                        <input class="form-control" type="text" id="governorUnit" name="governorUnit"
                               autocomplete="off">
                    </td>

                    <td class="td-title">联系方式</td>
                    <td class="td-value">
                        <input class="form-control" type="text" id="governorUnitPhone" name="governorUnitPhone"
                               autocomplete="off">
                    </td>
                </tr>

                <tr>
                    <td class="td-title">施工单位</td>
                    <td class="td-value">
                        <input class="form-control" type="text" id="constructionUnit" name="constructionUnit"
                               autocomplete="off">
                    </td>

                    <td class="td-title">联系方式</td>
                    <td class="td-value">
                        <input class="form-control" type="text" id="constructionUnitPhone" name="constructionUnitPhone"
                               autocomplete="off">
                    </td>
                </tr>

                <tr>
                    <td class="td-title">监理单位</td>
                    <td class="td-value">
                        <input class="form-control" type="text" id="supervisorUnit" name="supervisorUnit"
                               autocomplete="off">
                    </td>

                    <td class="td-title">联系方式</td>
                    <td class="td-value">
                        <input class="form-control" type="text" id="supervisorUnitPhone" name="supervisorUnitPhone"
                               autocomplete="off">
                    </td>
                </tr>

                <tr>
                    <td class="td-title">工程位置</td>
                    <td class="td-value">
                        <input class="form-control" type="text" id="proLocation" name="proLocation" autocomplete="off">
                    </td>

                    <td class="td-title">是否有锥桶</td>
                    <td class="td-value">
                        <select class="form-control" id="containConeBucket" name="containConeBucket">
                            <option value="1">否</option>
                            <option value="2">是</option>
                        </select>
                    </td>

                </tr>

                <tr id="coneBucketTypeSelect" style="display: none">
                    <td class="td-title">锥桶类型</td>
                    <td class="td-value">
                        <select class="form-control" id="coneBucketType" name="coneBucketType">
                            <c:forEach items="${coneBucketTypeList}" var="coneBucketType">
                                <option value="${coneBucketType.id}">${coneBucketType.typeName}</option>
                            </c:forEach>
                        </select>
                    </td>

                    <td class="td-title">锥桶编号</td>
                    <td colspan="3">
                        <input class="form-control" type="text" id="coneBucketNum" name="coneBucketNum"
                               autocomplete="off" onclick="selectConeBarrel()" readonly
                               onkeyup="this.value=this.value.replace(/，/g,','),this.value=this.value.replace(/\s+/g,'')">
                    </td>
                </tr>

                <tr>
                    <td colspan="3" style="font-size: 14px;padding: 10px 0;border-right: none !important;"
                        class="table-td-content">
                        施工范围
                    </td>
                    <td colspan="1" style="padding: 0 10px 0 0;text-align: right;border-left: none !important;"
                        class="table-td-content">
                        <input type="button" value="重绘地图" onclick="reloadMap()" class="btn btn-primary btn-sm">
                    </td>
                </tr>

                <tr>
                    <td colspan="4" rowspan="5" style="height: 600px;">
                        <input type="hidden" id="proScope" name="proScope">
                        <div id="containerAdd"></div>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
        <div style="text-align: center">
            <%--<input class="btn btn-primary btn-sm" type="button" style="padding: 5px 15px;margin-right: 10px;" onclick="backOff()" value="返回">--%>
            <input class="btn btn-primary btn-sm" type="button" style="padding: 5px 15px;" onclick="commit()" value="提交">
        </div>
    </div>
</div>
</body>

<%--勾选锥桶--%>
<div id="chooseConeBarrel" style="display: none">
    <div style="height: 75%;padding: 15px 30px;overflow: auto;" id="multipleConeBarrel">
        <ul style="margin: 0;padding: 0">
            <c:forEach items="${coneBarrelManageList}" var="coneBarrelManage">
                <li style="margin-bottom: 5px;">
                    <input type="checkbox" style="zoom: 130%;margin: 0 10px 0 0;padding: 0;vertical-align: middle;" value="${coneBarrelManage.deviceId}">
                    <span style="font-size: 15px;">${coneBarrelManage.deviceId}</span>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div style="height: 25%;text-align: center;padding-top: 15px;">
        <button class="btn btn-primary btn-sm" onclick="addChooseConeBarrel()">确认</button>
    </div>
</div>
<script src="../../../static/js/jquery.js"></script>
<script src="../../../static/plugin/layer/layer.js"></script>
<script type="text/javascript" src="../../../static/js/jeDate/src/jedate.js"></script>
<script>

    //日期选择器
    jeDate(".je-start-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000
    });

    //日期选择器
    jeDate(".je-end-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000
    });

    var pathAdd = [];

    function newMap() {
        tgisServer.initServer("containerAdd", tgisServer.EnumObject.SceneModeEnum.SCENE2D,3);

        tgisServer.Event.serverStartFinished = function () {

            //关闭状态栏和导航栏
            tgisServer.Component.Navigation.visibility = false;
            tgisServer.Component.CenterInfoBar.visibility = false;

            //初始化位置
            tgisServer.centerAndZoom(118.927711,42.26859, 12);

            var longitudeAdd;
            var latitudeAdd;
            var altAdd;
            var markerAdd;
            var polylineAdd;

            //鼠标左键点击事件
            tgisServer.Event.MouseLeftClickEvent(leftCallBackClick);

            function leftCallBackClick(e) {
                //经度
                longitudeAdd = e.lon;
                //纬度
                latitudeAdd = e.lat;
                //高程
                altAdd = e.alt;

                var config = {
                    iconPath: "../../../static/img/marker.png",
                    lon: longitudeAdd,
                    lat: latitudeAdd,
                    alt: altAdd
                };
                markerAdd = tgisServer.Entity.Marker.create(config);

                pathAdd.push({lon: longitudeAdd, lat: latitudeAdd, alt: 0});

                //线
                var config2 = {
                    id: tgisServer.createGuid(),
                    lineWidth: 2,
                    lineOpacity: 1,
                    lineColor: "#0500ff",
                    points: pathAdd
                };
                polylineAdd = tgisServer.Entity.Polyline.create(config2);

            }

            //右键点击事件
            tgisServer.Event.MouseRightClickEvent(rightCallBackClick);

            function rightCallBackClick() {
                if (markerAdd !== "") {
                    //删除path最后一个元素
                    pathAdd.pop();
                    tgisServer.Entity.remove(markerAdd);
                    tgisServer.Entity.remove(polylineAdd);
                    markerAdd = "";
                } else {
                    return false;
                }
            }
        };
    }


    //重新加载地图
    function reloadMap() {
        pathAdd = [];
        //清除
        tgisServer.Entity.removeAll();
        newMap();
    }

    //返回
    function backOff() {
        var  url = localStorage.getItem("ajaxUrl") + "/toProjectMessageIndex.do";
        loadUrl(url);
    }

    //提交form
    function commit() {
        if ($.trim($("#proName").val()) !== "") {
            if (pathAdd.length > 0) {
                var proScopeJson = JSON.stringify(pathAdd);
                $('#proScope').val(proScopeJson);

                $.ajax({
                    type: "POST",
                    url: localStorage.getItem("ajaxUrl") + '/projectMessage/add.do',
                    data: $('#projectMessage').serialize(),
                    error: function (request) {
                        alert("Connection error");
                    },
                    success: function (data) {
                        if (data === "success") {
                            layer.msg('添加成功',{time: 800});
                            // var  url = localStorage.getItem("ajaxUrl") + "/toProjectMessageIndex.do";
                            // loadUrl(url);
                            window.location.href = localStorage.getItem("ajaxUrl") + "/toProjectMessageIndex.do";
                        } else {
                            layer.msg('添加失败');
                        }
                    }
                });

            } else {
                layer.msg("请绘制施工范围！");
            }
        } else {
            layer.msg("工程名称必填！");
        }
    }

    //是否有锥桶
    $('#containConeBucket').change(function () {
        if ($(this).val() == 1) {
            $('#coneBucketTypeSelect').hide();
        } else if ($(this).val() == 2) {
            $('#coneBucketTypeSelect').show();
        }
    });

    //勾选锥桶
    function selectConeBarrel(){
        window.lar = layer.open({
            type: 1,
            title: '选择锥桶',
            area: ['300px', '300px'],
            skin: 'layer-ext-yourskin',
            shade: [0.8, '#393D49'],
            shadeClose: false, //点击遮罩关闭
            content: $("#chooseConeBarrel"),
            offset: "auto",
            success: function () {
                //Enter回车，遮罩无限弹出
                $(':focus').blur();
            }
        });
    }

    //确认勾选的锥桶
    function addChooseConeBarrel(){
        var str = "";
        var list = $("#multipleConeBarrel input:checked");
        for (var i = 0; i < list.length; i++) {
            str += list[i].value + ",";
        }
        if (str.length > 0) {
            $('#coneBucketNum').val(str.substring(0, str.length - 1));
            layer.close(window.lar);
        }else {
            layer.close(window.lar);
            $('#coneBucketNum').val("");
        }
    }

    //初始化地图
    $(function () {
        newMap();
    });
</script>
</html>