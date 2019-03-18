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
    <title>添加</title>

    <link rel="stylesheet" href="../../../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../static/css/style.css">
    <link rel="stylesheet" href="../../../static/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../../static/css/project.css">
    <link rel="stylesheet" href="../../../static/plugin/date_pickers/date_picker.css">
</head>
<body>

<!--<div id='windowBackgroundColor'></div>-->

<div class="content" style="padding: 20px;background: #fff">
    <div class="panel-heading" style="font-size: 16px;border: 1px #bfbfbf solid;border-bottom: none;">新增工程</div>
    <form id="projectMessage">
        <table class="table table-condensed table-bordered table-hover">
            <tbody>
            <tr>
                <td style="width: 10%">工程名称</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="proName" name="proName" value="" autocomplete="off">
                </td>

                <td style="width: 10%">工程类型</td>
                <td style="width: 40%">
                    <select class="form-control" id="proType" name="proType">
                        <c:forEach items="${projectTypeList}" var="projectType">
                            <option value="${projectType.id}">${projectType.typeName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td style="width: 10%">工程概述</td>
                <td colspan="3">
                    <input class="form-control" type="text" id="proSummarize" name="proSummarize" value=""
                           autocomplete="off">
                </td>
            </tr>

            <tr>
                <td style="width: 10%">开始时间</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="proStartTimeStr" name="proStartTimeStr"
                           readonly="readonly"
                           autocomplete="off">
                </td>

                <td style="width: 10%">结束时间</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="proEndTimeStr" name="proEndTimeStr" autocomplete="off"
                           readonly="readonly">
                </td>
            </tr>

            <tr>
                <td style="">主管单位</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="governorUnit" name="governorUnit" autocomplete="off">
                </td>

                <td style="">联系方式</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="governorUnitPhone" name="governorUnitPhone"
                           autocomplete="off">
                </td>
            </tr>

            <tr>
                <td style="">施工单位</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="constructionUnit" name="constructionUnit"
                           autocomplete="off">
                </td>

                <td style="">联系方式</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="constructionUnitPhone" name="constructionUnitPhone"
                           autocomplete="off">
                </td>
            </tr>

            <tr>
                <td style="">监理单位</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="supervisorUnit" name="supervisorUnit"
                           autocomplete="off">
                </td>

                <td style="">联系方式</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="supervisorUnitPhone" name="supervisorUnitPhone"
                           autocomplete="off">
                </td>
            </tr>

            <tr>
                <td style="">工程位置</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="proLocation" name="proLocation" autocomplete="off">
                </td>

                <td style="">是否有锥桶</td>
                <td style="width: 40%">
                    <select class="form-control" id="containConeBucket" name="containConeBucket">
                        <option value="1">否</option>
                        <option value="2">是</option>
                    </select>
                </td>

            </tr>

            <tr id="coneBucketTypeSelect" style="display: none">
                <td style="">锥桶类型</td>
                <td style="width: 40%">
                    <select class="form-control" id="coneBucketType" name="coneBucketType">
                        <c:forEach items="${coneBucketTypeList}" var="coneBucketType">
                            <option value="${coneBucketType.id}">${coneBucketType.typeName}</option>
                        </c:forEach>
                    </select>
                </td>

                <td style="">锥桶编号</td>
                <td colspan="3">
                    <input class="form-control" type="text" id="coneBucketNum" name="coneBucketNum" autocomplete="off" onkeyup="this.value=this.value.replace(/，/g,',')">
                </td>
            </tr>

            <tr>
                <td colspan="4" style="width: 10%">施工范围</td>
            </tr>

            <tr>
                <td colspan="4" rowspan="5" style="height: 600px;">
                    <input type="button" value="重新加载地图" onclick="reloadMap()"
                           style="background: #00acee;color: #fff;padding: 5px;float: right; margin: 0 10px 5px 0;">
                    <input type="hidden" id="proScope" name="proScope">
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

<!--<div id="win"
     style="background: #fff;width: 1000px;height: 500px;display: none;position: absolute;top: 50px;left: 260px;z-index: 9999;border-radius: 10px;padding: 10px">
    <div>
        <input type="text" id="keyword" name="keyword"/>
    </div>
    <div style="float: right;height: 5%;width: 30px;text-align: center;vertical-align: middle;cursor: pointer;">
        <img src="../img/close.png" class="map-close-img" onclick="closeMap()"/>
    </div>

    &lt;!&ndash;地图&ndash;&gt;
    &lt;!&ndash;<div id="container"></div>&ndash;&gt;

    <span id="positioningFailure"
          style="background: #c1bfbf;width: 100px;height: 30px;position: absolute;top: 50%;left: 45%;font-size: 16px;text-align: center;line-height: 30px;display: none">定位失败</span>
</div>-->
</body>
<script src="../../../static/js/jquery.js"></script>
<script src="../../../static/plugin/date_pickers/jquery.date_input.pack.js"></script>
<%--引入腾讯地图--%>
<script charset="utf-8" src="https://map.qq.com/api/js?v=2.exp&key=UTKBZ-2XGL4-KFHUB-XO2FA-7JCX5-CUFQ4"></script>
<script>
    //腾讯地图
    var path = [];
    function newMap() {
        //定义map变量 调用 qq.maps.Map() 构造函数   获取地图显示容器
        var map = new qq.maps.Map(document.getElementById("container"), {
            center: new qq.maps.LatLng(39.916527, 116.397128),      // 地图的中心地理坐标。
            zoom: 11                                                 // 地图的中心地理坐标。
        });


        //绑定单击事件添加参数
        qq.maps.event.addListener(map, 'click', function (event) {
            path.push(new qq.maps.LatLng(event.latLng.getLat(),event.latLng.getLng()));
            console.log(path);
            //创建marker
            var marker = new qq.maps.Marker({
                position: new qq.maps.LatLng(event.latLng.getLat(), event.latLng.getLng()),
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
            var polyline = new qq.maps.Polyline({
                path: path,
                strokeColor: '#3366FF',
                strokeWeight: 2,
                editable: false,
                map: map
            });
        });

    }


    //重新加载地图
    function reloadMap() {
        newMap();
    }

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
            url: 'http://localhost:8080/projectMessage/add.do',
            data: $('#projectMessage').serialize(),
            error: function (request) {
                alert("Connection error");
            },
            success: function (data) {
                if (data === "success") {
                    alert('添加成功');
                } else {
                    alert('添加失败');
                }
            }
        });
    }

    //是否有锥桶
    $('#containConeBucket').change(function () {
        if ($(this).val() == 1) {
            $('#coneBucketTypeSelect').hide();
            $('#coneBucketType').empty();
        } else if ($(this).val() == 2) {
            $('#coneBucketTypeSelect').show();
        }
    });

    //初始化地图
    $(function () {
        newMap();
        $('#proStartTimeStr').date_input();
        $('#proEndTimeStr').date_input();
    });
</script>
</html>