package com.csd.utils;

import java.util.UUID;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 15:17.
 */
public class UUIDUtil {


    public static String getUUID(){ return UUID.randomUUID().toString().replaceAll("-",""); }


    public static void main(String[] args) {

        System.out.println(UUIDUtil.getUUID());

    }

}
