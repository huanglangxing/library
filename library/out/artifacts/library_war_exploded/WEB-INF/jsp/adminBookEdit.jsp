<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>编辑《 ${sessionScope.detail.name}》</title>
    <link rel="stylesheet" href="../../static/css/bootstrap.min.css">
    <script src="../../static/js/jquery-3.2.1.js"></script>
    <script src="../../static/js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('adminHeader');
        })
    </script>
</head>
<body background="../../static/img/book2.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header" style="padding-bottom: 80px"></div>

<div class="col-xs-6 col-md-offset-3" style="position: relative;">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">《 ${sessionScope.detail.name}》<a style="float: right" href="javascript:history.go(-1);">返回上一页</a></h3>
        </div>
        <div class="panel-body">
            <form action="bookUpdateDo?bookId=${sessionScope.detail.bookId}" method="post" id="editBook" >

                <table class="table table-hover">
                    <tbody>
                    <tr>
                        <th width="15%">书名</th>
                        <td><input type="text" class="form-control" name="name" id="name" value="${sessionScope.detail.name}"></td>
                    </tr>
                    <tr>
                        <th>作者</th>
                        <td><input type="text" class="form-control" name="author" id="author" value="${sessionScope.detail.author}" ></td>
                    </tr>
                    <tr>
                        <th>出版社</th>
                        <td><input type="text" class="form-control" name="publish" id="publish"  value="${sessionScope.detail.publish}" ></td>
                    </tr>
                    <tr>
                        <th>ISBN</th>
                        <td><input type="text" class="form-control" name="ISBN" id="ISBN"  value="${sessionScope.detail.ISBN}" ></td>
                    </tr>
                    <tr>
                        <th>简介</th>
                        <td><input type="text" class="form-control" name="introduction" id="introduction"  value="${sessionScope.detail.introduction}" ></td>
                    </tr>
                    <tr>
                        <th>语言</th>
                        <td><input type="text" class="form-control" name="language" id="language" value="${sessionScope.detail.language}" ></td>
                    </tr>
                    <tr>
                        <th>价格</th>
                        <td><input type="text" class="form-control" name="price"  id="price" value="${sessionScope.detail.price}"></td>
                    </tr>
                    <tr>
                        <th>出版日期</th>
                        <td><input type="date" class="form-control" name="pubstr" id="pubstr" value="<fmt:formatDate value="${sessionScope.detail.pubDate}" pattern="yyyy-MM-dd"/>"></td>
                    </tr>
                    <tr>
                        <th>分类号</th>
                        <td><input type="text" class="form-control" name="classId" id="classId" value="${sessionScope.detail.classId}"></td>
                    </tr>
                    <tr>
                        <th>数量</th>
                        <td><input type="text" class="form-control" name="number"  id="number" value="${sessionScope.detail.number}"></td>
                    </tr>
                    </tbody>
                </table>
                <div align="center">
                    <input type="submit" value="确定修改" class="btn btn-success " >
                </div>
                <script>
                    $("#editBook").submit(function () {
                        if($("#name").val()==''||$("#author").val()==''||$("#publish").val()==''||$("#ISBN").val()==''||$("#introduction").val()==''||$("#language").val()==''||$("#price").val()==''||$("#pubDate").val()==''||$("#classId").val()==''||$("#number").val()==''){
                            alert("请填入完整图书信息！");
                            return false;
                        }
                    })
                </script>
            </form>
        </div>
    </div>

</div>

</body>
</html>
