<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2019/3/14
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改工程</title>
    <link rel="stylesheet" href="../../../static/css/project-add.css">
    <link rel="stylesheet" href="../../../static/css/bootstrap/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="../../../static/js/jeDate/skin/jedate.css">
    <script type="text/javascript" src="http://219.159.45.138:8087/gisServer4.0/getApi?key=86aa4f63dbc26d401fd9fadd24b659db45ca"></script>
</head>
<body>

<div style="height: 100%;width: 100%;background-color:#012038">

    <div class="main-con-title">
        <span class="main-tit-name">编辑工程</span>
    </div>

    <div class="content" style="padding: 30px;overflow: auto;height: 95%;">

        <form id="projectMessageEdit">
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="td-title">工程名称</td>
                    <td class="td-value">
                        <input type="hidden" name="id" value="${projectMessage.id}">
                        <input type="hidden" name="proNum" value="${projectMessage.proNum}">
                        <input type="hidden" name="proStatus" value="${projectMessage.proStatus}">
                        <input type="hidden" name="proSchedule" value="${projectMessage.proSchedule}">
                        <input class="form-control" type="text" id="proNameEdit" name="proName"
                               value="${projectMessage.proName}" autocomplete="off"
                               onkeyup="this.value=this.value.replace(/\s+/g,'')">
                    </td>

                    <td class="td-title">工程类型</td>
                    <td class="td-value">
                        <select class="form-control" id="proType" name="proType">
                            <c:forEach items="${projectTypeList}" var="projectType">
                                <c:choose>
                                    <c:when test="${projectType.id == projectMessage.proType}">
                                        <option value="${projectType.id}" selected>${projectType.typeName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${projectType.id}">${projectType.typeName}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td class="td-title">工程概述</td>
                    <td style=" background: #011f39;" colspan="3">
                        <input class="form-control" type="text" id="proSummarize" name="proSummarize"
                               value="${projectMessage.proSummarize}" autocomplete="off">
                    </td>
                </tr>

                <tr>
                    <td class="td-title">开始时间</td>
                    <td class="td-value">
                        <input class="form-control je-start-date-edit" type="text" id="proStartTimeStr" name="proStartTimeStr"
                               style="background: #183f5e;" value="${projectMessage.proStartTimeStr}" readonly autocomplete="off">
                    </td>

                    <td class="td-title">结束时间</td>
                    <td class="td-value">
                        <input class="form-control je-end-date-edit" type="text" id="proEndTimeStr" name="proEndTimeStr"
                               style="background: #183f5e;" autocomplete="off" value="${projectMessage.proEndTimeStr}" readonly>
                    </td>
                </tr>

                <tr>
                    <td class="td-title">主管单位</td>
                    <td class="td-value">
                        <input class="form-control" type="text" id="governorUnit" name="governorUnit" autocomplete="off"
                               value="${projectMessage.governorUnit}">
                    </td>

                    <td class="td-title">联系方式</td>
                    <td class="td-value">
                        <input class="form-control" type="text" id="governorUnitPhone" name="governorUnitPhone"
                               value="${projectMessage.governorUnitPhone}" autocomplete="off">
                    </td>
                </tr>

                <tr>
                    <td class="td-title">施工单位</td>
                    <td class="td-value">
                        <input class="form-control" type="text" id="constructionUnit" name="constructionUnit"
                               value="${projectMessage.constructionUnit}" autocomplete="off">
                    </td>

                    <td class="td-title">联系方式</td>
                    <td class="td-value">
                        <input class="form-control" type="text" id="constructionUnitPhone" name="constructionUnitPhone"
                               value="${projectMessage.constructionUnitPhone}" autocomplete="off">
                    </td>
                </tr>

                <tr>
                    <td class="td-title">监理单位</td>
                    <td class="td-value">
                        <input class="form-control" type="text" id="supervisorUnit" name="supervisorUnit"
                               value="${projectMessage.supervisorUnit}" autocomplete="off">
                    </td>

                    <td class="td-title">联系方式</td>
                    <td class="td-value">
                        <input class="form-control" type="text" id="supervisorUnitPhone" name="supervisorUnitPhone"
                               value="${projectMessage.supervisorUnitPhone}" autocomplete="off">
                    </td>
                </tr>

                <tr>
                    <td class="td-title">工程位置</td>
                    <td style=" background: #011f39;" colspan="3">
                        <input class="form-control" type="text" id="proLocation" name="proLocation" autocomplete="off"
                               value="${projectMessage.proLocation}">
                    </td>
                </tr>

                <tr>
                    <td class="td-title">锥桶类型</td>
                    <td class="td-value">
                        <select class="form-control" id="coneBucketType" name="coneBucketType">
                            <c:if test="${fn:length(projectMessage.coneBarrelManages) == 0}">
                                <option value="">--请选择--</option>
                                <c:forEach items="${coneBucketTypeList}" var="coneBucketType">
                                    <option value="${coneBucketType.id}">${coneBucketType.typeName}</option>
                                </c:forEach>
                            </c:if>

                            <c:if test="${fn:length(projectMessage.coneBarrelManages) > 0}">
                                <c:forEach items="${projectMessage.coneBarrelManages}" var="coneBarrelManage" begin="0"
                                           end="0">
                                    <c:forEach items="${coneBucketTypeList}" var="coneBucketType">
                                        <c:choose>
                                            <c:when test="${coneBucketType.typeName == coneBarrelManage.servicePlatform}">
                                                <option value="${coneBucketType.id}"
                                                        selected>${coneBucketType.typeName}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${coneBucketType.id}">${coneBucketType.typeName}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </c:forEach>
                            </c:if>
                        </select>
                    </td>

                    <td class="td-title">锥桶编号</td>
                    <td class="td-value">
                        <input class="form-control" type="text" id="coneBucketNum" name="coneBucketNum"
                               readonly onclick="selectConeBarrel()"
                               value="${coneBucketNum}"
                               onkeyup="this.value=this.value.replace(/，/g,','),this.value=this.value.replace(/\s+/g,'')">
                    </td>
                </tr>

                <tr>
                    <td colspan="3" style="font-size: 14px;padding: 10px 0;border-right: none;"
                        class="table-td-content">
                        施工范围
                    </td>
                    <td colspan="1" style="padding: 0 10px 0 0;text-align: right;border-left: none;"
                        class="table-td-content">
                        <input type="button" value="重绘地图" onclick="reloadMapEdit()" class="btn btn-primary btn-sm">
                    </td>
                </tr>

                <tr>
                    <td colspan="4" rowspan="5" style="height: 600px;">
                        <input type="hidden" id="proScopeEdit" name="proScope">
                        <div id="containerEdit" style="height: 95%"></div>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
        <div style="text-align: center">
            <input class="btn btn-primary btn-sm" type="button" onclick="commit()" value="提交">
            <input class="btn btn-primary btn-sm" type="button" onclick="backOff()" value="返回">
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
<%--<script type="text/javascript"--%>
        <%--src="http://219.159.45.138:8087/gisServer4.0/getApi?key=0321b14am6a11m49f0m91aam385b5d59f083"></script>--%>
<script>

    //日期选择器
    jeDate(".je-start-date-edit", {
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
    jeDate(".je-end-date-edit", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000
    });

    var pathEdit = [];
    var projectLocationJson = '${projectLocationList}';
    var projectLocation = JSON.parse(projectLocationJson);

    tgisServer.initServer("containerEdit", tgisServer.EnumObject.SceneModeEnum.SCENE2D,3);
    tgisServer.Event.serverStartFinished = function () {

        //关闭状态栏和导航栏
        tgisServer.Component.Navigation.visibility = false;
        tgisServer.Component.CenterInfoBar.visibility = false;

        //初始化位置（二维）
        tgisServer.centerAndZoom(projectLocation[0].longitude, projectLocation[0].latitude, 12);

        //解析工程经纬度，展示在地图上
        for (var i = 0; i < projectLocation.length; i++) {

            //点
            var config = {
                iconPath: "../../static/img/marker.png",
                lon: projectLocation[i].longitude,
                lat: projectLocation[i].latitude,
                alt: 0
            };
            marker = tgisServer.Entity.Marker.create(config);

            //存储线
            pathEdit.push({lon: projectLocation[i].longitude, lat: projectLocation[i].latitude, alt: 0});

            //线
            var config2 = {
                id: tgisServer.createGuid(),
                lineWidth: 2,
                lineOpacity: 1,
                lineColor: "#0500ff",
                points: pathEdit
            };
            polyline = tgisServer.Entity.Polyline.create(config2);
        }
    };

    //重绘地图
    function reloadMapEdit() {

        //清除
        tgisServer.Entity.removeAll();

        pathEdit = [];

        var longitudeEdit;
        var latitudeEdit;
        var altEdit;
        var markerEdit;
        var polylineEdit;

        //鼠标左键点击事件
        tgisServer.Event.MouseLeftClickEvent(leftCallBackClick);

        function leftCallBackClick(e) {
            //经度
            longitudeEdit = e.lon;
            //纬度
            latitudeEdit = e.lat;
            //高程
            altEdit = e.alt;

            var config = {
                iconPath: "../../../static/img/marker.png",
                lon: longitudeEdit,
                lat: latitudeEdit,
                alt: altEdit
            };
            markerEdit = tgisServer.Entity.Marker.create(config);

            pathEdit.push({lon: longitudeEdit, lat: latitudeEdit, altEdit: 0});

            //线
            var config2 = {
                id: tgisServer.createGuid(),
                lineWidth: 2,
                lineOpacity: 1,
                lineColor: "#0500ff",
                points: pathEdit
            };
            polylineEdit = tgisServer.Entity.Polyline.create(config2);

        }

        //右键点击事件
        tgisServer.Event.MouseRightClickEvent(rightCallBackClick);

        function rightCallBackClick() {
            if (markerEdit !== "") {
                //删除path最后一个元素
                pathEdit.pop();
                tgisServer.Entity.remove(markerEdit);
                tgisServer.Entity.remove(polylineEdit);
                markerEdit = "";
            } else {
                return false;
            }
        }
    }

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

    //返回
    function backOff() {
        // var  url = localStorage.getItem("ajaxUrl") + "/toProjectMessageIndex.do";
        // loadUrl(url);
        history.back(-1);
    }

    //提交form
    function commit() {
        if ($.trim($("#proNameEdit").val()) !== "") {

            if (pathEdit.length > 0) {
                var proScopeJson = JSON.stringify(pathEdit);
                $('#proScopeEdit').val(proScopeJson);

                $.ajax({
                    type: "POST",
                    url: localStorage.getItem("ajaxUrl") + '/projectMessage/edit.do',
                    data: $('#projectMessageEdit').serialize(),
                    error: function (request) {
                        layer.msg("Connection error");
                    },
                    success: function (data) {
                        if (data === "success") {
                            layer.msg('修改成功', {time: 800});
                            window.location.href = localStorage.getItem("ajaxUrl") + "/toProjectMessageIndex.do";
                            // var url = localStorage.getItem("ajaxUrl") + "/toProjectMessageIndex.do";
                            // loadUrl(url);
                        } else {
                            layer.msg('修改失败');
                        }
                    }
                });
            }
        } else {
            layer.msg("工程名称必填！");
        }
    }
</script>
</html>