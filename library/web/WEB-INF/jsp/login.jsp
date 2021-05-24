<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>登录界面</title>
    <link rel="stylesheet" href="../../static/css/bootstrap.min.css">
    <script src="../../static/js/jquery-3.2.1.js"></script>
    <script src="../../static/js/bootstrap.min.js" ></script>
    <script src="../../static/js/js.cookie.js"></script>
    <link rel="shortcut icon" href="../../static/img/favicon.ico" />
    <style>
        #login{
            height: 45%;
            width: 28%;
            margin-left: auto;
            margin-right: auto;
            margin-top: 5%;
            display: block;
            position: center;
            background-color: #a6e1ec;
        }
        .form-group {
            margin-bottom: 0;
        }
        * {
            padding:0;
            margin:0;
        }
    </style>
</head>
<body background="../../static/img/bg_all.jpg" style=" background-repeat:no-repeat ;
    background-size:100% 100%;
    background-attachment: fixed;">
<br>
<br>
<h2 style="text-align: center; color: black; font-family: '华文行楷'; font-size: 500%">图 书 馆 管 理 系 统</h2>

<div style="position: relative; width: 50%; margin-left: 25%;">
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

<div class="panel panel-default" id="login" style="color: #080808" >
    <div class="panel-heading" style="background-color: #a6e1ec">
        <h3 class="panel-title" style="text-align: center; color: #080808" >欢迎，请登录！</h3>
    </div>
    <div class="panel-body" >
        <div class="form-group">
            <label for="id">账号</label>
            <input type="text" class="form-control" id="id" placeholder="请输入账号">
        </div>
        <br>
        <div class="form-group">
            <label for="passwd">密码</label>
            <input type="password" class="form-control" id="passwd" placeholder="请输入密码">
        </div>
        <div class="checkbox text-left">
            <label>
                <input type="checkbox" id="remember">记住密码
            </label>
        </div>

        <p style="text-align: right;color: #ff0000;position: absolute" id="info"></p>
        <br>
        <button id="loginButton"  class="btn btn-primary  btn-block">登 陆
        </button>
    </div>
</div>
<script>
    $("#id").keyup(
        function () {
            if(isNaN($("#id").val())){
                $("#info").text("提示:账号只能为数字");
            }
            else {
                $("#info").text("");
            }
        }
    )
    // 记住登录信息
    function rememberLogin(username, password, checked) {
        Cookies.set('loginStatus', {
            username: username,
            password: password,
            remember: checked
        }, {expires: 30, path: ''})
    }
    // 若选择记住登录信息，则进入页面时设置登录信息
    function setLoginStatus() {
        var loginStatusText = Cookies.get('loginStatus')
        if (loginStatusText) {
            var loginStatus
            try {
                loginStatus = JSON.parse(loginStatusText);
                $('#id').val(loginStatus.username);
                $('#passwd').val(loginStatus.password);
                $("#remember").prop('checked',true);
            } catch (__) {}
        }
    }

    // 设置登录信息
    setLoginStatus();
    $("#loginButton").click(function () {
        var id =$("#id").val();
        var passwd=$("#passwd").val();
        var remember=$("#remember").prop('checked');
        if (id == '') {
            $("#info").text("提示:账号不能为空");
        }
        else if( passwd == ''){
            $("#info").text("提示:密码不能为空");
        }
        else if(isNaN( id )){
            $("#info").text("提示:账号必须为数字");
        }
        else {
            $.ajax({
                type: "POST",
                url: "api/loginCheck",
                data: {
                    id:id ,
                    passwd: passwd
                },
                dataType: "json",
                success: function(data) {
                    if (data.stateCode.trim() === "0") {
                        $("#info").text("提示:账号或密码错误！");
                    } else if (data.stateCode.trim() === "1") {
                        $("#info").text("提示:登陆成功，跳转中...");
                        window.location.href="adminMain";
                    } else if (data.stateCode.trim() === "2") {
                        if(remember){
                            rememberLogin(id,passwd,remember);
                        }else {
                            Cookies.remove('loginStatus');
                        }
                        $("#info").text("提示:登陆成功，跳转中...");
                        window.location.href="readerMain";
                    }
                }
            });
        }
    })
</script>
</div>
</body>
</html>