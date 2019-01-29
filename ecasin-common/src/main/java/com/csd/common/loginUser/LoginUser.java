package com.csd.common.loginUser;

import com.csd.security.securityEntity.SecurityUserDetails;
import com.csd.system.user.po.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 17:15.
 */
public class LoginUser {

    private LoginUser(){}


    public static boolean isLogin(){
        SecurityContext sc = SecurityContextHolder.getContext();
        if (sc == null) {
            return false;
        }
        Authentication auth = sc.getAuthentication();
        if (auth == null) {
            return false;
        }
        Object obj = auth.getPrincipal();
        if (obj instanceof SecurityUserDetails) {
            return true;
        }
        return false;
    }

    public static User getLoginUser() {
        User loginUser = null;
        SecurityContext sc = SecurityContextHolder.getContext();
        if (sc != null && null != sc.getAuthentication()) {
            if (sc.getAuthentication().getPrincipal() instanceof SecurityUserDetails) {
                SecurityUserDetails egovUserDetails = (SecurityUserDetails) sc.getAuthentication().getPrincipal();
                loginUser = egovUserDetails.getUser();
            }
        }
        return loginUser;
    }

    public static String getLoginUserId() {
        String loginUserId = null;
        User loginedUser = getLoginUser();
        if (null != loginedUser) {
            loginUserId = String.valueOf(loginedUser.getUserId());
        }
        return loginUserId;
    }

    public static String getLoginUserName() {
        String loginUserName = null;
        User loginedUser = getLoginUser();
        if (null != loginedUser) {
            loginUserName = loginedUser.getUserName();
        }
        return loginUserName;
    }
}
