package com.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.StrutsStatics;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * Created by hedefu on 07/10/2017.
 * 通过拦截器MethodFilterInterceptor实现在struts.xml中配置拦截的action的方法
 */
public class LoginInterceptor extends MethodFilterInterceptor{
    private static final Log log = LogFactory.getLog(LoginInterceptor.class);
    public static final String USER_HANDLE = "LoggedInUser";

    @Override
    public void destroy() {

    }

    @Override
    public void init() {
        log.info("MethodFilterInterceptor拦截器初始化中。。。");
    }

    @Override
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
        final ActionContext context = actionInvocation.getInvocationContext();
        Map session = context.getSession();
        Object user = session.get(USER_HANDLE);
        String actionName = actionInvocation.getAction().getClass().getName();
        //在这里配置拦截指定的action ClassName
        String[] actionClassToBeIntecepted = {"com.action.PatientsAction",
                "com.action.SNSAction","com.action.HealManAction"};
        List nameList = Arrays.asList(actionClassToBeIntecepted);
        if (nameList.contains(actionName) && user == null){
            context.getSession().put("message","请您先登录!");
            return "signin";
        }else {
            return actionInvocation.invoke();
        }
    }
}
