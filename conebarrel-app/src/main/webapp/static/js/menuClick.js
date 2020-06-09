/**
 * Created by xinxinsi on 2017/5/18.D:\intelliJWorkspace\ylt\src\main\webapp\javascript\homePage\menuClick.js
 * 首页菜单响应事件
 */
//本地
// localStorage.setItem('ajaxUrl', 'http://localhost:8080');
// 线上
localStorage.setItem('ajaxUrl', 'http://47.105.114.70:8484');

//初始化加载菜单
$(function () {
    $('#frame').attr("src", "toProjectEnquiry.do");
    // leftMenuClickEvent_ZHZD(null, 'projectEnquiry')
});

//智慧锥桶
function leftMenuClickEvent_ZHZD(obj, menu) {
    //清除以前选中的li，将当前li设置为选中样式
    if (obj) {
        $(".sub-li").find("li.ahover").removeClass("ahover");
        $(obj).addClass("ahover");
    }
    var url = "";
    var data = {};

    if (menu === 'projectEnquiry') {
        url = localStorage.getItem("ajaxUrl") + "/toProjectEnquiry.do";
    } else if (menu === 'projectMessage') {
        url = localStorage.getItem("ajaxUrl") + "/toProjectMessageIndex.do";
    } else if (menu === 'coneBarrelManage') {
        url = localStorage.getItem("ajaxUrl") + "/toConeBarrelManage.do?page=1";
    } else if (menu === 'userInfo') {
        url = localStorage.getItem("ajaxUrl") + "/toUserIndex.do";
    } else if (menu === 'roleInfo') {
        url = localStorage.getItem("ajaxUrl") + "/toRoleIndex.do";
    } else if (menu === 'permissions') {
        url = localStorage.getItem("ajaxUrl") + "/toPermissionsIndex.do";
    } else if (menu === 'parameter') {
        url = localStorage.getItem("ajaxUrl") + "/toParameterIndex.do";
    } else if (menu === 'engineeringLog') {
        url = localStorage.getItem("ajaxUrl") + "/toEngineeringLogIndex.do";
    } else if (menu === 'coneBarrelLog') {
        url = localStorage.getItem("ajaxUrl") + "/toConeBarrelLogIndex.do";
    } else if (menu === 'warningLog') {
        url = localStorage.getItem("ajaxUrl") + "/toWarningLogIndex.do";
    }
    loadUrl(url, data);
}

function loadUrl(url, data) {
    $.ajax({
        type: "POST",
        url: url,
        data: data,
        cache: false,
        dataType: 'html',
        error: function (request) {
            alert("出错了");
        },
        success: function (data) {
            $("#mainFrame").html(data);
        }
    });
}

/*新跳转方法*/
//工程查询
$('#engineeringQuery').on('click',function () {
    $(this).parent('li').addClass("ahover").siblings().removeClass("ahover");
    $('#frame').attr("src", "toProjectEnquiry.do");
});

//工程管理
$('#projectManagement').on('click',function () {
    $(this).parent('li').addClass("ahover").siblings().removeClass("ahover");
    $('#frame').attr("src", "toProjectMessageIndex.do");
});

//锥桶管理
$('#coneBucketManagement').on('click',function () {
    $(this).parent('li').addClass("ahover").siblings().removeClass("ahover");
    $('#frame').attr("src", "toConeBarrelManage.do?page=1");
});


