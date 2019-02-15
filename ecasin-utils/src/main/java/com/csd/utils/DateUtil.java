package com.csd.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 16:09.
 */
public class DateUtil {



    private final static SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");

    private final static SimpleDateFormat sdfDay = new SimpleDateFormat("yyyy-MM-dd");

    private final static SimpleDateFormat sdfDays = new SimpleDateFormat("yyyyMMdd");

    private final static SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    // 不要日期的时间格式
    private final static SimpleDateFormat noDateTime = new SimpleDateFormat("HH:mm:ss");

    private final static SimpleDateFormat sdfYearMonth = new SimpleDateFormat("yyyy-MM");

    /**
     * 获取YYYY格式
     *
     * @return
     */
    public static String getYear() {
        return sdfYear.format(new Date());
    }

    /**
     * 获取YYYY-MM-DD格式
     *
     * @return
     */
    public static String getDay() {
        return sdfDay.format(new Date());
    }

    /**
     * 获取YYYYMMDD格式
     *
     * @return
     */
    public static String getDays() {
        return sdfDays.format(new Date());
    }

    /**
     * 获取YYYY-MM-DD HH:mm:ss格式
     *
     * @return
     */
    public static String getTime() {
        return sdfTime.format(new Date());
    }

    /**
     * 根据传入字符串返回日期类型
     * @param dateString 传入date 的String格式yyyy-MM-dd HH:mm:ss
     * @return
     * @throws ParseException
     */
    public static Date getDateTime(String dateString) throws ParseException {
        return sdfTime.parse(dateString);
    }

    /**
     * 获取YYYY-MM格式
     * @param dateTime
     * @return
     */
    public static String getYearMonth(Date dateTime){
        return sdfYearMonth.format(dateTime);
    }

    /**
     * 获取YYYY-MM格式
     * @param dateTime
     * @return
     */
    public static String getYearMonth(String dateTime){
        return sdfYearMonth.format(fomatDateForSimple(dateTime));
    }

    /**
     * 日期比较，如果s>=e 返回true 否则返回false
     */
    public static boolean compareDate(String s, String e) {
        if (fomatDate(s) == null || fomatDate(e) == null) {
            return false;
        }
        return fomatDate(s).getTime() >= fomatDate(e).getTime();
    }

