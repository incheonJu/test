package com.eip.template.controller.admin.system;

import javax.servlet.ServletContext;

import com.eip.template.service.admin.system.SystemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * 시스템 Action
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : SystemAction.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Controller
@RequestMapping(value = "/system")
public class SystemAction 
{
	@Autowired private SystemService systemService;
	@Autowired private FileSystemResource fsResource;
	@Autowired private ServletContext context;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 시스템로그 목록 조회 페이지 로딩
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showSystemLogListPage
	 *@param model
	 *@param page
	 *@param searchString
	 *@return
	 */
	@RequestMapping(value = "/systemLogList", method = RequestMethod.GET)
    public String showSystemLogListPage(ModelMap model,
    		@RequestParam(value = "page", required=false, defaultValue="1") int page,
    		@RequestParam(value = "searchString", required=false, defaultValue="") String searchString) // 요청 페이지 값
    {
        model.addAttribute("states", systemService.getAll().getObject());
        model.addAttribute("page", page);
        model.addAttribute("searchString", searchString);
        return "admin/system/systemLogList";
    }
	
}