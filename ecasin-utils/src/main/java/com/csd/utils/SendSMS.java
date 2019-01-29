package com.csd.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 16:07.
 */
public class SendSMS {

    private static final String URI  = "http://v.juhe.cn/sms/send?";

    private static final String APPKEY = "0ccb24704e84b853d3e6e052b27206de";

    private static final String CHARACTER  = "utf-8";

    private static String DTYPE  = "json";

    private static final String  TPID_SIGN = "120072";

    private static final String  TPID_FORGET = "120158";

    public static String sendSMS(String mobile,String code,String time,String sendType) throws IOException {
        String utfString;
        String tpl_value;
        String url = null;
        if(sendType.equals(ConstantUtil.CODE_ONE)){
            utfString = "#code#=" + code + "&#m#=" + time;
            tpl_value = URLEncoder.encode(utfString , CHARACTER);
            url = URI + "dtype=" + DTYPE +"&mobile=" + mobile + "&tpl_id=" + TPID_SIGN + "&tpl_value=" + tpl_value + "&key=" + APPKEY;
        }
        if(sendType.equals(ConstantUtil.CODE_TWO)){
            utfString = "#code#=" + code;
            tpl_value = URLEncoder.encode(utfString , CHARACTER);
            url = URI + "dtype=" + DTYPE +"&mobile=" + mobile + "&tpl_id=" + TPID_FORGET + "&tpl_value=" + tpl_value + "&key=" + APPKEY;
        }

        StringBuffer buffer = null;

        try {
            // 建立连接
            URL requestUrl = new URL(url);
            HttpURLConnection httpUrlConn = (HttpURLConnection) requestUrl.openConnection();
            httpUrlConn.setDoInput(true);
            httpUrlConn.setRequestMethod("POST");
            //获取输入流
            InputStream inputStream = httpUrlConn.getInputStream();
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, CHARACTER);
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
            // 读取返回结果
            buffer = new StringBuffer();
            String str = null;
            while ((str = bufferedReader.readLine()) != null) {
                buffer.append(str);
            }
            // 释放资源
            bufferedReader.close();
            inputStreamReader.close();
            inputStream.close();
            httpUrlConn.disconnect();
        }catch (Exception e){
            e.printStackTrace();
        }
        if(buffer == null) {
            return null;
        }
        else {
            return buffer.toString();
        }
    }

}
