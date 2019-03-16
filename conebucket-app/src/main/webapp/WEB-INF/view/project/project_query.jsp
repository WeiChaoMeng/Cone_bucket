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
    <!--引入高德地图JSAPI -->
    <script type="text/javascript"
            src="https://webapi.amap.com/maps?v=1.4.13&key=5ae1365fcf3e53e6a218d9d88cd50249"></script>
    <script type="text/javascript"
            src="https://webapi.amap.com/maps?v=1.4.13&key=5ae1365fcf3e53e6a218d9d88cd50249&plugin=AMap.Autocomplete,AMap.PlaceSearch"></script>
    <script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
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
                            title="切换" onclick="handover()">切换</button>
                </div>
            </div>

            <div id="tableShow" class="x_content">

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

            <div id="mapShow" style="display: none">
                <div id="container"></div>
            </div>
        </div>
    </div>
    <!-- /page content -->
</div>
</body>
<script src="../../../static/js/jquery-1.12.4.min.js"></script>
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

    //高德地图
    var map = new AMap.Map('container', {
        zoom: 11,//级别
        center: [116.397428, 39.90923],//中心点坐标
        viewMode: '3D'//使用3D视图
    });

    // 同时引入工具条插件，比例尺插件和鹰眼插件
    AMap.plugin([
        'AMap.ToolBar',
        'AMap.Scale',
        'AMap.MapType'
    ], function () {
        // 在图面添加工具条控件，工具条控件集成了缩放、平移、定位等功能按钮在内的组合控件
        map.addControl(new AMap.ToolBar());

        // 在图面添加比例尺控件，展示地图在当前层级和纬度下的比例尺
        map.addControl(new AMap.Scale());

        // 在图面添加类别切换控件，实现默认图层与卫星图、实施交通图层之间切换的控制
        map.addControl(new AMap.MapType());
    });

    //添加线
    var polylinePath = [
        new AMap.LngLat(116.335933, 39.942113),
        new AMap.LngLat(116.483096, 39.944063),
        new AMap.LngLat(116.398114, 39.908543)
    ];

    var polyline = new AMap.Polyline({
        path: polylinePath,
        strokeColor: "#3366FF"
    });

    // 创建一个 Icon
    var startIcon = new AMap.Icon({
        // 图标尺寸
        size: new AMap.Size(19, 23),
        // 图标的取图地址
        image: "../../static/img/poi-marker-default.png",
        // 图标所用图片大小
        imageSize: new AMap.Size(20, 25),
        // 图标取图偏移量
        imageOffset: new AMap.Pixel(0, 0)
    });

    //添加marker
    var markers = [{
        icon: startIcon,
        position: [116.335933, 39.942113]
    }, {
        icon: startIcon,
        position: [116.483096, 39.944063]
    }, {
        icon: startIcon,
        position: [116.398114, 39.908543]
    }];

    markers.forEach(function (marker) {
        new AMap.Marker({
            map: map,
            icon: marker.icon,
            position: [marker.position[0], marker.position[1]],
            offset: new AMap.Pixel(-10, -23)
        });
    });

    map.add([polyline]);
</script>
</html>