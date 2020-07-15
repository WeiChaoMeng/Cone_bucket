//工程查询
$('#engineeringQuery').on('click', function () {
    mainMuneColor(this);
    $('#secondaryMenu').html('');
    $('#inlineFrame').attr("src", "/projectMessage/toProjectQueryIndex.do");
});

//工程管理
$('#engineeringManage').on('click', function () {
    mainMuneColor(this);
    $('#secondaryMenu').html('');
    $('#inlineFrame').attr("src", "/projectMessage/toIndex.do");
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
    $('#inlineFrame').attr("src", "/userInfo/toIndex.do");
});

//设备管理
$('#device').on('click', function () {
    mainMuneColor(this);
    $('#secondaryMenu').html(
        '<div class="secondary-menu-device">' +
        '<div onclick="coneBucketManagement(this)" class="secondary-menu-style-color">锥桶管理</div>' +
        '</div>')
    $('#inlineFrame').attr("src", "/coneBucket/toIndex?page=1");
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
    $('#inlineFrame').attr("src", "/engineeringLog.do");
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
    $('#inlineFrame').attr("src", "/userInfo/toIndex.do");
}

//角色管理
function role(o) {
    secondaryMenuColor(o);
    $('#inlineFrame').attr("src", "/roleInfo/toIndex.do");
}

//权限管理
function permissions(o) {
    secondaryMenuColor(o);
    $('#inlineFrame').attr("src", "/permission/toIndex.do");
}

//参数配置
function parameterConfigure(o) {
    secondaryMenuColor(o);
    $('#inlineFrame').attr("src", "/parameterConfigure.do");
}


/*--------------------------设备管理-----------------------------*/

//锥桶管理
function coneBucketManagement(o) {
    secondaryMenuColor(o);
    $('#inlineFrame').attr("src", "/coneBucketManage.do");
}

/*--------------------------日志管理-----------------------------*/

//工程日志
function engineeringLog(o) {
    secondaryMenuColor(o);
    $('#inlineFrame').attr("src", "/engineeringLog.do");
}

//锥桶日志
function coneBucketLog(o) {
    secondaryMenuColor(o);
    $('#inlineFrame').attr("src", "/getAllConeBucketLog.do");
}

//预警日志
function alertLog(o) {
    secondaryMenuColor(o);
    $('#inlineFrame').attr("src", "/alertLog.do");
}


//二级菜单选中颜色
function secondaryMenuColor(o) {
    $('#secondaryMenu').children('div').children('div').removeClass('secondary-menu-style-color');
    $(o).addClass('secondary-menu-style-color');
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
        title: '工程详情信息',
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
    detailedInfo += '<div id="containers"></div>';
    detailedInfo += '</td>';
    detailedInfo += '</tr>';

    $("#tbody").html(detailedInfo);

    var projectLocationList = mapObject.projectMessage.projectLocation;
    var latitude;
    var longitude;
    if (projectLocationList.length > 1) {
        for (var i = 0; i < projectLocationList.length; i++) {
            longitude = projectLocationList[0].longitude;
            latitude = projectLocationList[0].latitude;
        }
    }

    // window.onload = function () {
        tgisServer.initServer("containers",tgisServer.EnumObject.SceneModeEnum.SCENE2D);
        tgisServer.Event.serverStartFinished = function () {
            //初始化位置（二维）
            tgisServer.centerAndZoom(longitude,latitude,12);

            //施工范围
            var path = [];

            for (var i = 0; i < projectLocationList.length; i++) {
                var config = {
                    iconPath: "../../static/img/marker.png",
                    lon: projectLocationList[i].longitude,
                    lat: projectLocationList[i].latitude,
                    alt: 0
                };
                marker = tgisServer.Entity.Marker.create(config);

                path.push({lon: projectLocationList[i].longitude, lat: projectLocationList[i].latitude, alt: 0});
            }

            //线
            var config2 = {
                id: tgisServer.createGuid(),
                lineWidth: 2,
                lineOpacity: 1,
                lineColor: "#0500ff",
                points: path
            };
            polyline = tgisServer.Entity.Polyline.create(config2);
        };
    // };
}

//添加用户
function addUser() {
    window.lar = layer.open({
        title: '添加用户',
        type: 1,
        area: ['25%', '42%'],
        shadeClose: true, //点击遮罩关闭
        content: $("#addUser"),
        offset: "25%"
    });

    var userInfo = '';
    userInfo += '<div class="model-style">';
    userInfo += '<form id="userInfo">';
    userInfo += '<div class="user-add-div">';
    userInfo += '<label class="user-add-label">用户名</label>';
    userInfo += '<div class="user-add-div-div">';
    userInfo += '<input type="text" id="username" name="username" class="form-control" autocomplete="off" placeholder="支持英文、数字的组合,4-16个字符" maxlength="16">';
    userInfo += '</div>';
    userInfo += '</div>';
    userInfo += '<div class="user-add-div">';
    userInfo += '<label class="user-add-label">密码</label>';
    userInfo += '<div class="user-add-div-div">';
    userInfo += '<input type="text" id="password" name="password" class="form-control" autocomplete="off" placeholder="支持英文、数字的组合,4-16个字符" maxlength="16">';
    userInfo += '</div>';
    userInfo += '</div>';
    userInfo += '<div class="user-add-div">';
    userInfo += '<label class="user-add-label">手机号</label>';
    userInfo += '<div class="user-add-div-div">';
    userInfo += '<input type="text" id="phone" name="phone" class="form-control" autocomplete="off" maxlength="11">';
    userInfo += '</div>';
    userInfo += '</div>';
    userInfo += '<div class="user-add-but-div">';
    userInfo += '<input class="btn btn-primary btn-sm" type="button" onclick="commitUser()" value="提交">';
    userInfo += '</div>';
    userInfo += '</form>';
    userInfo += '</div>';

    $('#addUser').html(userInfo);
}

//提交添加
function commitUser() {
    var username = $('#username').val();
    var password = $('#password').val();
    if (username !== '') {
        if (password !== '') {
            var userInfo = $('#userInfo');
            frame.window.commitAdd(userInfo);
        } else {
            layer.msg("密码不可以为空！");
        }
    } else {
        layer.msg("用户名不可以为空！");
    }
}

//用户详情
function userDetails(map) {
    window.lar = layer.open({
        title: '用户详情',
        type: 1,
        area: ['25%', '42%'],
        shadeClose: true, //点击遮罩关闭
        content: $("#userDetails"),
        offset: "25%"
    });

    var user = '';

    user += '<div style="padding: 30px 15px;font-size: 14px;">';
    user += '<div style="margin-bottom: 15px;">';
    user += '                <label style="line-height: 34px;padding-right: 2%;width: 23%;text-align: right;margin: 0;font-weight: 600;">用户名:</label>';
    user += '                <div style="width: 75%;display: inline-block;">' + map.userInfo.username + '</div>';
    user += '</div>';
    user += '<div style="margin-bottom: 15px;">';
    user += '                <label style="line-height: 34px;padding-right: 2%;width: 23%;text-align: right;margin: 0;font-weight: 600;">密码:</label>';
    user += '                <div style="width: 75%;display: inline-block;">' + map.userInfo.password + '</div>';
    user += '</div>';
    user += '<div style="margin-bottom: 15px;">';
    user += '                <label style="line-height: 34px;padding-right: 2%;width: 23%;text-align: right;margin: 0;font-weight: 600;">手机号:</label>';
    user += '                <div style="width: 75%;display: inline-block;">' + map.userInfo.phone + '</div>';
    user += '</div>';
    user += '<div style="margin-bottom: 15px;">';
    user += '<label style="line-height: 34px;padding-right: 2%;width: 23%;text-align: right;margin: 0;font-weight: 600;">角色信息:</label>';
    if (map.roleInfoList < 1) {
        user += '<div style="width: 75%;display: inline-block;">无</div>';
    } else {
        for (var i = 0; i < map.roleInfoList.length; i++) {
            user += '<div style="display: inline-block;">' + map.roleInfoList[i].roleName + '</div>';
            if (i !== map.roleInfoList.length - 1) {
                user += ' , ';
            }
        }
    }
    user += '</div>';
    user += '</div>';
    $('#userDetails').html(user);
}

//关闭弹窗
function closeWin() {
    layer.close(window.lar);
}

//编辑用户
function userEdit(userInfo) {
    window.lar = layer.open({
        title: '编辑用户',
        type: 1,
        area: ['25%', '42%'],
        shadeClose: true, //点击遮罩关闭
        content: $("#editUser"),
        offset: "25%"
    });
    var user = '';
    user += '<div class="model-style">';
    user += '<form id="userInfoEdit">';
    user += '    <div class="user-add-div">';
    user += '<label class="user-add-label">用户名</label>';
    user += '<div class="user-add-div-div">';
    user += '    <input type="hidden" name="id" value="' + userInfo.id + '">';
    user += '    <input type="text" id="username" name="username" value="' + userInfo.username + '" class="form-control" autocomplete="off" maxlength="16">';
    user += '</div>';
    user += '    </div>';
    user += '    <div class="user-add-div">';
    user += '<label class="user-add-label">密码</label>';
    user += '<div class="user-add-div-div">';
    user += '    <input type="text" id="password" name="password" class="form-control" autocomplete="off" value="' + userInfo.password + '"  maxlength="16">';
    user += '</div>';
    user += '    </div>';
    user += '    <div class="user-add-div">';
    user += '<label class="user-add-label">手机号</label>';
    user += '<div class="user-add-div-div">';
    user += '    <input type="text" id="phone" name="phone" class="form-control" value="' + userInfo.phone + '" autocomplete="off" maxlength="11">';
    user += '</div>';
    user += '    </div>';
    user += '    <div class="user-add-but-div">';
    user += '<input class="btn btn-primary btn-sm" type="button" onclick="commitUserEdit()" value="提交">';
    user += '    </div>';
    user += '</form>';
    user += '</div>';

    $('#editUser').html(user);
}

//提交编辑后的用户
function commitUserEdit() {
    var username = $('#username').val();
    var password = $('#password').val();
    if (username !== '') {
        if (password !== '') {
            var userInfo = $('#userInfoEdit');
            console.log(userInfo);
            frame.window.commitEdit(userInfo);
        } else {
            layer.msg("密码不可以为空！");
        }
    } else {
        layer.msg("用户名不可以为空！");
    }
}

//绑定角色
function bindingRoles(id, roleInfoList) {
    window.lar = layer.open({
        title: '绑定角色',
        type: 1,
        area: ['25%', '42%'],
        shadeClose: true, //点击遮罩关闭
        content: $("#bindingRoles"),
        offset: "25%"
    });

    //所有角色
    var roleList = roleInfoList.roleInfoList;
    //已绑定角色
    var possessRoleList = roleInfoList.possessRoleInfoList;

    var role = '';
    role += '<input type="hidden" id="userId" value="' + id + '">';
    for (var i = 0; i < roleList.length; i++) {
        role += '<tr onclick="checkboxEvent(this)" style="margin-bottom: 5px;height:18px;display: table;">';
        role += '<td class="table-list-td-checkbox" style="padding-right: 20px;">';
        role += '<input type="checkbox" value="' + roleList[i].id + '" onclick="window.event.cancelBubble=true;">';
        role += '</td>';
        role += '<td class="td-border-bottom" style="cursor: pointer;">' + roleList[i].roleName + '</td>';
        role += '</tr>';
    }
    $('#roleBody').html(role);

    for (var j = 0; j < possessRoleList.length; j++) {
        $('#roleBody').children('tr').find('input').each(function () {
            if ($(this).val() == possessRoleList[j].id) {
                this.checked = true;
            }
        });
    }
}

//提交绑定的角色
function commitBindingRoles() {
    var array = [];
    var list = $("#roleBody input:checked");
    for (var i = 0; i < list.length; i++) {
        array.push(list[i].value);
    }

    if (array.length < 1) {
        layer.msg("最少选择一个角色！");
    } else {
        var id = $('#userId').val();

        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/userInfo/bindingRoles.do',
            data: {'id': id, 'array': array},
            traditional: true,
            success: function (data) {
                if (data === "success") {
                    layer.msg("绑定成功！");
                    layer.close(window.lar);
                } else {
                    layer.msg("绑定失败！")
                }
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }
}

//checkbox选中事件
function checkboxEvent(own) {
    var checkbox = $(own).children('td').children('input').prop('checked');
    if (checkbox) {
        $(own).children('td').children('input').prop("checked", false);
    } else {
        $(own).children('td').children('input').prop("checked", true);
    }
}

/**---------------角色管理-------------------*/
//添加角色
function addRole() {
    window.lar = layer.open({
        title: '添加角色',
        type: 1,
        area: ['25%', '42%'],
        shadeClose: true, //点击遮罩关闭
        content: $("#addRole"),
        offset: "25%"
    });

    var roleInfo = '';
    roleInfo += '<div class="model-style">';
    roleInfo += '<form id="roleInfo">';
    roleInfo += '<div class="user-add-div">';
    roleInfo += '<label class="user-add-label">角色名称</label>';
    roleInfo += '<div class="user-add-div-div">';
    roleInfo += '<input type="text" id="roleName" name="roleName" class="form-control" autocomplete="off">';
    roleInfo += '</div>';
    roleInfo += '</div>';
    roleInfo += '<div class="user-add-div">';
    roleInfo += '<label class="user-add-label">角色描述</label>';
    roleInfo += '<div class="user-add-div-div">';
    roleInfo += '<input type="text" id="description" name="description" class="form-control" autocomplete="off">';
    roleInfo += '</div>';
    roleInfo += '</div>';
    roleInfo += '<div class="user-add-but-div">';
    roleInfo += '<input class="btn btn-primary btn-sm" type="button" onclick="commitRole()" value="提交">';
    roleInfo += '</div>';
    roleInfo += '</form>';
    roleInfo += '</div>';

    $('#addRole').html(roleInfo);
}

//提交添加
function commitRole() {
    var roleName = $('#roleName').val();
    if (roleName !== '') {
        var roleInfo = $('#roleInfo');
        frame.window.commitRoleAdd(roleInfo);
    } else {
        layer.msg("角色名称不可以为空！");
    }
}

//编辑角色
function roleEdit(roleInfo) {
    window.lar = layer.open({
        title: '编辑角色',
        type: 1,
        area: ['25%', '42%'],
        shadeClose: true, //点击遮罩关闭
        content: $("#editRole"),
        offset: "25%"
    });
    var role = '';
    role += '<div class="model-style">';
    role += '<form id="roleInfoEdit">';
    role += '    <div class="user-add-div">';
    role += '<label class="user-add-label">角色名称</label>';
    role += '<div class="user-add-div-div">';
    role += '    <input type="hidden" name="id" value="' + roleInfo.id + '">';
    role += '    <input type="text" id="roleName" name="roleName" value="' + roleInfo.roleName + '" class="form-control" autocomplete="off">';
    role += '</div>';
    role += '    </div>';
    role += '    <div class="user-add-div">';
    role += '<label class="user-add-label">角色描述</label>';
    role += '<div class="user-add-div-div">';
    role += '    <input type="text" id="description" name="description" value="' + roleInfo.description + '" class="form-control" autocomplete="off">';
    role += '</div>';
    role += '    </div>';
    role += '    <div class="user-add-but-div">';
    role += '<input class="btn btn-primary btn-sm" type="button" onclick="commitRoleInfoEdit()" value="提交">';
    role += '    </div>';
    role += '</form>';
    role += '</div>';

    $('#editRole').html(role);
}

//提交编辑后的角色
function commitRoleInfoEdit() {
    var roleName = $('#roleName').val();
    if (roleName !== '') {
        var roleInfo = $('#roleInfoEdit');
        frame.window.commitRoleEdit(roleInfo);
    } else {
        layer.msg("角色名不可以为空！");
    }
}

//角色详情
function roleDetails(map) {
    window.lar = layer.open({
        title: '角色详情',
        type: 1,
        area: ['25%', '42%'],
        shadeClose: true, //点击遮罩关闭
        content: $("#roleDetails"),
        offset: "25%"
    });

    var role = '';

    role += '<div style="padding: 30px 15px;font-size: 14px;">';
    role += '<div style="margin-bottom: 15px;">';
    role += '                <label style="line-height: 34px;padding-right: 2%;width: 23%;text-align: right;margin: 0;font-weight: 600;">角色名称:</label>';
    role += '                <div style="width: 75%;display: inline-block;">' + map.roleInfo.roleName + '</div>';
    role += '</div>';
    role += '<div style="margin-bottom: 15px;">';
    role += '                <label style="line-height: 34px;padding-right: 2%;width: 23%;text-align: right;margin: 0;font-weight: 600;">角色描述:</label>';
    role += '                <div style="width: 75%;display: inline-block;">' + map.roleInfo.description + '</div>';
    role += '</div>';
    role += '<div style="margin-bottom: 15px;">';
    role += '<label style="line-height: 34px;padding-right: 2%;width: 23%;text-align: right;margin: 0;font-weight: 600;">权限信息:</label>';
    if (map.permissionList < 1) {
        role += '<div style="width: 75%;display: inline-block;">无</div>';
    } else {
        for (var i = 0; i < map.permissionList.length; i++) {
            role += '<div style="display: inline-block;">' + map.permissionList[i].url + '</div>';
            if (i !== map.permissionList.length - 1) {
                role += ' , ';
            }
        }
    }
    role += '</div>';
    role += '</div>';
    $('#roleDetails').html(role);
}


//绑定权限
function bindingPermission(id, permissionList) {
    window.lar = layer.open({
        title: '绑定权限',
        type: 1,
        area: ['25%', '42%'],
        shadeClose: true, //点击遮罩关闭
        content: $("#bindingPermission"),
        offset: "25%"
    });

    //所有角色
    var perList = permissionList.permissionList;
    //已绑定角色
    var possessPerList = permissionList.possessPermissionList;

    var permission = '';
    permission += '<input type="hidden" id="roleId" value="' + id + '">';
    for (var i = 0; i < perList.length; i++) {
        permission += '<tr onclick="checkboxEvent(this)" style="margin-bottom: 5px;height:18px;display: table;">';
        permission += '<td class="table-list-td-checkbox" style="padding-right: 20px;">';
        permission += '<input type="checkbox" value="' + perList[i].id + '" onclick="window.event.cancelBubble=true;">';
        permission += '</td>';
        permission += '<td class="td-border-bottom" style="cursor: pointer;">' + perList[i].description + '</td>';
        permission += '</tr>';
    }
    $('#permissionBody').html(permission);

    for (var j = 0; j < possessPerList.length; j++) {
        $('#permissionBody').children('tr').find('input').each(function () {
            if ($(this).val() == possessPerList[j].id) {
                this.checked = true;
            }
        });
    }
}

//提交绑定的角色
function commitBindingPermission() {
    var array = [];
    var list = $("#permissionBody input:checked");
    for (var i = 0; i < list.length; i++) {
        array.push(list[i].value);
    }

    if (array.length < 1) {
        layer.msg("最少选择一个权限！");
    } else {
        var id = $('#roleId').val();

        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/roleInfo/bindingPermission.do',
            data: {'id': id, 'array': array},
            traditional: true,
            success: function (data) {
                if (data === "success") {
                    layer.msg("绑定成功！");
                    layer.close(window.lar);
                } else {
                    layer.msg("绑定失败！")
                }
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }
}

//添加锥桶
function addConeBucket() {
    window.lar = layer.open({
        title: '添加锥桶',
        type: 1,
        area: ['390px', '270px'],
        shadeClose: true, //点击遮罩关闭
        content: $("#addConeBucket"),
        offset: "auto"
    });

    var userInfo = '';
    userInfo += '<div class="model-style">';
    userInfo += '<div class="user-add-div">';
    userInfo += '<label class="user-add-label">锥桶编号</label>';
    userInfo += '<div class="user-add-div-div">';
    userInfo += '<input type="text" id="deviceId" class="form-control" autocomplete="off">';
    userInfo += '</div>';
    userInfo += '</div>';
    userInfo += '<div class="user-add-div">';
    userInfo += '<label class="user-add-label">锥桶类型</label>';
    userInfo += '<div class="user-add-div-div">';
    userInfo += '<select class="form-control" id="coneBucketType">';
    userInfo += '<option value="0">内部监管</option>';
    userInfo += '<option value="1">高德平台</option>';
    userInfo += '</select>';
    userInfo += '</div>';
    userInfo += '</div>';
    userInfo += '<div class="user-add-but-div">';
    userInfo += '<input class="btn btn-primary btn-sm" type="button" onclick="commitConeBucketFun()" value="提交">';
    userInfo += '</div>';
    userInfo += '</div>';

    $('#addConeBucket').html(userInfo);
}

//提交添加
function commitConeBucketFun() {
    var deviceId = $('#deviceId').val();
    var coneBucketType = $("#coneBucketType option:selected");
    if (coneBucketType.val() === "1"){
        layer.msg("无高德平台锥桶！");
    } else{
        if (deviceId !== '') {
            frame.window.commitConeBucket(deviceId,coneBucketType.val());
        } else {
            layer.msg("锥桶编号不可以为空！");
        }
    }
}

//删除锥桶
function deleteConeBucket(id) {
    //提示窗
    layer.confirm('确定要删除吗？', {
            btn: ['确认', '取消']
        }, function () {
            $.ajax({
                type: "post",
                url: '/coneBucket/delete',
                data: {'deviceId': id},
                async: false,
                success: function (data) {
                    if (data === 'success') {
                        layer.msg('删除成功！');
                        frame.window.reloadConeBucketPage(1);
                    } else {
                        layer.msg('删除失败！')
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            });
        }
    );
}
/****************js判空方法********************/

function isNull(str) {

    if (!str && typeof(str) == 'undefined') {
        return true
    } else {
        return false
    }
}

//主菜单宽度
$(function () {
    var mainMenuLenght = $('#mainMenu').children('div').length;
    if (mainMenuLenght == 5) {
        $('#mainMenu').children('div').each(function () {
            $(this).width('20%');
        });
    } else if (mainMenuLenght == 4) {
        $('#mainMenu').children('div').each(function () {
            $(this).width('25%');
        });
    }

});