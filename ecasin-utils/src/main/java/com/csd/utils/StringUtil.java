package com.csd.utils;

import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 16:06.
 */
public class StringUtil {


    /**
     * 去掉字符前后的空格
     */
    public static String trim(String str) {
        return isNull(str) ? "" : str.trim();
    }

    /**
     * 判断字符串是否为空 return true 为空 return false 不为空
     */
    public static boolean isNull(String str) {
        return str == null ? true : false;
    }

    /**
     * 检查Object是否为空字符
     */
    public static boolean isObjectEmpty(Object str) {
        return (null == str) || "".equals(str) ? true : false;
    }

    /**
     * 检查字符串是否为空字符
     */
    public static boolean isEmpty(String str) {
        return isNull(str) || "".equals(str) ? true : false;
    }

    /**
     * 检查空字符串，如果为null返回空字符
     */
    public static String nullToString(String str) {
        return isNull(str) ? "" : str;
    }

    /**
     * 检测字符串是否不为空(null,"","null")
     *
     * @param s
     * @return 不为空则返回true，否则返回false
     */
    public static boolean notEmpty(String s) {
        return s != null && !"".equals(s) && !"null".equals(s);
    }

    /**
     * 验证字符串是否为日期格式
     *
     * @param args
     * @return true 是 false 否
     */
    public static boolean isDateType(String... args) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        df.setLenient(false);
        boolean isTag = true;
        try {
            for (int i = 0; i < args.length; i++) {
                df.format(df.parse(args[i]));
            }
        } catch (Exception e) {
            isTag = false;
        }
        return isTag;
    }

    /**
     * 获取指定字符串，指定字符 出现第N次所在的下标位置
     *
     * @param string  指定字符串
     * @param n       次
     * @param pattern 指定的字符
     * @return
     */
    public static int getCharacterPosition(String string, int n, String pattern) {
        //这里是获取pattern符号的位置
        Matcher slashMatcher = Pattern.compile(pattern).matcher(string);
        int mIdx = 0;
        while (slashMatcher.find()) {
            mIdx++;
            //当pattern符号第n次出现的位置
            if (mIdx == n) {
                break;
            }
        }
        return slashMatcher.start();
    }

    /**
     * 得到指定字符在 指定字符串 出现的次数
     *
     * @param s1    指定字符串
     * @param char1 指定字符
     * @return
     */
    public static int ciShu(String s1, String char1) {
        //定义一个int变量，用来计算s2在搜索s1中出现的次数；
        int num = 0;
        //遍历s1
        for (int i = 0; i < s1.length(); i++) {
            //调用方法indexOf,计算char1在s1字符串中出现的下标，
            int t = s1.indexOf(char1, i);
            //当用if判断，当遍历开始下标i与s2在s1中出现的下标位置相等时变量num自增1；
            if (i == t) {
                num++;
            }
        }
        return num;
    }

    //生成指定位数的随机数
    public static char[] generateRandomArray(int num) {
        String chars = "0123456789";
        char[] rands = new char[num];
        for (int i = 0; i < num; i++) {
            int rand = (int) (Math.random() * 10);
            rands[i] = chars.charAt(rand);
        }
        return rands;
    }


    //密码验证(必须未数字和英文的组合，不能有特殊字符)
    public static Boolean passwordVerification(String password) {
        String regex = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$";
        Boolean flg = password.matches(regex);
        return flg;
    }


    //得到时间格式
    public static String getTimeString(String dateTimeString) {
        return dateTimeString.substring(11, 16);
    }

    //得到标准月份格式
    public static String getStandMonth(String month) {
        if (month.length() == 6) {
            String monthChar = month.substring(0, 5);
            String dataChar = month.substring(5);
            month = monthChar + "0" + dataChar;
        }
        return month;
    }

}
