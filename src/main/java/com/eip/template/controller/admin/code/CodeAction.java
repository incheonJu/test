package com.eip.template.controller.admin.code;

import java.security.Principal;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.eip.template.common.util.ResultMessage;
import com.eip.template.domain.share.code.DetailCode;
import com.eip.template.domain.share.code.MasterCode;
import com.eip.template.service.admin.code.CodeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


/**
 * 공통코드 Acton
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : CodeAction.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Controller
@RequestMapping(value="/code")
public class CodeAction
{
	@Autowired private CodeService codeService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 마스터코드 목록 조회페이지 로딩
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showMasterCodeListPage
	 *@param model
	 *@return
	 */
	@RequestMapping(value = "/masterCodeList",method = RequestMethod.GET)
    public String showMasterCodeListPage(ModelMap model)
    {
        return "admin/code/masterCodeList";
    }
	
	/**
	 * 마스터코드 등록 페이지 로딩
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showMasterCodeInsertPage
	 *@param model
	 *@return
	 */
	@RequestMapping(value = "/masterCodeInsert",method = RequestMethod.GET)
	public String showMasterCodeInsertPage(ModelMap model)
	{
		return "admin/code/masterCodeInsert";
	}
	
	/**
	 * 마스터코드 등록 처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 1. 마스터코드가 존재하는지 확인하여 등록처리
	* </PRE>
	 *@Method Name : masterCodeInsertProcess
	 *@param model
	 *@param masterCode
	 *@param redirectAttributes
	 *@param request
	 *@return
	 */
	@RequestMapping(value = "/masterCodeInsertProcess",method = RequestMethod.POST)
	public String masterCodeInsertProcess(ModelMap model, 
			@ModelAttribute("masterCode") MasterCode masterCode,
			RedirectAttributes redirectAttributes,
			HttpServletRequest request)
	{
		logger.debug("Insert Data : " + masterCode);
        
		
		// 현재 접속한 사용자 정보를 가져옴.
        Principal principal = request.getUserPrincipal();
        String userID = "";
        
        if (principal != null)
        {
            userID = principal.getName();
        }
        else{
            return "redirect:/admin";
        }
    	ResultMessage resultMessage = codeService.get(new MasterCode(masterCode.getGrpCd()));
    	
    	if (resultMessage.getObject() != null) {
    		redirectAttributes.addFlashAttribute("message", "해당 그룹코드가 존재합니다.");
    	} else {
    		masterCode.setCreateId(userID);
    		masterCode.setUpdateId(userID);
    		masterCode.setCreateDt(new Date());
    		masterCode.setUpdateDt(new Date());
    	
	    	ResultMessage resultMessage2 = codeService.insert(masterCode);
	    	
	    	if (resultMessage2.isResult())
	        	redirectAttributes.addFlashAttribute("message", "등록을 완료했습니다.");
		    else
	        	redirectAttributes.addFlashAttribute("message", "등록중 오류가 발생하였습니다.");	
        
    	}
    	return "redirect:/admin/code/masterCodeList";
	}
	
	/**
	 * 마스터코드 수정페이지 로딩
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showMasterCodeUpdatePage
	 *@param model
	 *@param grpCd
	 *@return
	 */
	@RequestMapping(value = "/masterCodeUpdate/{grpCd}",method = RequestMethod.GET)
	public String showMasterCodeUpdatePage(ModelMap model,@PathVariable String grpCd)
	{
		MasterCode masterCode = (MasterCode) codeService.get(new MasterCode(grpCd)).getObject();
    	model.addAttribute("masterCode", masterCode);
		return "admin/code/masterCodeUpdate";
	}
	
	/**
	 * 마스터코드 수정 처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : masterCodeUpdateProcess
	 *@param model
	 *@param masterCode
	 *@param redirectAttributes
	 *@param request
	 *@return
	 */
	@RequestMapping(value = "/masterCodeUpdateProcess",method = RequestMethod.POST)
	public String masterCodeUpdateProcess(ModelMap model, 
			@ModelAttribute("masterCode") MasterCode masterCode, 
			RedirectAttributes redirectAttributes,
			HttpServletRequest request)
	{
		logger.debug("Insert Data : " + masterCode);
        
		// 현재 접속한 사용자 정보를 가져옴.
        Principal principal = request.getUserPrincipal();
        String userID = "";
        
        if (principal != null)
        {
            userID = principal.getName();
        }
        else{
            return "redirect:/admin";
        }
        
    	masterCode.setUpdateId(userID);
   		masterCode.setUpdateDt(new Date());
    	
    	ResultMessage resultMessage2 = codeService.update(masterCode);
    	
    	if (resultMessage2.isResult())
        	redirectAttributes.addFlashAttribute("message", "수정을 완료했습니다.");
	    else
        	redirectAttributes.addFlashAttribute("message", "수정중 오류가 발생하였습니다.");	
        
    	return "redirect:/admin/code/masterCodeList";
	}
	
	/**
	 * 마스터코드 삭제 처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : masterCodeDeleteProcess
	 *@param grpCd
	 *@param redirectAttributes
	 *@return
	 */
	@RequestMapping(value = "/masterCodeDeleteProcess/{grpCd}", method = RequestMethod.GET)
    public String masterCodeDeleteProcess(@PathVariable String grpCd, RedirectAttributes redirectAttributes)
    {
		
		//TODO 사용중인 하위 디테일 코드가 있는지 검토하여 삭제함.
		
		if (codeService.delete(new MasterCode(grpCd)).isResult())
			redirectAttributes.addFlashAttribute("message", "삭제를 완료했습니다.");
		else
			redirectAttributes.addFlashAttribute("message", "삭제중 오류가 발생하였습니다.");
		
		return "redirect:/admin/code/masterCodeList";
    }
	
	// 상세코드 부분----------------------------------------------------------------------------------------------
	
	/**
	 * 상세코드 목록 페이지 로딩
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showDetailCodeListPage
	 *@param model
	 *@return
	 */
	@RequestMapping(value = "/detailCodeList",method = RequestMethod.GET)
    public String showDetailCodeListPage(ModelMap model)
    {
		/*Map parameters = new HashMap();
		parameters.put("useYn","Y");
		List<MasterCode> masterCodeList = codeService.getMasterCodeList(parameters);
		
		model.addAttribute("masterCodeList", masterCodeList);*/
		
        return "admin/code/detailCodeList";
    }
	
	/**
	 * 상세코드 등록페이지 로딩
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showDetailCodeInsertPage
	 *@param model
	 *@return
	 */
	@RequestMapping(value = "/detailCodeInsert",method = RequestMethod.GET)
	public String showDetailCodeInsertPage(ModelMap model)
	{
		/*Map parameters = new HashMap();
		parameters.put("useYn","Y");
		List<MasterCode> masterCodeList = codeService.getMasterCodeList(parameters);
		
		model.addAttribute("masterCodeList", masterCodeList);
		*/
		return "admin/code/detailCodeInsert";
	}
	
	/**
	 * 상세코드 등록처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : detailCodeInsertProcess
	 *@param model
	 *@param detailCode
	 *@param redirectAttributes
	 *@param request
	 *@return
	 */
	@RequestMapping(value = "/detailCodeInsertProcess",method = RequestMethod.POST)
	public String detailCodeInsertProcess(ModelMap model, 
			@ModelAttribute("detailCode") DetailCode detailCode,
			RedirectAttributes redirectAttributes,
			HttpServletRequest request)
	{
		logger.debug("Insert Data : " + detailCode);
        
		
		/*// 현재 접속한 사용자 정보를 가져옴.
        Principal principal = request.getUserPrincipal();
        String userID = "";
        
        if (principal != null)
        {
            userID = principal.getName();
        }
        else{
            return "redirect:/admin";
        }
    	ResultMessage resultMessage = codeService.getDetail(new DetailCode(detailCode.getGrpCd(), detailCode.getDtlsCd()));
    	
    	if (resultMessage.getObject() != null) {
    		redirectAttributes.addFlashAttribute("message", "해당 그룹코드가 존재합니다.");
    	} else {
    		detailCode.setCreateId(userID);
    		detailCode.setUpdateId(userID);
    		detailCode.setCreateDt(new Date());
    		detailCode.setUpdateDt(new Date());
    	
	    	ResultMessage resultMessage2 = codeService.insertDetail(detailCode);

	    	if (resultMessage2.isResult())
	        	redirectAttributes.addFlashAttribute("message", "등록을 완료했습니다.");
		    else
	        	redirectAttributes.addFlashAttribute("message", "등록중 오류가 발생하였습니다.");	

    	}*/
    	return "redirect:/admin/code/detailCodeList";
	}
	
	/**
	 * 상세코드 수정 페이지 로딩
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showDetailCodeUpdatePage
	 *@param model
	 *@param grpCd
	 *@param dtlsCd
	 *@return
	 */
	@RequestMapping(value = "/detailCodeUpdate",method = RequestMethod.GET)
	public String showDetailCodeUpdatePage(ModelMap model, 
			@RequestParam(value = "grpCd", required=true) String grpCd ,
			@RequestParam(value = "dtlsCd", required=true) String dtlsCd )
	{
/*		DetailCode detailCode = (DetailCode) codeService.getDetail(new DetailCode(grpCd, dtlsCd)).getObject();
    	model.addAttribute("detailCode", detailCode);*/
		return "admin/code/detailCodeUpdate";
	}
	
	/**
	 * 상세코드 수정 처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : detailCodeUpdateProcess
	 *@param model
	 *@param detailCode
	 *@param redirectAttributes
	 *@param request
	 *@return
	 */
	@RequestMapping(value = "/detailCodeUpdateProcess",method = RequestMethod.POST)
	public String detailCodeUpdateProcess(ModelMap model, 
			@ModelAttribute("detailCode") DetailCode detailCode, 
			RedirectAttributes redirectAttributes,
			HttpServletRequest request)
	{
		logger.debug("Insert Data : " + detailCode);
        
		// 현재 접속한 사용자 정보를 가져옴.
        Principal principal = request.getUserPrincipal();
        String userID = "";
        
        if (principal != null)
        {
            userID = principal.getName();
        }
        else{
            return "redirect:/admin";
        }
        
    	detailCode.setUpdateId(userID);
   		detailCode.setUpdateDt(new Date());
    	
    	/*ResultMessage resultMessage2 = codeService.updateDetail(detailCode);
    	*//*
    	if (resultMessage2.isResult())
        	redirectAttributes.addFlashAttribute("message", "수정을 완료했습니다.");
	    else
        	redirectAttributes.addFlashAttribute("message", "수정중 오류가 발생하였습니다.");	
        */
    	return "redirect:/admin/code/detailCodeList";
	}
	
	/**
	 * 상세코드 삭제처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : detailCodeDeleteProcess
	 *@param redirectAttributes
	 *@param grpCd
	 *@param dtlsCd
	 *@return
	 */
	@RequestMapping(value = "/detailCodeDeleteProcess", method = RequestMethod.GET)
    public String detailCodeDeleteProcess(RedirectAttributes redirectAttributes,
    		@RequestParam(value = "grpCd", required=true) String grpCd ,
			@RequestParam(value = "dtlsCd", required=true) String dtlsCd)
    {
		
		//TODO 사용중인 하위 디테일 코드가 있는지 검토하여 삭제함.
		
		/*if (codeService.deleteDetail(new DetailCode(grpCd, dtlsCd)).isResult())
			redirectAttributes.addFlashAttribute("message", "삭제를 완료했습니다.");
		else
			redirectAttributes.addFlashAttribute("message", "삭제중 오류가 발생하였습니다.");
		*/
		return "redirect:/admin/code/detailCodeList";
    }
}