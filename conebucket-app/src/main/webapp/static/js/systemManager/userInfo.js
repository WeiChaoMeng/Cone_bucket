

/**
 * 添加用户弹出
 */
function addUser() {
    window.lar = layer.open({
        type: 1,
        area: ['600px', '300px'],
        shadeClose: true, //点击遮罩关闭
        shade:0,
        content: $("#addFrom"),
        offset:"5%"
    })
}

function addSubmit() {
    var userName = $("#userName").val();
    var password = $("#passwords").val();
    var phone = $("#phone").val();
    debugger
    if (isNull(userName) || isNull(password) ||isNull(phone)){
        layer.msg("请填写相应信息");
        return false;
    }else {
        $.ajax({
            url:localStorage.getItem("ajaxUrl") + "/addUser.do",
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            data: {
                "userName"  : userName,
                "password":password,
                "phone":phone
            },
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if (result.resCode == 200) {
                    layer.msg("添加成功");
                    layer.close(window.lar);
                }else {
                    layer.msg("添加失败");
                }

            },
            error : function() {
                layer.msg("异常！");
            }
        })
    }

}

/****************js判空方法********************/

function isNull(str) {

    if (!str && typeof(str) =='undefined' ){
        return true
    }else {
        return false
    }
}