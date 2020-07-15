//流程图按钮颜色切换
function rectButton(parameter) {
    var page = 1;
    if (parameter === 0) {
        $('#proStatus').val(parameter);
        //施工上报
        constructionReport(page, parameter);
    } else if (parameter === 1) {
        $('#proStatus').val(parameter);
        //内部审批
        industryApproval(page, parameter);
    } else if (parameter === 2) {
        $('#proStatus').val(parameter);
        //工程实施
        projectImplement(page, parameter);
    } else if (parameter === 3) {
        $('#proStatus').val(parameter);
        //施工完成
        completion(page, parameter);
    }
}

/*------------施工上报---------------*/

//施工上报页面
function constructionReport(page, parameter) {
    //工程进度筛选
    $('#proScheduleSelect').css('display', 'none');

    var proName = $("#proName").val();
    var proType = $("#proType").val();
    var proStatus = $("#proStatus").val();
    var proSchedule = '';

    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/projectMessage/notReported.do',
        data: {
            'page': page,
            'proName': proName,
            'proSchedule': proSchedule,
            'proType': proType,
            'proStatus': proStatus
        },
        async: false,
        success: function (data) {
            $('#constructionTab').show();
            $('#tbodyTab').hide();
            $('#implementTab').hide();

            var map = JSON.parse(data);
            $('#constructionSvg').text('施工上报(' + map.notReported + ')条');
            $('#industrySvg').text('内部审批(' + map.industryApprovalNumber + ')条');
            // $('#policeSvg').text('交警确认(' + map.policeConfirmationNumber + ')条');
            $('#implementationSvg').text('工程实施(' + map.projectImplementNumber + ')条');
            $('#completionSvg').text('施工完成(' + map.completed + ')条');

            var ProjectMessages = map.pageInfo;

            //总数
            $("#PageCount").val(ProjectMessages.total);
            //每页显示条数
            $("#PageSize").val("8");

            //基本数据
            //结果集
            var ProjectMessageList = ProjectMessages.list;
            //当前页
            var pageNum = ProjectMessages.pageNum;
            //插入tbody
            var ProjectMessage = '';
            if (ProjectMessageList.length === 0) {
                ProjectMessage += '<tr>';
                ProjectMessage += '<td colspan="8" style="text-align: center;">' + '暂无符合条件的数据' + '</td>';
                ProjectMessage += '</tr>';
            } else {
                for (var i = 0; i < ProjectMessageList.length; i++) {
                    ProjectMessage += '<tr>';
                    // ProjectMessage += '<td><input type="checkbox" value="' + ProjectMessageList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                    ProjectMessage += '<td style="vertical-align: middle;">' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 8 + i + 1) + '</td>';
                    ProjectMessage += '<td style="vertical-align: middle;text-align: left;" title="' + ProjectMessageList[i].proName + '">' + ProjectMessageList[i].proName + '</td>';
                    ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proTypeStr + '</td>';
                    ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proNum + '</td>';
                    ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proStartTimeStr + '</td>';
                    ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proEndTimeStr + '</td>';
                    ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proStatusStr + '</td>';
                    ProjectMessage += '<td style="padding: 5px 0;">';
                    ProjectMessage += '<button class="btn btn-primary btn-sm" style="margin-right: 5px;" onclick="details(' + ProjectMessageList[i].id + ')">详细';
                    ProjectMessage += '</button>';
                    ProjectMessage += '<button class="btn btn-primary btn-sm" style="margin-right: 5px;" onclick="del(' + ProjectMessageList[i].id + ')">删除';
                    ProjectMessage += '</button>';
                    ProjectMessage += '<button class="btn btn-primary btn-sm" style="margin-right: 5px;" onclick="edit(' + ProjectMessageList[i].id + ')">编辑';
                    ProjectMessage += '</button>';
                    ProjectMessage += '<button class="btn btn-primary btn-sm" onclick="report(' + ProjectMessageList[i].id + ')">上报';
                    ProjectMessage += '</button>';
                    ProjectMessage += '</td>';
                    ProjectMessage += '</tr>';
                }
            }

            $('#conTab').html(ProjectMessage);

            loadPage(parameter);
        },
        error: function (result) {
            layer.msg("出错！");
        }
    })
}

