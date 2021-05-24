<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>《 ${sessionScope.detail.name}》</title>
    <link rel="stylesheet" href="../../static/css/bootstrap.min.css">
    <script src="../../static/js/jquery-3.2.1.js"></script>
    <script src="../../static/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('adminHeader');
        })
    </script>
</head>
<body background="../../static/img/book4.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header" style="padding-bottom: 80px"></div>

<div class="col-xs-6 col-md-offset-3">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">《 ${sessionScope.detail.name}》<a style="float: right" href="javascript:history.go(-1);">返回上一页</a></h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tbody>
                <tr>
                    <th width="15%">书名</th>
                    <td>${sessionScope.detail.name}</td>
                </tr>
                <tr>
                    <th>作者</th>
                    <td>${sessionScope.detail.author}</td>
                </tr>
                <tr>
                    <th>出版社</th>
                    <td>${sessionScope.detail.publish}</td>
                </tr>
                <tr>
                    <th>ISBN</th>
                    <td>${sessionScope.detail.ISBN}</td>
                </tr>
                <tr>
                    <th>简介</th>
                    <td>${sessionScope.detail.introduction}</td>
                </tr>
                <tr>
                    <th>语言</th>
                    <td>${sessionScope.detail.language}</td>
                </tr>
                <tr>
                    <th>价格</th>
                    <td>${sessionScope.detail.price}</td>
                </tr>
                <tr>
                    <th>出版日期</th>
                    <td><fmt:formatDate value="${sessionScope.detail.pubDate}" pattern="yyyy-MM-dd"/></td>
                </tr>
                <tr>
                    <th>分类号</th>
                    <td>${sessionScope.detail.classId}</td>
                </tr>
                <tr>
                    <th>数量</th>
                    <td>${sessionScope.detail.number}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>

</body>
</html>
