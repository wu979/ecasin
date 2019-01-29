package com.csd.security.securityInterceptor;

import com.csd.utils.PasswordUtil;
import org.springframework.security.authentication.encoding.MessageDigestPasswordEncoder;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 17:27.
 */
public class SecurityPasswordEncoder extends MessageDigestPasswordEncoder {


    public SecurityPasswordEncoder() {
        super("SHA-1");
    }

    @Override
    public String encodePassword(String rawPass, Object salt) {
        String endcodePass = "defalut";
        if (null != salt) {
            endcodePass = PasswordUtil.SHA1(rawPass, salt.toString());
        }
        return endcodePass;
    }

}
