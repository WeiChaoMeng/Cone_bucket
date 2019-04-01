//初始化
$(function () {
    loadData(1);
    loadPage(1);
});

function exeData(page, type, parameter) {
    //全部
    if (parameter === 1) {
        loadData(page);

        //搜索
    } else if (parameter === 2) {
        search(page);
    }
}

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
            alert("出错！");
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
            alert("出错！");
        }
    })
}

//添加角色
function add() {
    parent.addRole();
}

//提交添加
function commitRoleAdd(roleInfo) {
    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/roleInfo/add.do',
        data: roleInfo.serialize(),
        traditional: true,
        success: function (data) {
            if (data === "success") {
                parent.closeWin();
                layer.msg("添加成功！");
                loadData(1);
            } else {
                layer.msg("添加失败！")
            }
        },
        error: function (result) {
            layer.msg("出错！");
        }
    })
}

//删除用户
function del(id) {
    $.ajax({
        type: "post",
        url: '/roleInfo/remove.do',
        data: {'id': id},
        success: function (data) {
            if (data === 'success') {
                layer.msg("删除角色成功");
                loadData(1);
            } else {
                layer.msg('删除角色失败！');
            }
        },
        error: function (result) {
            layer.msg("出错！");
        }
    })
}

//编辑用户
function editor(id) {
    $.ajax({
        type: "post",
        url: '/roleInfo/toEdit.do',
        data: {'id': id},
        success: function (data) {
            var roleInfo = JSON.parse(data);
            parent.roleEdit(roleInfo);
        },
        error: function (result) {
            layer.msg("出错！");
        }
    });
}


//提交修改
function commitRoleEdit(roleInfo) {
    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/roleInfo/edit.do',
        data: roleInfo.serialize(),
        traditional: true,
        success: function (data) {
            if (data === "success") {
                parent.closeWin();
                layer.msg("修改成功！");
                loadData(1);
            } else {
                layer.msg("修改失败！")
            }
        },
        error: function (result) {
            layer.msg("出错！");
        }
    })
}

//详情
function details(id) {
    $.ajax({
        type: "post",
        url: '/roleInfo/details.do',
        data: {'id': id},
        success: function (data) {
            var map = JSON.parse(data);
            parent.roleDetails(map);
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
            parent.bindingPermission(id, permissionList);
        },
        error: function (result) {
            layer.msg("出错！");
        }
    });
}