//流程-施工上报
function report(id) {
    var status = 1;
    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/projectMessage/projectReport.do',
        data: {'id': id, 'status': status},
        async: false,
        error: function (request) {
            alert("Connection error");
        },
        success: function (data) {
            if (data === "success") {
                layer.msg('上报成功');
                constructionReport(1, 0);
            } else {
                layer.msg('上报失败');
            }
        }
    })
}

/*----------------内部审批-----------------*/

//内部审批页面
function industryApproval(page, parameter) {
    //工程进度筛选
    $('#proScheduleSelect').css('display', 'none');

    var proName = $("#proName").val();
    var proType = $("#proType").val();
    var proStatus = $("#proStatus").val();
    var proSchedule = '';
    var assignee = 'industryApproval';

    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/projectMessage/getTaskByAssignee.do',
        data: {
            'assignee': assignee,
            'page': page,
            'proName': proName,
            'proSchedule': proSchedule,
            'proType': proType,
            'proStatus': proStatus
        },
        async: false,
        success: function (data) {
            $('#tbodyTab').show();
            $('#constructionTab').hide();
            $('#implementTab').hide();

            var map = JSON.parse(data);
            $('#constructionSvg').text('施工上报(' + map.notReported + ')条');
            $('#industrySvg').text('内部审批(' + map.industryApprovalNumber + ')条');
            // $('#policeSvg').text('交警确认(' + map.policeConfirmationNumber + ')条');
            $('#implementationSvg').text('工程实施(' + map.projectImplementNumber + ')条');
            $('#completionSvg').text('施工完成(' + map.completed + ')条');

            var ProjectMessages = map.pageInfo;

            var pro = '';
            if (ProjectMessages == "") {
                pro += '<tr>';
                pro += '<td colspan="8" style="text-align: center;">' + '暂无符合条件的数据' + '</td>';
                pro += '</tr>';
                $("#PageCount").val(0);
                //每页显示条数
                $("#PageSize").val("8");
            } else {
                //总数
                $("#PageCount").val(ProjectMessages.total);
                //每页显示条数
                $("#PageSize").val("8");

                //基本数据
                var ProjectMessageList = ProjectMessages.list;
                //当前页
                var pageNum = ProjectMessages.pageNum;

                if (ProjectMessageList.length < 1) {
                    pro += '<tr>';
                    pro += '<td colspan="8" style="text-align: center;">' + '暂无符合条件的数据' + '</td>';
                    pro += '</tr>';
                } else {
                    for (var i = 0; i < ProjectMessageList.length; i++) {
                        pro += '<tr>';
                        // pro += '<td><input type="checkbox" value="' + ProjectMessageList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                        pro += '<td style="vertical-align: middle;">' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 8 + i + 1) + '</td>';
                        pro += '<td style="vertical-align: middle;text-align: left;" title="' + ProjectMessageList[i].proName + '">' + ProjectMessageList[i].proName + '</td>';
                        pro += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proTypeStr + '</td>';
                        pro += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proNum + '</td>';
                        pro += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proStartTimeStr + '</td>';
                        pro += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proEndTimeStr + '</td>';
                        pro += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proStatusStr + '</td>';
                        pro += '<td style="padding: 5px 0;">';
                        pro += '<button class="btn btn-primary btn-sm" style="margin-right: 5px;" onclick="details(' + ProjectMessageList[i].id + ')">详细</button>';
                        pro += '<button class="btn btn-primary btn-sm" onclick="industryPerform(' + ProjectMessageList[i].taskId + ',' + ProjectMessageList[i].id + ')">通过</button>';
                        pro += '</td>';
                        pro += '</tr>';
                    }
                }
            }

            $('#tbody').html(pro);
            loadPage(parameter);
        },
        error: function (result) {
            layer.msg("出错！");
        }
    })
}

