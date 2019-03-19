$(function () {
    //进入页面加载所有锥桶列表
    getAllConeBucket();
})

//点击添加方法时弹出
function add() {
    parent.iframeAlert();
}

//后台查询所有锥桶信息
function getAllConeBucket() {
    $.ajax({
        url:localStorage.getItem("ajaxUrl") + "/getAllConeBucket.do",
        //几个参数需要注意一下
        type: "get",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        success: function (res) {
            $("#tBo").empty();
            console.log(res);//打印服务端返回的数据(调试用)
            if (res.resCode == 200){

                var coneBucketList = res.resData;

                for (var i =0;i < coneBucketList.length;i++){
                    var id = coneBucketList[i].id;
                    var cone_bucket_num = coneBucketList[i].cone_bucket_num;
                    var create_time = coneBucketList[i].create_time;
                    var type_name = coneBucketList[i].type_name;

                    var html = "                    <tr>\n" +
                        "                        <th><input onclick='changeCheckCss(this.id);' id="+ id  +" + name='check' + type=\"checkbox\"></th>\n" +
                        "                        <th  scope=\"row\"> " + id +" </th>\n" +
                        "                        <td style=\" text-align:center;\" >" + cone_bucket_num +"</td>\n" +
                        "                        <td style=\" text-align:center;\" >" + type_name+"</td>\n" +
                        "                        <td style=\" text-align:center;\" >" + create_time+"</td>\n" +
                        "                        <td style=\"text-align: center; width: 110px;padding: 0;line-height: 50px; \">\n" +
                        "                            <button onclick='getConeBucketMessage(this.id)' id="+ id +" style=\" text-align:right;\" class=\"btn btn-primary btn-sm\">详细\n" +
                        "                            </button>\n" +
                        "                        </td>\n" +
                        "                    </tr>";


                    $("#tBo").append(html);
                }


            }else if (res.resCode == 404){
                layer.msg("当前无锥桶")
            } else {
                layer.msg("错误！")
            }

        },
        error : function() {
            layer.msg("异常！");
        }
    })
}

//点击时改变checkBox属性
function changeCheckCss(id) {

    if ($("#" + id).is(':checked')){
        $("#" + id).attr("checked","checked");
    }else {
        $("#" + id).removeAttr("checked");
    }
}

//点击时全选
function changeAllCheckCss(id) {
    if ($("#"+id).is(':checked')){
        $("input[name='check']:checkbox").each(function() {
            $(this).attr("checked","checked");
        })
    }else {
        $("input[name='check']:checkbox").each(function() {
            $(this).removeAttr("checked");
        })
    }
}
//删除事件
function dellectConeBucket() {
    var arrs=new Array();
    $("input[name='check']:checkbox").each(function(){
        if($(this).attr("checked")){
            arrs.push($(this).attr("id"));
        }
    });
    if(arrs.length==0 ){
        layer.msg('请选择数据!');
        return ;
    }else {

        $.ajax({
            url:localStorage.getItem("ajaxUrl") + "/removeConeBucketById.do",
            //几个参数需要注意一下
            type: "Post",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            traditional:true,//防止深度序列化
            data:{
                "idArray":arrs
            },
            success: function (res) {
                if (res.resCode == 200){
                    layer.msg("删除成功");
                    getAllConeBucket();

                } else {
                    layer.msg("删除失败")
                }
            },
            error:function () {
                layer.msg("异常！");
            }
        })
    }
}

//条件查询方法
function getConeBucketByCondition() {
    var cbn = $("#coneBucketNum").val();
    var cbt = $("#coneBucketType").val();

    if (isNull(cbn) && isNull(cbn)){
        layer.msg("请输入查询信息")
        return ;
    }

    $.ajax({
        url:localStorage.getItem("ajaxUrl") + "/getConeBucketByCondition.do",
        //几个参数需要注意一下
        type: "Post",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        data:{
            "cbn":cbn,
            "cbt":cbt
        },
        success: function (res) {

            if (res.resCode == 200){
                $("#tBo").empty();
                layer.msg("查询成功");
                var coneBucketList = res.resData;

                for (var i =0;i < coneBucketList.length;i++){
                    var id = coneBucketList[i].id;
                    var cone_bucket_num = coneBucketList[i].cone_bucket_num;
                    var create_time = coneBucketList[i].create_time;
                    var type_name = coneBucketList[i].type_name;

                    var html = "                    <tr>\n" +
                        "                        <th><input onclick='changeCheckCss(this.id);' id="+ id  +" + name='check' + type=\"checkbox\"></th>\n" +
                        "                        <th  scope=\"row\"> " + id +" </th>\n" +
                        "                        <td style=\" text-align:center;\" >" + cone_bucket_num +"</td>\n" +
                        "                        <td style=\" text-align:center;\" >" + type_name+"</td>\n" +
                        "                        <td style=\" text-align:center;\" >" + create_time+"</td>\n" +
                        "                        <td style=\"text-align: center; width: 110px;padding: 0;line-height: 50px; \">\n" +
                        "                            <button onclick='getConeBucketMessage(this.id)' id="+ id +" style=\" text-align:right;\" class=\"btn btn-primary btn-sm\">详细\n" +
                        "                            </button>\n" +
                        "                        </td>\n" +
                        "                    </tr>";


                    $("#tBo").append(html);
                }

            } else {
                layer.msg("无锥桶")
            }
        },
        error:function () {
            layer.msg("异常！");
        }
    });

}



/****************js判空方法********************/

function isNull(str) {

    if (!str && typeof(str) =='undefined' ){
        return true
    }else {
        return false
    }
}
