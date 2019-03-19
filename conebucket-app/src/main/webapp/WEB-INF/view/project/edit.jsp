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
    <title>修改工程</title>

    <link rel="stylesheet" href="../../../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../static/css/style.css">
    <link rel="stylesheet" href="../../../static/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../../static/css/project.css">
    <link rel="stylesheet" href="../../../static/plugin/date_pickers/date_picker.css">
</head>
<body>


<div class="content" style="padding: 20px;background: #fff">
    <div class="panel-heading" style="font-size: 16px;border: 1px #bfbfbf solid;border-bottom: none;">新增工程</div>
    <form id="projectMessage">
        <table class="table table-condensed table-bordered table-hover">
            <tbody>
            <tr>
                <td style="width: 10%">工程名称</td>
                <td style="width: 40%">
                    <input type="hidden" name="id" value="${projectMessage.id}">
                    <input type="hidden" name="proNum" value="${projectMessage.proNum}">
                    <input type="hidden" name="proStatus" value="${projectMessage.proStatus}">
                    <input type="hidden" name="proSchedule" value="${projectMessage.proSchedule}">
                    <input class="form-control" type="text" id="proName" name="proName"
                           value="${projectMessage.proName}" autocomplete="off">
                </td>

                <td style="width: 10%">工程类型</td>
                <td style="width: 40%">
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
                <td style="width: 10%">工程概述</td>
                <td colspan="3">
                    <input class="form-control" type="text" id="proSummarize" name="proSummarize"
                           value="${projectMessage.proSummarize}"
                           autocomplete="off">
                </td>
            </tr>

            <tr>
                <td style="width: 10%">开始时间</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="proStartTimeStr" name="proStartTimeStr"
                           value="${projectMessage.proStartTimeStr}"
                           readonly="readonly"
                           autocomplete="off">
                </td>

                <td style="width: 10%">结束时间</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="proEndTimeStr" name="proEndTimeStr" autocomplete="off"
                           value="${projectMessage.proEndTimeStr}"
                           readonly="readonly">
                </td>
            </tr>

            <tr>
                <td style="">主管单位</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="governorUnit" name="governorUnit" autocomplete="off"
                           value="${projectMessage.governorUnit}">
                </td>

                <td style="">联系方式</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="governorUnitPhone" name="governorUnitPhone"
                           value="${projectMessage.governorUnitPhone}"
                           autocomplete="off">
                </td>
            </tr>

            <tr>
                <td style="">施工单位</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="constructionUnit" name="constructionUnit"
                           value="${projectMessage.constructionUnit}"
                           autocomplete="off">
                </td>

                <td style="">联系方式</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="constructionUnitPhone" name="constructionUnitPhone"
                           value="${projectMessage.constructionUnitPhone}"
                           autocomplete="off">
                </td>
            </tr>

            <tr>
                <td style="">监理单位</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="supervisorUnit" name="supervisorUnit"
                           value="${projectMessage.supervisorUnit}"
                           autocomplete="off">
                </td>

                <td style="">联系方式</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="supervisorUnitPhone" name="supervisorUnitPhone"
                           value="${projectMessage.supervisorUnitPhone}"
                           autocomplete="off">
                </td>
            </tr>

            <tr>
                <td style="">工程位置</td>
                <td colspan="3">
                    <input class="form-control" type="text" id="proLocation" name="proLocation" autocomplete="off"
                           value="${projectMessage.proLocation}">
                </td>
            </tr>

            <tr>
                <td style="">锥桶类型</td>
                <td style="width: 40%">
                    <select class="form-control" id="coneBucketType" name="coneBucketType">
                        <c:forEach items="${projectMessage.coneBucketMessage}" var="coneBucketMessage" begin="0" end="0">
                            <c:forEach items="${coneBucketTypeList}" var="coneBucketType">
                                <c:choose>
                                    <c:when test="${coneBucketType.id == coneBucketMessage.coneBucketType}">
                                        <option value="${coneBucketType.id}" selected>${coneBucketType.typeName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${coneBucketType.id}">${coneBucketType.typeName}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </c:forEach>
                    </select>
                </td>

                <td style="">锥桶编号</td>
                <td colspan="3">
                    <input class="form-control" type="text" id="coneBucketNum" name="coneBucketNum" autocomplete="off"
                           value="${coneBucketNum}"
                           onkeyup="this.value=this.value.replace(/，/g,',')">
                </td>
            </tr>

            <tr>
                <td colspan="4" style="width: 10%">施工范围</td>
            </tr>

            <tr>
                <td colspan="4" rowspan="5" style="height: 600px;">
                    <input type="button" value="重新加载地图" onclick="reloadMap()"
                           style="background: #00acee;color: #fff;padding: 5px;float: right; margin: 0 10px 5px 0;">
                    <input type="hidden" id="proScope" name="proScope" value="">
                    <div id="container"></div>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <div style="text-align: center">
        <input class="btn btn-primary btn-sm" type="button" value="提交" onclick="commit()">
        <input class="btn btn-primary btn-sm" type="button" onclick="backOff()" value="返回">
    </div>
</div>

</body>
<script src="../../../static/js/jquery.js"></script>
<script src="../../../static/plugin/date_pickers/jquery.date_input.pack.js"></script>
<%--引入腾讯地图--%>
<script charset="utf-8" src="https://map.qq.com/api/js?v=2.exp&key=UTKBZ-2XGL4-KFHUB-XO2FA-7JCX5-CUFQ4"></script>
<script>

    //定义map变量 调用 qq.maps.Map() 构造函数   获取地图显示容器
    var map = new qq.maps.Map(document.getElementById("container"), {
        center: new qq.maps.LatLng(39.916527, 116.397128),      // 地图的中心地理坐标。
        zoom: 11                                                 // 地图的中心地理坐标。
    });

    //解析工程经纬度，展示在地图上
    var path = [];
    var projectLocationJson = '${projectLocationList}';
    var projectLocation = JSON.parse(projectLocationJson);
    for (var i = 0; i < projectLocation.length; i++) {
        path.push(new qq.maps.LatLng(projectLocation[i].latitude, projectLocation[i].longitude));
        //点
        var marker = new qq.maps.Marker({
            position: new qq.maps.LatLng(projectLocation[i].latitude, projectLocation[i].longitude),
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
        path.push(new qq.maps.LatLng(projectLocation[i].latitude, projectLocation[i].longitude));
    }

    //线
    var polyline = new qq.maps.Polyline({
        path: path,
        strokeColor: '#3366FF',
        strokeWeight: 2,
        editable: false,
        map: map
    });

    //返回
    function backOff() {
        history.back(-1);
    }

    //提交form
    function commit() {
        var proScopeJson = JSON.stringify(path);
        console.log("------" + proScopeJson);
        $('#proScope').val(proScopeJson);
        $.ajax({
            type: "POST",
            url: 'http://localhost:8080/projectMessage/edit.do',
            data: $('#projectMessage').serialize(),
            error: function (request) {
                alert("Connection error");
            },
            success: function (data) {
                if (data === "success") {
                    alert('修改成功');
                    history.back(-1);
                } else {
                    alert('修改失败');
                }
            }
        });
    }

    //初始化
    $(function () {
        $('#proStartTimeStr').date_input();
        $('#proEndTimeStr').date_input();
    });
</script>
</html>