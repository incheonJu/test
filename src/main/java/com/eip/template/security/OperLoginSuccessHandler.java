package com.eip.template.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eip.template.service.admin.operator.OperatorService;
import com.eip.template.service.share.VisitorService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

/**
 * Operator Login Success Handler Class
 * 로그인 사용자 이름 세션 추가.
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : OperLoginSuccessHandler.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
public class OperLoginSuccessHandler implements AuthenticationSuccessHandler
{
    @Autowired
    OperatorService operatorService;
    @Autowired
    VisitorService visitorService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException
    {
        /*Operator operator = (Operator) operatorService.findOperatorID(authentication.getName()).getObject();
        request.getSession().setAttribute("loginUserId", operator.getOperId());
        request.getSession().setAttribute("loginUserName", operator.getOperName());
        request.getSession().setAttribute("loginUser", operator);
        
        visitorService.addBackofficeVisitor();
*/
        response.sendRedirect(request.getContextPath() + "/admin/main");
    }

}