//流程-内部审批通过处理
function industryPerform(taskId, id) {
    var status = 2;
    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/projectMessage/industryPerform.do',
        data: {'taskId': taskId, 'id': id, 'status': status},
        error: function (request) {
            alert("Connection error");
        },
        success: function (data) {
            if (data === "success") {
                layer.msg('处理成功');
                industryApproval(1, 1);
            } else {
                layer.msg('处理失败');
            }
        }
    })
}

/*---------------交警确认--------------------*/

//交警确认页面
function policeConfirm(page, parameter) {
    //工程进度筛选
    $('#proScheduleSelect').css('display', 'none');

    var proName = $("#proName").val();
    var proType = $("#proType").val();
    var proStatus = $("#proStatus").val();
    var proSchedule = '';
    var assignee = 'policeConfirmation';

    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/projectMessage/getTaskByAssignee.do',
        data: {
            'assignee': assignee,
            'page': page,
            'proName': proName,
            'proSchedule': proSchedule,
            'proType': proType,
            'proStatus': proStatus
        },
        async: false,
        success: function (data) {
            $('#tbodyTab').show();
            $('#constructionTab').hide();
            $('#implementTab').hide();

            var map = JSON.parse(data);
            $('#constructionSvg').text('施工上报(' + map.notReported + ')条');
            $('#industrySvg').text('内部审批(' + map.industryApprovalNumber + ')条');
            // $('#policeSvg').text('交警确认(' + map.policeConfirmationNumber + ')条');
            $('#implementationSvg').text('工程实施(' + map.projectImplementNumber + ')条');
            $('#completionSvg').text('施工完成(' + map.completed + ')条');

            var ProjectMessages = map.pageInfo;

            //插入tbody
            var ProjectMessage = '';
            if (ProjectMessages == "") {
                ProjectMessage += '<tr>';
                ProjectMessage += '<td colspan="8" style="text-align: center;">' + '暂无符合条件的数据' + '</td>';
                ProjectMessage += '</tr>';
                $("#PageCount").val(0);
                //每页显示条数
                $("#PageSize").val("8");
            } else {
                //总数
                $("#PageCount").val(ProjectMessages.total);
                //每页显示条数
                $("#PageSize").val("8");

                //审批处理
                //基本数据
                var ProjectMessageList = ProjectMessages.list;
                //当前页
                var pageNum = ProjectMessages.pageNum;

                if (ProjectMessageList.length < 1) {
                    ProjectMessage += '<tr>';
                    ProjectMessage += '<td colspan="8" style="text-align: center;">' + '暂无符合条件的数据' + '</td>';
                    ProjectMessage += '</tr>';
                } else {
                    for (var i = 0; i < ProjectMessageList.length; i++) {
                        ProjectMessage += '<tr>';
                        // ProjectMessage += '<td><input type="checkbox" value="' + ProjectMessageList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 8 + i + 1) + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;text-align: left;" title="' + ProjectMessageList[i].proName + '">' + ProjectMessageList[i].proName + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;"style="vertical-align: middle;">' + ProjectMessageList[i].proTypeStr + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proNum + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proStartTimeStr + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proEndTimeStr + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proStatusStr + '</td>';
                        ProjectMessage += '<td style="padding: 5px 0;">';
                        ProjectMessage += '<button class="btn btn-primary btn-sm" style="margin-right: 5px;" onclick="details(' + ProjectMessageList[i].id + ')">详细</button>';
                        ProjectMessage += '<button class="btn btn-primary btn-sm" onclick="policePerform(' + ProjectMessageList[i].taskId + ',' + ProjectMessageList[i].id + ')">通过</button>';
                        ProjectMessage += '</td>';
                        ProjectMessage += '</tr>';
                    }
                }
            }

            $('#tbody').html(ProjectMessage);
            loadPage(parameter);
        },
        error: function (result) {
            layer.msg("出错！");
        }
    })
}

