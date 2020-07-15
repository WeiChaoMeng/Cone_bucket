// //设置当前页
// var currentPageNum = JSON.parse('${currentPage}');

//初始化
$(function () {
    // var currentPageNum = $('#page').val();
    //设置当前页
    loadData(1);
    loadPage(1);
});

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

//加载数据
function loadData(page) {
    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/userInfo/index.do',
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
        obj += '<td colspan="5" style="text-align: center;">' + '暂无数据' + '</td>';
        obj += '</tr>';
    } else {
        for (var i = 0; i < objectInfoList.length; i++) {
            obj += '<tr>';
            obj += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 10 + i + 1) + '</td>';
            obj += '<td class="table-td-content">' + objectInfoList[i].username + '</td>';
            obj += '<td class="table-td-content">' + objectInfoList[i].phone + '</td>';
            obj += '<td style="text-align: center;padding: 5px 0">';
            obj += '<button class="btn btn-primary btn-sm" onclick="binding(' + objectInfoList[i].id + ')">绑定角色</button>';
            obj += '<button class="btn btn-primary btn-sm" style="margin-left: 10px" onclick="details(' + objectInfoList[i].id + ')">详细</button>';
            obj += '<button class="btn btn-primary btn-sm" style="margin-left: 10px" onclick="editor(' + objectInfoList[i].id + ')">编辑</button>';
            obj += '<button class="btn btn-primary btn-sm" style="margin-left: 10px" onclick="del(' + objectInfoList[i].id + ')">删除</button>';
            obj += '</td>';
            obj += '</tr>';
        }
    }

    $('#tbody').html(obj);
}

//搜索
function search(page) {
    var userName = $('#name').val();
    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/userInfo/search.do',
        data: {'page': page, 'userName': userName},
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
                // $('#page').val(page);
                exeData(page, type, parameter);
            }
        }
    });
}

