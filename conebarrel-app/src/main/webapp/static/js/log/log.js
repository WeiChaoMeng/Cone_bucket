$(function () {

})

function getAllConeBucketLog() {
    $.ajax({
        url:localStorage.getItem("ajaxUrl") + "/getAllConeBucketLog.do",
        type:"get",
        dataType: "json",//预期服务器返回的数据类型
        data:{},
        success:function (res) {
            var logArray = res.data;
            if (logArray != null){
                $("#tbodys").empty();

                for (var i =0; i < logArray.length;i++){
                   var log = logArray[i].cone_bucket_num;
                   alert(log)
                }

            } else {
                $("#tbodys").append()
            }

        }
    })
}




/****************js判空方法********************/

function isNull(str) {

    if (!str && typeof(str) =='undefined' ){
        return true
    }else {
        return false
    }
}