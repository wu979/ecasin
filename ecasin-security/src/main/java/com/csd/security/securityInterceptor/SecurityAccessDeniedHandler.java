package com.csd.security.securityInterceptor;

import com.csd.security.securityEntity.User;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 17:25.
 */
public class SecurityAccessDeniedHandler implements AccessDeniedHandler {


    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response,
                       AccessDeniedException accessDeniedException) throws IOException, ServletException {

        User user = (User)request.getSession().getAttribute("user");
        if(null == user) {
            response.sendRedirect(request.getContextPath() + "/notAuth?error=3");
        }
    }

}
