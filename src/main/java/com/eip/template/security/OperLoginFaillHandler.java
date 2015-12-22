package com.eip.template.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

/**
 * 로그인 실패 처리 핸들러
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : OperLoginFaillHandler.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
public class OperLoginFaillHandler implements AuthenticationFailureHandler
{
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException aException) throws IOException, ServletException
    {
        String failMessage = aException.getMessage();
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("message", failMessage);
        request.getSession().setAttribute("message", failMessage);
        response.sendRedirect(request.getContextPath() + "/admin/login?error=true");
    }

}
