package com.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.RequestAware;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * Created by hedefu on 28/09/2017.
 * 此action仅由index页面执行
 */
public class IndexAction extends ActionSupport implements RequestAware{

    private Map<String,Object> request;

    @Override
    public String execute() throws Exception {
        return super.execute();
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.request = map;
    }
}
