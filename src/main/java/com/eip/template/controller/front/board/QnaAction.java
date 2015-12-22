package com.eip.template.controller.front.board;

import com.eip.template.service.front.member.MemberService;
import com.eip.template.domain.share.board.Qna;
import com.eip.template.domain.share.member.Member;
import com.eip.template.service.share.board.QnaService;
import com.eip.template.common.util.PagingData;
import com.eip.template.common.util.ResultMessage;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 사용자> 게시판 Action
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
	@Autowired private MemberService memberService;
	@Autowired private FileSystemResource fsResource;
	@Autowired private ServletContext context;

	static final Logger logger = LoggerFactory.getLogger(QnaAction.class);
	
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
    public String showQnaListPage(Model model,
            @RequestParam(value = "page", required=false, defaultValue="1") int page, // 요청 페이지 값
            @RequestParam(value = "rows", required=false, defaultValue="10") int rows,
            @RequestParam(value = "sidx", required=false, defaultValue="QNA_SEQ") String sidx,
            @RequestParam(value = "sord", required=false, defaultValue="desc") String sord,
            @RequestParam(value = "searchField", required=false, defaultValue="") String searchField,
            @RequestParam(value = "searchQuery", required=false, defaultValue="") String searchQuery)
    {
		Map <String, Object> parameters = new HashMap <String, Object >();
    	
    	parameters.put("queryColum", searchField);
    	parameters.put("searchQuery", searchQuery);
    	
        PagingData pagingData = qnaService.getQnaList(page, rows, sord, sidx, parameters);
        
       
        List<Qna> qnaList = (List<Qna>) pagingData.getObject();
        
        // 검색 정보.
        model.addAttribute("searchField", searchField);
        model.addAttribute("searchQuery", searchQuery);
        
        // 페이징 정보 및 데이터.
        model.addAttribute("paging", pagingData);
        model.addAttribute("qnaList", qnaList);
        
        return "front/board/qnaList";
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
    public String showQnaInsertPage(ModelMap model, HttpServletRequest request)
    {
		 Principal principal = request.getUserPrincipal();
		 if (principal != null)
	     {
			 Member loginMemberInfo = (Member) memberService.findMemberID().getObject();
			 model.addAttribute("loginMemberInfo", loginMemberInfo);
	     }
	     
         return "front/board/qnaInsert";
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
	    
	        qna.setCreateDt(new Date());
	        ResultMessage resultMessage = qnaService.insert(qna);
	        
	        qna = (Qna) resultMessage.getObject();
	        
	        if (resultMessage.isResult())
	        	redirectAttributes.addFlashAttribute("message", "등록을 완료했습니다.");
	        else
	        	redirectAttributes.addFlashAttribute("message", "등록중 오류가 발생하였습니다.");	
	        
	        return "redirect:/front/board/qnaList";
	}
	
	@RequestMapping(value = "/qnaPwdConfirm", method = RequestMethod.POST)
    public String qnaPwdConfirm(RedirectAttributes redirectAttributes, 
    		@RequestParam(value = "page", required=false, defaultValue="1") int page, @ModelAttribute("qna") Qna _qna, Model model) // 요청 페이지 값
    {
		boolean isQnaPwd = qnaService.isQnaPwdConfirm(_qna);
		if (isQnaPwd) {
			Qna qna = (Qna) qnaService.get(_qna).getObject();
			//model.addAttribute("qna", qna);
			redirectAttributes.addFlashAttribute("qna", qna);
			return "redirect:/front/board/qnaUpdate";
		} else {
        	redirectAttributes.addFlashAttribute("message", "비밀번호가 일치하지 않습니다.");	
        	return "redirect:/front/board/qnaList?page="+page;
		}
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
	@RequestMapping(value = "/qnaUpdate", method = RequestMethod.GET)
	public String showUpdateQnaPage(RedirectAttributes redirectAttributes, HttpServletRequest request,
	    		@ModelAttribute("qna") Qna qna,
	            Model model
			)
	{
			if (qna == null || qna.getQnaSeq() == 0){
				redirectAttributes.addFlashAttribute("message", "잘못된 접근입니다.");
				return "redirect:/front";
			} else {
				model.addAttribute("qna", qna);
		        return "front/board/qnaUpdate";
			}
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
	            Model model, 
	            @RequestParam(value = "page", required=false, defaultValue="1") int page // 요청 페이지 값
			)
	{
	    	logger.debug("Update Data : " + qna);
	    	
	    	//pwd 가져와서 세팅함..
	    	Qna preQna = (Qna) qnaService.get(qna).getObject();
	    	qna.setCreatePwd(preQna.getCreatePwd());
	        qna.setUpdateDt(new Date());
	        
	        if (qnaService.update(qna).isResult())
	        	redirectAttributes.addFlashAttribute("message", "수정을 완료했습니다.");
	        else
	        	redirectAttributes.addFlashAttribute("message", "수정중 오류가 발생하였습니다.");	
	        
	        return "redirect:/front/board/qnaList?page="+page;
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

		// 공개인경우 상세보기
		if (qna.getOpenYn().equals("Y")) {
			return "front/board/qnaDetail";			
		} else {
			return "front/board/qnaPwdInsert";
		}

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
		
		return "redirect:/front/board/qnaList";
    }
}