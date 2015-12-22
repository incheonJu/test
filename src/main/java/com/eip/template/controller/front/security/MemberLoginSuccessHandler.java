package com.eip.template.controller.front.security;

import com.eip.template.service.front.member.MemberService;
import com.eip.template.domain.share.member.Member;
import com.eip.template.service.share.VisitorService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Member Login Success Handler Class
 * 로그인 사용자 이름 세션 추가.
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : MemberLoginSuccessHandler.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
public class MemberLoginSuccessHandler implements AuthenticationSuccessHandler
{
    @Autowired MemberService memberService;
    @Autowired VisitorService visitorService;

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException
    {
        Member member = (Member) memberService.findMemberID().getObject();
        request.getSession().setAttribute("loginUserId", member.getMemberId());
        request.getSession().setAttribute("loginUserName", member.getMemberName());
        request.getSession().setAttribute("loginUser", member);
        
        visitorService.addFrontVisitor();

        response.sendRedirect(request.getContextPath() + "/front/main");
    }

}
