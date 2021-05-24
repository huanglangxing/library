<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>借还日志</title>
    <link rel="stylesheet" href="../../static/css/bootstrap.min.css">
    <script src="../../static/js/jquery-3.2.1.js"></script>
    <script src="../../static/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('adminHeader');
        })
    </script>
</head>
<body background="../../static/img/u5.jpeg" style=" background-repeat:no-repeat ;
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
            借还日志
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>流水号</th>
                <th>图书号</th>
                <th>读者证号</th>
                <th>借出日期</th>
                <th>归还日期</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${sessionScope.lends}" var="log">
                <tr>
                    <fmt:formatDate var="lendDate" type="date" value="${log.lendDate}" pattern="yyyy-MM-dd" />
                    <fmt:formatDate var="backDate" type="date" value="${log.backDate}" pattern="yyyy-MM-dd" />
                    <td><c:out value="${log.serNum}"/></td>
                    <td><c:out value="${log.bookId}"/></td>
                    <td><c:out value="${log.readerId}"/></td>
                    <td><c:out value="${lendDate}"/></td>
                    <td><c:out value="${backDate}"/></td>
                    <td>
                        <a href="deleteLend?serNum=<c:out value='${log.serNum}'/>">
                            <c:if test="${!empty backDate}">
                                <button type="button" class="btn btn-danger btn-xs">删除</button>
                            </c:if>
                            <c:if test="${empty backDate}">
                                <button type="button" class="btn btn-default btn-xs" disabled="disabled">删除</button>
                            </c:if>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
