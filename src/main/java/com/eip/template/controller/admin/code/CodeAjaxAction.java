package com.eip.template.controller.admin.code;

import java.util.HashMap;
import java.util.Map;


import com.eip.template.common.util.JqGridData;
import com.eip.template.domain.share.code.DetailCode;
import com.eip.template.domain.share.code.MasterCode;
import com.eip.template.service.admin.code.CodeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 공통코드 Ajax Action
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : CodeAjaxAction.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Controller
@RequestMapping(value = "/code")
public class CodeAjaxAction
{
	
	@Autowired private CodeService codeService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 그룹코드 grid 목록 조회
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : getMasterCodeJqList
	 *@param page
	 *@param rows
	 *@param sidx
	 *@param sord
	 *@param searchField
	 *@param searchString
	 *@return
	 */
	@RequestMapping(value = "/masterCodeJqList", method = RequestMethod.GET)
    @ResponseBody
    public JqGridData<MasterCode> getMasterCodeJqList(
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
        
        /*return codeService.getMasterCodeGridList(page, rows, sord, sidx, parameters);*/
        return null;
    }
    
	/**
	 * 상세코드 grid 목록 조회
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : getDetailCodeJqList
	 *@param page
	 *@param rows
	 *@param sidx
	 *@param sord
	 *@param searchField
	 *@param searchString
	 *@param searchGrpCd
	 *@return
	 */
	@RequestMapping(value = "/detailCodeJqList", method = RequestMethod.GET)
    @ResponseBody
    public JqGridData<DetailCode> getDetailCodeJqList(
            @RequestParam(value = "page", required=false) int page,
            @RequestParam(value = "rows", required=false) int rows,
            @RequestParam(value = "sidx", required=false) String sidx,
            @RequestParam(value = "sord", required=false) String sord,
            @RequestParam(value = "searchField", required=false) String searchField,
            @RequestParam(value = "searchString", required=false) String searchString,
            @RequestParam(value = "searchGrpCd", required=false) String searchGrpCd
            )
    {
        Map <String, Object> parameters = new HashMap <String, Object >();
    	
    	parameters.put("queryColum", searchField);
    	parameters.put("searchQuery", searchString);
    	parameters.put("grpCd", searchGrpCd);
        
        /*return codeService.getDetailCodeGridList(page, rows, sord, sidx, parameters);*/
        return null;
    }
}