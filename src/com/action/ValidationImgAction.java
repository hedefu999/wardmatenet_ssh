package com.action;

import com.opensymphony.xwork2.ActionSupport;
import com.utils.ValidationCode;
import com.utils.ValidationImg;
import org.apache.struts2.interceptor.SessionAware;

import java.io.ByteArrayInputStream;
import java.util.Map;

/**
 * Created by hedefu on 08/10/2017.
 */
public class ValidationImgAction extends ActionSupport implements SessionAware {
    private Map<String, Object> session;
    //图片流
    private ByteArrayInputStream imageStream;

    public ByteArrayInputStream getImageStream() {
        return imageStream;
    }

    public void setImageStream(ByteArrayInputStream imageStream) {
        this.imageStream = imageStream;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    @Override
    public String execute() throws Exception {
        String validationCode = ValidationCode.getValidationCode();
        imageStream = ValidationImg.getImageAsInputStream(validationCode);
        session.put("ValidationCode",validationCode);
        return SUCCESS;
    }
}
