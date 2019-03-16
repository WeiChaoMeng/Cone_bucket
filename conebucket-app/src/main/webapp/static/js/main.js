//工程查询
$('#engineeringQuery').on('click', function () {
    mainMuneColor(this);
    $('#secondaryMenu').html('');
    $('#inlineFrame').attr("src", "/projectQuery.do");
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
    $('#inlineFrame').attr("src", "userManage.do");
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
    $('#inlineFrame').attr("src", "userManage.do");
}

//角色管理
function role(o) {
    secondaryMenuColor(o);
    $('#inlineFrame').attr("src", "roleManage.do");
}

//权限管理
function permissions(o) {
    secondaryMenuColor(o);
    $('#inlineFrame').attr("src", "permissionsManage.do");
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
