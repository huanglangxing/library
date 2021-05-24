<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>全部图书信息</title>
    <link rel="stylesheet" href="../../static/css/bootstrap.min.css">
    <script src="../../static/js/jquery-3.2.1.js"></script>
    <script src="../../static/js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('adminHeader');
        })
    </script>
</head>
<body background="../../static/img/book1.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header"></div>

<div style="padding: 70px 550px 10px">
    <form   method="post" action="queryBook" class="form-inline"  id="searchForm">
        <div class="input-group">
           <input type="text" placeholder="输入图书名" id="search" name="word" class="form-control">
            <span class="input-group-btn">
                            <input type="submit" value="搜索" class="btn btn-default">
            </span>
        </div>
    </form>
    <script>
        $("#searchForm").submit(function () {
            var val=$("#search").val();
            if(val==''){
                alert("请输入关键字");
                return false;
            }
        })
    </script>
</div>

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
    <c:if test="${!empty sessionScope.error}">
        <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${sessionScope.error}
        </div>
    </c:if>
</div>
<div class="panel panel-default" style="width: 90%;margin-left: 5%">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">
            <a href="adminBooks">全部图书</a>
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>书名</th>
                <th>作者</th>
                <th>出版社</th>
                <th>ISBN</th>
                <th>价格</th>
                <th>剩余数量</th>
                <th>详情</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${sessionScope.books}" var="book">
            <tr>
                <td><c:out value="${book.name}"/></td>
                <td><c:out value="${book.author}"/></td>
                <td><c:out value="${book.publish}"/></td>
                <td><c:out value="${book.ISBN}"/></td>
                <td><c:out value="${book.price}"/></td>
                <td><c:out value="${book.number}"/></td>
                <td><a href="adminBookDetail?bookId=<c:out value="${book.bookId}"/>">
                    <button type="button" class="btn btn-success btn-xs">详情</button>
                </a></td>
                <td><a href="updateBook?bookId=<c:out value="${book.bookId}"/>"><button type="button" class="btn btn-info btn-xs">编辑</button></a></td>
                <td><a href="deleteBook?bookId=<c:out value="${book.bookId}"/>"><button type="button" class="btn btn-danger btn-xs">删除</button></a></td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
