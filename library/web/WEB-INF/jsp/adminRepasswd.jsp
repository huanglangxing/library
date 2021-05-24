<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理员密码修改</title>
    <link rel="stylesheet" href="../../static/css/bootstrap.min.css">
    <script src="../../static/js/jquery-3.2.1.js"></script>
    <script src="../../static/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('adminHeader');
        })
    </script>
</head>
<body background="../../static/img/adminRepasswd.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header" style="padding-bottom: 100px"></div>

<div style="position: relative; width: 50%; margin-left: 25%;">
    <c:if test="${!empty sessionScope.error}">
        <div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${sessionScope.error}
        </div>
    </c:if>
</div>
<div class="col-xs-6 col-md-offset-3" style="position: relative;">
    <div class="panel panel-primary ">
        <div class="panel-heading">
            <h3 class="panel-title">密码修改</h3>
        </div>
        <div class="panel-body">
            <form method="post" action="adminrRepasswdDo?adminId=${sessionScope.admin.adminId}" id="repasswd">
                <table class="table table-hover">
                    <tbody>
                    <tr>
                        <th>旧密码</th>
                        <td><input type="password" id="oldPasswd" name="oldPasswd" placeholder="请输入旧密码" class="form-control" ></td>
                    </tr>
                    <tr>
                        <th>新密码</th>
                        <td><input type="password" id="newPasswd" name="newPasswd" placeholder="请输入新密码" class="form-control" ></td>
                    </tr>
                    <tr>
                        <th>确认新密码</th>
                        <td><input type="password" id="reNewPasswd" name="reNewPasswd" placeholder="请再次输入新密码" class="form-control" ></td>
                    </tr>
                    </tbody>
                    <em id="tips" style="color: red"></em>
                </table>
                <div align="center">
                    <input type="submit" value="提交" class="btn btn-default">
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $(document).keyup(function () {
        if ($("#newPasswd").val() != $("#reNewPasswd").val() && $("#newPasswd").val() != "" && $("#reNewPasswd").val() != "" && $("#newPasswd").val().length == $("#reNewPasswd").val().length) {
            $("#tips").text("两次输入的新密码不同，请检查");
        } else {
            $("#tips").text("");
        }
    })

    $("#repasswd").submit(function () {
        if ($("#oldPasswd").val() == '' || $("#newPasswd").val() == '' || $("#reNewPasswd").val() == '') {
            $("#tips").text("请填写完毕后提交");
            return false;
        } else if ($("#newPasswd").val() != $("#reNewPasswd").val()) {
            $("#tips").text("两次输入的新密码不同，请检查");
            return false;
        }
    })
</script>
</body>
</html>