//添加用户
// function add() {
//     parent.addUsernew();
// }
//添加用户
function add() {
    window.lar = layer.open({
        title: '添加用户',
        type: 1,
        area: ['25%', '40%'],
        skin: 'layer-ext-yourskin',
        shade: [0.8, '#393D49'],
        shadeClose: true, //点击遮罩关闭
        content: $("#addUser"),
        offset: "25%"
    });

    var userInfo = '';
    userInfo += '<div class="model-style">';
    userInfo += '<form id="userInfo">';
    userInfo += '<div class="user-add-div">';
    userInfo += '<label class="user-add-label">用户名：</label>';
    userInfo += '<div class="user-add-div-div">';
    userInfo += '<input type="text" id="username" name="username" class="form-control" autocomplete="off" placeholder="支持英文、数字的组合,4-16个字符" maxlength="16">';
    userInfo += '</div>';
    userInfo += '</div>';
    userInfo += '<div class="user-add-div">';
    userInfo += '<label class="user-add-label">密码：</label>';
    userInfo += '<div class="user-add-div-div">';
    userInfo += '<input type="text" id="password" name="password" class="form-control" autocomplete="off" placeholder="支持英文、数字的组合,4-16个字符" maxlength="16">';
    userInfo += '</div>';
    userInfo += '</div>';
    userInfo += '<div class="user-add-div">';
    userInfo += '<label class="user-add-label">手机号：</label>';
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
    // var username = $('#username').val();
    // var password = $('#password').val();
    // $.trim($("#title").val()) === ''
    if ($.trim($("#username").val()) !== '') {
        if ($.trim($("#password").val()) !== '') {
            // var userInfo = $('#userInfo');
            // frame.window.commitAdd(userInfo);
            $.ajax({
                type: "post",
                url: localStorage.getItem("ajaxUrl") + '/userInfo/add.do',
                data: $('#userInfo').serialize(),
                success: function (data) {
                    if (data === "success") {
                        closeWin();
                        layer.msg("添加成功！");
                        loadData(1);
                        loadPage(1);
                        // window.location.href = localStorage.getItem("ajaxUrl") + "/toUserIndex.do?page=" + $('#page').val();
                    } else {
                        layer.msg("添加失败！")
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            })
        } else {
            layer.msg("密码不可以为空！");
        }
    } else {
        layer.msg("用户名不可以为空！");
    }
}

//提交添加用户
// function commitAdd(userInfo) {
//     $.ajax({
//         type: "post",
//         url: localStorage.getItem("ajaxUrl") + '/userInfo/add.do',
//         data: userInfo.serialize(),
//         traditional: true,
//         success: function (data) {
//             if (data === "success") {
//                 parent.closeWin();
//                 layer.msg("添加成功！");
//                 loadData(1);
//             } else {
//                 layer.msg("添加失败！")
//             }
//         },
//         error: function (result) {
//             layer.msg("出错！");
//         }
//     })
// }

//删除用户
function del(id) {
    layer.confirm('确定要删除吗？', {
            skin: 'layer-ext-yourskin',
            btn: ['确认', '取消']
        }, function () {
            $.ajax({
                type: "post",
                url: '/userInfo/remove.do',
                data: {'id': id},
                async: false,
                success: function (data) {
                    if (data === 'success') {
                        layer.msg("删除用户成功");
                        loadData(1);
                        loadPage(1);
                    } else {
                        layer.msg('删除用户失败！');
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            })
        }
    );
}


//编辑用户
function editor(id) {
    $.ajax({
        type: "post",
        url: '/userInfo/toEdit.do',
        data: {'id': id},
        success: function (data) {
            var userInfo = JSON.parse(data);
            // parent.userEdit(userInfo);
            window.lar = layer.open({
                title: '编辑用户',
                type: 1,
                area: ['25%', '40%'],
                skin: 'layer-ext-yourskin',
                shade: [0.8, '#393D49'],
                shadeClose: true, //点击遮罩关闭
                content: $("#editUser"),
                offset: "25%"
            });
            var user = '';
            user += '<div class="model-style">';
            user += '<form id="userInfoEdit">';
            user += '    <div class="user-add-div">';
            user += '<label class="user-add-label">用户名：</label>';
            user += '<div class="user-add-div-div">';
            user += '    <input type="hidden" name="id" value="' + userInfo.id + '">';
            user += '    <input type="text" id="usernameEdit" name="username" value="' + userInfo.username + '" class="form-control" autocomplete="off" maxlength="16">';
            user += '</div>';
            user += '    </div>';
            user += '    <div class="user-add-div">';
            user += '<label class="user-add-label">密码：</label>';
            user += '<div class="user-add-div-div">';
            user += '    <input type="text" id="passwordEdit" name="password" class="form-control" autocomplete="off" value="' + userInfo.password + '"  maxlength="16">';
            user += '</div>';
            user += '    </div>';
            user += '    <div class="user-add-div">';
            user += '<label class="user-add-label">手机号：</label>';
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

        },
        error: function (result) {
            layer.msg("出错！");
        }
    });
}

// function userEdit(userInfo) {
//     window.lar = layer.open({
//         title: '编辑用户',
//         type: 1,
//         area: ['25%', '42%'],
//         shadeClose: true, //点击遮罩关闭
//         content: $("#editUser"),
//         offset: "25%"
//     });
//     var user = '';
//     user += '<div class="model-style">';
//     user += '<form id="userInfoEdit">';
//     user += '    <div class="user-add-div">';
//     user += '<label class="user-add-label">用户名</label>';
//     user += '<div class="user-add-div-div">';
//     user += '    <input type="hidden" name="id" value="' + userInfo.id + '">';
//     user += '    <input type="text" id="username" name="username" value="' + userInfo.username + '" class="form-control" autocomplete="off" maxlength="16">';
//     user += '</div>';
//     user += '    </div>';
//     user += '    <div class="user-add-div">';
//     user += '<label class="user-add-label">密码</label>';
//     user += '<div class="user-add-div-div">';
//     user += '    <input type="text" id="password" name="password" class="form-control" autocomplete="off" value="' + userInfo.password + '"  maxlength="16">';
//     user += '</div>';
//     user += '    </div>';
//     user += '    <div class="user-add-div">';
//     user += '<label class="user-add-label">手机号</label>';
//     user += '<div class="user-add-div-div">';
//     user += '    <input type="text" id="phone" name="phone" class="form-control" value="' + userInfo.phone + '" autocomplete="off" maxlength="11">';
//     user += '</div>';
//     user += '    </div>';
//     user += '    <div class="user-add-but-div">';
//     user += '<input class="btn btn-primary btn-sm" type="button" onclick="commitUserEdit()" value="提交">';
//     user += '    </div>';
//     user += '</form>';
//     user += '</div>';
//
//     $('#editUser').html(user);
// }

//提交修改
// function commitEdit(userInfo) {
//     $.ajax({
//         type: "post",
//         url: localStorage.getItem("ajaxUrl") + '/userInfo/edit.do',
//         data: userInfo.serialize(),
//         traditional: true,
//         success: function (data) {
//             if (data === "success") {
//                 parent.closeWin();
//                 layer.msg("修改成功！");
//                 loadData(1);
//             } else {
//                 layer.msg("修改失败！")
//             }
//         },
//         error: function (result) {
//             layer.msg("出错！");
//         }
//     })
// }

//提交编辑后的用户
function commitUserEdit() {
    // var username = $('#username').val();
    // var password = $('#password').val();
    if ($.trim($("#usernameEdit").val()) !== '') {
        if ($.trim($("#passwordEdit").val()) !== '') {
            // var userInfo = $('#userInfoEdit');
            // frame.window.commitEdit(userInfo);

            $.ajax({
                type: "post",
                url: localStorage.getItem("ajaxUrl") + '/userInfo/edit.do',
                data: $('#userInfoEdit').serialize(),
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
            layer.msg("密码不可以为空！");
        }
    } else {
        layer.msg("用户名不可以为空！");
    }
}


//详情
function details(id) {
    $.ajax({
        type: "post",
        url: '/userInfo/details.do',
        data: {'id': id},
        success: function (data) {
            var map = JSON.parse(data);
            // parent.userDetails(map);

            window.lar = layer.open({
                title: '用户详情',
                type: 1,
                area: ['25%', '40%'],
                skin: 'layer-ext-yourskin',
                shade: [0.8, '#393D49'],
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
        },
        error: function (result) {
            layer.msg("出错！");
        }
    });
}

//用户详情
// function userDetails(map) {
//     window.lar = layer.open({
//         title: '用户详情',
//         type: 1,
//         area: ['25%', '42%'],
//         shadeClose: true, //点击遮罩关闭
//         content: $("#userDetails"),
//         offset: "25%"
//     });
//
//     var user = '';
//
//     user += '<div style="padding: 30px 15px;font-size: 14px;">';
//     user += '<div style="margin-bottom: 15px;">';
//     user += '                <label style="line-height: 34px;padding-right: 2%;width: 23%;text-align: right;margin: 0;font-weight: 600;">用户名:</label>';
//     user += '                <div style="width: 75%;display: inline-block;">' + map.userInfo.username + '</div>';
//     user += '</div>';
//     user += '<div style="margin-bottom: 15px;">';
//     user += '                <label style="line-height: 34px;padding-right: 2%;width: 23%;text-align: right;margin: 0;font-weight: 600;">密码:</label>';
//     user += '                <div style="width: 75%;display: inline-block;">' + map.userInfo.password + '</div>';
//     user += '</div>';
//     user += '<div style="margin-bottom: 15px;">';
//     user += '                <label style="line-height: 34px;padding-right: 2%;width: 23%;text-align: right;margin: 0;font-weight: 600;">手机号:</label>';
//     user += '                <div style="width: 75%;display: inline-block;">' + map.userInfo.phone + '</div>';
//     user += '</div>';
//     user += '<div style="margin-bottom: 15px;">';
//     user += '<label style="line-height: 34px;padding-right: 2%;width: 23%;text-align: right;margin: 0;font-weight: 600;">角色信息:</label>';
//     if (map.roleInfoList < 1) {
//         user += '<div style="width: 75%;display: inline-block;">无</div>';
//     } else {
//         for (var i = 0; i < map.roleInfoList.length; i++) {
//             user += '<div style="display: inline-block;">' + map.roleInfoList[i].roleName + '</div>';
//             if (i !== map.roleInfoList.length - 1) {
//                 user += ' , ';
//             }
//         }
//     }
//     user += '</div>';
//     user += '</div>';
//     $('#userDetails').html(user);
// }

//绑定角色
function binding(id) {
    $.ajax({
        type: "post",
        url: '/userInfo/possessRole.do',
        data: {'id': id},
        success: function (data) {
            var roleInfoList = JSON.parse(data);
            // parent.bindingRoles(id, roleList);
            window.lar = layer.open({
                title: '绑定角色',
                type: 1,
                area: ['25%', '40%'],
                skin: 'layer-ext-yourskin',
                shade: [0.8, '#393D49'],
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
        },
        error: function (result) {
            layer.msg("出错！");
        }
    });
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

// function bindingRoles(id, roleInfoList) {
//     window.lar = layer.open({
//         title: '绑定角色',
//         type: 1,
//         area: ['25%', '42%'],
//         shadeClose: true, //点击遮罩关闭
//         content: $("#bindingRoles"),
//         offset: "25%"
//     });
//
//     //所有角色
//     var roleList = roleInfoList.roleInfoList;
//     //已绑定角色
//     var possessRoleList = roleInfoList.possessRoleInfoList;
//
//     var role = '';
//     role += '<input type="hidden" id="userId" value="' + id + '">';
//     for (var i = 0; i < roleList.length; i++) {
//         role += '<tr onclick="checkboxEvent(this)" style="margin-bottom: 5px;height:18px;display: table;">';
//         role += '<td class="table-list-td-checkbox" style="padding-right: 20px;">';
//         role += '<input type="checkbox" value="' + roleList[i].id + '" onclick="window.event.cancelBubble=true;">';
//         role += '</td>';
//         role += '<td class="td-border-bottom" style="cursor: pointer;">' + roleList[i].roleName + '</td>';
//         role += '</tr>';
//     }
//     $('#roleBody').html(role);
//
//     for (var j = 0; j < possessRoleList.length; j++) {
//         $('#roleBody').children('tr').find('input').each(function () {
//             if ($(this).val() == possessRoleList[j].id) {
//                 this.checked = true;
//             }
//         });
//     }
// }


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
