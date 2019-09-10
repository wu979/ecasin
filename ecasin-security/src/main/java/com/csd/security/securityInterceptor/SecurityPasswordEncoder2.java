package com.csd.security.securityInterceptor;//package com.sly.security.config;
//
//import com.sly.admin.MD5Util;
//import com.sly.security.service.SecurityService;
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
//    private SecurityService securityService;
//
//    public SecurityPasswordEncoder(){
//    }
//
//    public SecurityPasswordEncoder(SecurityService securityService){
//        this.securityService = securityService;
//    }
//
//    @Override
//    public boolean matches(CharSequence rawPassword, String encodedPassword) {
//        String userTel = securityService.getUserTel();
//        String salt = securityService.getSalt();
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
