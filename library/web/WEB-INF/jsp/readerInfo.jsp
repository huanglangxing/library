<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>${sessionScope.readerInfo.name}的主页</title>
    <link rel="stylesheet" href="../../static/css/bootstrap.min.css">
    <script src="../../static/js/jquery-3.2.1.js"></script>
    <script src="../../static/js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('readerHeader');
        })
    </script>
</head>
<body background="../../static/img/readerInfo.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header" style="padding-bottom: 80px"></div>

<div class="col-xs-5 col-md-offset-3">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                <h3 class="panel-title">我的信息<a style="float: right" href="javascript:history.go(-1);">返回上一页</a></h3>
            </h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tbody>
                <tr>
                    <th width="20%">读者证号</th>
                    <td>${sessionScope.readerInfo.readerId}</td>
                </tr>
                <tr>
                    <th>姓名</th>
                    <td>${sessionScope.readerInfo.name}</td>
                </tr>
                <tr>
                    <th>性别</th>
                    <td>${sessionScope.readerInfo.sex}</td>
                </tr>
                <tr>
                    <th>生日</th>
                    <td><fmt:formatDate value="${sessionScope.readerInfo.birth}" pattern="yyyy-MM-dd"/></td>
                </tr>
                <tr>
                    <th>地址</th>
                    <td>${sessionScope.readerInfo.address}</td>
                </tr>
                <tr>
                    <th>电话</th>
                    <td>${sessionScope.readerInfo.phone}</td>
                </tr>
                </tbody>
            </table>
            <div align="center">
                <a class="btn btn-success btn-sm" href="readerInfoEdit" role="button">修改</a>
            </div>
        </div>
    </div>
</div>


</body>
</html>
