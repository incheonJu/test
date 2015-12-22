package com.eip.template.security;

import java.util.ArrayList;
import java.util.List;


import com.eip.template.service.admin.operator.OperatorService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
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
public class OperDetailService implements UserDetailsService
{
    @Autowired private OperatorService operService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException
    {
        OperDetail operDetail = new OperDetail();
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
       
        /*Operator operator = (Operator) operService.findOperatorID(username).getObject();
        
        if (operator == null)
        {
            throw new DisabledException("가입되지 않은 ID 입니다.");
        }
        else if (operator.getOperState().equals("0"))
        {
            throw new DisabledException("승인되지 않은 사용자입니다."); 
        }
        else if (operator.getOperState().equals("2"))
        {
        	throw new DisabledException("탈퇴 처리된 사용자입니다.");
        }
        else
        {
            // 권한 정보를 가져옴.
            
            authorities.add(new SimpleGrantedAuthority("ROLE_BACKOFFICE"));

            if (operator.isPriv01()) {
                authorities.add(new SimpleGrantedAuthority("ROLE_PRIV01"));
                authorities.add(new SimpleGrantedAuthority("ROLE_OPER"));
            }
            
            if (operator.isPriv02()) 
                authorities.add(new SimpleGrantedAuthority("ROLE_PRIV02"));
            
            if (operator.isPriv03())
                authorities.add(new SimpleGrantedAuthority("ROLE_PRIV03"));
            
            if (operator.isPriv04())
                authorities.add(new SimpleGrantedAuthority("ROLE_PRIV04"));
            
            if (operator.isPriv05())
                authorities.add(new SimpleGrantedAuthority("ROLE_PRIV05"));
        }
        
        operDetail.setUsername(username);
        operDetail.setPassword(operator.getOperPwd());
        
        operDetail.setAuthorities(authorities);*/
        return operDetail;
    }

}
