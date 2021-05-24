<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${sessionScope.readerCard.username}的主页</title>
    <link rel="stylesheet" href="../../static/css/bootstrap.min.css">
    <script src="../../static/js/jquery-3.2.1.js"></script>
    <script src="../../static/js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('readerHeader');
        })
    </script>
</head>
<body background="../../static/img/readerMain_bg.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header"></div>

</body>
</html>