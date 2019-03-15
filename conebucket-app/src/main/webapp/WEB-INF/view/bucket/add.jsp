<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2019/3/14
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>锥桶添加</title>

    <link rel="stylesheet" href="../../../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../static/css/cone_bucket.css">
</head>
<body>

<div class="content" style="padding: 20px;background: #fff">
    <div class="panel-heading" style="font-size: 16px;border: 1px #bfbfbf solid;border-bottom: none;">新增锥桶</div>
    <form id="streetlightDiseaseForm" type="get" onsubmit="addSubmit(); return false">
        <table class="table table-condensed table-bordered table-hover">
            <tbody>
            <tr>
                <td style="width: 10%">锥桶编号</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="" name="diseaseNumber" value="" autocomplete="off"
                           required="true">
                </td>

                <td style="width: 10%">锥桶类型</td>
                <td style="width: 40%">
                    <select class="form-control" id="roadName" name="roadName" required="true">
                        <option value="">内部监管</option>
                        <option value="">高德平台</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td style="width: 10%">规格</td>
                <td colspan="3">
                    <input class="form-control" type="text" id="" name="remarks" value="" required="true"
                           autocomplete="off">
                </td>
            </tr>

            <tr>
                <td style="width: 10%">材质</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="" name="diseaseNumber" value="" autocomplete="off"
                           required="true">
                </td>

                <td style="width: 10%">颜色</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="" name="diseaseNumber" value="" autocomplete="off"
                           required="true">
                </td>
            </tr>

            <tr>
                <td style="width: 10%">重量</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="" name="diseaseNumber" value="" autocomplete="off"
                           required="true">
                </td>

                <td style="width: 10%">特点</td>
                <td style="width: 40%">
                    <input class="form-control" type="text" id="" name="diseaseNumber" value="" autocomplete="off"
                           required="true">
                </td>
            </tr>

            <tr>
                <td style="width: 10%">适用地点</td>
                <td colspan="3">
                    <input  class="form-control" type="text" id="" name="remarks" value="" required="true"
                           autocomplete="off">
                </td>
            </tr>

            </tbody>
        </table>
        <div style="text-align: center">
            <input class="btn btn-primary btn-sm" type="submit" value="提交">
            <input class="btn btn-primary btn-sm" type="button" onclick="backOff()" value="返回">
        </div>
    </form>
</div>

</body>
<script src="../../../static/js/jquery-1.12.4.min.js"></script>
<script>
    //返回
    function backOff() {
        history.back(-1);
    }
</script>
</html>