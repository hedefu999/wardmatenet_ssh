package com.utils;

import java.util.Arrays;

/**
 * Created by hedefu on 08/10/2017.
 */
public class ValidationCode {
    public enum SecurityLevel{Simple,Medium,Hard}
    private static char[] codeUnits = {'1','2','3','4','5','6','7','8','9','0','q','w','e','r','t','y','u','i','o','p','a','s','d','f','g','h','j','k','l','z','x','c','v','b','n','m','Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J','K','L','Z','X','C','V','B','N','M'};
    public static String getValidationCode(){
        return getValidationCode(4,SecurityLevel.Medium,false);
    }
    public static String getValidationCode(int length, SecurityLevel level, boolean repeatability){
        char[] codes = null;
        if (level == SecurityLevel.Simple){
            codes = Arrays.copyOfRange(codeUnits,0,10);
        }else if (level == SecurityLevel.Medium){
            codes = Arrays.copyOfRange(codeUnits,0,36);
        }
        int n = codes.length;
        if (length > n && repeatability == false){
            throw new RuntimeException("等级"+level+"所能提供的最大字符串长度小于要求长度"+n+"，且不允许重复，这是错误的");
        }
        char[] result = new char[length];
        if (repeatability){
            for (int i = 0; i<result.length; i++){
                int r = (int) (Math.random()*n);
                result[i] = codes[r];
            }
        }else {
            for (int i = 0; i<result.length; i++){
                int r = (int) (Math.random()*n);
                result[i] = codes[r];
                //避免再次命中之前使用的字符的方法是用codes的最后一个替换它，并把最后一个丢弃（长度减1）
                codes[r] = codes[n-1];
                n--;
            }
        }
        return String.valueOf(result);
    }
}
