package com.test;

import com.utils.CheckSumBuilder;
import com.utils.NIMHandler;
import com.utils.NIMProcessor;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.junit.Test;

import java.util.*;

/**
 * Created by hedefu on 09/10/2017.
 */
public class NIMTest {
    CloseableHttpClient httpClient = HttpClients.createDefault();
    String appKey = "4443915b1d915db9ee0ac497e7bd6894";
    String appSecret = "7fe2822bf894";
    String nonce =  "9875123460";//随机数
    @Test
    public void test() throws Exception{
        String actionName="msg/sendMsg";
        String url = "https://api.netease.im/nimserver/"+actionName+".action";
        HttpPost httpPost = new HttpPost(url);

        String curTime = String.valueOf((new Date()).getTime() / 1000L);
        String checkSum = CheckSumBuilder.getCheckSum(appSecret, nonce ,curTime);//参考 计算CheckSum的java代码

        // 设置请求的header
        httpPost.addHeader("AppKey", appKey);
        httpPost.addHeader("Nonce", nonce);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        // 设置请求的参数
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        //accid 应用内唯一，相当于userName
        nvps.add(new BasicNameValuePair("ope","0"));
        nvps.add(new BasicNameValuePair("from","hedefu"));
        nvps.add(new BasicNameValuePair("to","linsiqin"));
        nvps.add(new BasicNameValuePair("type","0"));
        nvps.add(new BasicNameValuePair("body","{'msg':'testSendMessage!'}"));
        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

        // 执行请求
        HttpResponse response = httpClient.execute(httpPost);

        // 打印执行结果
        System.out.println(EntityUtils.toString(response.getEntity(), "utf-8"));
    }
    @Test
    public void testCreateTeam() throws Exception {
        String actionName="team/create";
        String url = "https://api.netease.im/nimserver/"+actionName+".action";
        HttpPost httpPost = new HttpPost(url);

        String curTime = String.valueOf((new Date()).getTime() / 1000L);
        String checkSum = CheckSumBuilder.getCheckSum(appSecret, nonce ,curTime);//参考 计算CheckSum的java代码

        // 设置请求的header
        httpPost.addHeader("AppKey", appKey);
        httpPost.addHeader("Nonce", nonce);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        // 设置请求的参数
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        //accid 应用内唯一，相当于userName
        nvps.add(new BasicNameValuePair("ope","0"));
        nvps.add(new BasicNameValuePair("from","hedefu"));
        nvps.add(new BasicNameValuePair("to","linsiqin"));
        nvps.add(new BasicNameValuePair("type","0"));
        nvps.add(new BasicNameValuePair("body","{'msg':'testSendMessage!'}"));
        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

        // 执行请求
        HttpResponse response = httpClient.execute(httpPost);

        // 打印执行结果
        System.out.println(EntityUtils.toString(response.getEntity(), "utf-8"));
    }
    @Test
    public void testShowTeams(){
        Map<String,String> params = new HashMap<>();
        params.put("ope","0");
        try {
            System.out.println(NIMProcessor.proceed("team/query",params));
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @Test
    public void testCreateChatroom(){
        Map<String,String> params = new HashMap<>();
        params.put("creator","hedefu");
        params.put("name","高血压群");
        params.put("annnouncement","各位好，欢迎加入患者大家庭，大家可以再这里畅所欲言，交流自身患病经历和体验。严禁发布广告及一切夸大、虚假信息！违者踢出");
        System.out.println(NIMProcessor.proceed("chatroom/create",params));
    }
    @Test
    public void getChatroomAddress(){
        Map<String,String> params = new HashMap<>();
        params.put("roomid","17982990");
        params.put("accid","hedefu");
        System.out.println(NIMProcessor.proceed("chatroom/requestAddr", params));
    }
}
