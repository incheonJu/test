package com.eip.template.controller.admin.board;

import com.eip.template.common.util.JqGridData;
import com.eip.template.domain.share.board.Faq;
import com.eip.template.service.share.board.FaqService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * 게시판 Ajax Action
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : FaqAjaxAction.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Controller
@RequestMapping(value = "/board")
public class FaqAjaxAction
{
	@Autowired private FaqService faqService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	/**
	 * 게시판 grid 목록 조회
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : faqJqList
	 *@param page
	 *@param rows
	 *@param sidx
	 *@param sord
	 *@param searchField
	 *@param searchString
	 *@return
	 */
	@RequestMapping(value = "/faqJqList", method = RequestMethod.GET)
    @ResponseBody
    public JqGridData<Faq> faqJqList(
            @RequestParam(value = "page", required=false) int page,
            @RequestParam(value = "rows", required=false) int rows,
            @RequestParam(value = "sidx", required=false) String sidx,
            @RequestParam(value = "sord", required=false) String sord,
            @RequestParam(value = "searchField", required=false) String searchField,
            @RequestParam(value = "searchString", required=false) String searchString)
    {
        Map <String, Object> parameters = new HashMap <String, Object >();
    	
    	parameters.put("queryColum", searchField);
    	parameters.put("searchQuery", searchString);
    	 
        return faqService.getFaqGridList(page, rows, sord, sidx, parameters);
    }
	
    
}