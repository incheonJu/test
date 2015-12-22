package com.eip.template.controller.admin.board;

import com.eip.template.common.util.ResultMessage;
import com.eip.template.domain.share.board.Faq;
import com.eip.template.service.share.board.FaqService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.Date;

/**
 * 관리자> 게시판 Action
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : FaqAction.java 
 * Comment  :  
 * History  : 2014. 5. 30., 
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Controller
@RequestMapping(value = "/board")
public class FaqAction 
{
	@Autowired private FaqService faqService;
	@Autowired private FileSystemResource fsResource;
	@Autowired private ServletContext context;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 게시판 목록 조회페이지 로딩
	 * <PRE>
	 * 개요 : 게시판 목록페이지 로딩
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showFaqList
	 *@param model
	 *@param page
	 *@param searchString
	 *@return
	 */
	@RequestMapping(value = "/faqList", method = RequestMethod.GET)
    public String showFaqListPage(ModelMap model,
    		@RequestParam(value = "page", required=false, defaultValue="1") int page,
    		@RequestParam(value = "searchString", required=false, defaultValue="") String searchString) // 요청 페이지 값
    {
        model.addAttribute("states", faqService.getAll().getObject());
        model.addAttribute("page", page);
        model.addAttribute("searchString", searchString);
        return "admin/board/faqList";
    }
	
	/**
	 * 게시판 등록 페이지 로딩
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showFaqInsertPage
	 *@param model
	 *@return
	 */
	@RequestMapping(value = "/faqInsert", method = RequestMethod.GET)
    public String showFaqInsertPage(ModelMap model)
    {
        return "admin/board/faqInsert";
    }
	
	/**
	 * 게시판 등록처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 첨부파일의 목록을 가져와 faq VO 에 set. faq VO insert 
	* </PRE>
	 *@Method Name : insertFaq
	 *@param redirectAttributes
	 *@param request
	 *@param faq
	 *@return
	 */
	@RequestMapping(value = "/faqInsertProcess",method = RequestMethod.POST)
	public String insertFaq(RedirectAttributes redirectAttributes, HttpServletRequest request,
	    		@ModelAttribute("faq") Faq faq)
	{
	    	logger.debug("Insert Data : " + faq);
	    	
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
	        
	        faq.setCreateId(userID);
	        faq.setCreateDt(new Date());
	        ResultMessage resultMessage = faqService.insert(faq);
	        
	        faq = (Faq) resultMessage.getObject();
	        
	        if (resultMessage.isResult())
	        	redirectAttributes.addFlashAttribute("message", "등록을 완료했습니다.");
	        else
	        	redirectAttributes.addFlashAttribute("message", "등록중 오류가 발생하였습니다.");	
	        
	        return "redirect:/admin/board/faqList";
	}
	
	/**
	 * 게시판 수정페이지 로딩
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showFaqUpdatePage
	 *@param seq
	 *@param model
	 *@param page
	 *@param searchString
	 *@return
	 */
	@RequestMapping(value = "/faqUpdate/{seq}", method = RequestMethod.GET)
    public String showFaqUpdatePage(@PathVariable int seq, Model model, 
    		@RequestParam(value = "page", required=false, defaultValue="1") int page,
    		@RequestParam(value = "searchString", required=false, defaultValue="") String searchString) // 요청 페이지 값
    {
		Faq faq = (Faq) faqService.get(new Faq(seq)).getObject();
    	model.addAttribute("faq", faq);
    	model.addAttribute("page", page);
        model.addAttribute("searchString", searchString);
        return "admin/board/faqUpdate";
    }
	
	/**
	 * 게시판 수정 처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 수정전 파일VO에 삭제/수정/추가된 파일정보를 set 한후 전체삭제후 다시 등록함. 
	* </PRE>
	 *@Method Name : updateFaq
	 *@param redirectAttributes
	 *@param request
	 *@param faq
	 *@param fileUpdate
	 *@param fileUpdateSeq
	 *@param fileDel
	 *@param model
	 *@param page
	 *@return
	 */
	@RequestMapping(value = "/faqUpdateProcess",method = RequestMethod.POST)
	public String updateFaq(RedirectAttributes redirectAttributes, HttpServletRequest request,
	    		@ModelAttribute("faq") Faq faq,
	            Model model, 
	            @RequestParam(value = "page", required=false, defaultValue="1") int page // 요청 페이지 값
			)
	{
	    	logger.debug("Update Data : " + faq);
	    	
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
	        
	        faq.setUpdateId(userID);
	        faq.setUpdateDt(new Date());
	        
	        if (faqService.update(faq).isResult())
	        	redirectAttributes.addFlashAttribute("message", "수정을 완료했습니다.");
	        else
	        	redirectAttributes.addFlashAttribute("message", "수정중 오류가 발생하였습니다.");	
	        
	        return "redirect:/admin/board/faqList?page="+page;
	}
	
	/**
	 * 게시판 삭제처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 게시판, 게시판댓글, 게시판 첨부파일 del_yn='Y'로 세팅함 
	* </PRE>
	 *@Method Name : deleteFaq
	 *@param seq
	 *@param redirectAttributes
	 *@return
	 */
	@RequestMapping(value = "/faqDelete/{seq}", method = RequestMethod.GET)
    public String deleteFaq(@PathVariable int seq, RedirectAttributes redirectAttributes)
    {
		if (faqService.delete(new Faq(seq)).isResult())
			redirectAttributes.addFlashAttribute("message", "삭제를 완료했습니다.");
		else
			redirectAttributes.addFlashAttribute("message", "삭제중 오류가 발생하였습니다.");
		
		return "redirect:/admin/board/faqList";
    }
}