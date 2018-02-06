<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: hedefu
  Date: 21/09/2017
  Time: 3:24 PM
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
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>循证医学</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="framework/awesomefonts/css/font-awesome.min.css">
    <link rel="stylesheet" href="framework/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/rem.css"/>
    <link rel="stylesheet" href="css/navbar.css" type="text/css">
    <link rel="stylesheet" href="css/evimed/evimed.css" type="text/css"/>
</head>
<body>
<%@include file="/pages/common/navbar.jsp"%>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1">
        <div id="vicemenu">
            <div class="row">
                <div class="col-xs-3 col-sm-2 col-md-2 col"><a class="btn btn-primary" href="#"><i class="fa fa-binoculars" aria-hidden="true">&nbsp;关于循证医学</i></a></div>
                <div class="col-xs-3 col-sm-2 col-md-2 col"><a class="btn btn-default " href="#"><i class="fa fa-book" aria-hidden="true">&nbsp;专业术语</i></a></div>
                <div class="col-xs-3 col-sm-2 col-md-2 col"><a class="btn btn-default " href="#"><i class="fa fa-wrench" aria-hidden="true">&nbsp;循证实践</i></a></div>
                <div class="col-xs-3 col-sm-2 col-md-2 col"><a class="btn btn-default " href="#"><i class="fa fa-gavel" aria-hidden="true">&nbsp;卫生技术评估</i></a></div>
                <div class="col-xs-0 col-sm-4 col-md-4 col"><div class="userentrance"><a href="#"> <img class="avatar" src="imgs/avatar.png">&emsp;<s:property value="#session.LoggedInUser"/></a><a href="#">&emsp;</a></div></div>
            </div>
        </div><!-- vicemenu -->
        <div class="row">
            <div class="col col-xs-4"><img class="img-responsive" src="imgs/evimed/evimedbanner.jpg"></div>
            <div class="col col-xs-8"><h3><a>卫生技术评估</a></h3><p>卫生技术包括药物、医疗器械、卫生材料、医疗方案、医学信息系统、后勤支持系统和行政管理体系等。卫生技术评估是指对卫生技术的技术特性、临床安全性、有效性（效能、效果和生存质量）、经济学特性（成本-效果、成本-效益、成本-效用）和社会适应性进行全面系统的评价。</p>
                <div style="float:right;"><a>研究人员A</a>&emsp;<a>2017-09-18</a>&emsp;<a>[最新术语解释]</a></div></div>
        </div>
        <div class="row" style="margin:1rem;">
            <div class="col col-xs-7">按汉语拼音首字母查找：<span><a href="#">A</a>&emsp;<a href="#">B</a>&emsp;<a href="#">C</a>&emsp;<a href="#">D</a>&emsp;<a href="#">E</a>&emsp;<a href="#">F</a>&emsp;<a href="#">G</a>&emsp;<a href="#">H</a>&emsp;<a href="#">I</a>&emsp;<a href="#">J</a>&emsp;<a href="#">K</a>&emsp;<a href="#">L</a>&emsp;<a href="#">M</a>&emsp;<a href="#">N</a></span></div>
            <div><input><button>搜索术语</button></div>
        </div>
        <div class="tab-pane" id="glossary">
            <div id="fluidcontainer">
                <div class="klcard"><h4>RCT-随机对照试验</h4><hr><p>是一种对医疗卫生服务中的某种疗法或药物的效果进行检测的手段，特别常用于医学、药学、护理学研究中，在司法、教育、社会科学等其他领域也有所应用。基本方法是，将研究对象随机分组，对不同组实施不同的干预，以对照效果的不同。RCT的特征为：1、随机分组 2、设置对照 3、施加干预 4、具有前瞻性 5、论证强度为最强</p><img src="imgs/evimed/knowledge02.gif" class="img img-responsive"><p></p><a href="#"><i class="fa fa-star"></i>&nbsp;收藏到笔记</a>&emsp;<a href="#"><i class="fa fa-comment"></i>&nbsp;添加评论</a>&emsp;<a href="#"><i class="fa fa-share"></i>&nbsp;分享</a></div>
                <div class="klcard"><h4>PICOS原则</h4><hr>分别是：<p>P(populations)：关注什么样的人群/患者；</p><p>I(intervention)：采取什么样的干预措施；</p><p>C(compare)：对照措施是什么；</p><p>O(outcomes)：结局指标有哪些；</p><p>S(study)：纳入哪些研究设计</p><p>基于PICOS原则对临床问题进行拆分。</p><p>如一个不良事件问题：一名50岁老年男性患者，有心肌梗死史。患者几年来一直服用索他洛尔治疗期前收缩。根据网上信息，担心长期服用索他洛尔会导致其他心律失常。拆分后表述为：对有心肌梗死史的期前收缩患者，使用索他洛尔治疗是否会增加死亡风险。</p><a href="#"><i class="fa fa-star"></i>&nbsp;收藏到笔记</a>&emsp;<a href="#"><i class="fa fa-comment"></i>&nbsp;添加评论</a>&emsp;<a href="#"><i class="fa fa-share"></i>&nbsp;分享</a></div>
                <div class="klcard"><h4>Meta分析</h4><hr><p>Meta分析是对相同主题的一组同质性符合要求的文献量化分析。以同一主题的多项独立研究的结果为研究对象，在严格设计的基础上，运用适当的统计学方法对多个研究结果进行系统、客观、定量的综合分析。</p><img class="img img-responsive" src="imgs/evimed/knowledge01.jpg"><p>meta分析的步骤有提出问题，制定研究计划；检索收集文献；筛选纳入文献；提取纳入文献的数据信息并描述特征；纳入文献的质量评价；资料的统计学处理；敏感性分析；结果的分析与讨论。</p><a href="#"><i class="fa fa-star"></i>&nbsp;收藏到笔记</a>&emsp;<a href="#"><i class="fa fa-comment"></i>&nbsp;添加评论</a>&emsp;<a href="#"><i class="fa fa-share"></i>&nbsp;分享</a></div>
                <div class="klcard"><h4>队列研究-Cohort Study</h4><hr><p>队列研究是将某一特定人群按是否暴露于某可疑因素或暴露程度分为不同的亚组，追踪观察两组或多组成员结局（如疾病）发生的情况，比较各组之间结局发生率的差异，从而判定这些因素与该结局之间有无因果关联及关联程度的一种观察性研究方法。</p><p>队列研究的基本原理是在一个特定人群中选择所需的研究对象，根据目前或过去某个时期是否暴露于某个待研究的危险因素，或其不同的暴露水平而将研究对象分成不同的组，如暴露组和非暴露组，高剂量暴露组和低剂量暴露组等，随访观察一段时间，检查并登记各组人群待研究的预期结局的发生情况，比较各组结局的发生率，从而评价和检验危险因素与结局的关系。</p><a href="#"><i class="fa fa-star"></i>&nbsp;收藏到笔记</a>&emsp;<a href="#"><i class="fa fa-comment"></i>&nbsp;添加评论</a>&emsp;<a href="#"><i class="fa fa-share"></i>&nbsp;分享</a></div>
                <div class="klcard"><h4>系统评价-Systematic Review</h4><hr><img class="img img-responsive" src="imgs/evimed/knowledge03.png"><p>系统评价(systematic reviews)是对新开发的或改建的系统，根据预定的系统目标，用系统分析的方法，从技术、经济、社会、生态等方面对系统设计的各种方案进行评审和选择，以确定最优或次优或满意的系统方案。由于各个国家社会制度、资源条件、经济发展状况、教育水平和民族传统等各不相同，所以没有统一的系统评价模式。评价项目、评价标准和评价方法也不尽相同。</p><p>系统评价一般包括：①明确系统方案的目标体系和约束条件，②确定评价项目和指标体系，③制定评价方法并收集有关资料，④可行性研究，⑤技术经济评价，⑥综合评价。</p><a href="#"><i class="fa fa-star"></i>&nbsp;收藏到笔记</a>&emsp;<a href="#"><i class="fa fa-comment"></i>&nbsp;添加评论</a>&emsp;<a href="#"><i class="fa fa-share"></i>&nbsp;分享</a></div>
                <!-- duplicated -->
                <div class="klcard"><h4>RCT-随机对照试验</h4><hr><p>是一种对医疗卫生服务中的某种疗法或药物的效果进行检测的手段，特别常用于医学、药学、护理学研究中，在司法、教育、社会科学等其他领域也有所应用。基本方法是，将研究对象随机分组，对不同组实施不同的干预，以对照效果的不同。RCT的特征为：1、随机分组 2、设置对照 3、施加干预 4、具有前瞻性 5、论证强度为最强</p><img src="imgs/evimed/knowledge02.gif" class="img img-responsive"><p></p><a href="#"><i class="fa fa-star"></i>&nbsp;收藏到笔记</a>&emsp;<a href="#"><i class="fa fa-comment"></i>&nbsp;添加评论</a>&emsp;<a href="#"><i class="fa fa-share"></i>&nbsp;分享</a></div>
                <div class="klcard"><h4>PICOS原则</h4><hr>分别是：<p>P(populations)：关注什么样的人群/患者；</p><p>I(intervention)：采取什么样的干预措施；</p><p>C(compare)：对照措施是什么；</p><p>O(outcomes)：结局指标有哪些；</p><p>S(study)：纳入哪些研究设计</p><p>基于PICOS原则对临床问题进行拆分。</p><p>如一个不良事件问题：一名50岁老年男性患者，有心肌梗死史。患者几年来一直服用索他洛尔治疗期前收缩。根据网上信息，担心长期服用索他洛尔会导致其他心律失常。拆分后表述为：对有心肌梗死史的期前收缩患者，使用索他洛尔治疗是否会增加死亡风险。</p><a href="#"><i class="fa fa-star"></i>&nbsp;收藏到笔记</a>&emsp;<a href="#"><i class="fa fa-comment"></i>&nbsp;添加评论</a>&emsp;<a href="#"><i class="fa fa-share"></i>&nbsp;分享</a></div>
                <div class="klcard"><h4>Meta分析</h4><hr><p>Meta分析是对相同主题的一组同质性符合要求的文献量化分析。以同一主题的多项独立研究的结果为研究对象，在严格设计的基础上，运用适当的统计学方法对多个研究结果进行系统、客观、定量的综合分析。</p><img class="img img-responsive" src="imgs/evimed/knowledge01.jpg"><p>meta分析的步骤有提出问题，制定研究计划；检索收集文献；筛选纳入文献；提取纳入文献的数据信息并描述特征；纳入文献的质量评价；资料的统计学处理；敏感性分析；结果的分析与讨论。</p><a href="#"><i class="fa fa-star"></i>&nbsp;收藏到笔记</a>&emsp;<a href="#"><i class="fa fa-comment"></i>&nbsp;添加评论</a>&emsp;<a href="#"><i class="fa fa-share"></i>&nbsp;分享</a></div>
                <div class="klcard"><h4>队列研究-Cohort Study</h4><hr><p>队列研究是将某一特定人群按是否暴露于某可疑因素或暴露程度分为不同的亚组，追踪观察两组或多组成员结局（如疾病）发生的情况，比较各组之间结局发生率的差异，从而判定这些因素与该结局之间有无因果关联及关联程度的一种观察性研究方法。</p><p>队列研究的基本原理是在一个特定人群中选择所需的研究对象，根据目前或过去某个时期是否暴露于某个待研究的危险因素，或其不同的暴露水平而将研究对象分成不同的组，如暴露组和非暴露组，高剂量暴露组和低剂量暴露组等，随访观察一段时间，检查并登记各组人群待研究的预期结局的发生情况，比较各组结局的发生率，从而评价和检验危险因素与结局的关系。</p><a href="#"><i class="fa fa-star"></i>&nbsp;收藏到笔记</a>&emsp;<a href="#"><i class="fa fa-comment"></i>&nbsp;添加评论</a>&emsp;<a href="#"><i class="fa fa-share"></i>&nbsp;分享</a></div>
                <div class="klcard"><h4>系统评价-Systematic Review</h4><hr><img class="img img-responsive" src="imgs/evimed/knowledge03.png"><p>系统评价(systematic reviews)是对新开发的或改建的系统，根据预定的系统目标，用系统分析的方法，从技术、经济、社会、生态等方面对系统设计的各种方案进行评审和选择，以确定最优或次优或满意的系统方案。由于各个国家社会制度、资源条件、经济发展状况、教育水平和民族传统等各不相同，所以没有统一的系统评价模式。评价项目、评价标准和评价方法也不尽相同。</p><p>系统评价一般包括：①明确系统方案的目标体系和约束条件，②确定评价项目和指标体系，③制定评价方法并收集有关资料，④可行性研究，⑤技术经济评价，⑥综合评价。</p><a href="#"><i class="fa fa-star"></i>&nbsp;收藏到笔记</a>&emsp;<a href="#"><i class="fa fa-comment"></i>&nbsp;添加评论</a>&emsp;<a href="#"><i class="fa fa-share"></i>&nbsp;分享</a></div>
            </div>
    </div>
</div>

<script src="framework/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="framework/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="framework/cascadefluid/mp.mansory.min.js" type="text/javascript"></script>
<script>
    $(function () {
        $('#navbar .nav li:nth-child(2)').addClass('active');
        var colheight = $('#vicemenu .col').height();
        $('#vicemenu .userentrance .avatar').css("height",colheight);
        $("#fluidcontainer").mpmansory({
            childrenClass: 'klcard', // default is a div
            columnClasses: 'padding', //add classes to items
            breakpoints:{lg: 4, md: 4, sm: 6, xs: 12},
            distributeBy: { order: false, height: false, attr: 'data-order', attrOrder: 'asc' }, //default distribute by order, options => order: true/false, height: true/false, attr => 'data-order', attrOrder=> 'asc'/'desc'
            onload: function (items) {
                //make somthing with items
            }
        });
    });
</script>
</body>
</html>
