<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加书籍</title>
    <link rel="stylesheet" href="../../static/css/bootstrap.min.css">
    <script src="../../static/js/jquery-3.2.1.js"></script>
    <script src="../../static/js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('adminHeader');
        })
    </script>
</head>
<body background="../../static/img/book3.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header" style="padding-bottom: 80px"></div>

<div class="col-xs-6 col-md-offset-3" style="position: relative;">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">添加书籍<a style="float: right" href="javascript:history.go(-1);">返回上一页</a></h3>
        </div>
        <div class="panel-body">
            <form action="bookAddDo" method="post" id="bookAdd" >

                <table class="table table-hover">
                    <tbody>
                    <tr>
                        <th width="15%">书名</th>
                        <td><input type="text" class="form-control" name="name" id="name"></td>
                    </tr>
                    <tr>
                        <th>作者</th>
                        <td><input type="text" class="form-control" name="author" id="author"></td>
                    </tr>
                    <tr>
                        <th>出版社</th>
                        <td><input type="text" class="form-control" name="publish" id="publish" ></td>
                    </tr>
                    <tr>
                        <th>ISBN</th>
                        <td><input type="text" class="form-control" name="ISBN" id="ISBN" ></td>
                    </tr>
                    <tr>
                        <th>简介</th>
                        <td><input type="text" class="form-control" name="introduction" id="introduction" ></td>
                    </tr>
                    <tr>
                        <th>语言</th>
                        <td><input type="text" class="form-control" name="language" id="language" ></td>
                    </tr>
                    <tr>
                        <th>价格</th>
                        <td><input type="text" class="form-control" name="price"  id="price" ></td>
                    </tr>
                    <tr>
                        <th>出版日期</th>
                        <td><input type="date" class="form-control" name="pubstr" id="pubstr" ></td>
                    </tr>
                    <tr>
                        <th>分类号</th>
                        <td><input type="text" class="form-control" name="classId" id="classId" ></td>
                    </tr>
                    <tr>
                        <th>数量</th>
                        <td><input type="text" class="form-control" name="number"  id="number" ></td>
                    </tr>
                    </tbody>
                </table>
                <div align="center">
                    <input type="submit" value="添加" class="btn btn-success " >
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
