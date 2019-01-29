package com.csd.security.securityInterceptor;

import com.csd.utils.entity.CodeImage;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 17:26.
 */
@Component
public class SecurityValidateCodeFilter extends OncePerRequestFilter {


    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {

        String path = httpServletRequest.getContextPath();

        if (StringUtils.equalsIgnoreCase(path + "/userLogin", httpServletRequest.getRequestURI())
                && StringUtils.equalsIgnoreCase(httpServletRequest.getMethod(), "post")) {
            validateCode(httpServletRequest,httpServletResponse);
        }
        filterChain.doFilter(httpServletRequest, httpServletResponse);
    }

    private void validateCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
        CodeImage codeImage = (CodeImage)request.getSession().getAttribute("codeImage");

        String codeInRequest = request.getParameter("validCode");

        if (StringUtils.isBlank(codeInRequest)) {
            response.sendRedirect(request.getContextPath()+"/login?error=4");
            return ;
        }
        if (codeImage == null) {
            response.sendRedirect(request.getContextPath()+"/login?error=5");
            return ;
        }
        if (codeImage.isExpire()) {
            response.sendRedirect(request.getContextPath()+"/login?error=6");
            return ;
        }
        if (!StringUtils.equalsIgnoreCase(codeImage.getCode(), codeInRequest)) {
            response.sendRedirect(request.getContextPath()+"/login?error=7");
            return ;
        }
    }

}
