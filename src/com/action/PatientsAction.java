package com.action;

import com.entity.PatientsUser;
import com.interceptor.LoginInterceptor;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.service.PatientsUserService;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Logger;

/**
 * Created by hedefu on 28/09/2017.
 */
@Controller
public class PatientsAction extends ActionSupport implements RequestAware,SessionAware,Preparable,ModelDriven<PatientsUser>{
    Logger logger = Logger.getLogger("userAction");
    private Map<String,Object> request;
    private PatientsUser user;
    private PatientsUserService userService;
    private String selectedDisease;
    private List<String> diseaseList;
    private Map<String,String> gendermap;
    private String message;
    private Map<String, Object> session;
    private String validationCode;
    private String checkUserPass;

    public String getCheckUserPass() {
        return checkUserPass;
    }

    public void setCheckUserPass(String checkUserPass) {
        this.checkUserPass = checkUserPass;
    }

    public void setValidationCode(String validationCode) {
        this.validationCode = validationCode;
    }
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    public Map<String, String> getGendermap() {
        gendermap = new HashMap<>();
        gendermap.put("male","男");
        gendermap.put("female","女");
        return gendermap;
    }

    public void setUserService(PatientsUserService userService) {
        this.userService = userService;
    }

    public List<String> getDiseaseList() {
        String[] diseases = {"糖尿病","高血压","心血管疾病","慢性肝病"};
        diseaseList = Arrays.asList(diseases);
        return diseaseList;
    }

    public void setUser(PatientsUser user) {
        this.user = user;
    }

    public PatientsUser getUser() {
        return user;
    }

    public String signup(){
        session.put("diseaseList",getDiseaseList());
        return "signup";
    }
    public String signin(){
        return "signin";
    }
    public String logon(){
        //在此处使用session实现登录成功后跳转到之前页面：
        String valiCodeInSession = (String) session.get("ValidationCode");
        if (valiCodeInSession.equals(validationCode)){
            if (userService.checkUserExist(user)){
                session.put(LoginInterceptor.USER_HANDLE,user.getUserName());
                return "signinsuccess";
            }else {
                session.put("message","用户名或密码错误");
                return "signin"; //返回登录页面
            }
        }else {
            session.put("message","验证码错误");
            return "signin";
        }
    }
    private String userName;

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String details(){
        return "details";
    }
    public void prepareDetails(){
        setUser(userService.getUserByName(userName));
    }
    public String logoff(){
        //被struts2包装的session没有invalidate方法，不同于HttpSession
        session.clear();
        user = null;
        //session.remove("LoggedInUser"); 选择性清除
        return "index";
    }
    public String save(){
        String valiCodeInSession = (String) session.get("ValidationCode");
        if (valiCodeInSession.equals(validationCode)){
            userService.saveOrUpdate(user);
            user = null;
            return "signupsuccess";
        }else {
            session.put("message","验证码错误");
            return "signup";
        }

    }
    //处理要持久化的User的其他属性
    public void prepareSave(){
        //selectedDisease.trim().split(",");转为String[]的方法
        user.setDiseaseList(selectedDisease);
        user.setRegdate(new java.sql.Date(new Date().getTime()));
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.request = map;
    }

    @Override
    //此方法配置为不执行（共用一个prepare方法显得凌乱），但必须实现
    public void prepare() throws Exception { logger.info("preparing...");  }

    @Override
    //将user存入值栈，便于jsp页面调用
    public PatientsUser getModel() {
        logger.info("user obtained: "+user);
        return user;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }
    //方法执行顺序：prepareXXX prepare getModel XXX
}
