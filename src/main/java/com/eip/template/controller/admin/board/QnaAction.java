package com.eip.template.controller.admin.board;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.eip.template.common.util.ResultMessage;
import com.eip.template.domain.share.board.Qna;
import com.eip.template.service.share.board.QnaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 관리자> 게시판 Action
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : QnaAction.java 
 * Comment  :  
 * History  : 2014. 5. 30., 
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Controller
@RequestMapping(value = "/board")
public class QnaAction 
{
	@Autowired private QnaService qnaService;
	@Autowired private FileSystemResource fsResource;
	@Autowired private ServletContext context;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 게시판 목록 조회페이지 로딩
	 * <PRE>
	 * 개요 : 게시판 목록페이지 로딩
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showQnaList
	 *@param model
	 *@param page
	 *@param searchString
	 *@return
	 */
	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
    public String showQnaListPage(ModelMap model,
    		@RequestParam(value = "page", required=false, defaultValue="1") int page,
    		@RequestParam(value = "searchString", required=false, defaultValue="") String searchString) // 요청 페이지 값
    {
        model.addAttribute("states", qnaService.getAll().getObject());
        model.addAttribute("page", page);
        model.addAttribute("searchString", searchString);
        return "admin/board/qnaList";
    }
	
	/**
	 * 게시판 등록 페이지 로딩
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showQnaInsertPage
	 *@param model
	 *@return
	 */
	@RequestMapping(value = "/qnaInsert", method = RequestMethod.GET)
    public String showQnaInsertPage(ModelMap model)
    {
        return "admin/board/qnaInsert";
    }
	
	/**
	 * 게시판 등록처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 첨부파일의 목록을 가져와 qna VO 에 set. qna VO insert 
	* </PRE>
	 *@Method Name : insertQna
	 *@param redirectAttributes
	 *@param request
	 *@param qna
	 *@return
	 */
	@RequestMapping(value = "/qnaInsertProcess",method = RequestMethod.POST)
	public String insertQna(RedirectAttributes redirectAttributes, HttpServletRequest request,
	    		@ModelAttribute("qna") Qna qna)
	{
	    	logger.debug("Insert Data : " + qna);
	    	
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
	        
	        qna.setCreateId(userID);
	        qna.setCreateDt(new Date());
	        ResultMessage resultMessage = qnaService.insert(qna);
	        
	        qna = (Qna) resultMessage.getObject();
	        
	        if (resultMessage.isResult())
	        	redirectAttributes.addFlashAttribute("message", "등록을 완료했습니다.");
	        else
	        	redirectAttributes.addFlashAttribute("message", "등록중 오류가 발생하였습니다.");	
	        
	        return "redirect:/admin/board/qnaList";
	}
	
	/**
	 * 게시판 수정페이지 로딩
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showQnaUpdatePage
	 *@param seq
	 *@param model
	 *@param page
	 *@param searchString
	 *@return
	 */
	@RequestMapping(value = "/qnaUpdate/{seq}", method = RequestMethod.GET)
    public String showQnaUpdatePage(@PathVariable int seq, Model model, 
    		@RequestParam(value = "page", required=false, defaultValue="1") int page,
    		@RequestParam(value = "searchString", required=false, defaultValue="") String searchString) // 요청 페이지 값
    {
		Qna qna = (Qna) qnaService.get(new Qna(seq)).getObject();
    	model.addAttribute("qna", qna);
    	model.addAttribute("page", page);
        model.addAttribute("searchString", searchString);
        return "admin/board/qnaUpdate";
    }
	
