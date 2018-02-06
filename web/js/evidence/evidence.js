/**
 * Created by hedefu on 15/10/2017.
 */
//fix second searchbox to the top of the window
var fixsecondpanel = function(){
    var secondpanel = $('#secondpanel');
    var startpos = secondpanel.offset().top;
    var height = secondpanel.height();
    $.event.add(window,"scroll",function(){
        var scrolldistance = $(window).scrollTop();
        $(secondpanel).css('position',((scrolldistance+height>startpos)?'fixed':'static'));
        $(secondpanel).css('top',((scrolldistance+height>startpos)?'0px':''));
    });
}
// icheck checkbox and radio initialization
$(document).ready(function(){
    // $('#resultschooser-catagory input').iCheck({
    //     checkboxClass: 'icheckbox_square-green',increaseArea: '20%' // optional
    // });
    // $('#resultschooser-origin input').iCheck({
    //     checkboxClass: 'icheckbox_square-orange',increaseArea: '20%' // optional
    // });
    // $('#resultschooser-date input').iCheck({
    //     checkboxClass: 'icheckbox_square-green',radioClass: 'iradio_square-blue',increaseArea: '20%' // optional
    // });
});
//treeview of contents,evidence articles,namely.
var articlemenu = [{
    text: '药物介绍',href: '#parent4',tags: ['0']
},{
    text: '药物分析',href: '#parent1',tags: ['4'],
    nodes: [{
        text: '药理分析',href: '#child1',tags: ['2'],
        nodes: [{
            text: '作用',href: '#grandchild1',tags: ['0']
        },{
            text: 'sinomed',href: '#grandchild2',tags: ['0']
        }]
    },{
        text: '毒理分析',href: '#child2',tags: ['0']
    }]
},{
    text: '适应症',href: '#parent2',tags: ['0']
},{
    text: '不良反应',href: '#parent2',tags: ['0']
},{
    text: '经济学评价',href: '#parent4',tags: ['0']
},{
    text: 'EVIDEM循证评价',href: '#sectable',tags: ['0']
},{
    text: '参考文献',href: '#parent5',tags: ['0']
}];
//generate a treeview
$('#contentmenu').treeview({
    color: "#428bca",
    expandIcon: 'fa fa-chevron-circle-right',
    collapseIcon: 'fa fa-chevron-circle-down',
    nodeIcon: 'fa fa-bookmark-o',
    data: articlemenu
});
//fix this treeview to the top of the window
var fixdetailsdir = function(){
    var height = $('#secondpanel').height();
    var menutitle = $('#details .menuwrapper');
    //menutitle.offset().top;//元素的hide remove操作使得这里获取的值始终为0，导致bug，这里使用了绝对值
    var startpos = 100;
    $.event.add(window,"scroll",function(){
        var scrolldistance = $(window).scrollTop();
        //调试用。。。
        // $('#secondpanel span').html(scrolldistance+'-start-'+startpos+'-panelheight-'+height);
        if(scrolldistance+height>startpos){
            $(menutitle).css('position','fixed');$(menutitle).css('top', '4.5rem');$(menutitle).css('width','19%');
        }else{
            $(menutitle).css('position','initial');$(menutitle).css('top','');$(menutitle).css('width','100%');
        }
    });
}
// $('#details .col-md-9 thead tr th').css('width','5rem');
var delta=200;
function autoMove(){
    delta++;
    if(delta>650){
        delta=200;
    }
    $(".mvBtn").css("left",delta);
}
setInterval(autoMove,8);
var deNum=0;
function autoTsq(){
    $(".mvSq").css("color","#F5FAFD");
    setTimeout(function(){$(".mvSq").eq(0).css("color","#29B6FF")},0);
    setTimeout(function(){$(".mvSq").eq(1).css("color","#29B6FF")},500);
    setTimeout(function(){$(".mvSq").eq(2).css("color","#29B6FF")},1000);
}
setInterval(autoTsq,1500);
$(function(){
    $('#firstpanel .searchbutton').click(function(){
        //显示搜素结果
        $('#loading').show();
        setTimeout(function(){
            $('#firstpanel').hide();$('#loading').hide();$('#instruction').hide();
            $('#secondpanel').show();$('#searchresults').show();
            fixsecondpanel();fixdetailsdir();},1000)
    });
    $('#secondpanel .searchbutton').click(function(){
        //任意搜素
    });
    $('#searchresults .testmedicine').click(function(){
        //展示药物信息
        $('#searchresults').hide();
        $('#loading').show().css('margin-top','10rem');
        setTimeout(function(){
            $('#loading').hide();$('#details').show();$('#secondpanel .tools').show();
        },1000);
    });
});