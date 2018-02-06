<%--
  Created by IntelliJ IDEA.
  User: hedefu
  Date: 15/10/2017
  Time: 8:30 PM
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
    <title>医疗查证</title>
    <link rel="stylesheet" href="framework/awesomefonts/css/font-awesome.min.css">
    <link rel="stylesheet" href="framework/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="framework/bootstrap/treeview/bootstrap-treeview.min.css"/>
    <link rel="stylesheet" href="css/rem.css"/>
    <link rel="stylesheet" href="css/navbar.css"/>
    <link rel="stylesheet" href="css/evidence/evidence.css"/>
</head>
<body>
<%@include file="/pages/common/navbar.jsp"%>
<hr class="colorgraph">
<div id="firstpanel" style="display: normal;">
    <p class="title">病友网循证搜索</p>
    <p class="vicetitle">— — 您可信赖的证据库</p>
    <div class="input-group searchpanel">
        <div class="input-group-addon btn btn-default" data-toggle="dropdown" aria-expanded="false">所有类型&nbsp;<i class="fa fa-sort-desc"></i></div>
        <input type="text" class="form-control input-lg">
        <div class="input-group-addon searchbutton" style="cursor: pointer;"><i class="fa fa-search"></i>&emsp;搜   索</div>
        <ul class="dropdown-menu">
            <li><a href="#">临床指南</a></li>
            <li><a href="#">药物信息</a></li>
            <li><a href="#">卫生技术评估</a></li>
            <li><a href="#">医学常识</a></li>
            <li><a href="#">循证医学</a></li>
        </ul>
    </div>
</div>
<div id="secondpanel" style="display: none;">
    <span>病友网循证搜索&emsp;</span>
    <div class="input-group">
        <div class="input-group-addon btn btn-default" data-toggle="dropdown" aria-expanded="false">所有类型&nbsp;<i class="fa fa-sort-desc"></i></div>
        <input type="text" class="form-control">
        <div class="input-group-addon searchbutton" style="cursor: pointer;"><i class="fa fa-search"></i>&nbsp;搜 索</div>
        <ul class="dropdown-menu">
            <li><a href="#">临床指南</a></li>
            <li><a href="#">药物信息</a></li>
            <li><a href="#">卫生技术评估</a></li>
            <li><a href="#">医学常识</a></li>
            <li><a href="#">循证医学</a></li>
        </ul>
    </div>
    <div class="tools" style="display: none;"><a href="#"><i class="fa fa-star"></i>&nbsp;收藏到笔记</a>&emsp;<a href="#"><i class="fa fa-thumbs-o-up"></i>&nbsp;此内容有帮助</a>&emsp;<a href="#"><i class="fa fa-commenting-o"></i>&nbsp;评价此文章</a>&emsp;<a href="#"><i class="fa fa-share-alt"></i>&nbsp;复制文章链接</a></div>