//流程-交警审批通过处理
function policePerform(taskId, id) {
    var status = 3;
    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/projectMessage/policePerform.do',
        data: {'taskId': taskId, 'id': id, 'status': status},
        async: false,
        error: function (request) {
            alert("Connection error");
        },
        success: function (data) {
            if (data === "success") {
                layer.msg('处理成功');
                policeConfirm(1, 2);
            } else {
                layer.msg('处理失败');
            }
        }
    })
}

/*-----------------工程实施------------------*/
function projectImplement(page, parameter) {
    //工程进度筛选
    $('#proScheduleSelect').css('display', 'block');

    var proName = $("#proName").val();
    var proSchedule = $("#proSchedule").val();
    var proType = $("#proType").val();
    var proStatus = $("#proStatus").val();
    var assignee = 'projectImplementation';

    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/projectMessage/getTaskByAssignee.do',
        data: {
            'assignee': assignee,
            'page': page,
            'proName': proName,
            'proSchedule': proSchedule,
            'proType': proType,
            'proStatus': proStatus
        },
        async: false,
        success: function (data) {
            $('#implementTab').show();
            $('#constructionTab').hide();
            $('#tbodyTab').hide();

            var map = JSON.parse(data);
            $('#constructionSvg').text('施工上报(' + map.notReported + ')条');
            $('#industrySvg').text('内部审批(' + map.industryApprovalNumber + ')条');
            // $('#policeSvg').text('交警确认(' + map.policeConfirmationNumber + ')条');
            $('#implementationSvg').text('工程实施(' + map.projectImplementNumber + ')条');
            $('#completionSvg').text('施工完成(' + map.completed + ')条');

            var ProjectMessages = map.pageInfo;

            //插入tbody
            var ProjectMessage = '';
            if (ProjectMessages == "") {
                ProjectMessage += '<tr>';
                ProjectMessage += '<td colspan="9" style="text-align: center;">' + '暂无符合条件的数据' + '</td>';
                ProjectMessage += '</tr>';
                $("#PageCount").val(0);
                //每页显示条数
                $("#PageSize").val("8");
            } else {
                //总数
                $("#PageCount").val(ProjectMessages.total);
                //每页显示条数
                $("#PageSize").val("8");

                //基本数据
                var ProjectMessageList = ProjectMessages.list;
                //当前页
                var pageNum = ProjectMessages.pageNum;

                if (ProjectMessageList.length < 1) {
                    ProjectMessage += '<tr>';
                    ProjectMessage += '<td colspan="9" style="text-align: center;">' + '暂无符合条件的数据' + '</td>';
                    ProjectMessage += '</tr>';
                } else {
                    for (var i = 0; i < ProjectMessageList.length; i++) {
                        ProjectMessage += '<tr>';
                        // ProjectMessage += '<td><input type="checkbox" value="' + ProjectMessageList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 8 + i + 1) + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;text-align: left;" title="' + ProjectMessageList[i].proName + '">' + ProjectMessageList[i].proName + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proTypeStr + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proNum + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proStartTimeStr + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proEndTimeStr + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proStatusStr + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proScheduleStr + '</td>';
                        ProjectMessage += '<td style="padding: 5px 0;">';
                        ProjectMessage += '<button class="btn btn-primary btn-sm" style="margin-right: 5px;" onclick="details(' + ProjectMessageList[i].id + ')">详细';
                        ProjectMessage += '</button>';
                        if (ProjectMessageList[i].proScheduleStr === "未进场") {
                            ProjectMessage += '<button class="btn btn-primary btn-sm" onclick="startWork(' + ProjectMessageList[i].id + ')">进场</button>';
                        } else {
                            ProjectMessage += '<button class="btn btn-primary btn-sm" onclick="implementPerform(' + ProjectMessageList[i].taskId + ',' + ProjectMessageList[i].id + ')">完工';
                        }
                        ProjectMessage += '</button>';
                        ProjectMessage += '</td>';
                        ProjectMessage += '</tr>';
                    }
                }
            }

            $('#implement').html(ProjectMessage);
            loadPage(parameter);
        },
        error: function (result) {
            layer.msg("出错！");
        }
    })
}

