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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>工程详情</title>

    <link rel="stylesheet" href="../../../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../static/css/style.css">
    <link rel="stylesheet" href="../../../static/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../../static/css/project.css">
    <link rel="stylesheet" href="../../../static/plugin/date_pickers/date_picker.css">
</head>
<body>

<!--<div id='windowBackgroundColor'></div>-->

<div class="content" style="padding: 20px;background: #fff">
    <div class="panel-heading" style="font-size: 16px;border: 1px #bfbfbf solid;border-bottom: none;">工程详情</div>
    <table class="table table-condensed table-bordered table-hover">
        <tbody>
        <tr>
            <td style="width: 10%">工程名称</td>
            <td class="table-td-content" id="proName" >
                <input type="hidden" id="id" value="${id}">
            </td>

            <td style="width: 10%">工程类型</td>
            <td class="table-td-content" id="proTypeStr"></td>
        </tr>

        <tr>
            <td>工程概述</td>
            <td class="table-td-content" colspan="3" id="proSummarize"></td>
        </tr>

        <tr>
            <td>开始时间</td>
            <td class="table-td-content" id="proStartTimeStr"></td>

            <td>结束时间</td>
            <td class="table-td-content" id="proEndTimeStr"></td>
        </tr>

        <tr>
            <td>主管单位</td>
            <td class="table-td-content" id="governorUnit"></td>

            <td>联系方式</td>
            <td class="table-td-content" id="governorUnitPhone"></td>
        </tr>

        <tr>
            <td>施工单位</td>
            <td class="table-td-content" id="constructionUnit"></td>

            <td>联系方式</td>
            <td class="table-td-content" id="constructionUnitPhone"></td>
        </tr>

        <tr>
            <td>监理单位</td>
            <td class="table-td-content" id="supervisorUnit"></td>

            <td>联系方式</td>
            <td class="table-td-content" id="supervisorUnitPhone"></td>
        </tr>

        <tr>
            <td>工程位置</td>
            <td class="table-td-content" colspan="3" id="proLocation"></td>
        </tr>

        <tr>
            <td>锥桶类型</td>
            <td class="table-td-content" id="coneBucketTypeStr"></td>

            <td>锥桶编号</td>
            <td class="table-td-content" id="coneBucketNum"></td>
        </tr>

        <tr>
            <td>工程状态</td>
            <td class="table-td-content" id="proStatusStr"></td>

            <td>工程进度</td>
            <td class="table-td-content" id="proScheduleStr"></td>
        </tr>

        <tr>
            <td class="table-td-content" colspan="4" style="width: 10%">施工范围</td>
        </tr>

        <tr>
            <td colspan="4" rowspan="5" style="height: 600px;">
                <div id="container"></div>
            </td>
        </tr>
        </tbody>
    </table>
    <div style="text-align: center">
        <input class="btn btn-primary btn-sm" type="button" onclick="backOff()" value="返回">
    </div>
</div>

</body>
<script src="../../../static/js/jquery.js"></script>
<script src="../../../static/plugin/date_pickers/jquery.date_input.pack.js"></script>
<%--引入腾讯地图--%>
<script charset="utf-8" src="https://map.qq.com/api/js?v=2.exp&key=UTKBZ-2XGL4-KFHUB-XO2FA-7JCX5-CUFQ4"></script>
<script>
    //腾讯地图
    var map = new qq.maps.Map(document.getElementById("container"), {
        center: new qq.maps.LatLng(39.916527, 116.397128),      // 地图的中心地理坐标。
        zoom: 11                                                 // 地图的中心地理坐标。
    });

    //返回
    function backOff() {
        history.back(-1);
    }

    var id = $('#id').val();
    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/projectMessage/details.do',
        data: {'id': id},
        async: false,
        success: function (data) {
            var mapObject = JSON.parse(data);
            //工程基本信息
            $("#proName").append(mapObject.projectMessage.proName);
            $("#proNum").append(mapObject.projectMessage.proNum);
            $("#supervisorUnit").append(mapObject.projectMessage.supervisorUnit);
            $("#supervisorUnitPhone").append(mapObject.projectMessage.supervisorUnitPhone);
            $("#constructionUnit").append(mapObject.projectMessage.constructionUnit);
            $("#constructionUnitPhone").append(mapObject.projectMessage.constructionUnitPhone);
            $("#governorUnit").append(mapObject.projectMessage.governorUnit);
            $("#governorUnitPhone").append(mapObject.projectMessage.governorUnitPhone);
            $("#proLocation").append(mapObject.projectMessage.proLocation);
            $("#proSummarize").append(mapObject.projectMessage.proSummarize);
            $("#proTypeStr").append(mapObject.projectMessage.proTypeStr);
            $("#proStartTimeStr").append(mapObject.projectMessage.proStartTimeStr);
            $("#proEndTimeStr").append(mapObject.projectMessage.proEndTimeStr);
            $("#proStatusStr").append(mapObject.projectMessage.proStatusStr);
            $("#proScheduleStr").append(mapObject.projectMessage.proScheduleStr);

            //锥桶信息
            var coneBucketNum = "";
            var coneBucketTypeStr = "";
            for (var i = 0; i < mapObject.coneBucketMessageList.length; i++) {
                coneBucketTypeStr = mapObject.coneBucketMessageList[i].coneBucketTypeStr;
                coneBucketNum += mapObject.coneBucketMessageList[i].coneBucketNum;
                if (mapObject.coneBucketMessageList.length - 1 !== i) {
                    coneBucketNum += ",";
                }
            }
            $("#coneBucketNum").append(coneBucketNum);
            $("#coneBucketTypeStr").append(coneBucketTypeStr);

            //施工范围
            var path = [];
            var projectLocationList = mapObject.projectMessage.projectLocation;

            for (var i = 0; i < projectLocationList.length; i++) {
                //点
                var marker = new qq.maps.Marker({
                    position: new qq.maps.LatLng(projectLocationList[i].latitude, projectLocationList[i].longitude),
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
                path.push(new qq.maps.LatLng(projectLocationList[i].latitude, projectLocationList[i].longitude));
            }

            //线
            var polyline = new qq.maps.Polyline({
                path: path,
                strokeColor: '#3366FF',
                strokeWeight: 2,
                editable: false,
                map: map
            });
        },
        error: function (result) {
            alert("出错！");
        }
    })

</script>
</html>