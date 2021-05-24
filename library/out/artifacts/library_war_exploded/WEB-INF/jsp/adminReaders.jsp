<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>全部读者</title>
    <link rel="stylesheet" href="../../static/css/bootstrap.min.css">
    <script src="../../static/js/jquery-3.2.1.js"></script>
    <script src="../../static/js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('adminHeader');
        })
    </script>
</head>
<body background="../../static/img/adminReaders.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header"></div>

<div style="position: relative; top: 10%; width: 90%; margin-left: 5%">
    <c:if test="${!empty sessionScope.succ}">
        <div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${sessionScope.succ}
        </div>
    </c:if>
</div>


<div class="panel panel-default" style="position:relative;top: 80px;width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            <a href="allReaders">全部读者</a>
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>读者号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>生日</th>
                <th>地址</th>
                <th>电话</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${sessionScope.readers}" var="reader">
                <tr>
                    <fmt:formatDate var="birth" type="date" value="${reader.birth}" pattern="yyyy-MM-dd" />
                    <td><c:out value="${reader.readerId}"/></td>
                    <td><c:out value="${reader.name}"/></td>
                    <td><c:out value="${reader.sex}"/></td>
                    <td><c:out value="${birth}" escapeXml="false"/></td>
                    <td><c:out value="${reader.address}"/></td>
                    <td><c:out value="${reader.phone}"/></td>
                    <td><a href="readerEdit?readerId=<c:out value="${reader.readerId}"/>"><button type="button" class="btn btn-info btn-xs">编辑</button></a></td>
                    <td><a href="readerDelete?readerId=<c:out value="${reader.readerId}"/>"><button type="button" class="btn btn-danger btn-xs">删除</button></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