//进场
function startWork(id) {
    var schedule = 1;
    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/projectMessage/startWork.do',
        data: {'id': id, 'schedule': schedule},
        async: false,
        error: function (request) {
            alert("Connection error");
        },
        success: function (data) {
            if (data === "success") {
                layer.msg('处理成功');
                projectImplement(1, 3);
            } else {
                layer.msg('处理失败');
            }
        }
    })
}

//流程-工程实施完工
function implementPerform(taskId, id) {
    var schedule = 2;
    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/projectMessage/implementationPerform.do',
        data: {'taskId': taskId, 'id': id, 'schedule': schedule},
        async: false,
        error: function (request) {
            alert("Connection error");
        },
        success: function (data) {
            if (data === "success") {
                layer.msg('处理成功');
                projectImplement(1, 3);
            } else {
                layer.msg('处理失败');
            }
        }
    })
}

/*-----------------施工完成------------------*/

//施工完成 页面
function completion(page, parameter) {
    //工程进度筛选
    $('#proScheduleSelect').css('display', 'none');

    var proName = $("#proName").val();
    var proType = $("#proType").val();
    var proSchedule = 2;
    var proStatus = 2;

    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/projectMessage/completion.do',
        data: {
            'page': page,
            'proName': proName,
            'proSchedule': proSchedule,
            'proType': proType,
            'proStatus': proStatus
        },
        async: false,
        success: function (data) {
            $('#implementTab').show();
            $('#constructionTab').hide();
            $('#tbodyTab').hide();

            var map = JSON.parse(data);
            $('#constructionSvg').text('施工上报(' + map.notReported + ')条');
            $('#industrySvg').text('内部审批(' + map.industryApprovalNumber + ')条');
            // $('#policeSvg').text('交警确认(' + map.policeConfirmationNumber + ')条');
            $('#implementationSvg').text('工程实施(' + map.projectImplementNumber + ')条');
            $('#completionSvg').text('施工完成(' + map.completed + ')条');

            var ProjectMessages = map.pageInfo;

            var ProjectMessage = '';
            if (ProjectMessages == "") {
                ProjectMessage += '<tr>';
                ProjectMessage += '<td colspan="9" style="text-align: center;">' + '暂无符合条件的数据' + '</td>';
                ProjectMessage += '</tr>';
                $("#PageCount").val(0);
                //每页显示条数
                $("#PageSize").val("8");
            } else {
                //总数
                $("#PageCount").val(ProjectMessages.total);
                //每页显示条数
                $("#PageSize").val("8");

                //结果集
                var ProjectMessageList = ProjectMessages.list;
                //当前页
                var pageNum = ProjectMessages.pageNum;

                if (ProjectMessageList.length < 1) {
                    ProjectMessage += '<tr>';
                    ProjectMessage += '<td colspan="9" style="text-align: center;">' + '暂无符合条件的数据' + '</td>';
                    ProjectMessage += '</tr>';
                } else {
                    for (var i = 0; i < ProjectMessageList.length; i++) {
                        ProjectMessage += '<tr>';
                        // ProjectMessage += '<td><input type="checkbox" value="' + ProjectMessageList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 8 + i + 1) + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;text-align: left;" title="' + ProjectMessageList[i].proName + '">' + ProjectMessageList[i].proName + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proTypeStr + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proNum + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proStartTimeStr + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proEndTimeStr + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proStatusStr + '</td>';
                        ProjectMessage += '<td style="vertical-align: middle;">' + ProjectMessageList[i].proScheduleStr + '</td>';
                        ProjectMessage += '<td style="padding: 5px 0;">';
                        ProjectMessage += '<button class="btn btn-primary btn-sm" onclick="details(' + ProjectMessageList[i].id + ')">详细';
                        ProjectMessage += '</button>';
                        ProjectMessage += '</td>';
                        ProjectMessage += '</tr>';
                    }
                }
            }

            $('#implement').html(ProjectMessage);

            loadPage(parameter);
        },
        error: function (result) {
            layer.msg("出错！");
        }
    })
}

