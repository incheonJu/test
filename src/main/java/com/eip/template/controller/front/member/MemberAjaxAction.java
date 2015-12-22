package com.eip.template.controller.front.member;

import com.eip.template.service.front.member.MemberService;
import com.eip.template.domain.share.member.Member;
import com.eip.template.common.util.JqGridData;
import com.eip.template.common.util.ResultMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * 사용자관리 Ajax Action
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : MemberAjaxAction.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Controller
@RequestMapping(value = "/member")
public class MemberAjaxAction
{
    @Autowired
    private MemberService memberService;

    static final Logger logger = LoggerFactory.getLogger(MemberAjaxAction.class);
    
    /**
     * 사용자 grid 목록 조회
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : memberJqList
     *@param page
     *@param rows
     *@param sidx
     *@param sord
     *@param searchField
     *@param searchString
     *@param state01
     *@param state02
     *@param state03
     *@param priv01
     *@param priv02
     *@param priv03
     *@param priv04
     *@param priv05
     *@return
     */
    @RequestMapping(value = "/memberJqList", method = RequestMethod.GET)
    @ResponseBody
    public JqGridData<Member> memberJqList(
            @RequestParam(value = "page", required=false) int page,
            @RequestParam(value = "rows", required=false) int rows,
            @RequestParam(value = "sidx", required=false) String sidx,
            @RequestParam(value = "sord", required=false) String sord,
            @RequestParam(value = "searchField", required=false, defaultValue="all") String searchField,
            @RequestParam(value = "searchString", required=false, defaultValue="") String searchString,
            @RequestParam(value = "state01", required=false, defaultValue="") String state01,
            @RequestParam(value = "state02", required=false, defaultValue="") String state02,
            @RequestParam(value = "state03", required=false, defaultValue="") String state03)
    {
     
    	Map <String, Object> parameters = new HashMap <String, Object >();
    	
    	parameters.put("queryColum", searchField);
    	parameters.put("searchQuery", searchString);
    	parameters.put("state01", state01);
    	parameters.put("state02", state02);
    	parameters.put("state03", state03);
    	 
    	return memberService.getMemberGridList(page, rows, sord, sidx, parameters);
    }
    
    /**
     * ID 중복 체크
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : checkDuplicateID
     *@param id
     *@return
     */
    @RequestMapping(value = "/checkID/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ResultMessage checkDuplicateID(@PathVariable String id)
    {
        return memberService.checkDuplicateID(id);
    }
}
