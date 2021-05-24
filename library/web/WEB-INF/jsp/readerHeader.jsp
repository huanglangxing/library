<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default" role="navigation" style="background-color: #a6e1ec">
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
            <a class="navbar-brand " href="readerMain"><p class="text-primary" style="font-family: 华文行楷; font-size: 200%; ">我的图书馆</p></a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav navbar-left">
                <li>
                    <a href="readerBooks">
                        图书查询
                    </a>
                </li>
                <li>
                    <a href="readerInfo" >
                        个人信息
                    </a>
                </li>
                <li >
                    <a href="myLend" >
                        我的借还
                    </a>
                </li>
                <li >
                    <a href="readerRepasswd" >
                        密码修改
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a >欢迎你，${sessionScope.readerCard.username}</a></li>
                <li><a href="login">退出</a></li>
            </ul>
        </div>
    </div>
</nav>
