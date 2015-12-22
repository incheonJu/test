package com.eip.template.controller.admin;

import com.eip.template.service.admin.operator.OperatorService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * 처리자 로그인 관련 Action
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : LoginAction.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Controller
public class LoginAction
{
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired private OperatorService operatorService;
    
    /**
     * Root Path로 접근시 로그인페이지 이동
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : showDefaultPage
     *@return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String showDefaultPage()
    {
        logger.debug("Show Default View Page");
        return "admin/login";
    }
    
    /**
     * 로그인 페이지 로딩
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : showLoginPage
     *@return
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String showLoginPage()
    {
        logger.debug("Show Login View Page");
        return "admin/login";
    }
}
