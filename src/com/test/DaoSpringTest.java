package com.test;

import com.dao.PatientsUserDao;
import com.entity.PatientsUser;
import com.service.PatientsUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.AnnotationConfigContextLoader;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by hedefu on 30/09/2017.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:com/test/spring.xml")
@Transactional
public class DaoSpringTest {
    @Autowired
    private PatientsUserDao userDao;
    @Autowired
    private PatientsUserService userService;
    @Test
    public void userDaoTest() throws ParseException {
        PatientsUser user = new PatientsUser();
        user.setUserName("hedefu973");
        user.setUserPass("hedefu981");
        user.setEmail("hedefu973@163.com");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthdate = dateFormat.parse("1995-02-07");
        user.setBirthdate(new java.sql.Date(birthdate.getTime()));
        user.setRegdate(new java.sql.Date(new Date().getTime()));
        user.setDiseaseList("somgth,anyth");
        user.setGender("male");
        //user.setPhoneNum("18862805762");
        System.out.println(user);
        userDao.saveOrUpdate(user);
        userDao.getSession().flush();
//        Integer userId = userDao.save(user);
//        System.out.println(userId);
    }
    @Test
    public void testUserDaoCheckUserByName(){
        PatientsUser user = userDao.getUserByName("hedefu");
        System.out.println(user.getUserPass());
//        error1: Failed to instantiate [org.springframework.test.context.web.WebDelegatingSmartContextLoader]: Constructor threw exception; nested exception is java.lang.NoClassDefFoundError: javax/servlet/ServletContext
//        导入tomcat至library
//        error2：测试类加载WEB-INF下的文件有一堆毛病
//        复制文件到test文件夹下
    }
    @Test
    public void testUserDaoCheckUser(){
        PatientsUser user = new PatientsUser();
        user.setUserName("hedefu");
        user.setUserPass("hedefu999");
        System.out.println(userDao.checkUser(user));
    }
}
