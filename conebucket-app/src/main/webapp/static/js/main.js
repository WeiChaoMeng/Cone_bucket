//工程查询
$('#engineeringQuery').on('click', function () {
    mainMuneColor(this);
    $('#secondaryMenu').html('');
    $('#inlineFrame').attr("src", "projectMessage/toProjectQueryIndex.do");
});

//工程管理
$('#engineeringManage').on('click', function () {
    mainMuneColor(this);
    $('#secondaryMenu').html('');
    $('#inlineFrame').attr("src", "projectMessage/toIndex.do");
});

//系统管理
$('#system').on('click', function () {
    mainMuneColor(this);
    $('#secondaryMenu').html(
        '<div class="secondary-menu-system">' +
        '<div onclick="user(this)" class="secondary-menu-style-color">用户管理</div>' +
        '</div>' +
        '<div class="secondary-menu-system">' +
        '<div onclick="role(this)">角色管理</div>' +
        '</div>' +
        '<div class="secondary-menu-system">' +
        '<div onclick="permissions(this)">权限管理</div>' +
        '</div>' +
        '<div class="secondary-menu-system">' +
        '<div onclick="parameterConfigure(this)">参数管理</div>' +
        '</div>');
    $('#inlineFrame').attr("src", "userInfo/toIndex.do");
});

//设备管理
$('#device').on('click', function () {
    mainMuneColor(this);
    $('#secondaryMenu').html(
        '<div class="secondary-menu-device">' +
        '<div onclick="coneBucketManagement(this)" class="secondary-menu-style-color">锥桶管理</div>' +
        '</div>')
    $('#inlineFrame').attr("src", "coneBucketManage.do");
});

//日志管理
$('#log').on('click', function () {
    mainMuneColor(this);
    $('#secondaryMenu').html(
        '<div class="secondary-menu-log">' +
        '<div onclick="engineeringLog(this)" class="secondary-menu-style-color">工程日志</div>' +
        '</div>' +
        '<div class="secondary-menu-log">' +
        '<div onclick="coneBucketLog(this)">锥桶日志</div>' +
        '</div>' +
        '<div class="secondary-menu-log">' +
        '<div onclick="alertLog(this)">预警日志</div>' +
        '</div>')
    $('#inlineFrame').attr("src", "engineeringLog.do");
});

//主菜单选中颜色
function mainMuneColor(o) {
    $('#mainMenu').children('div').removeClass('action-div-border');
    $(o).addClass('action-div-border');
}

/*--------------------------------系统管理--------------------------*/

//用户管理
function user(o) {
    secondaryMenuColor(o);
    $('#inlineFrame').attr("src", "userInfo/toIndex.do");
}

//角色管理
function role(o) {
    secondaryMenuColor(o);
    $('#inlineFrame').attr("src", "roleInfo/toIndex.do");
}

//权限管理
function permissions(o) {
    secondaryMenuColor(o);
    $('#inlineFrame').attr("src", "permission/toIndex.do");
}

//参数配置
function parameterConfigure(o) {
    secondaryMenuColor(o);
    $('#inlineFrame').attr("src", "parameterConfigure.do");
}


/*--------------------------设备管理-----------------------------*/

//锥桶管理
function coneBucketManagement(o) {
    secondaryMenuColor(o);
    $('#inlineFrame').attr("src", "coneBucketManage.do");
}

/*--------------------------日志管理-----------------------------*/

//工程日志
function engineeringLog(o) {
    secondaryMenuColor(o);
    $('#inlineFrame').attr("src", "engineeringLog.do");
}

//锥桶日志
function coneBucketLog(o) {
    secondaryMenuColor(o);
    $('#inlineFrame').attr("src", "coneBucketLog.do");
}

//预警日志
function alertLog(o) {
    secondaryMenuColor(o);
    $('#inlineFrame').attr("src", "alertLog.do");
}


//二级菜单选中颜色
function secondaryMenuColor(o) {
    $('#secondaryMenu').children('div').children('div').removeClass('secondary-menu-style-color');
    $(o).addClass('secondary-menu-style-color');
}

//退出
function exit() {
    window.location.href = "http://localhost:8080/"
}

/**********************锥桶添加函数********************************/
//弹出事件
function iframeAlert() {
    window.lar = layer.open({
        type: 1,
        area: ['600px', '360px'],
        shadeClose: true, //点击遮罩关闭
        content: $("#addFrom"),
        offset: "25%"
    });
}

//添加锥桶
function addSubmit() {
    var cone_bucket_num = $("#cbNum").val();
    var cone_bucket_type = $("#roadName").val();


    if (isNull(cone_bucket_num) || isNull(cone_bucket_type)) {
        layer.msg('锥桶内容不能为空');
    } else {

        $.ajax({
            url: localStorage.getItem("ajaxUrl") + "/addConeBucket.do",
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            data: {
                "diseaseNumber": cone_bucket_num,
                "roadName": cone_bucket_type
            },
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if (result.resultCode == 200) {
                    layer.msg("添加成功");
                    layer.close(window.lar);
                    $("#inlineFrame")[0].contentWindow.getAllConeBucket();
                } else {
                    layer.msg("添加失败");
                }

            },
            error: function () {
                layer.msg("异常！");
            }
        })
    }
}

