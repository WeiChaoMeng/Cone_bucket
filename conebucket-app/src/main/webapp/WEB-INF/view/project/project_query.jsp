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

                    <label id="nickname" class="control-label col-sm-1">工程名称:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_road2" autocomplete="off">
                    </div>

                    <label id="type" class="control-label col-sm-1">工程类型:</label>
                    <div class="col-sm-4">
                        <select class="form-control" id="facilityCategory">
                            <option value="">--请选择--</option>
                            <option value="">大中修工程</option>
                            <option value="">应急抢险</option>
                            <option value="">日常维修</option>
                        </select>
                    </div>
                </div>

                <div class="form-group row" style="margin:10px auto">
                    <label id="time" class="control-label col-sm-1">工程时间:</label>
                    <div class="col-sm-2">
                        <input placeholder="开始时间" type="text" class="form-control " id="star"
                               onfocus="WdatePicker({lang:'zh-cn'})" readonly="">
                    </div>
                    <div class="col-sm-2">
                        <input placeholder="结束时间" type="text" class="form-control " id="end"
                               onfocus="WdatePicker({lang:'zh-cn'})" readonly="">
                    </div>

                    <label id="bucket" class="control-label col-sm-1">锥桶类型:</label>
                    <div class="col-sm-4">
                        <select class="form-control" id="search">
                            <option value="">--请选择--</option>
                            <option value="">内部监管</option>
                            <option value="">高德平台</option>
                        </select>
                    </div>

                    <div class="col-sm-1" style="text-align:center;">
                        <button type="button" id="btn_query" class="btn btn-primary btn-sm">查询
                        </button>
                    </div>
                </div>

            </form>
        </div>
    </div>

    <!--table-->
    <div class="table-style">
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

            <div id="tableShow"  style="display: none" class="x_content">

                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="width: 5%;"><input type="checkbox"></th>
                        <th style="width: 5%;">序号</th>
                        <th style="width: 20%;">工程名称</th>
                        <th style="width: 10%;">工程类型</th>
                        <th style="width: 15%;">开始时间</th>
                        <th style="width: 15%;">结束时间</th>
                        <th style="width: 10%;">工程状态</th>
                        <th style="width: 10%;">工程进度</th>
                        <th style="width: 10%;">操作</th>
                    </tr>
                    </thead>
                    <tbody>
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
<%--引入腾讯地图--%>
<script charset="utf-8" src="https://map.qq.com/api/js?v=2.exp&key=UTKBZ-2XGL4-KFHUB-XO2FA-7JCX5-CUFQ4"></script>
<script>

    //腾讯地图
    var map = new qq.maps.Map(document.getElementById("container"), {
        center: new qq.maps.LatLng(39.916527, 116.397128),      // 地图的中心地理坐标。
        zoom: 11                                                 // 地图的中心地理坐标。
    });

    //创建marker
    var marker1 = new qq.maps.Marker({
        position: new qq.maps.LatLng(39.91710957679777, 116.38134956359863),
        map: map
    });

    var marker2 = new qq.maps.Marker({
        position: new qq.maps.LatLng(39.91622086779371, 116.40512466430664),
        map: map
    });

    var marker3 = new qq.maps.Marker({
        position: new qq.maps.LatLng(39.901901188686146, 116.40538215637207),
        map: map
    });

    var marker4 = new qq.maps.Marker({
        position: new qq.maps.LatLng(39.91375217116118, 116.38031959533691),
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
    marker1.setIcon(markerIcon);
    marker2.setIcon(markerIcon);
    marker3.setIcon(markerIcon);
    marker4.setIcon(markerIcon);

    /*
    0: q {lat: 39.91710957679777, lng: 116.38134956359863}
    1: q {lat: 39.91622086779371, lng: 116.40512466430664}
    2: q {lat: 39.901901188686146, lng: 116.40538215637207}
    3: q {lat: 39.91375217116118, lng: 116.38031959533691}
    * */
    var path = [
        new qq.maps.LatLng(39.91710957679777, 116.38134956359863),
        new qq.maps.LatLng(39.91622086779371, 116.40512466430664),
        new qq.maps.LatLng(39.901901188686146, 116.40538215637207),
        new qq.maps.LatLng(39.91375217116118, 116.38031959533691)
    ];

    //线
    var polyline = new qq.maps.Polyline({
        path: path,
        strokeColor: '#3366FF',
        strokeWeight: 2,
        editable: false,
        map: map
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
</script>
</html>