    /**
     * 格式化日期
     *
     * @return
     */
    public static Date fomatDate(String date) {
        DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            return fmt.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 格式化日期 只需要日期
     *
     * @return
     */
    public static Date fomatDateForSimple(String date) {
        DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return fmt.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 格式化日期 只需要时间
     *
     * @return
     */
    public static Date fomatDateForTime(String date) {
        DateFormat fmt = new SimpleDateFormat("HH:mm:ss");
        String date1 = date;
        if (date.length() > 10) {
            date1 = date.substring(10);
        }
        try {
            return fmt.parse(date1);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 格式化日期字符串
     *
     * @return
     */
    public static String fomatDate(Date date) {
        DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return fmt.format(date);
    }

    /**
     * 格式化日期字符串(只取年月日)
     *
     * @return
     */
    public static String simplefomatDate(Date date) {
        DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
        return fmt.format(date);
    }

    /**
     * 校验日期是否合法
     *
     * @return
     */
    public static boolean isValidDate(String s) {
        DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
        try {
            fmt.parse(s);
            return true;
        } catch (Exception e) {
            // 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
            return false;
        }
    }

    /**
     * 得到相隔几年
     *
     * @param startTime
     * @param endTime
     * @return
     */
    public static int getDiffYear(String startTime, String endTime) {
        DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
        try {
            int years = (int) (((fmt.parse(endTime).getTime() - fmt.parse(startTime).getTime()) / (1000 * 60 * 60 * 24))
                    / 365);
            return years;
        } catch (Exception e) {
            // 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
            return 0;
        }
    }

    /**
     * <li>功能描述：时间相减得到天数
     *
     * @param beginDateStr
     * @param endDateStr
     * @return long
     * @author Administrator
     */
    public static long getDaySub(String beginDateStr, String endDateStr) {
        long day = 0;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date beginDate = null;
        Date endDate = null;

        try {
            beginDate = format.parse(beginDateStr);
            endDate = format.parse(endDateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        day = (endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60 * 1000);
        // System.out.println("相隔的天数="+day);

        return day;
    }

    /**
     * <li>功能描述：时间相减得到天数(参数为日期)
     *
     * @param beginDateStr
     * @param endDateStr
     * @return long
     * @author Administrator
     */
    public static long getDaySub(Date beginDateStr, Date endDateStr) {
        long day = 0;
//		day = (endDateStr.getTime() - beginDateStr.getTime()) / (24 * 60 * 60 * 1000);
        day = (endDateStr.getDate() - beginDateStr.getDate());
        return day;
    }

    /**
     * 根据起止时间得到间隔天数数组
     *
     * @param beginDateStr
     * @param endDateStr
     * @return
     */
    public static ArrayList<String> getDaysByTime(String beginDateStr, String endDateStr) {
        long days = getDaySub(beginDateStr, endDateStr);
        // 开始计时日期
        Date startDate = DateUtil.fomatDateForSimple(beginDateStr);
        Date date = null;
        Calendar curr = Calendar.getInstance();
        ArrayList<String> dayGroup = new ArrayList<>();
        curr.setTime(startDate);

        for (int i = 0; i < days - 1; i++) {
            curr.add(Calendar.DATE, 1);
            date = curr.getTime();
            dayGroup.add(DateUtil.simplefomatDate(date));
        }
        return dayGroup;
    }

    /**
     * 根据起止时间得到间隔天数数组
     *
     * @param beginDateStr
     * @param endDateStr
     * @return
     */
    public static ArrayList<String> getDaysByTime(Date beginDateStr, Date endDateStr) {
        long days = getDaySub(beginDateStr, endDateStr);
        Date date = null;
        Calendar curr = Calendar.getInstance();
        ArrayList<String> dayGroup = new ArrayList<>();
        curr.setTime(beginDateStr);

        for (int i = 0; i < days - 1; i++) {
            curr.add(Calendar.DATE, 1);
            date = curr.getTime();
            dayGroup.add(DateUtil.simplefomatDate(date));
        }
        return dayGroup;
    }

    /**
     * 时间相减得到分钟数
     *
     * @param starttime 结束时间 输入格式为"yyyy-MM-dd HH:mm:ss"
     * @return 相差分钟数
     * @throws ParseException
     */
    public static long getMinutes(String starttime, String endtime) throws ParseException {
        Date start = sdfTime.parse(starttime);
        Date end = sdfTime.parse(endtime);
        // 将时间转成秒 相减除以六十
        long seconds = end.getTime() - start.getTime();
        long num = seconds / (60 * 1000);
        return num;
    }

    /**
     * 时间相减得到分钟数
     *
     * @param  "yyyy-MM-dd HH:mm:ss"
     * @return 相差分钟数
     * @throws ParseException
     */
    public static long getMinutes(Date start, Date end) throws ParseException {
        // 将时间转成秒 相减除以六十
        long seconds = end.getTime() - start.getTime();
        long num = seconds / (60 * 1000);
        return num;
    }

    /**
     * 得到相隔几小时
     *
     * @param startTime
     * @param endTime
     * @return
     */
    public static long getDiffHour(String startTime, String endTime) throws ParseException {
        Date start = noDateTime.parse(startTime);
        Date end = noDateTime.parse(endTime);
        // 将时间转成秒 相减除以六十
        long seconds = end.getTime() - start.getTime();
        long num = seconds % (60 * 60 * 1000);
        return num;
    }

    /**
     * 得到相隔几小时
     *
     * @param startTime
     * @param endTime
     * @return
     */
    public static int getDiffHour(Date startTime, Date endTime) throws ParseException {
        int start = startTime.getHours();
        int end = endTime.getHours();
        int minuteDifference = endTime.getMinutes() - startTime.getMinutes();

        if (minuteDifference >= 0) {
            return end - start;
        } else {
            return end - start - 1;
        }
    }


    /**
     * 获取当前时间之前或之后几分钟 minute
     */
    public static Date getTimeByMinuteForDate(int minute) {

        Calendar calendar = Calendar.getInstance();

        calendar.add(Calendar.MINUTE, minute);

        return calendar.getTime();
    }

    /**
     * 获取当前时间之前或之后几分钟 minute
     */
    public static String getTimeByMinute(int minute) {

        Calendar calendar = Calendar.getInstance();

        calendar.add(Calendar.MINUTE, minute);

        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar.getTime());

    }

    /**
     * 取到 指定分钟 之前时间
     * @param minutes 分钟数
     * @return
     */
    public static String getTimeByMinute(String date ,int minutes) throws ParseException {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date));
        cal.add(Calendar.MINUTE, -minutes);
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(cal.getTime());
    }


    /**
     * 取到 days 以前日期
     * @param
     * @return
     */
    public static String getHeadDay(String date ,int days) throws ParseException {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new SimpleDateFormat("yyyy-MM-dd").parse(date));
        cal.add(Calendar.DATE, -days);
        return new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
    }

    /**
     * 取到 hours 以前时间
     * @param hours 小时
     * @return
     */
    public static Date headDate(String date ,int hours) throws ParseException {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date));
        cal.add(Calendar.HOUR_OF_DAY, hours);
        return cal.getTime();
    }