//分页
function exeData(page, type, parameter) {
    //施工上报
    if (parameter === 0) {
        constructionReport(page);

        //内部审批
    } else if (parameter === 1) {
        industryApproval(page);

        //工程实施
    } else if (parameter === 2) {
        projectImplement(page);

        //施工完成
    } else if (parameter === 3) {
        completion(page);
    }

}

//加载页面
function loadPage(parameter) {
    var myPageCount = parseInt($("#PageCount").val());
    var myPageSize = parseInt($("#PageSize").val());
    var totalPageNum = myPageCount === 0 ? 1 : Math.ceil(myPageCount / myPageSize);
    $("#countindex").val(totalPageNum);

    $.jqPaginator('#pagination', {
        totalPages: parseInt($("#countindex").val()),
        visiblePages: parseInt($("#visiblePages").val()),
        currentPage: 1,
        first: '<li class="first"><a href="javascript:;">首页</a></li>',
        prev: '<li class="prev"><a href="javascript:;"><i class="arrow arrow2"></i>上一页</a></li>',
        next: '<li class="next"><a href="javascript:;">下一页<i class="arrow arrow3"></i></a></li>',
        last: '<li class="last"><a href="javascript:;">末页</a></li>',
        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
        onPageChange: function (page, type) {
            if (type == "change") {
                exeData(page, type, parameter);
            }
        }
    });
}

//添加
function add() {
    // var url = localStorage.getItem("ajaxUrl") + "/projectMessage/toAdd.do";
    // loadUrl(url);
    window.location.href = localStorage.getItem("ajaxUrl") + "/projectMessage/toAdd.do";
}

//删除
function del(id) {
    layer.confirm('确定要删除吗？', {
            skin: 'layer-ext-yourskin',
            btn: ['确认', '取消']
        }, function () {
            $.ajax({
                type: 'post',
                url: localStorage.getItem("ajaxUrl") + '/projectMessage/remove.do',
                data: {'id': id},
                error: function () {
                    layer.msg("Connection error");
                },
                success: function (result) {
                    if (result === 'success') {
                        layer.msg('删除成功!');
                        constructionReport(1, 0);
                    } else {
                        layer.msg('删除失败!');
                    }
                }
            });
        }
    );
}


//修改
function edit(id) {
    // var url = localStorage.getItem("ajaxUrl") + "/projectMessage/toEdit.do?id=" + id;
    // var data = {"id": id};
    // loadUrl(url, data);
    window.location.href = localStorage.getItem("ajaxUrl") + "/projectMessage/toEdit.do?id=" + id;
    //
    // var length = $("tbody input:checked").length;
    // if (length != 1) {
    //     layer.msg('请选择一条数据!');
    //     return false;
    // } else {
    //     var id = $("tbody input:checked").val();
    //     window.location.href = localStorage.getItem("ajaxUrl") + "/projectMessage/toEdit.do?id=" + id;
    // }
}

//条件查询方法
function getProMessageByCondition() {
    var proStatus = $("#proStatus").val();

    if (proStatus == 0) {

        //施工上报
        constructionReport(1, 0);
    } else if (proStatus == 1) {

        //内部审批
        industryApproval(1, 1);
    } else if (proStatus == 2) {

        //工程实施
        projectImplement(1, 2);
    } else if (proStatus == 3) {

        //施工完成
        completion(1, 3);
    }
}

