/**
 * Created by hedefu on 08/10/2017.
 */
/**
 * Created by hedefu on 27/09/2017.
 */
$(function(){
    $('input[data-toggle]').tooltip();
    $('input.form-control.input-lg').after('<i class="form-control-feedback icon-large"></i><div class="help-block with-errors"></div>');
    $('#validationRow .validationImg').click(function(){
        //使用时间戳防止浏览器认为是同一张图片，而从缓存中读取
        $(this).attr("src","validationCodeImg?timestamp="+new Date().getTime());
    });
    $('#birthdate').datepicker({format:'yyyy-mm-dd',language:'zh-CN'});
    $('#birthdate').datepicker('setStartDate','1917-01-01');
    $('#birthdate').datepicker('setEndDate','2018-01-01');

    $('#passinput').keyup(function(){
        if ($('#passrankbar').is(':hidden')) {$('#passrankbar').show();}
        var password = this.value;
        //第1种计算密码强度的方法：正则表达式匹配
        //var regex4checkcipher = ['[a-zA-Z0-9_]/g','[a-zA-Z]','[0-9]'];
        var barclass = ['progress-bar-danger','progress-bar-warning','progress-bar-info','progress-bar-success'];
        var barwidth = ['width:20%;','width:40%;','width:70%;','width:100%;'];
        var rank = ['极低','低','中','高'];
        if(password.length>6){ //长度达到6位即开始评价
            var ranknum = getPassRankNum(password);
            $('#passrank').html(rank[ranknum]);
            $('#cipherstrength').attr('class',barclass[ranknum]);
            $('#cipherstrength').addClass('progress-bar');
            $('#cipherstrength').attr('style',barwidth[ranknum]);
        }else{
            $('#cipherstrength').attr('class','progress-bar progress-bar-danger');
            $('#passrank').html(rank[0]);
            $('#cipherstrength').attr('style',barwidth[0]);
            $('#passrankbar').hide();
        }

    });
    //validate.js可以检查radiobutton是否勾选一个，但不能检查checkbox group至少选择一个（需要修改源码？）
    //此处通过在html中添加带有required域的hidden input实现至少勾选一个checkbox时，hiddeninput内容将不为空
    $('#checkdisease :checkbox').change(function(){
        if ($('#checkdisease :checkbox').filter(':checked').length) {
            $('#checkdisease .hiddencheck').val('checked');
        }else{
            $('#checkdisease .hiddencheck').val('');
        }
    });
});

// 计算密码强度的算法，在字符串长>8时，对每个字母检视，数字记0001，小写记0010，大写记0100，特殊字符记1000（通过charType(text.charCodeAt(i))）
function getPassRankNum(password){
    var result = 0;//result表示每个字母检视结果的或值，是一个4位二进制数
    var length = password.length;
    for (var i = password.length - 1; i >= 0; i--) {
        //charCodeAt获取字符Unicode码，字母数字分别位于不同连续的数字段
        result |= charType(password.charCodeAt(i));
    }
    //ranknum就是result里有几个1，1-4
    var ranknum = -1;
    for (var i = 0; i <= 4; i++){
        if (result & 1) {ranknum ++;}
        result = result >>> 1;
    }
    //强度为中的密码在长度超过10位时判为高
    if (ranknum == 2) {if (length > 12) ranknum++;}
    return ranknum;
}
function charType(num){
    if(num >= 48 && num <= 57){
        return 1;//0001
    }
    if (num >= 97 && num <= 122) {
        return 2;//0010
    }
    if (num >= 65 && num <= 90) {
        return 4;//0100
    }
    return 8;//1000
}

