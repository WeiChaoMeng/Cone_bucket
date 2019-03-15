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
    <link rel="stylesheet" href="../../../static/css/engineering.css">
    <!--引入高德地图JSAPI -->
    <script type="text/javascript"
            src="https://webapi.amap.com/maps?v=1.4.13&key=5ae1365fcf3e53e6a218d9d88cd50249"></script>
    <script type="text/javascript"
            src="https://webapi.amap.com/maps?v=1.4.13&key=5ae1365fcf3e53e6a218d9d88cd50249&plugin=AMap.Autocomplete,AMap.PlaceSearch"></script>
    <script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
    <style>
        .table-hover > tbody > tr:hover {
            /*去除背景色*/
            background-color: transparent;
        }

        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
            vertical-align: middle;
        }

        .form-control {
            display: block;
            width: 100%;
        }

        #windowBackgroundColor {
            width: 100%;
            height: 100%;
            z-index: 8888;
            background-color: #000000;
            position: absolute;
            opacity: 0.3;
            display: none;
            left: 0;
        }

        #container {
            width: 100%;
            height: 560px;
        }

        .map-close-img:before {
            color: #f06e57;
        }

        .form-control{
            font-size: 13px;
        }
    </style>
</head>
<body style="background: #e7e8eb;width: 80%;margin: 0 auto">

<!--<div id='windowBackgroundColor'></div>-->

<div class="content" style="padding: 20px;background: #fff">
    <div class="panel-heading" style="font-size: 16px;border: 1px #bfbfbf solid;border-bottom: none;">新增工程</div>
    <form id="streetlightDiseaseForm" type="get" onsubmit="addSubmit(); return false">
        <table class="table table-condensed table-bordered table-hover">
            <tbody>
            <tr>
                <td style="width: 10%">工程名称</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="" name="diseaseNumber" value="" autocomplete="off"
                           required="true">
                </td>

                <td style="width: 10%">工程类型</td>
                <td style="width: 40%">
                    <select class="form-control" id="roadName" name="roadName" required="true">
                        <option value="">大中修工程</option>
                        <option value="">应急抢险</option>
                        <option value="">日常维修</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td style="width: 10%">工程概述</td>
                <td colspan="3">
                    <input class="form-control" type="text" id="" name="remarks" value="" required="true"
                           autocomplete="off">
                </td>
            </tr>

            <tr>
                <td style="width: 10%">开始时间</td>
                <td style="width: 40%">
                    <select class="form-control" name="facilityCategory" id="facilityCategory" required="true">
                        <option value="">--请选择--</option>
                    </select>
                </td>

                <td style="width: 10%">结束时间</td>
                <td style="width: 40%">
                    <select class="form-control" id="diseaseDescribe" name="diseaseDescribe" keyname="病害小类"
                            required="true">
                        <option value="">--请选择--</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td style="width: 10%">是否有锥桶</td>
                <td style="width: 40%">
                    <select class="form-control" id="" name="diseaseDescribe" keyname="病害小类"
                            required="true">
                        <option value="">--请选择--</option>
                        <option value="">是</option>
                        <option value="">否</option>
                    </select>
                </td>

                <td style="width: 10%">锥桶类型</td>
                <td style="width: 40%">
                    <select class="form-control" id="" name="diseaseDescribe" keyname="病害小类"
                            required="true">
                        <option value="">--请选择--</option>
                        <option value="">内部监管</option>
                        <option value="">高德平台</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td style="width: 10%">锥桶编号</td>
                <td colspan="3">
                    <input class="form-control" type="text" id="" name="remarks" value="" required="true"
                           autocomplete="off">
                </td>
            </tr>

            <tr>
                <td colspan="4" style="width: 10%">工程位置</td>
            </tr>

            <tr>
                <td colspan="4" rowspan="5" style="height: 600px;">
                    <input type="button" value="重新加载地图" onclick="reloadMap()"
                           style="background: #00acee;color: #fff;padding: 5px;float: right; margin: 0 10px 5px 0;">
                    <div id="container"></div>
                </td>
            </tr>
            </tbody>
        </table>
        <div style="text-align: center">
            <input class="btn btn-primary btn-sm" type="submit" value="提交">
            <input class="btn btn-primary btn-sm" type="button" onclick="backOff()" value="返回">
        </div>
    </form>
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
<script src="../../../static/js/jquery-1.12.4.min.js"></script>
<script>
    //返回
    function backOff() {
        history.back(-1);
        //销毁地图，并清空地图容器
        map.destroy();
    }

    //重新加载地图
    function reloadMap() {
        newMap();
    }

    function newMap() {
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

        // 创建一个 Icon
        var startIcon = new AMap.Icon({
            // 图标尺寸
            size: new AMap.Size(19, 23),
            // 图标的取图地址
            image: "../img/poi-marker-default.png",
            // 图标所用图片大小
            imageSize: new AMap.Size(20, 25),
            // 图标取图偏移量
            imageOffset: new AMap.Pixel(0, 0)
        });

        var path = [];

        //设置marker
        map.on('click', label);

        function label(e) {
            path.push(new AMap.LngLat(e.lnglat.getLng(), e.lnglat.getLat()));
            console.log(e.lnglat.getLng() + ',' + e.lnglat.getLat());
            console.log(path);
            marker = new AMap.Marker({
                icon: startIcon,
                position: [e.lnglat.getLng(), e.lnglat.getLat()],
                offset: new AMap.Pixel(-10, -23)
            });
            marker.setMap(map);

            var polyline = new AMap.Polyline({
                path: path,
                strokeColor: "#3366FF",
                strokeOpacity: 1,
                strokeWeight: 2,
                // 折线样式还支持 'dashed'
                strokeStyle: "solid",
                // strokeStyle是dashed时有效
                strokeDasharray: [10, 5],
                lineJoin: 'round',
                lineCap: 'round',
                zIndex: 50
            });

            polyline.setMap(map);
            // 缩放地图到合适的视野级别
            map.setFitView([polyline]);
        }

        map.on('rightclick', function () {
            map.off('click', label);
        });
    }

    //初始化地图
    $(function () {
        newMap();
    });
</script>
</html>