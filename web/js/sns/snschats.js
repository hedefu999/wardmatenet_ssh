/**
 * Created by hedefu on 13/10/2017.
 */
$('#navbar .nav li:nth-child(4)').addClass('active');
var colheight = $('#vicemenu .col').height();
$('#vicemenu .userentrance .avatar').css("height",colheight);
var userName = $('#vicemenu .userName').html();
$.ajax({
    type:'post',
    //滥用 / 会引起找不到的问题
    url:'ajax/fetchUserInfo',
    data:{
        //ajax使用中对象的最后一条不能加',' 否则出错但不告知位置
        userName:userName
    },
    dataType:'json',
    success:function (result) {
        //得到的result是JSONAction中的字符串，形如{"name":"***","token":"**"}
        //得到的data是一个形如{key:"value",key1:"value1"}的数据类型，然后取值出来
        var data = eval('('+result+')');
        data.userName
        data.token
        data.diseaList
        console.log(data);
    },
    error:function () {
//TAG:完成ajax查询后台的功能2017-10-15
    }
});
//此处定义两个用户
var userA = {
    account:'hedefu',
    token:'hedefu999',
};
var userB = {
    account:'linsiqin',
    token:'a1c1e073f5b84ad44be2f1b9145c036c',
};

var user = userB;

if (userName == userA.account){
    user = userA;
}
//关于网易云信
var data = {};
var chatroom = SDK.Chatroom.getInstance({
    appKey:mainCon.appKey,
    //提出聊天室登入者信息
    account:user.account,
    token:user.token,
    chatroomId:'17982990',
    chatroomAddresses:['weblink04.netease.im:443'],
    isAnoymous:true,
    onconnect:onChatroomConnect,
    onmsgs: onChatroomMsgs,
    onerror:onChatroomError
});
//jQuery函数处理主体
$(function () {

});

$('#chatpaneinput .send').click(function () {
    var chatcontents = $('#chatpaneinput .chatcontents').val();
    var msg = chatroom.sendText({
        text:chatcontents,
        done:sendChatroomMsgDone,
    });
});
function onChatroomConnect(obj) {
    //初始化UI
    $('#chatpanetitle .groupName').append(chatroom.protocol.chatroom.name);
    console.log(chatroom);
}
function onChatroomMsgs(msgs) {
    //外部消息，注意此处接收到的消息msgs是JSON数组
    $.each(msgs,function (num,msg) {
        appMsg(msg,'left');
    });
    //msgs.fromNick  msgs.time
}
function onChatroomError(error) {
    console.log('发生错误', error, obj);
}
function sendChatroomMsgDone(error, msg) {
    //自身发出
    appMsg(msg,'right');
    $('#chatpaneinput .chatcontents').val('');
}
//TAG:附上消息，并滚动到最底部
function appMsg(msg,float) {
    if (float == 'right'){
        if(msg.type == 'text'){
            var msgUI = '<div class="me"><table border="0"><tr>' +
                '<td rowspan="2"><div class="rmessage">'+msg.text+'</div></td>' +
                '<td rowspan="2"><div class="rightarrow"></div></td>' +
                '<td><img class="avatar img-circle" src="/imgs/'+msg.from+'.jpg" alt="..."><h5>'+msg.from+'</h5></td>' +
                '</tr></table></div>';
            $('#chatpanebody').append(msgUI);
        }
    }else if(float == 'left'){
        if(msg.type == 'text'){
            var msgUI = '<div class="others"><table border="0"><tr>' +
                '<td><img class="avatar img-circle" src="/imgs/'+msg.from+'.jpg" alt="..."><h5>'+msg.from+'</h5></td>' +
                '<td rowspan="2"><div class="leftarrow"></div></td>' +
                '<td rowspan="2"><div class="lmessage">'+msg.text+'</div></td></tr></table></div>';
            $('#chatpanebody').append(msgUI);
        }
    }
    //聊天窗口自动滚动至底部，scrollTop()函数进行设置，prop('scrollHeight') prop('scrollTop')都能获取
    //$('#chatpanebody').scrollTop = $('#chatpanebody').scrollHeight; 不起作用，原因不明
    $('#chatpanebody').scrollTop($('#chatpanebody').prop('scrollHeight'));
}


// var nim = SDK.NIM.getInstance({
//     //参见 Web开发集成>完整的初始化代码
//     appKey:'4443915b1d915db9ee0ac497e7bd6894',
//     account:'linsiqin',
//     token:'a1c1e073f5b84ad44be2f1b9145c036c',
//     db:false,//不开启数据库
//     onconnect:onConnect,
//     onsyncdone:onSyncDone(),
//     onwillreconnect:onWillReconnect,
//     ondisconnect:onDisconnect,
//     onerror:onError,
//     onloginportschange:onLoginPortsChange,
//     onmsg:onMessage,
// });
//        var msg = nim.sendText({
//            scene:'p2p',
//            to:'hedefu',
//            text:'hello',
//            done:function sendMsgDone(error,msg) {
//                console.log(msg);//通知
//            }
//        });
function onMessage(msg) {
    console.log(msg);
}
function onConnect(obj) {
    console.log(obj.ip);
    console.log('连接成功');
}
function onSyncDone() {
    //开始进行UI渲染
}
function onDisconnect(error) {
    console.log(error);
    if (error){
        switch (error.code){
            //此处通过UI提示断开原因
            case 302://用户名或密码错误
                break;
            case 417://重复操作
                break;
            case 'kicked':
                break;
            default:
                break;
        }
    }
}
function onError(error) {
    console.log(error);
}
function onLoginPortsChange(loginPorts) {
    console.log('当前账户在其他设备上登录',loginPorts);
}
function addFriendDone(error, obj) {
    console.log(error);
    console.log(obj);
    console.log('直接加为好友'+(!error?'成功':'失败'));
}
function getFriendsDone(error, friends) {
    console.log('获取好友列表'+(!error?'成功':'失败'),error,friends)
}