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
    <div class="" style="padding:15px 0;font-size: 17px;font-weight:600;text-align: center">修改工程</div>
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
                           value="${projectMessage.proName}" autocomplete="off"
                           onkeyup="this.value=this.value.replace(/\s+/g,'')">
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
                        <c:if test="${fn:length(projectMessage.coneBucket) == 0}">
                            <option value="">--请选择--</option>
                            <c:forEach items="${coneBucketTypeList}" var="coneBucketType">
                                <option value="${coneBucketType.id}">${coneBucketType.typeName}</option>
                            </c:forEach>
                        </c:if>

                        <c:if test="${fn:length(projectMessage.coneBucket) > 0}">
                            <c:forEach items="${projectMessage.coneBucket}" var="coneBucket" begin="0"
                                       end="0">
                                <c:forEach items="${coneBucketTypeList}" var="coneBucketType">
                                    <c:choose>
                                        <c:when test="${coneBucketType.id == coneBucket.coneBucketTypeId}">
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

                <td style="">锥桶编号</td>
                <td>
                    <input class="form-control" type="text" id="coneBucketNum" name="coneBucketNum" autocomplete="off"
                           readonly onclick="selectConeBarrel()" value="${coneBucketNum}">
                           <%--onkeyup="this.value=this.value.replace(/，/g,','),this.value=this.value.replace(/\s+/g,'')">--%>
                </td>
            </tr>

            <tr>
                <td colspan="4" style="text-align: left;font-size: 14px;text-indent: 20px;padding: 10px 0;">施工范围</td>
            </tr>

            <tr>
                <td colspan="4" rowspan="5" style="height: 600px;">
                    <input type="button" value="重绘地图" onclick="reloadMap()" class="btn btn-primary btn-sm"
                           style="float: right;margin-bottom: 5px;">
                    <input type="hidden" id="proScope" name="proScope" value="">
                    <div id="container" style="height: 95%"></div>
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

<%--勾选锥桶--%>
<div id="chooseConeBarrel" style="display: none">
    <%--<div style="height: 75%;padding: 15px 30px;overflow: auto;" id="multipleConeBarrel">--%>
        <%--<ul style="margin: 0;padding: 0">--%>
            <%--<c:forEach items="${coneBucketList}" var="coneBucketList">--%>
                <%--<li style="margin-bottom: 5px;">--%>
                    <%--<input type="checkbox" style="zoom: 130%;margin: 0 10px 0 0;padding: 0;vertical-align: middle;" value="${coneBucketList.id}">--%>
                    <%--<span style="font-size: 15px;">${coneBucketList.id}</span>--%>
                <%--</li>--%>
            <%--</c:forEach>--%>
        <%--</ul>--%>
    <%--</div>--%>
    <%--<div style="height: 25%;text-align: center;padding-top: 15px;">--%>
        <%--<button class="btn btn-primary btn-sm" onclick="addChooseConeBarrel()">确认</button>--%>
    <%--</div>--%>
</div>

<script src="../../../static/js/jquery.js"></script>
<script src="../../../static/plugin/layer/layer.js"></script>
<script src="../../../static/plugin/date_pickers/jquery.date_input.pack.js"></script>
<%--引入腾讯地图--%>
<script charset="utf-8" src="https://map.qq.com/api/js?v=2.exp&key=UTKBZ-2XGL4-KFHUB-XO2FA-7JCX5-CUFQ4"></script>
<script>

    //解析工程经纬度，展示在地图上
    var path = [];
    var projectLocationJson = '${projectLocationList}';
    var projectLocation = JSON.parse(projectLocationJson);

    //定义map变量 调用 qq.maps.Map() 构造函数   获取地图显示容器
    var map = new qq.maps.Map(document.getElementById("container"), {
        center: new qq.maps.LatLng(projectLocation[0].latitude, projectLocation[0].longitude),      // 地图的中心地理坐标。
        zoom: 11                                                 // 地图的中心地理坐标。
    });

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
        $('#proScope').val(proScopeJson);
        $.ajax({
            type: "POST",
            url: localStorage.getItem("ajaxUrl") + '/projectMessage/edit.do',
            data: $('#projectMessage').serialize(),
            error: function (request) {
                alert("Connection error");
            },
            success: function (data) {
                if (data === "success") {
                    layer.msg('修改成功');
                    window.location.href = localStorage.getItem("ajaxUrl") + "/projectMessage/toIndex.do";
                } else {
                    layer.msg('修改失败');
                }
            }
        });
    }

    var coneBucketList = JSON.parse('${coneBucketList}');
    var selectedConeBucketList = JSON.parse('${selectedConeBucketList}');
    var sel;

    //勾选锥桶
    function selectConeBarrel(){
        var coneBucketContent = '';
        coneBucketContent += '<div style="height: 75%;padding: 15px 30px;overflow: auto;" id="multipleConeBarrel">';
        coneBucketContent += '        <ul style="margin: 0;padding: 0">';
        for (var i = 0; i < coneBucketList.length; i++) {
            coneBucketContent += '<li style="margin-bottom: 5px;">';

            if (selectedConeBucketList.length > 0){
                for (var j = 0; j < selectedConeBucketList.length; j++) {
                    if (coneBucketList[i].id === selectedConeBucketList[j].id) {
                        sel = '<input type="checkbox" checked style="zoom: 130%;margin: 0 10px 0 0;padding: 0;vertical-align: middle;" value="'+ coneBucketList[i].id +'">';
                        break;
                    }else {
                        sel ='<input type="checkbox" style="zoom: 130%;margin: 0 10px 0 0;padding: 0;vertical-align: middle;" value="'+ coneBucketList[i].id +'">';
                    }
                }
            } else{
                sel ='<input type="checkbox" style="zoom: 130%;margin: 0 10px 0 0;padding: 0;vertical-align: middle;" value="'+ coneBucketList[i].id +'">';
            }

            coneBucketContent += sel;
            coneBucketContent += '<span style="font-size: 15px;">'+coneBucketList[i].id+'</span>';
            coneBucketContent += '</li>';
        }


        coneBucketContent += '        </ul>';
        coneBucketContent += '    </div>';
        coneBucketContent += '    <div style="height: 25%;text-align: center;padding-top: 15px;">';
        coneBucketContent += '        <button class="btn btn-primary btn-sm" onclick="addChooseConeBarrel()">确认</button>';
        coneBucketContent += '    </div>';

        $('#chooseConeBarrel').html(coneBucketContent);
        window.lar = layer.open({
            type: 1,
            title: '选择锥桶',
            area: ['300px', '300px'],
            skin: 'layer-ext-yourskin',
            // shade: [0.8, '#393D49'],
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

    //初始化
    $(function () {
        $('#proStartTimeStr').date_input();
        $('#proEndTimeStr').date_input();
    });
</script>
</html>