	/**
	 * 게시판 수정 처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 수정전 파일VO에 삭제/수정/추가된 파일정보를 set 한후 전체삭제후 다시 등록함. 
	* </PRE>
	 *@Method Name : updateQna
	 *@param redirectAttributes
	 *@param request
	 *@param qna
	 *@param fileUpdate
	 *@param fileUpdateSeq
	 *@param fileDel
	 *@param model
	 *@param page
	 *@return
	 */
	@RequestMapping(value = "/qnaUpdateProcess",method = RequestMethod.POST)
	public String updateQna(RedirectAttributes redirectAttributes, HttpServletRequest request,
	    		@ModelAttribute("qna") Qna qna,
	            @RequestParam(value = "fileUpdate", required=false, defaultValue="") List<MultipartFile> fileUpdate,
	            @RequestParam(value = "fileUpdateSeq", required=false, defaultValue="") List<String> fileUpdateSeq,
	            @RequestParam(value = "fileDel", required=false, defaultValue="") List<String> fileDel,
	            
	            Model model, 
	            @RequestParam(value = "page", required=false, defaultValue="1") int page // 요청 페이지 값
			)
	{
	    	logger.debug("Update Data : " + qna);
	    	
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
	        
	        qna.setUpdateId(userID);
	        qna.setUpdateDt(new Date());
	        
	        if (qnaService.update(qna).isResult())
	        	redirectAttributes.addFlashAttribute("message", "수정을 완료했습니다.");
	        else
	        	redirectAttributes.addFlashAttribute("message", "수정중 오류가 발생하였습니다.");	
	        
	        return "redirect:/admin/board/qnaList?page="+page;
	}
	
	/**
	 * 게시판상세 페이지 로딩
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showQnaDetailPage
	 *@param seq
	 *@param model
	 *@param page
	 *@param searchString
	 *@return
	 */
	@RequestMapping(value = "/qnaDetail/{seq}", method = RequestMethod.GET)
    public String showQnaDetailPage(@PathVariable int seq, Model model, 
    		@RequestParam(value = "page", required=false, defaultValue="1") int page,
    		@RequestParam(value = "searchString", required=false, defaultValue="") String searchString) // 요청 페이지 값
    {
		Qna qna = (Qna) qnaService.get(new Qna(seq)).getObject();
    	model.addAttribute("qna", qna);
    	model.addAttribute("page", page);
        model.addAttribute("searchString", searchString);
        return "admin/board/qnaDetail";
    }
	
	/**
	 * 게시판 삭제처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 게시판, 게시판댓글, 게시판 첨부파일 del_yn='Y'로 세팅함 
	* </PRE>
	 *@Method Name : deleteQna
	 *@param seq
	 *@param redirectAttributes
	 *@return
	 */
	@RequestMapping(value = "/qnaDelete/{seq}", method = RequestMethod.GET)
    public String deleteQna(@PathVariable int seq, RedirectAttributes redirectAttributes)
    {
		if (qnaService.delete(new Qna(seq)).isResult())
			redirectAttributes.addFlashAttribute("message", "삭제를 완료했습니다.");
		else
			redirectAttributes.addFlashAttribute("message", "삭제중 오류가 발생하였습니다.");
		
		return "redirect:/admin/board/qnaList";
    }
	
	/**
	 * 게시판 답글 등록/수정
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 수정전 파일VO에 삭제/수정/추가된 파일정보를 set 한후 전체삭제후 다시 등록함. 
	* </PRE>
	 *@Method Name : updateQna
	 *@param redirectAttributes
	 *@param request
	 *@param qna
	 *@param fileUpdate
	 *@param fileUpdateSeq
	 *@param fileDel
	 *@param model
	 *@param page
	 *@return
	 */
	@RequestMapping(value = "/qnaReplyUpdateProcess",method = RequestMethod.POST)
	public String updateReplyQna(RedirectAttributes redirectAttributes, HttpServletRequest request,
	    		@ModelAttribute("qna") Qna qna,
	            Model model, 
	            @RequestParam(value = "page", required=false, defaultValue="1") int page // 요청 페이지 값
			)
	{
	    	logger.debug("Update Data : " + qna);
	    	
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
	        
	        qna.setUpdateId(userID);
	        qna.setUpdateDt(new Date());
	        
	        /*boolean isResult = false;
	        Qna replyQna = qna.getReplyQna();
	        
	        replyQna.setQnaRefSeq(qna.getQnaSeq());
        	replyQna.setQnaDepth(1);
        	
	        // 수정
	        if (qna.getReplyQna().getQnaSeq() != 0){
	        	isResult = qnaService.update(replyQna).isResult(); 
	        }
	        else { // 신규
	        	isResult = qnaService.insert(replyQna).isResult();
	        }
	        
	        if (isResult)	
	        	redirectAttributes.addFlashAttribute("message", "수정을 완료했습니다.");
	        else
	        	redirectAttributes.addFlashAttribute("message", "수정중 오류가 발생하였습니다.");	*/
	        
	        return "redirect:/admin/board/qnaList?page="+page;
	        
	}
}