</div>
<div class="maincontent">
    <!-- 加载loading效果 -->
    <div id="loading" style="display: none">
        <div class="mvTxt">加载中<span class="mvSq">.</span><span class="mvSq">.</span><span class="mvSq">.</span></div>
        <div class="mvBox"><img class="mvBtn" src="imgs/evidence/loadingslider.jpg"/></div>
    </div>
    <div id="searchresults" style="display: none">
        <div class="container">
            <div class="rows">
                <div class="col-xs-12 col-sm-3 col-md-3 leftcata">
                    <h4>分类筛选:</h4>
                    <div class="panel panel-default">
                        <div class="panel-heading"><h4 class="panel-title">
                            <a href="#resultschooser-catagory" data-toggle="collapse" aria-expanded="true" class="">证据类型&emsp;&emsp;<i class="fa fa-arrow-down"></i></a>
                        </h4></div>
                        <div id="resultschooser-catagory" class="panel-collapse collapse in" aria-expanded="true"><div class="panel-body">
                            <div class="checkbox-group">
                                <label class=""><input type="checkbox" value="option1" checked><big>&nbsp;临床指南</big></label>
                                <label class=""><input type="checkbox" value="option1" checked><big>&nbsp;系统评价</big></label>
                                <label class=""><input type="checkbox" value="option1"><big>&nbsp;临床试验</big></label>
                                <label class=""><input type="checkbox" value="option2" checked="checked"><big>&nbsp;药物信息&emsp;<i class="fa fa-sort-desc"></i></big>
                                </label>
                                <label class="">&emsp;<input type="checkbox" value="option2"><big>&nbsp;有效性证据</big></label>
                                <label class="">&emsp;<input type="checkbox" value="option2"><big>&nbsp;安全性证据</big></label>
                                <label class="">&emsp;<input type="checkbox" value="option2"><big>&nbsp;经济性证据</big></label>
                                <label class=""><input type="checkbox" value="option3"><big>&nbsp;患者手册</big></label>
                                <label class=""><input type="checkbox" value="option3"><big>&nbsp;卫生技术评估</big></label>
                                <label class=""><input type="checkbox" value="option3"><big>&nbsp;医药卫生政策</big></label>
                                <label class=""><input type="checkbox" value="option3"><big>&nbsp;多媒体资料</big></label>
                            </div>
                        </div></div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading"><h4 class="panel-title">
                            <a href="#resultschooser-origin" data-toggle="collapse" class="collapsed" aria-expanded="false">证据来源&emsp;&emsp;<i class="fa fa-arrow-down"></i></a>
                        </h4></div>
                        <div id="resultschooser-origin" class="panel-collapse collapse" aria-expanded="false"><div class="panel-body">
                            <label class=""><input type="checkbox" value="option1"><big>&nbsp;出版图书</big></label>
                            <label class=""><input type="checkbox" value="option1"><big>&nbsp;期刊杂志</big></label>
                            <label class=""><input type="checkbox" value="option1"><big>&nbsp;政策文件</big></label>
                        </div></div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading"><h4 class="panel-title">
                            <a href="#resultschooser-date" data-toggle="collapse" class="collapsed" aria-expanded="false">发布日期&emsp;&emsp;<i class="fa fa-arrow-down"></i></a>
                        </h4></div>
                        <div id="resultschooser-date" class="panel-collapse collapse" aria-expanded="false"><div class="panel-body">
                            <div class="radio-group">
                                <label class=""><input type="radio" value="option3" name="myradio"><big> — 2017 — </big></label>
                                <label class=""><input type="radio" value="option1" name="myradio"><big> — 近3年 — </big></label>
                                <label class=""><input type="radio" value="option2" name="myradio" checked="checked"><big> — 近5年 — </big></label>
                            </div>
                        </div></div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-9 col-md-9 rightdetails">
                    <div class="resultitems guideborder">
                        <h4><a href="#">2型糖尿病指南</a></h4>
                        <span>中华医学会II型临床糖尿病</span>
                        <div class="resultitemfoot">来源：<span>中国知网</span><span class="clinicalguide">临床指南</span><span class="date">2013</span></div>
                    </div>
                    <div class="resultitems economicborder">
                        <h4><a href="#">二甲双胍</a></h4>
                        <span>目前临床上使用的双胍类药物主要是盐酸二甲双胍。双胍类药物的主要药理作用是通过减少肝脏葡萄糖的输出和改善外周胰岛素抵抗而降低血糖。 许多国家和国际组织制定的糖尿病诊治指南中推荐二甲双胍作为2型糖尿病患者控制高血糖的一线用药和药物联合中的基本用药。</span>
                        <div class="resultitemfoot">来源：<span>期刊论文</span><span class="economic">经济性评价</span><span class="date">2016-02-16</span></div>
                    </div>
                    <div class="resultitems medicineborder">
                        <h4><a class="testmedicine">DDP-4抑制剂</a></h4>
                        <span>二肽基肽酶(DPP－4)抑制剂为首的新型口服降糖药为糖尿病的治疗带来了新的突破。2015 《美国临床内分泌医师协会(AACE/ACE)指南》中已将DPP－4抑制剂和二甲双胍一同作为基础治疗药物，并推荐为2型糖尿病治疗流程选择药物。</span>
                        <div class="resultitemfoot">来源：<span>综合查证</span><span class="medicineinfo">药物信息</span><span class="date">2017-02-13</span></div>
                    </div>
                    <div class="resultitems medicineborder">
                        <h4><a href="#">胰岛素</a></h4>
                        <span>胰岛素是由胰脏内的胰岛β细胞受内源性或外源性物质如葡萄糖、乳糖、核糖、精氨酸、胰高血糖素等的刺激而分泌的一种蛋白质激素。胰岛素是机体内唯一降低血糖的激素，同时促进糖原、脂肪、蛋白质合成。外源性胰岛素主要用来糖尿病治疗。</span>
                        <div class="resultitemfoot">来源：<span>综合查证</span><span class="medicineinfo">药物信息</span><span class="date">2017-02-13</span></div>
                    </div>
                    <div class="resultitems healthtechborder">
                        <h4><a href="#">胰岛素注射笔</a></h4>
                        <span>胰岛素治疗是实现良好血糖控制的重要环节之一，胰岛素注射笔已成为常见的胰岛素注射装置。胰岛素注射笔更易操作，是可行的且糖尿病患者易于接受的治疗模式。</span>
                        <div class="resultitemfoot">来源：<span>系统评价&nbsp;DOI:10.3969</span><span class="healthtech">卫生技术</span><span class="date">2014-01-08</span></div>
                    </div>
                    <div class="resultitems medicineborder"><h4><a href="#">磺脲类药物</a></h4>
                        <span>磺脲类药物是临床常用的口服降糖药,通过刺激、激活胰腺中胰岛β细胞,释放胰岛素,提高胰岛素敏感性,降低胰岛素抵抗 , 降低肝脏内葡萄糖的产生等机制降低血糖,改善患者代谢 </span>
                        <div class="resultitemfoot">来源：<span>期刊论文&nbsp;DOI:10.14163</span><span class="medicineinfo">药物信息</span><span class="date">2015-12-18</span></div>
                    </div>

                    <ul class="pagination">
                        <li><a href="#">«上一页</a></li><li><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li><li><a href="#">4</a></li><li><a href="#">5</a></li><li><a href="#">下一页»</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <table class="searchresults table table-hover" style="display: none;">
            <thead>
            <tr>
                <th style="width: 10rem;">药品名</th>
                <th style="">证据摘要</th>
                <th style="width: 20rem;">证据来源</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><a href="#" class="medname"></a>二甲双胍</td>
                <td>目前临床上使用的双胍类药物主要是盐酸二甲双胍。双胍类药物的主要药理作用是通过减少肝脏葡萄糖的输出和改善外周胰岛素抵抗而降低血糖。 许多国家和国际组织制定的糖尿病诊治指南中推荐二甲双胍作为2型糖尿病患者控制高血糖的一线用药和药物联合中的基本用药。</td>
                <td>中华医学会糖尿病学分会.中国2型糖尿病防治指南(2007)[J].中华医学杂志,2008,88:1227-1245.</td>
            </tr>
            <tr>
                <td><a href="#" class="medname"></a>胰岛素</td>
                <td>...</td>
                <td>...</td>
            </tr>
            <tr>
                <td><a href="details.html" target="myiframe" class="medname">DDP-4抑制剂</a></td>
                <td>...</td>
                <td>...</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<div id="details" style="display: none;">
    <div class="container"><div class="rows">
        <div class="col-xs-3 col-sm-3 col-md-3">
            <div class="menuwrapper">
                <h3>&emsp;目录导航</h3>
                <div id="contentmenu"></div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-9 col-md-9">
            <h2>总体介绍</h2>
            <p style="font-size: 1.5rem;">DPP-4抑制剂的主要作用是葡萄糖依赖性地促进胰岛素分泌，抑制胰高糖素的分泌。可降低HbA1c 0.5％一1.0％，单独使用不增加低血糖发生的风险，也不增加体重。在有肾功能不全的患者中使用，应按照药物说明书要求减少药物剂量。</p>
            <h2>EVIDEM循证评价</h2>
            <table class="searchresults table table-hover">
                <caption><h4>量化指标-药物干预措施内在价值&emsp;&emsp;&emsp;应用环境：中国大陆&emsp;&emsp;评价工具：EVIDEM框架</h4></caption>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>指标</th>
                    <th>综合信息</th>
                    <th>最低分-0</th>
                    <th>最高分-3</th>
                </tr>
                </thead>
                <tbody>
                <tr><td></td><td style="font-weight: bold;">疾病影响</td><td></td><td></td><td></td></tr>
                <tr><td>D1</td><td>疾病严重程度</td><td class="d1c">据世界卫生组织估计,2005到2015年间中国由于糖尿病及相关心血管疾病导致的经济损失达 5 577 亿美元。CDS糖尿病慢性并发症调查组报告,在三甲医院中住院的2型糖尿病患者并发症患病率分别为:高血压 34.2%、脑血管病12.6%、心血管病17.1%、下肢血管病5.2%。糖尿病会增加下肢动脉病变患者截肢的风险（RR=40），约15%的糖尿病患者最终会发生足溃疡。</td><td>不严重</td><td>非常严重</td></tr>
                <tr><td>D2</td><td>患病率</td><td class="d2c">2007至2008年CDS在我国部分地区开展的糖尿病流行病学调查显示,在20岁以上的人群中,糖尿病患病率为9.7%,糖尿病前期的比例为15.5%,糖尿病患者中仅有40%获得诊断。</td><td>罕见疾病</td><td>常见疾病</td></tr>
                <tr><td></td><td style="font-weight: bold;">干预措施背景</td><td></td><td></td><td></td></tr>
                <tr><td>C1</td><td>临床指南</td><td class="c1c">
                    中国 2型糖尿病防治指南(2013年版) ：提及DPP-4抑制剂作为辅助二甲双胍治疗的药物。<br>
                    中国肥胖和2型糖尿病外科治疗指南（2014）：未提及<br>2型糖尿病口服药物治疗临床实践指南（2012）：单药治疗，效果不及二甲双胍；与二甲双胍的联合治疗效果更明显。<br>type-2-diabetes-in-adults-management：二甲双胍不适时，可考虑DPP-4抑制剂在内的其他药物进行初始治疗。<br>
                    Diabetes guideline 2014 of American Diabetes Association: 将DPP-4抑制剂作为二线口服降糖药物。
                </td><td>不推荐</td><td>强推荐</td></tr>
                <tr><td>C2</td><td>对照方案的局限性</td><td class="c2c">二甲双胍：二甲双胍单药治疗与其他单药治疗以及联合治疗相比，降低血糖的效果更明显，且可减轻体重并改善大多数患者的血脂水平。<br>磺脲类：发生低血糖的风险较高。<br>格列奈类：常见副作用是低血糖和体重增加,但低血糖的风险和程度较磺脲类药物轻。<br>联合药物治疗：联合治疗对于降低糖化血红蛋白HbA1c水平更有效，但不良反应较多。</td><td>无局限性或很小</td><td>存在严重局限</td></tr>
                <tr><td></td><td style="font-weight: bold;">干预结果</td><td></td><td></td><td></td></tr>
                <tr><td>I1</td><td>效果的提升</td><td class="i1c">...</td><td>比对照措施差</td><td>优于对照措施</td></tr>
                <tr><td>I2</td><td>安全性和耐受度的提高</td><td class="i2c">...</td><td>低于对照措施</td><td>强于对照措施</td></tr>
                <tr><td>I3</td><td>患者报告结局指标的提升</td><td class="i3c">...</td><td>低于对照措施</td><td>强于对照措施</td></tr>
                <tr><td></td><td style="font-weight: bold;">受益类型</td><td></td><td></td><td></td></tr>
                <tr><td>T1</td><td>公众卫生利益</td><td class="t1c">...</td><td>没有降低风险</td><td>明显的风险降低</td></tr>
                <tr><td>T2</td><td>效果类型</td><td class="t2c">...</td><td>较差的效果，如仅缓解痛苦</td><td>较好的效果，如治愈</td></tr>
                <tr><td></td><td style="font-weight: bold;">经济学</td><td></td><td></td><td></td></tr>
                <tr><td>E1</td><td>卫生计划预算的影响</td><td class="e1c">...</td><td>带来额外开销</td><td>节省支出</td></tr>
                <tr><td>E2</td><td>成本效果对比</td><td class="e2c">...</td><td>低效价比</td><td>高效价比</td></tr>
                <tr><td>E3</td><td>对其他开支的影响</td><td class="e3c">...</td><td>额外增加</td><td>节约开销</td></tr>
                <tr><td></td><td style="font-weight: bold;">证据质量</td><td></td><td></td><td></td></tr>
                <tr><td>Q1</td><td>决策体需求可遵循性</td><td class="q1c">不适用于案例研究</td><td>不遵循</td><td>高度遵循</td></tr>
                <tr><td>Q2</td><td>报告证据的完整性和一致性</td><td class="q2c">...</td><td>存在分歧，不连贯</td><td>完整且一致</td></tr>
                <tr><td>Q3</td><td>证据相关性和效度</td><td class="q3c">...</td><td>低</td><td>高</td></tr>
                </tbody>
            </table>
            <table class="searchresults table table-hover" id="sectable">
                <caption><h4>定性指标-药物干预措施外在价值</h4></caption>
                <thead style="padding-top: 40px;">
                <tr>
                    <th style="width: 3rem;"></th>
                    <th style="width: 5rem;">定性指标</th>
                    <th style="width: 45rem;">综合信息</th>
                    <th style="width: 8rem;">影响和评价</th>
                </tr>
                </thead>
                <tbody>
                <tr><td></td><td style="font-weight: bold;">伦理框架</td><td></td><td></td></tr>
                <tr><td>Et1</td><td>卫生保健目标-可用性</td><td class="et1c">...</td><td>提交/查看</td></tr>
                <tr><td>Et2</td><td>机会成本-效度</td><td class="et2c">...</td><td>提交/查看</td></tr>
                <tr><td>Et3</td><td>人群获取次序-公平性</td><td class="et3c">...</td><td>提交/查看</td></tr>
                <tr><td></td><td style="font-weight: bold;">其他指标</td><td></td><td></td></tr>
                <tr><td>O1</td><td>系统容量和干预措施合理使用</td><td class="o1c">...</td><td>提交/查看</td></tr>
                <tr><td>O2</td><td>利益相关者压力</td><td class="o1c">...</td><td>提交/查看</td></tr>
                <tr><td>O3</td><td>政策/历史环境</td><td class="o1c">...</td><td>提交/查看</td></tr>
                </tbody>
            </table>
        </div>
    </div></div>
</div>
<div id="instruction" class="row">
    <div class="col-xs-3 col-md-3"><img src="imgs/evidence/ebme01.png" class="img-responsive"></div>
    <div class="col-xs-9 col-md-9 right">
        <h3 class="text-primary">查证用证</h3>
        <p class="lead">检索有关疾病的临床干预措施及其评价证据,包括临床用药、诊治技术、医疗器械等。<br>&emsp;&emsp;全球医疗工作者和科研人员的精心研究，为我们生产了大量循证证据，包括临床指南、系统评价和荟萃分析等，是您值得信赖的医疗信息源。经过我们的精心整理、设计，为广大患者提供了一个可靠的循证医疗信息服务平台。</p>
    </div>
</div>
<form method="get" action="http://www.tripdatabase.com/search" style="margin-left: auto;margin-right: auto;width: 100%;">
    <input type="text" name="criteria" placeholder="使用tripdatabase搜索专业信息" style="width:400px" />
    <input type="submit" value="搜索"/>
</form>
</div>

<script src="framework/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="framework/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="framework/bootstrap/treeview/bootstrap-treeview.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/evidence/evidence.js"></script>
</body>
</html>