//工程详情信息
function details(id) {
    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/projectMessage/details.do',
        data: {'id': id},
        async: false,
        success: function (data) {
            var projectMessage = JSON.parse(data);
            // parent.projectDetailed(mapObject);
            window.lar = layer.open({
                title: '工程详情信息',
                type: 1,
                area: ['95%', '90%'],
                skin: 'layer-ext-yourskin',
                shade: [0.8, '#393D49'],
                shadeClose: true, //点击遮罩关闭
                content: $("#projectDetailed"),
                offset: "5%"
            });

            var detailedInfo = "";
            detailedInfo += '<tr>';
            detailedInfo += '<td style="background: #052846;">工程名称</td>';
            detailedInfo += '<td class="table-td-content" style="background: #011f39;" colspan="5">' + projectMessage.proName + '</td>';
            detailedInfo += '<td style="width: 10%;background: #052846;">工程类型</td>';
            detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.proTypeStr + '</td>';
            detailedInfo += '</tr>';
            detailedInfo += '<tr>';
            detailedInfo += '<td style="background: #052846;">工程概述</td>';
            detailedInfo += '<td class="table-td-content" style="background: #011f39;" colspan="7">' + projectMessage.proSummarize + '</td>';
            detailedInfo += '</tr>';
            detailedInfo += '<tr>';
            detailedInfo += '<td style="width: 10%;background: #052846;">开始时间</td>';
            detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.proStartTimeStr + '</td>';
            detailedInfo += '<td style="width: 10%;background: #052846;">结束时间</td>';
            detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.proEndTimeStr + '</td>';
            detailedInfo += '<td style="width: 10%;background: #052846;">主管单位</td>';
            detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.governorUnit + '</td>';
            detailedInfo += '<td style="width: 10%;background: #052846;">联系方式</td>';
            detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.governorUnitPhone + '</td>';
            detailedInfo += '</tr>';
            detailedInfo += '<tr>';
            detailedInfo += '<td style="background: #052846;">施工单位</td>';
            detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.constructionUnit + '</td>';
            detailedInfo += '<td style="background: #052846;">联系方式</td>';
            detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.constructionUnitPhone + '</td>';
            detailedInfo += '<td style="background: #052846;">监理单位</td>';
            detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.constructionUnit + '</td>';
            detailedInfo += '<td style="background: #052846;">联系方式</td>';
            detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.supervisorUnitPhone + '</td>';
            detailedInfo += '</tr>';
            detailedInfo += '<tr>';
            detailedInfo += '<td style="background: #052846;">工程位置</td>';
            detailedInfo += '<td class="table-td-content" style="background: #011f39;" colspan="7">' + projectMessage.proLocation + '</td>';
            detailedInfo += '</tr>';
            detailedInfo += '<tr>';

            //锥桶信息
            detailedInfo += '<td style="background: #052846;">锥桶类型</td>';
            detailedInfo += '<td class="table-td-content" style="background: #011f39;" id="coneBucketTypeStr">';

            //锥桶管理
            var coneBarrelManageList = projectMessage.coneBarrelManages;
            if (coneBarrelManageList.length < 1) {
                detailedInfo += '无';
            } else {
                detailedInfo += coneBarrelManageList[0].servicePlatform;
            }
            detailedInfo += '</td>';
            detailedInfo += '<td style="background: #052846;">锥桶编号</td>';
            detailedInfo += '<td class="table-td-content" style="background: #011f39;" id="coneBucketNum">';

            if (coneBarrelManageList.length < 1) {
                detailedInfo += '无';
            } else {
                for (var i = 0; i < coneBarrelManageList.length; i++) {
                    detailedInfo += coneBarrelManageList[i].deviceId;
                    if (coneBarrelManageList.length - 1 !== i) {
                        detailedInfo += ",";
                    }
                }
            }
            detailedInfo += '</td>';
            detailedInfo += '<td style="background: #052846;">工程状态</td>';
            detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.proStatusStr + '</td>';
            detailedInfo += '<td style="background: #052846;">工程进度</td>';
            detailedInfo += '<td class="table-td-content" style="background: #011f39;">' + projectMessage.proScheduleStr + '</td>';
            detailedInfo += '</tr>';
            detailedInfo += '<tr>';
            detailedInfo += '<td class="table-td-title" style="background: #011f39;" colspan="8">施工范围</td>';
            detailedInfo += '</tr>';
            detailedInfo += '<tr>';
            detailedInfo += '<td colspan="8" style="height: 350px;">';
            detailedInfo += '<div id="containersDetails"></div>';
            detailedInfo += '</td>';
            detailedInfo += '</tr>';

            $("#tbo").html(detailedInfo);

            var projectLocationList = projectMessage.projectLocation;
            var latitude;
            var longitude;
            if (projectLocationList.length > 1) {
                for (var i = 0; i < projectLocationList.length; i++) {
                    longitude = projectLocationList[0].longitude;
                    latitude = projectLocationList[0].latitude;
                }
            }

            tgisServer.initServer("containersDetails", tgisServer.EnumObject.SceneModeEnum.SCENE2D,3);
            tgisServer.Event.serverStartFinished = function () {

                //关闭状态栏和导航栏
                tgisServer.Component.Navigation.visibility = false;
                tgisServer.Component.CenterInfoBar.visibility = false;

                //初始化位置（二维）
                tgisServer.centerAndZoom(longitude, latitude, 12);

                //先加载的路线层级靠上
                //1-锥桶位置信息
                var coneBarrelPath = [];

                //工程中锥桶
                //0.未进场,1.施工中,2已完工
                if (projectMessage.proSchedule === 1) {
                    for (var i = 0; i < coneBarrelManageList.length; i++) {
                        //设备使用状态，0 停用、1 起用
                        if (coneBarrelManageList[i].onlineSwitch === "1"){
                            var timestamp = (new Date()).getTime();
                            var modifiedTime = coneBarrelManageList[i].modifiedTime;
                            var resultTime = timestamp - modifiedTime;
                            if (resultTime < 600000){

                                var deviceId = coneBarrelManageList[i].deviceId;
                                deviceId = {
                                    iconPath: "../../../static/img/mark/marker-"+deviceId.substring(deviceId.length -2)+".png",
                                    lon: (coneBarrelManageList[i].lng  / 1000000),
                                    lat: (coneBarrelManageList[i].lat / 1000000),
                                    alt: 30
                                };

                                tgisServer.Entity.Marker.create(deviceId);
                                coneBarrelPath.push({lon:(coneBarrelManageList[i].lng  / 1000000), lat:(coneBarrelManageList[i].lat / 1000000), alt: 0});
                            }
                        }
                    }

                    //渲染锥桶线路
                    if (coneBarrelPath.length >= 2){
                        //线
                        var config3 = {
                            id: tgisServer.createGuid(),
                            lineWidth: 2,
                            lineOpacity: 1,
                            lineColor: "#0cff04",
                            points: coneBarrelPath
                        };
                        tgisServer.Entity.Polyline.create(config3);
                    }
                }

                //2-施工范围
                var pathDetails = [];

                for (var i = 0; i < projectLocationList.length; i++) {
                    var config = {
                        iconPath: "../../static/img/marker.png",
                        lon: projectLocationList[i].longitude,
                        lat: projectLocationList[i].latitude,
                        alt: 0
                    };
                    marker = tgisServer.Entity.Marker.create(config);

                    pathDetails.push({lon: projectLocationList[i].longitude, lat: projectLocationList[i].latitude, alt: 0});
                }

                //渲染施工路线
                var config2 = {
                    id: tgisServer.createGuid(),
                    lineWidth: 4,
                    lineOpacity: 1,
                    lineColor: "#0500ff",
                    points: pathDetails
                };
                tgisServer.Entity.Polyline.create(config2);
            };
        },
        error: function (result) {
            layer.msg("出错！");
        }
    });

}

//重新加载页面
function reload() {
    $('#tbody').html("");
    $('#implement').html("");
    setTimeout(function () {
        var proStatus = $("#proStatus").val();

        if (proStatus == 0) {

            //施工上报
            constructionReport(1, 0);
        } else if (proStatus == 1) {

            //内部审批
            industryApproval(1, 1);
        } else if (proStatus == 2) {

            //工程实施
            projectImplement(1, 2);
        } else if (proStatus == 3) {

            //施工完成
            completion(1, 3);
        }
    }, 100)
}

/*function reload() {}*/

//初始化工程管理页面
$(function () {
    constructionReport(1, 0);
});
