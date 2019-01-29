package com.csd.security.securityInterceptor;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.RequestDispatcher;
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

        if (!response.isCommitted()) {
            request.setAttribute(WebAttributes.ACCESS_DENIED_403,
                    accessDeniedException);
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath() + "/user/notAuth?error=3");
            dispatcher.forward(request, response);
        }
    }

}