    /**
     * 获取给定时间之前或之后几分钟 minute
     */
    public static Date getTimeByMinuteForDate(Date date ,int minute) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MINUTE, minute);
        return calendar.getTime();
    }

    /**
     * 得到n天之后的日期
     *
     * @param days
     * @return
     */
    public static String getAfterDayDate(String days) {
        int daysInt = Integer.parseInt(days);

        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();

        SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = sdfd.format(date);

        return dateStr;
    }

    /**
     * 得到n天之后是周几
     *
     * @param days
     * @return
     */
    public static String getAfterDayWeek(String days) {
        int daysInt = Integer.parseInt(days);

        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();

        SimpleDateFormat sdf = new SimpleDateFormat("E");
        String dateStr = sdf.format(date);

        return dateStr;
    }

    /**
     * 根据输入参数获取指定日期指定几年 几月 几周 几天 后的日期
     *
     * @param number    递增数量
     * @param type      递增类型 周期类型 1,年 2,月 3,周 4,日
     * @param Startdate 起始日期 格式为"yyyy-MM-dd"
     * @return
     * @throws Exception
     */
    public static String getDayByCondition(String Startdate, Integer number, Integer type) throws Exception {
        Date Startdate1 = DateUtil.fomatDateForSimple(Startdate);
        Calendar curr = Calendar.getInstance();
        curr.setTime(Startdate1);
        Date date = null;
        switch (type) {
            case 1:
                curr.add(Calendar.YEAR, number);
                date = curr.getTime();
                break;
            case 2:
                curr.add(Calendar.MONTH, number);
                date = curr.getTime();
                break;
            case 3:
                curr.add(Calendar.DATE, number * 7);
                date = curr.getTime();
                break;
            case 4:
                curr.add(Calendar.DATE, number);
                date = curr.getTime();
                break;
            default:
                throw new Exception("请输入指定周期类型: 1,年 2,月 3,周 4,日");
        }
        return DateUtil.simplefomatDate(date);
    }

    /**
     * 获取当前日期指定几年 几月 几周 几天 后的日期
     *
     * @param number 递增数量
     * @param type   递增类型 周期类型 1,年 2,月 3,周 4,日
     * @return
     * @throws Exception
     */
    public static String getDayByCondition(Integer number, Integer type) throws Exception {
        Calendar curr = Calendar.getInstance();
        Date date = null;
        switch (type) {
            case 1:
                curr.set(Calendar.YEAR, curr.get(Calendar.YEAR) + number);
                date = curr.getTime();
                break;
            case 2:
                curr.set(Calendar.MONTH, curr.get(Calendar.MONTH) + number);
                date = curr.getTime();
                break;
            case 3:
                curr.set(Calendar.DAY_OF_MONTH, curr.get(Calendar.DAY_OF_MONTH) + number * 7);
                date = curr.getTime();
                break;
            case 4:
                curr.set(Calendar.DATE, curr.get(Calendar.DATE) + number);
                date = curr.getTime();
                break;
            default:
                throw new Exception("请输入指定周期类型: 1,年 2,月 3,周 4,日");
        }
        return DateUtil.simplefomatDate(date);

    }

    /**
     * 得到一个随机的id
     *
     * @return
     */
    public static String getRandomId() {
        Long companyOrgId1 = System.currentTimeMillis();
        String companyOrgId2 = companyOrgId1.toString().substring(7);
        Double double1 = 100 * Math.random();
        return companyOrgId2 + double1.intValue();
    }

    /**
     * 得到n天之前的日期
     *
     * @param days
     * @return
     * @throws ParseException
     */
    public static String getBeforeDayDate(String afterDay, Integer days) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse(afterDay);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        // Calendar canlendar = Calendar.getInstance(); // java.util包
        calendar.add(Calendar.DATE, -days); // 日期减 如果不够减会将月变动
        Date beforeDate = calendar.getTime();
        SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = sdfd.format(beforeDate);

        return dateStr;
    }

    /**
     * 得到n天之后的日期
     *
     * @param startDay 开始日期
     * @param days     天数
     * @return String
     * @throws ParseException 时间解析异常
     */
    public static String getAfterDayDate(String startDay, Integer days) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse(startDay);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DATE, days);
        Date beforeDate = calendar.getTime();
        SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdfd.format(beforeDate);
    }

    /**
     * 获取当年的第一天
     *
     * @return
     */
    public static String thisYearFirst() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.MONTH, 0);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        return simplefomatDate(calendar.getTime());
    }

    /**
     * 获取当年的最后一天
     *
     * @return
     */
    public static String thisYearLast() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.MONTH, 11);
        calendar.set(Calendar.DAY_OF_MONTH, 31);
        return simplefomatDate(calendar.getTime());
    }

    /**
     * 两个日期之间相差 计算相差时以各自单位为准，例如2014年12月31日与2015年1月1日之间相差的年数是1
     *
     * @param from 开始日期
     * @param to   结束日期
     * @param unit 单位：Calendar.YEAR,MONTH,DATE,HOUR,MINUTE,SECOND,MILLISECOND
     * @return 根据单位计算得到相差的数量，如果开始日期晚于结束日期返回负数
     */
    public static int between(Calendar from, Calendar to, int unit) {
        int fromInt, toInt;
        switch (unit) {
            case Calendar.YEAR:
                return to.get(Calendar.YEAR) - from.get(Calendar.YEAR);
            case Calendar.MONTH:
                int year = to.get(Calendar.YEAR) - from.get(Calendar.YEAR);
                int month = to.get(Calendar.MONTH) - from.get(Calendar.MONTH);
                return year * 12 + month;
            case Calendar.DATE:
                fromInt = (int) (from.getTimeInMillis() / (24 * 60 * 60 * 1000L));
                toInt = (int) (to.getTimeInMillis() / (24 * 60 * 60 * 1000L));
                return toInt - fromInt;
            case Calendar.HOUR:
            case Calendar.HOUR_OF_DAY:
                fromInt = (int) (from.getTimeInMillis() / (60 * 60 * 1000L));
                toInt = (int) (to.getTimeInMillis() / (60 * 60 * 1000L));
                return toInt - fromInt;
            case Calendar.MINUTE:
                fromInt = (int) (from.getTimeInMillis() / (60 * 1000L));
                toInt = (int) (to.getTimeInMillis() / (60 * 1000L));
                return toInt - fromInt;
            case Calendar.SECOND:
                fromInt = (int) (from.getTimeInMillis() / (60 * 1000L));
                toInt = (int) (to.getTimeInMillis() / (60 * 1000L));
                return toInt - fromInt;
            case Calendar.MILLISECOND:
                return (int) (to.getTimeInMillis() - from.getTimeInMillis());
            default:
                throw new IllegalArgumentException("Unknown Date Unit: " + unit);
        }
    }

    /**
     * 两个日期之间相差 计算相差时以各自单位为准，例如2014年12月31日与2015年1月1日之间相差的年数是1
     *
     * @param fromDate 开始日期
     * @param toDate   结束日期
     * @param unit     单位：Calendar.YEAR,MONTH,DATE,HOUR,MINUTE,SECOND,MILLISECOND
     * @return 根据单位计算得到相差的数量，如果开始日期晚于结束日期返回负数
     */
    public static int between(Date fromDate, Date toDate, int unit) {
        Calendar from = Calendar.getInstance();
        Calendar to = Calendar.getInstance();
        from.setTime(fromDate);
        to.setTime(toDate);
        return between(from, to, unit);
    }

    /**
     * 根据指定日期开始得到剩余日期的集合 格式为yyyy-MM-dd
     * @param startDate  开始日期 例如:2018-03-10
     * @return
     */
    public static List<String> getDayList(String startDate) {
        String[] dayArray = startDate.split("-");
        Calendar c = Calendar.getInstance();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        //分割日期字符串 得到dayArray[0]为年   dayArray[1]为月    dayArray[2]为日
        int startYear = Integer.valueOf(dayArray[0]);
        int startMonth = Integer.valueOf(dayArray[1]) - 1;
        int startDay = Integer.valueOf(dayArray[2]);

        c.set(startYear, startMonth,startDay);
        List<String> timeList = new LinkedList<>();
        while (true) {
            if (c.get(Calendar.YEAR) != Integer.valueOf(dayArray[0])) {
                break;
            } else {
                timeList.add(df.format(c.getTime()));
                c.set(Calendar.DATE, c.get(Calendar.DATE) + 1);
            }
        }
        return timeList;
    }

    /**
     * @param time 时间戳
     * @param type 返回时间格式 yyyy-MM-dd-HH-mm-ss或者yyyy-MM-dd HH:mm:ss
     * @return yyyy-MM-dd-HH-mm-ss或者yyyy-MM-dd HH:mm:ss
     */
    public static String getDate(String time, String type) {
        return getDateTimeByMillisecond(time, type);
    }

    /**
     * @param time 时间戳
     * @param type 返回时间格式 yyyy-MM-dd-HH-mm-ss或者yyyy-MM-dd HH:mm:ss
     * @return 星期几+yyyy-MM-dd-HH-mm-ss或者yyyy-MM-dd HH:mm:ss
     */
    public static String getDateAndWeek(String time, String type) {
        return changeWeekOne(time) + "  "
                + getDateTimeByMillisecond(time, type);
    }

    private static String getDateTimeByMillisecond(String str, String type) {
        Date date = new Date(Long.valueOf(str));
        SimpleDateFormat format = new SimpleDateFormat(type);
        String time = format.format(date);
        return time;
    }

    private static String changeWeekOne(String time) {
        SimpleDateFormat sdr = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
        long lcc = Long.valueOf(time);
        int i = Integer.parseInt(time);
        String times = sdr.format(new Date(i * 1000L));
        Date date = null;
        int mydate = 0;
        String week = null;
        try {
            date = sdr.parse(times);
            Calendar cd = Calendar.getInstance();
            cd.setTime(date);
            mydate = cd.get(Calendar.DAY_OF_WEEK);
            // 获取指定日期转换成星期几
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        if (mydate == 1) {
            week = "星期日";
        } else if (mydate == 2) {
            week = "星期一";
        } else if (mydate == 3) {
            week = "星期二";
        } else if (mydate == 4) {
            week = "星期三";
        } else if (mydate == 5) {
            week = "星期四";
        } else if (mydate == 6) {
            week = "星期五";
        } else if (mydate == 7) {
            week = "星期六";
        }
        return week;

    }

    /**
     * 判断给定时间是否在某个时间区间
     * @param nowTime  给定时间
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @return 是 返回true,否 返回false
     */
    public static boolean isEffectiveDate(Date nowTime, Date startTime, Date endTime) {
        if (nowTime.getTime() >= startTime.getTime() && nowTime.getTime() < endTime.getTime()) {
            return true;
        }
        return false;
    }

    /**
     * 判断给定时间是否在某个时间区间
     * @param nowTime  给定时间格式yyyy-MM-dd HH:mm:ss
     * @param start 开始时间格式yyyy-MM-dd HH:mm:ss
     * @param end 结束时间
     * @return 是 返回true,否 返回false
     * @throws ParseException
     */
    public static boolean isEffectiveDate(Date nowTime, String start, String end) throws ParseException {
        Date startTime =  sdfTime.parse(start);
        Date endTime =  sdfTime.parse(end);
        if (nowTime.getTime() >= startTime.getTime() && nowTime.getTime() < endTime.getTime()) {
            return true;
        }
        return false;
    }
    /**
     * 判断给定时间是否在某个时间区间 格式均为 yyyy-MM-dd HH:mm:ss
     * @param now  给定时间
     * @param start 开始时间
     * @param end 结束时间
     * @return 是 返回true,否 返回false
     */
    public static boolean isEffectiveDate(String now, String start, String end) throws ParseException{
        Date nowTime =  sdfTime.parse(now);
        Date startTime =  sdfTime.parse(start);
        Date endTime =  sdfTime.parse(end);
        if (nowTime.getTime() >= startTime.getTime() && nowTime.getTime() < endTime.getTime()) {
            return true;
        }
        return false;
    }
    /**
     * 判断给定时间是否在某个时间区间 格式均为 yyyy-MM-dd HH:mm:ss
     * @param nowTime  给定时间
     * @param start 开始时间
     * @param endTime 结束时间
     * @return 是 返回true,否 返回false
     */
    public static boolean isEffectiveDate(Date nowTime, String start, Date endTime) throws ParseException{
        Date startTime =  sdfTime.parse(start);
        if (nowTime.getTime() >= startTime.getTime() && nowTime.getTime() < endTime.getTime()) {
            return true;
        }
        return false;
    }

    /**
     * 是否闰年 是则返回true
     * @param year
     * @return
     * @throws ParseException
     */
    public static boolean isLeapYear(int year) throws ParseException{
        if(year%4==0&&year%100!=0||year%400==0){
            return true;
        }else{
            return false;
        }
    }


    /**
     * 取得当前时间戳（精确到秒）
     * @return
     */
    public static String timeStamp(){
        long time = System.currentTimeMillis();
        String t = String.valueOf(time/1000);
        return t;
    }
}
