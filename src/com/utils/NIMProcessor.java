package com.utils;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by hedefu on 12/10/2017.
 * OnlyFor Junit Test
 */
public class NIMProcessor {
    private static CloseableHttpClient httpClient = HttpClients.createDefault();
    private static String appKey = "4443915b1d915db9ee0ac497e7bd6894";
    private static String appSecret = "7fe2822bf894";
    private static String nonce =  "9875123460";//随机数
    private static HttpPost getProcessedHttpPost(String actionName){
        String url = "https://api.netease.im/nimserver/"+actionName+".action";
        HttpPost httpPost = new HttpPost(url);
        String curTime = String.valueOf((new Date()).getTime() / 1000L);
        String checkSum = CheckSumBuilder.getCheckSum(appSecret, nonce ,curTime);
        httpPost.addHeader("AppKey", appKey);
        httpPost.addHeader("Nonce", nonce);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        return httpPost;
    }
    public static String proceed(String actionName, Map<String,String> params){
        HttpPost httpPost = getProcessedHttpPost(actionName);
        //对传过来的Map重新包装
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        for (String key : params.keySet()){
            nvps.add(new BasicNameValuePair(key,params.get(key)));
        }
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));
            HttpResponse response = httpClient.execute(httpPost);
            return EntityUtils.toString(response.getEntity(), "utf-8");
        }catch (Exception e){
            e.printStackTrace();
            return "0";
        }

    }
}
