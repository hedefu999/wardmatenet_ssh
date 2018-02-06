package com.converter;

import org.apache.struts2.util.StrutsTypeConverter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.logging.Logger;

/**
 * Created by hedefu on 29/09/2017.
 */
public class BirthDateConverter extends StrutsTypeConverter {
    Logger logger = Logger.getLogger("BirthDateConverter");
    private DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    public DateFormat getDateFormat() {
        return dateFormat;
    }
    @Override
    public Object convertFromString(Map map, String[] strings, Class aClass) {
        if (aClass.getName().equals("java.sql.Date")){
            try{
                Date birth = dateFormat.parse(strings[0]);
                return new java.sql.Date(birth.getTime());
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return null;
    }
    @Override
    public String convertToString(Map map, Object o) {
        if (o instanceof java.sql.Date){
            return dateFormat.format((Date) o);
        }else {
            return "1997-01-01";
        }

    }
}
