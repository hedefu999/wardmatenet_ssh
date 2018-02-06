<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: hedefu
  Date: 12/10/2017
  Time: 3:41 PM
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
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>病友大厅</title>
    <link rel="stylesheet" href="framework/awesomefonts/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="framework/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/rem.css"/>
    <link rel="stylesheet" href="css/navbar.css"/>
    <style type="text/css">
        #vicemenu{background:rgba(0,128,128,0.4);}
        #vicemenu .btn{margin: 0.8rem 0;padding:0.5rem;}
        #vicemenu .btn-primary{background-color: rgba(0,136,204,0.5);}
        #vicemenu .btn-default{background-color: rgba(255,255,255,0.5);}
        #vicemenu .col{text-align: right;position: relative;padding: 0;text-align: center;}
        #vicemenu .col .badge{position: absolute;}
        #vicemenu .userentrance{margin-right: 2rem;}
        #vicemenu .avatar{margin-right: 1rem;}
    </style>
</head>
<body>
<%@include file="/pages/common/navbar.jsp"%>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1">
    <div id="vicemenu">
        <div class="row">
            <div class="col-xs-3 col-sm-2 col-md-2 col"><a class="btn btn-primary " href="snshall"><i class="fa fa-hand-stop-o" aria-hidden="true">&nbsp;病友大厅</i></a></div>
            <div class="col-xs-3 col-sm-2 col-md-2 col"><a class="btn btn-default " href="snschats"><i class="fa fa-group" aria-hidden="true">&nbsp;病友聊天</i></a><span class="badge">2</span> </div>
            <div class="col-xs-3 col-sm-2 col-md-2 col"><a class="btn btn-default " href="#"><i class="fa fa-list" aria-hidden="true">&nbsp;病友论坛</i></a></div>
            <div class="col-xs-3 col-sm-2 col-md-2 col"><a class="btn btn-default " href="#"><i class="fa fa-star-o" aria-hidden="true">&nbsp;病友动态</i></a></div>
            <div class="col-xs-0 col-sm-4 col-md-4 col"><div class="userentrance"><a href="#"> <img class="avatar" src="imgs/avatar.png"><span class="userName"><s:property value="#session.LoggedInUser"/></span></a><a href="#">&emsp;<i class="fa fa-vcard-o" aria-hidden="true">&nbsp;账户设置</i> </a></div></div>
        </div>
    </div><!-- vicemenu -->
    <div class="row">
        <div class="col-sm-5">
            <h2>病友群</h2>
            <div>
                <h3><i class="fa fa-medkit">&nbsp;&nbsp;糖尿病患者群</i></h3>
                <span>各位好，欢迎加入患者大家庭，大家可以再这里畅所欲言，交流自身患病经历和体验。严禁发布广告及一切夸大、虚假信息！违者踢出</span>
                <a class="btn btn-primary" href="#">已加入</a>
            </div>
            <div>
                <h3><i class="fa fa-stethoscope">&nbsp;&nbsp;高血压患者群</i></h3>
                <a class="btn btn-default" href="#">加入</a>
            </div>
        </div>
        <div class="col-sm-7">
            <h2>相似病情患者</h2>
            <div>
                <span>用户A</span><hr>
                <span>用户B</span><hr>
                <span>用户C</span><hr>
                <span>用户D</span><hr>
            </div>
        </div>
    </div>
</div>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1">
    <h2>病友热点事件</h2>
    <a class="btn btn-default" href="#">刷新</a>
</div>







<script src="framework/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="framework/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="framework/neteaseim/NIM_Web_SDK_v4.1.0.js" type="text/javascript"></script>
<script src="framework/neteaseim/nimconfig.js" type="text/javascript"></script>
<script type="text/javascript">
//    var nim = SDK.NIM.getInstance({
//        appKey:mainCon.appKey,
//        account:mainCon.account,
//        token:mainCon.token,
//        db:false,//不开启数据库
//        onconnect:onConnect,
//        onerror:onError,
//    });
//     function onConnect(obj) {
//         $('#teamsList').html(obj.ip);
//     }
//    function onError(error) {
//
//    }
    var colheight = $('#vicemenu .col').height();
    $('#vicemenu .userentrance .avatar').css("height",colheight);
</script>
</body>
</html>
