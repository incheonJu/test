package com.eip.template.controller.front.board;

import com.eip.template.domain.share.board.Faq;
import com.eip.template.service.share.board.FaqService;
import com.eip.template.common.util.PagingData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletContext;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 사용자> 게시판 Action
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

    static final Logger logger = LoggerFactory.getLogger(FaqAction.class);

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
    public String showFaqListPage(Model model,
            @RequestParam(value = "page", required=false, defaultValue="1") int page, // 요청 페이지 값
            @RequestParam(value = "rows", required=false, defaultValue="10") int rows,
            @RequestParam(value = "sidx", required=false, defaultValue="FAQ_SEQ") String sidx,
            @RequestParam(value = "sord", required=false, defaultValue="desc") String sord,
            @RequestParam(value = "searchField", required=false, defaultValue="") String searchField,
            @RequestParam(value = "searchQuery", required=false, defaultValue="") String searchQuery)
    {
		Map <String, Object> parameters = new HashMap <String, Object >();

    	parameters.put("queryColum", searchField);
    	parameters.put("searchQuery", searchQuery);

        PagingData pagingData = faqService.getFaqList(page, rows, sord, sidx, parameters);


        List<Faq> faqList = (List<Faq>) pagingData.getObject();

        // 검색 정보.
        model.addAttribute("searchField", searchField);
        model.addAttribute("searchQuery", searchQuery);

        // 페이징 정보 및 데이터.
        model.addAttribute("paging", pagingData);
        model.addAttribute("faqList", faqList);

        return "front/board/faqList";
    }

}