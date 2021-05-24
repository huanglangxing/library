<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>编辑读者信息《 ${sessionScope.readerInfo.name}》</title>
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
            <h3 class="panel-title">编辑读者信息《 ${sessionScope.readerInfo.name}》<a style="float: right" href="javascript:history.go(-1);">返回上一页</a></h3>
        </div>
        <div class="panel-body">
            <form action="readerEditDo?readerId=${sessionScope.readerInfo.readerId}" method="post" id="readerEdit" >

                <table class="table table-hover">
                    <tbody>
                    <tr>
                        <th width="15%">姓名</th>
                        <td><input type="text" class="form-control" name="name" id="name" value="${sessionScope.readerInfo.name}"></td>
                    </tr>
                    <tr>
                        <th>性别</th>
                        <td><input type="text" class="form-control" name="sex" id="sex" value="${sessionScope.readerInfo.sex}"></td>
                    </tr>
                    <tr>
                        <th>生日</th>
                        <td><input type="date" class="form-control" name="birstr" id="birstr" value="<fmt:formatDate value="${sessionScope.readerInfo.birth}" pattern="yyyy-MM-dd"/>"></td>
                    </tr>
                    <tr>
                        <th>地址</th>
                        <td><input type="text" class="form-control" name="address" id="address" value="${sessionScope.readerInfo.address}"></td>
                    </tr>
                    <tr>
                        <th>电话</th>
                        <td><input type="text" class="form-control" name="phone" id="phone" value="${sessionScope.readerInfo.phone}"></td>
                    </tr>
                    </tbody>
                </table>

                <br>
                <div align="center">
                    <input type="submit" value="确定修改" class="btn btn-success " >
                </div>

                <script>
                    $("#readerEdit").submit(function () {
                        if($("#name").val()==''||$("#sex").val()==''||$("#birth").val()==''||$("#address").val()==''||$("#phone").val()==''){
                            alert("请填入完整读者信息！");
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
