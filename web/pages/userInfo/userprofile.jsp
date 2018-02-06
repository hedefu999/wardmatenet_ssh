<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: hedefu
  Date: 01/10/2017
  Time: 8:59 PM
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
    <title>用户信息</title>
</head>
<body>
<s:debug/>
<a href="">注销登录</a>
基本信息修改头像 修改隐私设置 修改关注的疾病
<s:form action="patients-save" >
    <s:textfield name="user.userName" label="用户名"/>
    <s:textfield name="user.userPass" label="密码"/>
    <s:radio list="gendermap" name="user.gender" label="性别"/>
    <s:textfield name="user.birthdate" label="生日"/>
    <s:textfield name="user.email" label="邮箱"/>
    <s:textfield name="user.phoneNum" label="手机号"/>
    <s:textfield name="user.diseaseList" label="疾病"/>
</s:form>

</body>
</html>
