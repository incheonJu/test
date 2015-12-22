package com.eip.template.controller.admin.system;

import java.util.HashMap;
import java.util.Map;


import com.eip.template.common.util.JqGridData;
import com.eip.template.domain.share.system.SystemLog;
import com.eip.template.service.admin.system.SystemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 시스템 Ajax Action
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : SystemAjaxAction.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Controller
@RequestMapping(value = "/system")
public class SystemAjaxAction
{
	@Autowired private SystemService systemService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 시스템 로그 grip 목록 조회
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : systemLogJqList
	 *@param page
	 *@param rows
	 *@param sidx
	 *@param sord
	 *@param searchField
	 *@param searchString
	 *@param searchStartDate
	 *@param searchEndDate
	 *@return
	 */
	@RequestMapping(value = "/systemLogJqList", method = RequestMethod.GET)
    @ResponseBody
    public JqGridData<SystemLog> systemLogJqList(
            @RequestParam(value = "page", required=false) int page,
            @RequestParam(value = "rows", required=false) int rows,
            @RequestParam(value = "sidx", required=false) String sidx,
            @RequestParam(value = "sord", required=false) String sord,
            @RequestParam(value = "searchField", required=false) String searchField,
            @RequestParam(value = "searchString", required=false) String searchString,
            @RequestParam(value = "searchStartDate", required=false) String searchStartDate,
            @RequestParam(value = "searchEndDate", required=false) String searchEndDate)
    {
        Map <String, Object> parameters = new HashMap <String, Object >();
    	
    	parameters.put("queryColum", searchField);
    	parameters.put("searchQuery", searchString);
    	parameters.put("searchStartDate", searchStartDate);
    	parameters.put("searchEndDate", searchEndDate);
    	 
        /*return systemService.getSystemLogGridList(page, rows, sord, sidx, parameters);*/
        return null;
    }
}