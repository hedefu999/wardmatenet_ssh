package com.test;

import com.google.gson.Gson;
import org.junit.Test;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hedefu on 08/10/2017.
 */
public class CommonTest {
    @Test
    public void test(){
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        System.out.println(dateFormat.format(date));
    }
    @Test
    public void testDate(){
        java.util.Date date = new java.util.Date();
        java.sql.Date sqldate = (java.sql.Date) date;
        java.util.Date date2 = sqldate;//new java.util.Date(sqldate.getTime());
    }
    @Test
    public void testJson(){
        Map<String,Object> map = new HashMap<>();
        map.put("name","jack");
        map.put("token","jack999");
        map.put("diseaList","糖尿病");
        System.out.println(new Gson().toJson(map));
        //{"name":"jack","token":"jack999","diseaList":"糖尿病"}

    }
}
