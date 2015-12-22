package com.eip.template.controller.admin.board;

import java.util.HashMap;
import java.util.Map;


import com.eip.template.common.util.JqGridData;
import com.eip.template.common.util.ResultMessage;
import com.eip.template.domain.share.board.Board;
import com.eip.template.domain.share.board.BoardReply;
import com.eip.template.service.share.board.BoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 게시판 Ajax Action
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : BoardAjaxAction.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Controller
@RequestMapping(value = "/board")
public class BoardAjaxAction
{
	@Autowired private BoardService boardService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	/**
	 * 게시판 grid 목록 조회
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : boardJqList
	 *@param page
	 *@param rows
	 *@param sidx
	 *@param sord
	 *@param searchField
	 *@param searchString
	 *@return
	 */
	@RequestMapping(value = "/boardJqList", method = RequestMethod.GET)
    @ResponseBody
    public JqGridData<Board> boardJqList(
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
    	 
        return boardService.getBoardGridList(page, rows, sord, sidx, parameters);
    }
	
	/**
	 * 게시판 댓글 등록처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : boardReplyInsertProcess
	 *@param boardReply
	 *@return
	 */
    @RequestMapping(value = "/boardReplyInsertProcess", method = RequestMethod.POST)
    @ResponseBody
    public ResultMessage boardReplyInsertProcess(@RequestBody BoardReply boardReply)
    {
        return boardService.insertBoardReply(boardReply);
    }
    
    /**
     * 게시판 댓글 1건 가져옴
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : getBoardReply
     *@param boardReply
     *@return
     */
    @RequestMapping(value = "/getBoardReply", method = RequestMethod.POST)
    @ResponseBody
    public ResultMessage getBoardReply(@RequestBody BoardReply boardReply)
    {
        return boardService.getBoardReply(boardReply);
    }
    
    /**
     * 게시판댓글 수정 처리
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : updateBoardReplyProcess
     *@param boardReply
     *@return
     */
    @RequestMapping(value = "/updateBoardReplyProcess", method = RequestMethod.POST)
    @ResponseBody
    public ResultMessage updateBoardReplyProcess(@RequestBody BoardReply boardReply)
    {
        return boardService.updateBoardReply(boardReply);
    }
    
    /**
     * 게시판 댓글 목록 조회
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : getBoardReplyList
     *@param boardReply
     *@return
     */
    @RequestMapping(value = "/getBoardReplyList", method = RequestMethod.POST)
    @ResponseBody
    public ResultMessage getBoardReplyList(@RequestBody BoardReply boardReply)
    {
        return boardService.getBoardReplyList(boardReply);
    }
    
    /**
     * 게시판 삭제 처리
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : deleteBoardReplyProcess
     *@param boardReply
     *@return
     */
    @RequestMapping(value = "/deleteBoardReplyProcess", method = RequestMethod.POST)
    @ResponseBody
    public ResultMessage deleteBoardReplyProcess(@RequestBody BoardReply boardReply)
    {
        return boardService.deleteBoardReply(boardReply);
    }
    
    
    
}