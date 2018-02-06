<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="zh">
<head>
    <base href="<%=basePath%>"/>
    <title>病友社区</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-control" content="no-cache"/>
    <meta http-equiv="Cache" content="no-cache"/>
    <link rel="stylesheet" href="framework/awesomefonts/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="framework/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/rem.css"/>
    <link rel="stylesheet" href="css/navbar.css"/>
    <link rel="stylesheet" href="css/snschats.css"/>
</head>
<body>
<%--html引用路径使用basepath，图片 css资源使用/等引用在部署时找不到（版本问题），jsp不受此影响--%>
<%@include file="/pages/common/navbar.jsp"%>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1">
        <div id="vicemenu">
            <div class="row">
                <div class="col-xs-3 col-sm-2 col-md-2 col"><a class="btn btn-default " href="snshall"><i class="fa fa-hand-stop-o" aria-hidden="true">&nbsp;病友大厅</i></a></div>
                <div class="col-xs-3 col-sm-2 col-md-2 col"><a class="btn btn-primary " href="snschats"><i class="fa fa-group" aria-hidden="true">&nbsp;病友聊天</i></a><span class="badge">2</span> </div>
                <div class="col-xs-3 col-sm-2 col-md-2 col"><a class="btn btn-default " href="#"><i class="fa fa-list" aria-hidden="true">&nbsp;病友论坛</i></a></div>
                <div class="col-xs-3 col-sm-2 col-md-2 col"><a class="btn btn-default " href="#"><i class="fa fa-star-o" aria-hidden="true">&nbsp;病友动态</i></a></div>
                <div class="col-xs-0 col-sm-4 col-md-4 col"><div class="userentrance"><a href="#"> <img class="avatar" src="imgs/avatar.png"><span class="userName"><s:property value="#session.LoggedInUser"/></span></a><a href="#">&emsp;<i class="fa fa-vcard-o" aria-hidden="true">&nbsp;账户设置</i> </a></div></div>
            </div>
        </div><!-- vicemenu -->
        <div id="mainbody" class="row">
            <div class="col-sm-5 col-md-5">
                <ul id="friendstabhead" class="nav nav-tabs nav-pills">
                    <li class="active"><a href="#navgroup" data-toggle="tab">疾病群组<span class="badge">2</span></a></li>
                    <li><a href="#navfriends" data-toggle="tab">我的好友<span class="badge">3</span></a></li>
                    <li><a href="#navnotes" data-toggle="tab">证据笔记</a></li>
                </ul>
                <div id="friendstabbody" class="tab-content">
                    <div class="tab-pane fade active in" id="navgroup">
                        <div class="list-group">
                            <!-- 这里存放群组列表 -->
                            <div class="input-group">
                                <input type="text" placeholder="搜索群组" class="form-control">
                                <span class="input-group-btn"><button class="btn btn-primary"><i class="fa fa-search" aria-hidden="true"></i></button></span>
                            </div>
                            <a href="#" class="list-group-item"><div>
                                <img src="imgs/avatar01.jpg" class="img-rounded"><h4>糖尿病患者群</h4><div class="middle">小李：我儿子从印度给我带的药...</div><span class="badge">2</span><span class="last">2017-02-13</span>
                            </div></a>
                            <a href="#" class="list-group-item"><div>
                                <img src="imgs/avatar02.jpg" class="img-rounded"><h4>肝炎群</h4><div class="middle">小强：这个药有人用过吗？小强：这个药有人用过吗？</div><span class="last">昨天</span>
                            </div></a>
                            <a href="#" class="list-group-item"><div>
                                <img src="imgs/avatar04.jpg" class="img-rounded"><h4>高血压群</h4><div class="middle">小明：坚持锻炼</div><span class="last">刚刚</span>
                            </div></a>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="navfriends">
                        <div class="input-group">
                            <input type="text" placeholder="搜索好友" class="form-control">
                            <span class="input-group-btn"><button class="btn btn-primary"><i class="fa fa-search" aria-hidden="true"></i></button></span>
                        </div>
                        <a href="#" class="list-group-item"><div>
                            <img src="imgs/avatar04.jpg" class="img-rounded"><h4>小明</h4><div class="middle">小明：你好，这个药你服用了几个疗程？</div><span class="badge">1</span><span class="last">刚刚</span>
                        </div></a>
                        <a href="#" class="list-group-item"><div>
                            <img src="imgs/avatar05.jpg" class="img-rounded"><h4>大刘</h4><div class="middle">我：在吗？</div><span class="badge">2</span><span class="last">昨天</span>
                        </div></a>
                        <a href="#" class="list-group-item"><div>
                            <img src="imgs/avatar07.jpg" class="img-rounded"><h4>李老</h4><div class="middle">李老：这个帖子里提的药有相关证据吗？</div><span class="last">2017-02-13</span>
                        </div></a>
                    </div>
                    <div class="tab-pane fade rows" id="navnotes">微笔记
                        <div class="panel-group" id="tinynotes">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a href="#collapseOne" data-toggle="collapse" data-parent="#tinynotes" aria-expanded="true" class="">微记:DPP-4抑制剂</a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in" aria-expanded="true">
                                    <div class="panel-body">沙格列汀、西格列汀、维格列汀等，一般与二甲双胍联合使用。</div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a href="#collapseTwo" data-toggle="collapse" data-parent="#tinynotes" class="collapsed" aria-expanded="false">微记：无标题</a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                                    <div class="panel-body">咖啡中含有咖啡因，咖啡因可以让神经系统兴奋而造成失眠或神经紧张。而且摄取过多的咖啡因，容易发生耳鸣、心脏机能亢进，就是心脏跳动迅速、脉搏次数增加，及脉搏跳动不均，所以必须适量饮用咖啡。建议不要过量喝咖啡。</div>
                                </div>
                            </div>
                        </div>
                        收藏知识列表
                        <div class="list-group" id="favornotes">
                            <!-- 这里存放群组列表 -->
                            <a href="#" class="list-group-item"><div>
                                <img src="imgs/avatar07.jpg" class="img-rounded"><span><h4>如何加强与医生沟通</h4>收藏自用户：管理员</span><span class="last">2017-02-13</span>
                            </div></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-7 col-md-7">
                <div id="chatpanetitle">
                    <h4 class="groupName"><i class="fa fa-users">&emsp;</i></h4>
                    <a href="#" data-toggle="tooltip" title="关闭聊天窗口" class="btn btn-danger"><i class="fa fa-remove" aria-hidden="true"></i></a>
                    <a href="#" data-toggle="tooltip" title="联系人信息" class="btn btn-info"><i class="fa fa-info" aria-hidden="true"></i>&nbsp;</a>
                </div>
                <div id="chatpanebody">
                    <div class="me"><table border="0">
                        <tr><td rowspan="2"><div class="rmessage">今天医生开了个盐酸二甲双瓜片，大家有用的吗？效果怎样？</div></td>
                            <td rowspan="2"><div class="rightarrow"></div></td>
                            <td><img class="avatar img-circle" src="imgs/avatar07.jpg" alt="..."></td></tr>
                    </table></div>
                    <div class="date">2017-02-13</div>
                    <div class="others"><table border="0">
                        <tr><td><img class="avatar img-circle" src="imgs/avatar05.jpg" alt="..."></td><td rowspan="2"><div class="leftarrow"></div></td><td rowspan="2"><div class="lmessage">二甲双胍是2型糖尿病患者的一线治疗用药，如无禁忌症且能耐受药物者，二甲双胍应贯穿全程治疗。</div></td></tr>
                    </table></div>
                    <div class="others"><table border="0">
                        <tr>
                            <td><img class="avatar img-circle" src="imgs/avatar04.jpg" alt="..."><h5>heiguo</h5></td>
                            <td rowspan="2"><div class="leftarrow"></div></td>
                            <td rowspan="2"><div class="lmessage"><a href="http://www.bingyouebm.com/search?keyword=metformin">http://www.bingyouebm.com/search?keyword=metformin</a>这个地方有药物介绍</div></td>
                        </tr>
                    </table></div>
                    <div class="date">以上是历史消息</div>
                </div>
                <div id="chatpaneinput">
                    <div class="toolbox">
                        <button class="btn btn-success"><i class="fa fa-meh-o">&nbsp;选择表情</i></button>
                        <button class="btn btn-warning"><i class="fa fa-file-photo-o">&nbsp;添加图片</i></button>
                        <button class="btn btn-info"><i class="fa fa-heart"></i></button>
                        <button class="btn btn-primary send"><i class="fa fa-send-o"></i>&nbsp;发送</button>
                    </div>
                    <textarea class="form-control chatcontents" rows="5" placeholder="请输入聊天内容[Ueditor设计]"></textarea>

                </div>
            </div>
        </div>
    </div>
</div>
<script src="framework/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="framework/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="framework/neteaseim/NIM_Web_SDK_v4.1.0.js" type="text/javascript"></script>
<script src="framework/neteaseim/nimconfig.js" type="text/javascript"></script>
<script type="text/javascript" src="js/sns/snschats.js"></script>
</body>
</html>