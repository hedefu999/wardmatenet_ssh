<%--被引入页面加这一句可防止乱码--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav id="navbar" class="navbar navbar-default navabr-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a id="navbar-logo" class="navbar-brand" href="index.html"><img src="imgs/index/logo.png" alt="病友网"></a>
            <a href="index.html" class="navbar-brand">病 友 网</a>
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
                <li><a href="index"><i class="fa fa-home" aria-hidden="true">&nbsp;首  页</i></a></li>
                <li><a href="evimed"><i class="fa fa-book" aria-hidden="true"></i>&nbsp;循证医学</a></li>
                <li><a href="evidence"><i class="fa fa-search" aria-hidden="true">&nbsp;医疗查证</i></a></li>
                <li><a href="sns"><i class="fa fa-group" aria-hidden="true">&nbsp;病友社区</i></a></li>
                <li><a href="healman"><i class="fa fa-vcard" aria-hidden="true">&nbsp;健康管理</i></a></li>
            </ul>
        </div>
    </div> <!--container-->
</nav>