//工程详细信息
function projectDetailed(mapObject) {
    window.lar = layer.open({
        type: 1,
        area: ['80%', '90%'],
        shadeClose: true, //点击遮罩关闭
        content: $("#projectDetailed"),
        offset: "5%"
    });

    var detailedInfo = "";
    detailedInfo += '<tr>';
    detailedInfo += '<td>工程名称</td>';
    detailedInfo += '<td class="table-td-content" colspan="5">' + mapObject.projectMessage.proName + '</td>';
    detailedInfo += '<td style="width: 10%">工程类型</td>';
    detailedInfo += '<td class="table-td-content">' + mapObject.projectMessage.proTypeStr + '</td>';
    detailedInfo += '</tr>';
    detailedInfo += '<tr>';
    detailedInfo += '<td style="vertical-align: middle">工程概述</td>';
    detailedInfo += '<td class="table-td-content" colspan="7" style="height: 55px;padding: 5px">' + mapObject.projectMessage.proSummarize + '</td>';
    detailedInfo += '</tr>';
    detailedInfo += '<tr>';
    detailedInfo += '<td style="width: 10%">开始时间</td>';
    detailedInfo += '<td class="table-td-content">' + mapObject.projectMessage.proStartTimeStr + '</td>';
    detailedInfo += '<td style="width: 10%">结束时间</td>';
    detailedInfo += '<td class="table-td-content">' + mapObject.projectMessage.proEndTimeStr + '</td>';
    detailedInfo += '<td style="width: 10%">主管单位</td>';
    detailedInfo += '<td class="table-td-content">' + mapObject.projectMessage.governorUnit + '</td>';
    detailedInfo += '<td style="width: 10%">联系方式</td>';
    detailedInfo += '<td class="table-td-content">' + mapObject.projectMessage.governorUnitPhone + '</td>';
    detailedInfo += '</tr>';
    detailedInfo += '<tr>';
    detailedInfo += '<td>施工单位</td>';
    detailedInfo += '<td class="table-td-content">' + mapObject.projectMessage.constructionUnit + '</td>';
    detailedInfo += '<td>联系方式</td>';
    detailedInfo += '<td class="table-td-content">' + mapObject.projectMessage.constructionUnitPhone + '</td>';
    detailedInfo += '<td>监理单位</td>';
    detailedInfo += '<td class="table-td-content">' + mapObject.projectMessage.constructionUnit + '</td>';
    detailedInfo += '<td>联系方式</td>';
    detailedInfo += '<td class="table-td-content">' + mapObject.projectMessage.supervisorUnitPhone + '</td>';
    detailedInfo += '</tr>';
    detailedInfo += '<tr>';
    detailedInfo += '<td>工程位置</td>';
    detailedInfo += '<td class="table-td-content" colspan="7">' + mapObject.projectMessage.proLocation + '</td>';
    detailedInfo += '</tr>';
    detailedInfo += '<tr>';

    //锥桶信息
    detailedInfo += '<td>锥桶类型</td>';
    detailedInfo += '<td class="table-td-content" id="coneBucketTypeStr">';
    if (mapObject.coneBucketMessageList.length < 1) {
        detailedInfo += '无';
    } else {
        for (var i = 0; i < mapObject.coneBucketMessageList.length; i++) {
            detailedInfo += mapObject.coneBucketMessageList[i].coneBucketTypeStr;
        }
    }
    detailedInfo += '</td>';
    detailedInfo += '<td>锥桶编号</td>';
    detailedInfo += '<td class="table-td-content" id="coneBucketNum">';
    if (mapObject.coneBucketMessageList.length < 1) {
        detailedInfo += '无';
    } else {
        for (var i = 0; i < mapObject.coneBucketMessageList.length; i++) {
            detailedInfo += mapObject.coneBucketMessageList[i].coneBucketNum;
            if (mapObject.coneBucketMessageList.length - 1 !== i) {
                detailedInfo += ",";
            }
        }
    }
    detailedInfo += '</td>';
    detailedInfo += '<td>工程状态</td>';
    detailedInfo += '<td class="table-td-content">' + mapObject.projectMessage.proStatusStr + '</td>';
    detailedInfo += '<td>工程进度</td>';
    detailedInfo += '<td class="table-td-content">' + mapObject.projectMessage.proScheduleStr + '</td>';
    detailedInfo += '</tr>';
    detailedInfo += '<tr>';
    detailedInfo += '<td class="table-td-title" colspan="8">施工范围</td>';
    detailedInfo += '</tr>';
    detailedInfo += '<tr>';
    detailedInfo += '<td colspan="8" style="height: 350px;">';
    detailedInfo += '<div id="container"></div>';
    detailedInfo += '</td>';
    detailedInfo += '</tr>';

    $("#tbody").html(detailedInfo);

    var projectLocationList = mapObject.projectMessage.projectLocation;
    var mapCenter;
    if (projectLocationList.length > 1) {
        for (var i = 0; i < projectLocationList.length; i++) {
            mapCenter = new qq.maps.LatLng(projectLocationList[0].latitude, projectLocationList[0].longitude);
        }
    }
    console.log(mapCenter);

    //腾讯地图
    var map = new qq.maps.Map(document.getElementById("container"), {
        center: mapCenter,      // 地图的中心地理坐标。
        zoom: 11                                                 // 地图的中心地理坐标。
    });

    //施工范围
    var path = [];

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
}

/****************js判空方法********************/

function isNull(str) {

    if (!str && typeof(str) == 'undefined') {
        return true
    } else {
        return false
    }
}
