// $(function () {
//     //进入页面加载所有锥桶列表
//     getAllConeBucket();
// });

//后台查询所有锥桶信息
function getAllConeBucket() {
    $.ajax({
        url: localStorage.getItem("ajaxUrl") + "/coneBarrelManage/getAllConeBarrelManage",
        //几个参数需要注意一下
        type: "get",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        success: function (res) {
            $("#tBo").empty();
            if (res.resCode == 200) {

                var coneBucketList = res.resData;

                for (var i = 0; i < coneBucketList.length; i++) {
                    var id = coneBucketList[i].id;
                    var cone_bucket_num = coneBucketList[i].cone_bucket_num;
                    var create_time = coneBucketList[i].create_time;
                    var type_name = coneBucketList[i].type_name;

                    var html = "<tr>\n" +
                        "<td style='vertical-align: middle;text-align: center;'><input onclick='changeCheckCss(this.id);' id=" + id + " + name='check' + type=\"checkbox\"></td>\n" +
                        "<td style='vertical-align: middle;text-align: center;'>" + id + "</td>\n" +
                        "<td style='text-align: left;vertical-align: middle;'>" + cone_bucket_num + "</td>\n" +
                        "<td style='text-align: left;vertical-align: middle;'>" + type_name + "</td>\n" +
                        "<td style='text-align: left;vertical-align: middle;'>" + create_time + "</td>\n" +
                        "<td style='padding: 5px 0;'>\n" +
                        "<button onclick='getConeBucketlog(this.id)' id=" + cone_bucket_num + " class=\"btn btn-primary btn-sm\">详细\n" +
                        "</button>\n" +
                        "</td>\n" +
                        "</tr>";
                    $("#tBo").append(html);
                }
            } else if (res.resCode == 404) {
                layer.msg("当前无锥桶")
            } else {
                layer.msg("错误！")
            }
        },
        error: function () {
            layer.msg("异常！");
        }
    })
}

//点击时改变checkBox属性
function changeCheckCss(id) {
    if ($("#" + id).is(':checked')) {
        $("#" + id).attr("checked", "checked");
    } else {
        $("#" + id).removeAttr("checked");
    }
}

//点击时全选
function changeAllCheckCss(id) {
    if ($("#" + id).is(':checked')) {
        $("input[name='check']:checkbox").each(function () {
            $(this).attr("checked", "checked");
        })
    } else {
        $("input[name='check']:checkbox").each(function () {
            $(this).removeAttr("checked");
        })
    }
}

//删除事件
function dellectConeBucket() {
    var arrs = new Array();
    $("input[name='check']:checkbox").each(function () {
        if ($(this).attr("checked")) {
            arrs.push($(this).attr("id"));
        }
    });
    if (arrs.length == 0) {
        layer.msg('请选择数据!');
        return;
    } else {
        $.ajax({
            url: localStorage.getItem("ajaxUrl") + "/removeConeBucketById.do",
            //几个参数需要注意一下
            type: "Post",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            traditional: true,//防止深度序列化
            data: {
                "idArray": arrs
            },
            success: function (res) {
                if (res.resCode == 200) {
                    layer.msg("删除成功");
                    getAllConeBucket();
                } else {
                    layer.msg("删除失败")
                }
            },
            error: function () {
                layer.msg("异常！");
            }
        })
    }
}

//条件查询方法
function getConeBucketByCondition() {
    var cbn = $("#coneBucketNum").val();
    var cbt = $("#coneBucketType").val();

    if (isNull(cbn) && isNull(cbn)) {
        layer.msg("请输入查询信息")
        return;
    }

    $.ajax({
        url: localStorage.getItem("ajaxUrl") + "/getConeBucketByCondition.do",
        //几个参数需要注意一下
        type: "Post",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        data: {
            "cbn": cbn,
            "cbt": cbt
        },
        success: function (res) {
            if (res.resCode == 200) {
                $("#tBo").empty();
                var coneBucketList = res.resData;

                for (var i = 0; i < coneBucketList.length; i++) {
                    var id = coneBucketList[i].id;
                    var cone_bucket_num = coneBucketList[i].cone_bucket_num;
                    var create_time = coneBucketList[i].create_time;
                    var type_name = coneBucketList[i].type_name;

                    var html = "<tr>\n" +
                        "<td style='vertical-align: middle;text-align: center;'><input onclick='changeCheckCss(this.id);' id=" + id + " + name='check' + type=\"checkbox\"></td>\n" +
                        "<td style='vertical-align: middle;text-align: center;'>" + id + "</td>\n" +
                        "<td style='text-align: left;vertical-align: middle;'>" + cone_bucket_num + "</td>\n" +
                        "<td style='text-align: left;vertical-align: middle;'>" + type_name + "</td>\n" +
                        "<td style='text-align: left;vertical-align: middle;'>" + create_time + "</td>\n" +
                        "<td style='padding: 5px 0;'>\n" +
                        "<button onclick='getConeBucketlog(this.id)' id=" + cone_bucket_num + " class=\"btn btn-primary btn-sm\">详细\n" +
                        "</button>\n" +
                        "</td>\n" +
                        "</tr>";
                    $("#tBo").append(html);
                }
            } else {
                layer.msg("无锥桶")
            }
        },
        error: function () {
            layer.msg("异常！");
        }
    });
}

