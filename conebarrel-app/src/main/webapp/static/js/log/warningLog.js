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

//加载数据
function loadData(page) {
    $.ajax({
        type: "post",
        url: localStorage.getItem("ajaxUrl") + '/warningLog/index.do',
        data: {'page': page},
        async: false,
        success: function (data) {
            var objectInfo = JSON.parse(data);
            //总数
            $("#PageCount").val(objectInfo.total);
            //每页显示条数
            $("#PageSize").val("10");

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
        obj += '<td colspan="6" style="text-align: center;">' + '暂无数据' + '</td>';
        obj += '</tr>';
    } else {
        for (var i = 0; i < objectInfoList.length; i++) {
            obj += '<tr>';
            obj += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 10 + i + 1) + '</td>';
            obj += '<td class="table-td-content">' + objectInfoList[i].operationTimeStr + '</td>';
            obj += '<td class="table-td-content">' + objectInfoList[i].logType + '</td>';
            obj += '<td class="table-td-content">' + objectInfoList[i].logContent + '</td>';
            obj += '<td class="table-td-content">' + objectInfoList[i].operationUser + '</td>';
            obj += '<td class="table-td-content">' + objectInfoList[i].state + '</td>';
            obj += '</tr>';
        }
    }

    $('#tbody').html(obj);
}

//搜索
function search(page) {

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
