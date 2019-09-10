package com.csd.security.util;

import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @des:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/9/10 11:51
 */
public class MD5Util {

    /**
     * 需要盐值
     * @param password
     * @return
     */
    public static String encodeSalt(String password){
        String encodePassword = null;
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");//MD5加密类型
            BASE64Encoder base64en = new BASE64Encoder();//base64
            encodePassword = base64en.encode(md5.digest(password.getBytes("utf-8")));//加密后字符串
            System.out.println("加密后"+encodePassword);
        }catch (NoSuchAlgorithmException e){

        }catch (UnsupportedEncodingException e2){

        }
        return encodePassword;
    }

    /**
     * 不需要盐值
     * @param password
     * @return
     */
    public static String encode(String password){
        MessageDigest md5 = null;
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        char[] charArray = password.toCharArray();
        byte[] byteArray = new byte[charArray.length];

        for (int i = 0; i < charArray.length; i++)
            byteArray[i] = (byte) charArray[i];
        byte[] md5Bytes = md5.digest(byteArray);
        StringBuffer hexValue = new StringBuffer();
        for (int i = 0; i < md5Bytes.length; i++) {
            int val = ((int) md5Bytes[i]) & 0xff;
            if (val < 16) {
                hexValue.append("0");
            }

            hexValue.append(Integer.toHexString(val));
        }
        return hexValue.toString();
    }

}
