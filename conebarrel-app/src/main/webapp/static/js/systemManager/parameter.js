//初始化
$(function () {
    loadData(1);
    loadPage(1);
});

//加载全部数据
function loadData(page) {
    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/parameter/index.do',
        data: {'page': page},
        async: false,
        success: function (data) {
            var objectInfo = JSON.parse(data);
            //总数
            $("#PageCount").val(objectInfo.total);
            //每页显示条数
            $("#PageSize").val("9");

            //基本数据
            parseResult(objectInfo);
        },
        error: function (result) {
            layer.msg("出错！");
        }
    })
}

//搜索
function search(page) {
    var paramName = $('#parameterName').val();
    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/parameter/search.do',
        data: {'page': page, 'paramName': paramName},
        async: false,
        success: function (data) {
            var objectInfo = JSON.parse(data);
            //总数
            $("#PageCount").val(objectInfo.total);
            //每页显示条数
            $("#PageSize").val("9");

            //基本数据
            parseResult(objectInfo);
            loadPage(2);
        },
        error: function (result) {
            layer.msg("出错！");
        }
    })
}

//解析list
function parseResult(objectInfo) {
    //结果集
    var objectInfoList = objectInfo.list;
    //当前页
    var pageNum = objectInfo.pageNum;
    //插入tbody
    var obj = '';
    if (objectInfoList.length === 0) {
        obj += '<tr>';
        obj += '<td colspan="6" style="text-align: center;">' + '暂无数据' + '</td>';
        obj += '</tr>';
    } else {
        for (var i = 0; i < objectInfoList.length; i++) {
            obj += '<tr>';
            obj += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 10 + i + 1) + '</td>';
            obj += '<td class="table-td-content">' + objectInfoList[i].paramName + '</td>';
            obj += '<td class="table-td-content">' + objectInfoList[i].explanation + '</td>';
            obj += '<td class="table-td-content">' + objectInfoList[i].acquiesce + '</td>';
            obj += '<td class="table-td-content">' + objectInfoList[i].remarks + '</td>';
            obj += '<td style="text-align: center;padding: 5px 0">';
            obj += '<button class="btn btn-primary btn-sm" style="margin-left: 10px" onclick="details(' + objectInfoList[i].id + ')">详细</button>';
            obj += '<button class="btn btn-primary btn-sm" style="margin-left: 10px" onclick="editor(' + objectInfoList[i].id + ')">编辑</button>';
            obj += '<button class="btn btn-primary btn-sm" style="margin-left: 10px" onclick="del(' + objectInfoList[i].id + ')">删除</button>';
            obj += '</td>';
            obj += '</tr>';
        }
    }

    $('#tbody').html(obj);
}

//分页
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

function exeData(page, type, parameter) {
    //全部
    if (parameter === 1) {
        loadData(page);
        loadPage(parameter);

        //搜索
    } else if (parameter === 2) {
        search(page);
        loadPage(parameter);
    }
}

//添加角色
function add() {
    window.lar = layer.open({
        title: '添加参数',
        type: 1,
        area: ['25%', '50%'],
        skin: 'layer-ext-yourskin',
        shade: [0.8, '#393D49'],
        shadeClose: true, //点击遮罩关闭
        content: $("#addParameter"),
        offset: "25%"
    });

    var roleInfo = '';
    roleInfo += '<div class="model-style">';
    roleInfo += '<form id="parameter">';
    roleInfo += '<div class="user-add-div">';
    roleInfo += '<label class="user-add-label">参数名：</label>';
    roleInfo += '<div class="user-add-div-div">';
    roleInfo += '<input type="text" id="paramName" name="paramName" class="form-control" autocomplete="off">';
    roleInfo += '</div>';
    roleInfo += '</div>';
    roleInfo += '<div class="user-add-div">';
    roleInfo += '<label class="user-add-label">说明：</label>';
    roleInfo += '<div class="user-add-div-div">';
    roleInfo += '<input type="text" name="explanation" class="form-control" autocomplete="off">';
    roleInfo += '</div>';
    roleInfo += '</div>';
    roleInfo += '<div class="user-add-div">';
    roleInfo += '<label class="user-add-label">默认值：</label>';
    roleInfo += '<div class="user-add-div-div">';
    roleInfo += '<input type="text" name="acquiesce" class="form-control" autocomplete="off">';
    roleInfo += '</div>';
    roleInfo += '</div>';
    roleInfo += '<div class="user-add-div">';
    roleInfo += '<label class="user-add-label">备注：</label>';
    roleInfo += '<div class="user-add-div-div">';
    roleInfo += '<input type="text" name="remarks" class="form-control" autocomplete="off">';
    roleInfo += '</div>';
    roleInfo += '</div>';
    roleInfo += '<div class="user-add-but-div">';
    roleInfo += '<input class="btn btn-primary btn-sm" type="button" onclick="commitRole()" value="提交">';
    roleInfo += '</div>';
    roleInfo += '</form>';
    roleInfo += '</div>';

    $('#addParameter').html(roleInfo);
}

