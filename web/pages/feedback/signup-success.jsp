<%--
  Created by IntelliJ IDEA.
  User: hedefu
  Date: 01/10/2017
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>注册成功</title>
    <style>
        #welcome{
            text-align: center;
            font-size: 16px;
        }
    </style>
</head>
<body>
<div id="welcome">
    恭喜，注册成功，<span id="timecount">4</span>秒后返回登录页面<br>
    如果浏览器不能正常跳转请<a href="patients-signin?sign=signin">点击此处</a>
</div>

<script src="framework/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script>
    $(function () {
        var count = 3;
        setInterval(function () {
            if (count > 0){
                $('#timecount').html(count--);
            }else {
                window.location='patients-signin?sign=signin';
            }
        },1000);



    });
</script>
</body>
</html>
