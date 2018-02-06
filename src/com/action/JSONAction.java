package com.action;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.http.HttpRequest;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.Servlet;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hedefu on 14/10/2017.
 */
public class JSONAction extends ActionSupport implements ServletRequestAware {
    private HttpServletRequest request;
    private String jsonStr;

    public String getJsonStr() {
        return jsonStr;
    }

    public String fetchUserInfo(){
        String userName = request.getParameter("userName");
        Map<String,Object> map = new HashMap<>();
        if (userName.equals("hedefu")){
            map.put("name",userName);
            map.put("token","hedefu999");
            map.put("diseaList","糖尿病,高血压");
        }else {
            map.put("name","jack");
            map.put("token","jack999");
            map.put("diseaList","糖尿病");
        }
        jsonStr = new Gson().toJson(map);
        return SUCCESS;
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }
}
