$(function(){
	var bannerimgheight=0;
	initcontent(bannerimgheight);
	$(window).resize(function(){
		bannerimgheight = $('#index_banner .bannerimg').height();
		initcontent(bannerimgheight);
	});

	var unitImgs = new Array('imgs/index/logo.png','imgs/index/index01.png','imgs/index/index02.png','imgs/index/index07.png');
	var unitTitle = new Array('循证医学理念指导下的病友网','病友社区：患者是一家','高质量证据:患者的信息宝库','一切为了患者的福祉');
	var unitP = new Array('不同于现今大多数健康类网站，病友网基于传统社交网络，融入循证医学理念，提供科学、专业、可信赖的医疗信息。并与研究机构合作，提供特色服务。',
		'加入病友社区，交流治疗方案，用药选择，疾病体会，获取更多信息。多种互动方式，群组聊天、一对一交流，关注同类患者，了解病友选择的治疗方案。',
		'所有临床干预措施经过来自世界范围内的随机对照试验的严格评价，经转换医学将知识转换为临床实践，为患者架起通往国际前沿循证理念的桥梁。',
		'基于患者价值观，这是其与传统医学的本质区别，也是病友网功能设计的理念。引导用户了解循证医学知识，掌握获取、评价临床干预措施信息的方法。');
	var instructiondetail = $('#instruction .detail');
	for(var i=0; i < unitImgs.length; i++){
		var instructionUnit = '<div class="col-xm-12 col-sm-12 col-md-6 col"><div>' +
        '<div class="col col-xs-3"><img class="img-responsive" src="'+unitImgs[i]+'" alt="..." ></div><div class="col col-xs-9">' +
        '<h3 class="media-heading">'+unitTitle[i]+'</h3><p>'+unitP[i]+'</p></div></div></div>';
        instructiondetail.append(instructionUnit);
	}


});
var initcontent = function(imgheight){
	imgheight = $('#index_banner .bannerimg').height();
	$('#index_banner .bannerscreen').css("height",imgheight);
	$('#index_banner .bannertitle').css("padding-top",0.3*imgheight);
	$('#index_banner .bannerlink').css("padding-top",0.15*imgheight);
}