<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
  <head>
    <base href="<%=basePath%>"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>主页</title>
    <link rel="stylesheet" href="framework/awesomefonts/css/font-awesome.min.css">
    <link rel="stylesheet" href="framework/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/index.css" type="text/css"/>
    <!--<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">-->
  </head>
  <body>
<nav id="navbar" class="navbar navbar-default navabr-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a id="navbar-logo" class="navbar-brand" href="index.jsp"><img src="imgs/index/logo.png" alt="病友网"></a>
      <a href="#" class="navbar-brand">病 友 网</a>
      <!--移动设备上显示-->
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div class="collapse navbar-collapse navbar-right" id="navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="index"><i class="fa fa-home" aria-hidden="true">&nbsp;首  页</i></a></li>
        <li><a href="evimed"><i class="fa fa-book" aria-hidden="true"></i>&nbsp;循证医学</a></li>
        <li><a href="evidence"><i class="fa fa-search" aria-hidden="true">&nbsp;医疗查证</i></a></li>
        <li><a href="sns"><i class="fa fa-group" aria-hidden="true">&nbsp;病友社区</i></a></li>
        <li><a href="healman"><i class="fa fa-address-card" aria-hidden="true">&nbsp;健康记录</i></a></li>
      </ul>
    </div>
  </div> <!--container-->
</nav>

<div id="index_banner">
  <img class="img-responsive bannerimg" src="imgs/index/indexbanner.png" alt="医生" >
  <div class="bannerscreen"></div>
  <div class="bannerinstru container">
    <div class="row">
      <div class="col-sm-6"></div>
      <div class="col-xs-12 col-sm-6 bannertitle"><span>基于循证医学的病友网</span></div>
    </div>
    <div class="row">
      <div class="col-sm-6"></div>
      <div class="col-xs-12 col-sm-6 bannerlink">
        <%--判断值栈中是否有user信息，值栈操作在userAction中--%>
        <s:if test="#session.LoggedInUser != null">
          <h3>您好！&emsp;<a href="patients-details?userName=#session.LoggedInUser"><s:property value="#session.LoggedInUser"/></a>&emsp;<small><a href="patients-logoff">登出</a></small></h3>
        </s:if>
        <s:else>
          <a href="patients-signup">注册</a>&emsp;&emsp;
          <a href="patients-signin">登录</a>
        </s:else>

      </div>
    </div>
  </div>
  <div class="bannerdesc"><span>为您提供可靠临床证据的患者关怀家园</span></div>
</div>
<div id="instruction" class="tab1">
  <div class="title">
    <h2>「让循证医学走近患者」</h2>
    <p>循证医学理念与病友社区的结合</p>
  </div>
  <div class="row detail">
    <%--此部分内容使用js填充--%>
<%--病友网基于患者用户需求，提供经过循证评价的医学信息，科学权威、及时更新，值得卫生工作者在内的人群采纳，是您了解医疗措施效度等相关信息的资源库。--%>
  </div>
</div>
<div id="entrance row">
  <div class="col-xm-6 col-sm-6 col-md-3 col">
    <a href="evimedshow"><img class="img-responsive" src="imgs/index/index10.png"><span>关于循证</span></a>
  </div>
  <div class="col-xm-6 col-sm-6 col-md-3 col">
    <a><img class="img-responsive" src="imgs/index/index09.png"><span>医药查证</span></a>
  </div>
  <div class="col-xm-6 col-sm-6 col-md-3 col">
    <img class="img-responsive" src="imgs/index/index11.png"><span>前往论坛</span>
  </div>
  <div class="col-xm-6 col-sm-6 col-md-3 col">
    <img class="img-responsive" src="imgs/index/index08.png"><span>我的信息</span>
  </div>
</div>
<div id="myapps" class="row">
  <div class="col col-xs-6"><img class="img-responsive" src="imgs/index/appCons.png"><a href="http://123.207.239.163:8080/myapps/ConstitutionGenius.apk">体质精灵</a></div>
  <div class="col col-xs-6"><img class="img-responsive" src="imgs/index/appDiabetes.png"><a href="http://123.207.239.163:8080/myapps/T2DMRelativeRiskEvaluation.apk">糖尿病患病风险评估</a></div>
</div>
<div class="footer" style="text-align: center;">本站内容仅供学术交流，不向您承诺任何服务。</div>

<script src="framework/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="framework/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="js/index/index.js" type="text/javascript"></script>

<!--下面是CDN引用方式,项目发布时替换使用-->
<!-- <script src="http://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script> -->
<!--<script src="https://use.fontawesome.com/2ad4a91487.js"></script>-->
<!--<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>-->
  </body>
</html>