function getConeBucketlog(cone_bucket_num) {
    layer.open({
        type: 2,
        title: '日志信息',
        shade: [0.8, '#393D49'],
        shadeClose: true,
        maxmin: true, //开启最大化最小化按钮
        area: ['893px', '500px'],
        content: localStorage.getItem("ajaxUrl") + '/getConeBucketLog.do?coneBucketNum=' + cone_bucket_num
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


/**--------------------新方法----------------------*/
//点击添加方法时弹出
function add() {
    $('#coneBarrelNumbering').val("");
    window.lar = layer.open({
        type: 1,
        title: '新增',
        area: ['360px', '230px'],
        skin: 'layer-ext-yourskin',
        shade: [0.8, '#393D49'],
        shadeClose: false, //点击遮罩关闭
        content: $("#addFrom"),
        offset: "auto",
        success: function () {
            //Enter回车，遮罩无限弹出
            $(':focus').blur();
        }
    });
}

//添加锥桶
function addSubmit() {
    var cbm = $("#coneBarrelNumbering").val();
    var platform = $("#servicePlatform").val();

    if (cbm === "") {
        layer.msg('锥桶编号不能为空');
    } else {
        $.ajax({
            url: localStorage.getItem("ajaxUrl") + "/coneBarrelManage/addConeBarrel",
            type: "POST",
            dataType: "json",
            data: {
                "keyWd": cbm,
                "platform": platform
            },
            success: function (result) {
                if (result.code === "200"){
                    layer.msg(result.msg);
                    layer.close(window.lar);
                } else{
                    layer.msg(result.msg);
                }
            },
            error: function (e) {
                layer.msg("请求出错！");
            }
        })
    }
}

var refreshIntervalId;

$(function () {
    var currentPageNum = $('#currentPage').val();
    //设置当前页
    $('#page').val(currentPageNum);
    loadData(currentPageNum);
    loadPage(1,currentPageNum);

    //定时器-查询锥桶状态
    scheduledTasks();
});

//加载数据
function loadData(page) {
    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/coneBarrelManage/getAllConeBarrelManage',
        data: {'page': page},
        async: false,
        success: function (data) {
            var dataInfoLists = JSON.parse(data);
            //总数
            $("#PageCount").val(dataInfoLists.total);
            //每页显示条数
            $("#PageSize").val("14");
            parseResult(dataInfoLists);
        },
        error: function (result) {
            layer.msg("出错！");
        }
    })
}

//名字搜索
function criteriaQueries(page, parameter) {
    var coneBarrelNum = $('#coneBarrelNum').val();
    var coneBarrelType = $('#coneBarrelType').val();
    console.log("条件查询---" + coneBarrelNum + "----" + coneBarrelType);
    // $.ajax({
    //     type: "post",
    //     url: '/backstageManagement/usernameFilter',
    //     data: {'page': page, 'username': username},
    //     async: false,
    //     success: function (data) {
    //         $('#page').val(1);
    //         var dataInfoLists = JSON.parse(data);
    //         //总数
    //         $("#PageCount").val(dataInfoLists.total);
    //         //每页显示条数
    //         $("#PageSize").val("10");
    //         parseResult(dataInfoLists);
    //         loadPage(parameter);
    //     },
    //     error: function (result) {
    //         layer.msg("出错！");
    //     }
    // })
}

//解析list
function parseResult(dataInfoLists) {
    //结果集
    var dataInfoList = dataInfoLists.list;
    //插入tBody
    var showData = '';
    if (dataInfoList.length === 0) {
        showData += '<tr>';
        showData += '<td colspan="8">' + '暂无数据' + '</td>';
        showData += '</tr>';
    } else {
        for (var i = 0; i < dataInfoList.length; i++) {
            showData += '<tr>';
            showData += '<td>' + dataInfoList[i].deviceId + '</td>';
            if (dataInfoList[i].stateFlag === "1"){
                showData += '<td>稳定有效</td>';
            }else if (dataInfoList[i].stateFlag === "2"){
                showData += '<td>不稳定</td>';
            }else if (dataInfoList[i].stateFlag === "3"){
                showData += '<td>定位无效</td>';
            }else if (dataInfoList[i].stateFlag === "0"){
                showData += '<td>无</td>';
            }
            showData += '<td>' + dataInfoList[i].batteryPowerRemain + '%</td>';
            showData += '<td>' + dataInfoList[i].openTime + '分钟</td>';
            showData += '<td>' + dataInfoList[i].lastReportTime + '</td>';
            if(dataInfoList[i].keyState === "0"){
                showData += '<td>正常通行</td>';
            }else if(dataInfoList[i].keyState === "1"){
                showData += '<td>无法通行</td>';
            }else{
                showData += '<td>无</td>';
            }

            //设备使用状态，0 停用、1 起用
            if(dataInfoList[i].onlineSwitch === "1"){
                var timestamp = (new Date()).getTime();
                //记录更新时间
                var modifiedTime = dataInfoList[i].modifiedTime;
                var resultTime = timestamp - modifiedTime;
                if (resultTime < 600000){
                    showData += '<td><div class="cone-barrel-online">在线</div></td>';
                }else{
                    showData += '<td><div class="cone-barrel-Offline">离线</div></td>';
                }
            }else{
                showData += '<td><div class="cone-barrel-Offline">离线</div></td>';
            }

            if (dataInfoList[i].servicePlatform === "0"){
                showData += '<td>高德平台</td>';
            } else{
                showData += '<td>其他平台</td>';
            }
            showData += '</tr>';
        }
    }
    $('#tBo').html(showData);
}

function exeData(page, type, parameter) {
    var currentPageNumber = $('#page').val();
    //全部
    if (parameter === 1) {
        loadData(page);
        loadPage(parameter,currentPageNumber);

        //条件搜索
    } else if (parameter === 2) {
        criteriaQueries(page);
        loadPage(parameter,currentPageNumber);
    }
}

function loadPage(parameter,currentPageNumber) {
    var myPageCount = parseInt($("#PageCount").val());
    var myPageSize = parseInt($("#PageSize").val());
    var countindex = myPageCount === 0 ? 1 : Math.ceil(myPageCount / myPageSize);
    $("#countindex").val(countindex);

    $.jqPaginator('#pagination', {
        totalPages: parseInt($("#countindex").val()),
        visiblePages: parseInt($("#visiblePages").val()),
        currentPage: currentPageNumber,
        first: '<li class="first"><a href="javascript:;">首页</a></li>',
        prev: '<li class="prev"><a href="javascript:;"><i class="arrow arrow2"></i>上一页</a></li>',
        next: '<li class="next"><a href="javascript:;">下一页<i class="arrow arrow3"></i></a></li>',
        last: '<li class="last"><a href="javascript:;">末页</a></li>',
        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
        onPageChange: function (page, type) {
            if (type == "change") {
                $('#page').val(page);
                exeData(page, type, parameter);
            }
        }
    });
}

/*进入页面-开启定时器*/
function scheduledTasks(){
    refreshIntervalId = window.setInterval(function () {
        console.log("js定时任务");
        var currentPageNumber = $('#page').val();
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/coneBarrelManage/getAllConeBarrelManage',
            data: {'page': currentPageNumber},
            async: false,
            dataType: "json",
            success: function (data) {
                //总数
                $("#PageCount").val(data.total);
                //每页显示条数
                $("#PageSize").val("14");
                parseResult(data);
                loadPage(1,currentPageNumber);
            },
            error: function (e) {
                layer.msg("加载锥桶信息出现错误！");
            }
        })
    },40000);//1000 毫秒= 1 秒
}

/*退出页面-关闭定时器*/
window.onbeforeunload = function (e) {
    window.clearInterval(refreshIntervalId);
};