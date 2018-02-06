package com.action;

import com.opensymphony.xwork2.ActionSupport;
import com.utils.NIMHandler;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by hedefu on 07/10/2017.
 */
public class SNSAction extends ActionSupport {
    private NIMHandler nimHandler;

    public void setNimHandler(NIMHandler nimHandler) {
        this.nimHandler = nimHandler;
    }

    public String index(){
        return SUCCESS;
    }
    public String hall(){
        //服务端获取当前存在的群组
        //Map<String,String> params = new HashMap<>();
        //params.put()
        //nimHandler.proceed("chatroom/query",params);
        return "hall";
    }
    public String chats(){
        return "chats";
    }
    @Override
    public String execute() throws Exception {
        return super.execute();
    }
}