//提交添加
function commitRole() {
    if ($.trim($("#paramName").val()) !== '') {
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/parameter/add.do',
            data: $('#parameter').serialize(),
            traditional: true,
            success: function (data) {
                if (data === "success") {
                    parent.closeWin();
                    layer.msg("添加成功！");
                    loadData(1);
                    loadPage(1);
                } else {
                    layer.msg("添加失败！")
                }
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    } else {
        layer.msg("参数名不可以为空！");
    }
}

//删除
function del(id) {
    layer.confirm('确定要删除吗？', {
            skin: 'layer-ext-yourskin',
            btn: ['确认', '取消']
        }, function () {
            $.ajax({
                type: "post",
                url: '/parameter/remove.do',
                data: {'id': id},
                success: function (data) {
                    if (data === 'success') {
                        layer.msg("删除参数成功");
                        loadData(1);
                        loadPage(1);
                    } else {
                        layer.msg('删除参数失败！');
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            })
        }
    );
}

//编辑
function editor(id) {
    $.ajax({
        type: "post",
        url: '/parameter/toEdit.do',
        data: {'id': id},
        success: function (data) {
            var parameter = JSON.parse(data);

            window.lar = layer.open({
                title: '编辑参数',
                type: 1,
                area: ['25%', '50%'],
                skin: 'layer-ext-yourskin',
                shade: [0.8, '#393D49'],
                shadeClose: true, //点击遮罩关闭
                content: $("#editParameter"),
                offset: "25%"
            });
            var role = '';
            role += '<div class="model-style">';
            role += '<form id="parameterEdit">';
            role += '    <div class="user-add-div">';
            role += '<label class="user-add-label">角色名：</label>';
            role += '<div class="user-add-div-div">';
            role += '    <input type="hidden" name="id" value="' + parameter.id + '">';
            role += '    <input type="text" id="paramNameEdit" name="paramName" value="' + parameter.paramName + '" class="form-control" autocomplete="off">';
            role += '</div>';
            role += '    </div>';
            role += '    <div class="user-add-div">';
            role += '<label class="user-add-label">说明：</label>';
            role += '<div class="user-add-div-div">';
            role += '    <input type="text" name="explanation" value="' + parameter.explanation + '" class="form-control" autocomplete="off">';
            role += '</div>';
            role += '    </div>';
            role += '    <div class="user-add-div">';
            role += '<label class="user-add-label">默认值：</label>';
            role += '<div class="user-add-div-div">';
            role += '    <input type="text" name="acquiesce" value="' + parameter.acquiesce + '" class="form-control" autocomplete="off">';
            role += '</div>';
            role += '    </div>';
            role += '    <div class="user-add-div">';
            role += '<label class="user-add-label">备注：</label>';
            role += '<div class="user-add-div-div">';
            role += '    <input type="text" name="remarks" value="' + parameter.remarks + '" class="form-control" autocomplete="off">';
            role += '</div>';
            role += '    </div>';
            role += '    <div class="user-add-but-div">';
            role += '<input class="btn btn-primary btn-sm" type="button" onclick="commitRoleInfoEdit()" value="提交">';
            role += '    </div>';
            role += '</form>';
            role += '</div>';

            $('#editParameter').html(role);
        },
        error: function (result) {
            layer.msg("出错！");
        }
    });
}

//提交编辑后的角色
function commitRoleInfoEdit() {
    if ($.trim($("#paramNameEdit").val()) !== '') {
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/parameter/edit.do',
            data: $('#parameterEdit').serialize(),
            traditional: true,
            success: function (data) {
                if (data === "success") {
                    parent.closeWin();
                    layer.msg("修改成功！");
                    loadData(1);
                    loadPage(1);
                } else {
                    layer.msg("修改失败！")
                }
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    } else {
        layer.msg("参数名不可以为空！");
    }
}

//详情
function details(id) {
    $.ajax({
        type: "post",
        url: '/parameter/details.do',
        data: {'id': id},
        success: function (data) {
            var parameter = JSON.parse(data);

            window.lar = layer.open({
                title: '参数详情',
                type: 1,
                area: ['25%', '40%'],
                skin: 'layer-ext-yourskin',
                shade: [0.8, '#393D49'],
                shadeClose: true, //点击遮罩关闭
                content: $("#parameterDetails"),
                offset: "25%"
            });

            var role = '';

            role += '<div style="padding: 30px 15px 0;font-size: 14px;">';
            role += '<div style="margin-bottom: 15px;">';
            role += '<label style="line-height: 34px;padding-right: 2%;width: 23%;text-align: right;margin: 0;font-weight: 600;">参数名：</label>';
            role += '<div style="width: 75%;display: inline-block;">' + parameter.paramName + '</div>';
            role += '</div>';
            role += '<div style="margin-bottom: 15px;">';
            role += '<label style="line-height: 34px;padding-right: 2%;width: 23%;text-align: right;margin: 0;font-weight: 600;">说明：</label>';
            role += '<div style="width: 75%;display: inline-block;">' + parameter.explanation + '</div>';
            role += '</div>';
            role += '<div style="margin-bottom: 15px;">';
            role += '<label style="line-height: 34px;padding-right: 2%;width: 23%;text-align: right;margin: 0;font-weight: 600;">默认值：</label>';
            role += '<div style="width: 75%;display: inline-block;">' + parameter.acquiesce + '</div>';
            role += '</div>';
            role += '<div style="margin-bottom: 15px;">';
            role += '<label style="line-height: 34px;padding-right: 2%;width: 23%;text-align: right;margin: 0;font-weight: 600;">备注：</label>';
            role += '<div style="width: 75%;display: inline-block;">' + parameter.remarks + '</div>';
            role += '</div>';
            role += '</div>';
            $('#parameterDetails').html(role);
        },
        error: function (result) {
            layer.msg("出错！");
        }
    });
}

//关闭弹窗
function closeWin() {
    layer.close(window.lar);
}

