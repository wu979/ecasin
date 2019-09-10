//package com.csd.security.securityInterceptor;
//
//import com.csd.security.util.MD5Util;
//import org.springframework.security.crypto.password.PasswordEncoder;
//
///**
// * @des:
// * @author: wsw
// * @email: 18683789594@163.com
// * @date: 2019/8/22 16:38
// */
//public class SecurityPasswordEncoder implements PasswordEncoder {
//
//    String salt = "2323";
//    String userTel = "18694967833";
//
//    @Override
//    public boolean matches(CharSequence rawPassword, String encodedPassword) {
//
//        String encode = MD5Util.encode(userTel + rawPassword.toString());
//        rawPassword = salt + encode;
//        return encodedPassword.equals(MD5Util.encodeSalt((String)rawPassword));
//    }
//
//    @Override
//    public String encode(CharSequence rawPassword) {
//        return MD5Util.encode((String)rawPassword);
//    }
//
//
//}
