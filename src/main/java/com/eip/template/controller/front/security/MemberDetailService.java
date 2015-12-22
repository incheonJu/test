package com.eip.template.controller.front.security;


import com.eip.template.service.front.member.MemberService;
import com.eip.template.domain.share.member.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * 처리자 로그인 인증 처리 Class
 * 승인 대기중인 사용자에 대한 로그인 거부 처리. 
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : OperDetailService.java 
 * Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
public class MemberDetailService implements UserDetailsService
{
    @Autowired private MemberService memberService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException
    {
    	MemberDetail memberDetail = new MemberDetail();
	  	Member member = (Member) memberService.findMemberID().getObject();
	      
	  	if (member == null)
	  	{
	  		throw new DisabledException("가입되지 않은 ID 입니다.");
	  	}

	    memberDetail.setUsername(username);
	    memberDetail.setPassword(member.getMemberPwd());
	      
	    return memberDetail;
    }

}
