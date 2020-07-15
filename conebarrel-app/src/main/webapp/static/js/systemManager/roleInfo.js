//初始化
$(function () {
    loadData(1);
    loadPage(1);
});

//加载全部数据
function loadData(page) {
    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/roleInfo/index.do',
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
    var roleName = $('#characterName').val();
    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/roleInfo/search.do',
        data: {'page': page, 'roleName': roleName},
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
        obj += '<td colspan="4" style="text-align: center;">' + '暂无数据' + '</td>';
        obj += '</tr>';
    } else {
        for (var i = 0; i < objectInfoList.length; i++) {
            obj += '<tr>';
            obj += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 10 + i + 1) + '</td>';
            obj += '<td class="table-td-content">' + objectInfoList[i].roleName + '</td>';
            obj += '<td class="table-td-content">' + objectInfoList[i].description + '</td>';
            obj += '<td style="text-align: center;padding: 5px 0">';
            obj += '<button class="btn btn-primary btn-sm" onclick="binding(' + objectInfoList[i].id + ')">绑定权限</button>';
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
        title: '添加角色',
        type: 1,
        area: ['25%', '35%'],
        skin: 'layer-ext-yourskin',
        shade: [0.8, '#393D49'],
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
    if ($.trim($("#roleName").val()) !== '') {
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/roleInfo/add.do',
            data: $('#roleInfo').serialize(),
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
        layer.msg("角色名称不可以为空！");
    }
}

//删除角色
function del(id) {
    layer.confirm('确定要删除吗？', {
            skin: 'layer-ext-yourskin',
            btn: ['确认', '取消']
        }, function () {
            $.ajax({
                type: "post",
                url: '/roleInfo/remove.do',
                data: {'id': id},
                success: function (data) {
                    if (data === 'success') {
                        layer.msg("删除角色成功");
                        loadData(1);
                        loadPage(1);
                    } else {
                        layer.msg('删除角色失败！');
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            })
        }
    );
}

//编辑角色
function editor(id) {
    $.ajax({
        type: "post",
        url: '/roleInfo/toEdit.do',
        data: {'id': id},
        success: function (data) {
            var roleInfo = JSON.parse(data);

            window.lar = layer.open({
                title: '编辑角色',
                type: 1,
                area: ['25%', '35%'],
                skin: 'layer-ext-yourskin',
                shade: [0.8, '#393D49'],
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
            role += '    <input type="text" id="roleNameEdit" name="roleName" value="' + roleInfo.roleName + '" class="form-control" autocomplete="off">';
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
        },
        error: function (result) {
            layer.msg("出错！");
        }
    });
}

//提交编辑后的角色
function commitRoleInfoEdit() {
    if ($.trim($("#roleNameEdit").val()) !== '') {
        $.ajax({
            type: "post",
            url: localStorage.getItem("ajaxUrl") + '/roleInfo/edit.do',
            data: $('#roleInfoEdit').serialize(),
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
        layer.msg("角色名不可以为空！");
    }
}

//详情
function details(id) {
    $.ajax({
        type: "post",
        url: '/roleInfo/details.do',
        data: {'id': id},
        success: function (data) {
            var map = JSON.parse(data);

            window.lar = layer.open({
                title: '角色详情',
                type: 1,
                area: ['25%', '35%'],
                skin: 'layer-ext-yourskin',
                shade: [0.8, '#393D49'],
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
        },
        error: function (result) {
            layer.msg("出错！");
        }
    });
}

//绑定角色
function binding(id) {
    $.ajax({
        type: "post",
        url: '/roleInfo/possessPermission.do',
        data: {'id': id},
        success: function (data) {
            var permissionList = JSON.parse(data);

            window.lar = layer.open({
                title: '绑定权限',
                type: 1,
                area: ['25%', '40%'],
                skin: 'layer-ext-yourskin',
                shade: [0.8, '#393D49'],
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
        },
        error: function (result) {
            layer.msg("出错！");
        }
    });
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

//checkbox选中事件
function checkboxEvent(own) {
    var checkbox = $(own).children('td').children('input').prop('checked');
    if (checkbox) {
        $(own).children('td').children('input').prop("checked", false);
    } else {
        $(own).children('td').children('input').prop("checked", true);
    }
}

//关闭弹窗
function closeWin() {
    layer.close(window.lar);
}

