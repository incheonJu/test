package com.eip.template.controller.front.board;

import com.eip.template.domain.share.board.Board;
import com.eip.template.domain.share.board.BoardFile;
import com.eip.template.service.share.board.BoardService;
import com.eip.template.common.util.FileUtil;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.*;

/**
 * 사용자> 게시판 Action
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : BoardAction.java 
 * Comment  :  
 * History  : 2014. 5. 30., 
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Controller
@RequestMapping(value = "/board")
public class BoardAction 
{
	@Autowired private BoardService boardService;
	@Autowired private FileSystemResource fsResource;
	@Autowired private ServletContext context;

	static final Logger logger = LoggerFactory.getLogger(BoardAction.class);

	/**
	 * 게시판 목록 조회페이지 로딩
	 * <PRE>
	 * 개요 : 게시판 목록페이지 로딩
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showBoardList
	 *@param model
	 *@param page
	 *@param searchString
	 *@return
	 */
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
    public String showBoardListPage(Model model,
            @RequestParam(value = "page", required=false, defaultValue="1") int page, // 요청 페이지 값
            @RequestParam(value = "rows", required=false, defaultValue="10") int rows,
            @RequestParam(value = "sidx", required=false, defaultValue="BOARD_SEQ") String sidx,
            @RequestParam(value = "sord", required=false, defaultValue="desc") String sord,
            @RequestParam(value = "searchField", required=false, defaultValue="") String searchField,
            @RequestParam(value = "searchQuery", required=false, defaultValue="") String searchQuery)
    {
		Map <String, Object> parameters = new HashMap <String, Object >();
    	
    	parameters.put("queryColum", searchField);
    	parameters.put("searchQuery", searchQuery);
    	
        PagingData pagingData = boardService.getBoardList(page, rows, sord, sidx, parameters);
        
       
        List<Board> boardList = (List<Board>) pagingData.getObject();
        
        // 검색 정보.
        model.addAttribute("searchField", searchField);
        model.addAttribute("searchQuery", searchQuery);
        
        // 페이징 정보 및 데이터.
        model.addAttribute("paging", pagingData);
        model.addAttribute("boardList", boardList);
        
        return "front/board/boardList";
    }
	
	/**
	 * 게시판 등록 페이지 로딩
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showBoardInsertPage
	 *@param model
	 *@return
	 */
	@RequestMapping(value = "/boardInsert", method = RequestMethod.GET)
    public String showBoardInsertPage(ModelMap model)
    {
        return "front/board/boardInsert";
    }
	
	/**
	 * 게시판 등록처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 첨부파일의 목록을 가져와 board VO 에 set. board VO insert 
	* </PRE>
	 *@Method Name : insertBoard
	 *@param redirectAttributes
	 *@param request
	 *@param board
	 *@return
	 */
	@RequestMapping(value = "/boardInsertProcess",method = RequestMethod.POST)
	public String insertBoard(RedirectAttributes redirectAttributes, HttpServletRequest request,
	    		@ModelAttribute("board") Board board)
	{

	    	// 현재 접속한 사용자 정보를 가져옴.
	        Principal principal = request.getUserPrincipal();
	        String userID = "";
	        
	        if (principal != null)
	        {
	            userID = principal.getName();
	        }
	        else{
	            return "redirect:/front";
	        }
	        
	        List<MultipartFile> files = board.getUploadfiles();
			
			String fileFullPath = "";
			List<BoardFile> boardFileList = new ArrayList();
			
			if (null != files && files.size() > 0) {
				for (int i=0; i < files.size(); i++) {
					MultipartFile file = files.get(i);
					
					if ("".equals(file.getOriginalFilename().trim())) continue; 
					fileFullPath = FileUtil.saveFile(files.get(i), fsResource.getPath() + "Image/board");
					
					BoardFile boardFile = new BoardFile(file.getOriginalFilename(), fileFullPath, FileUtil.getFileKind(file.getOriginalFilename()));
					boardFile.setCreateId(userID);
					boardFile.setCreateDt(new Date());

					boardFileList.add(boardFile);
				}
				board.setBoardFileList(boardFileList);
			}
			
	        board.setCreateId(userID);
	        board.setCreateDt(new Date());
	        ResultMessage resultMessage = boardService.insert(board);
	        
	        board = (Board) resultMessage.getObject();
	        
	        if (resultMessage.isResult())
	        	redirectAttributes.addFlashAttribute("message", "등록을 완료했습니다.");
	        else
	        	redirectAttributes.addFlashAttribute("message", "등록중 오류가 발생하였습니다.");	
	        
	        return "redirect:/front/board/boardList";
	}
	
	/**
	 * 게시판 수정페이지 로딩
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showBoardUpdatePage
	 *@param seq
	 *@param model
	 *@param page
	 *@param searchString
	 *@return
	 */
	@RequestMapping(value = "/boardUpdate/{seq}", method = RequestMethod.GET)
    public String showBoardUpdatePage(@PathVariable int seq, Model model, 
    		@RequestParam(value = "page", required=false, defaultValue="1") int page,
    		@RequestParam(value = "searchString", required=false, defaultValue="") String searchString) // 요청 페이지 값
    {
		Board board = (Board) boardService.get(new Board(seq)).getObject();
    	model.addAttribute("board", board);
    	model.addAttribute("page", page);
        model.addAttribute("searchString", searchString);
        return "front/board/boardUpdate";
    }
	
	/**
	 * 게시판 수정 처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 수정전 파일VO에 삭제/수정/추가된 파일정보를 set 한후 전체삭제후 다시 등록함. 
	* </PRE>
	 *@Method Name : updateBoard
	 *@param redirectAttributes
	 *@param request
	 *@param board
	 *@param fileUpdate
	 *@param fileUpdateSeq
	 *@param fileDel
	 *@param model
	 *@param page
	 *@return
	 */
	@RequestMapping(value = "/boardUpdateProcess",method = RequestMethod.POST)
	public String updateBoard(RedirectAttributes redirectAttributes, HttpServletRequest request,
	    		@ModelAttribute("board") Board board,
	            @RequestParam(value = "fileUpdate", required=false, defaultValue="") List<MultipartFile> fileUpdate,
	            @RequestParam(value = "fileUpdateSeq", required=false, defaultValue="") List<String> fileUpdateSeq,
	            @RequestParam(value = "fileDel", required=false, defaultValue="") List<String> fileDel,
	            
	            Model model, 
	            @RequestParam(value = "page", required=false, defaultValue="1") int page // 요청 페이지 값
			)
	{
	    	logger.debug("Update Data : " + board);

	    	// 현재 접속한 사용자 정보를 가져옴.
	        Principal principal = request.getUserPrincipal();
	        String userID = "";
	        
	        if (principal != null)
	        {
	            userID = principal.getName();
	        }
	        else{
	            return "redirect:/front";
	        }
	        
	        board.setUpdateId(userID);
	        board.setUpdateDt(new Date());
	        
	        
	        String fileFullPath = "";
	        
	        /**
	         * 1. 수정전 파일정보를 불러와서 
	         * 2. 삭제된정보는 목록에서 제거하고
	         * 3. 수정할 파일은 교체하고
	         * 4. 추가한 파일은 추가해서
	         * 5. 전체삭제후 다시 등록함.
	         */
	        //수정전 파일정보
	        ResultMessage resultMessage = boardService.getBoardFileList(new BoardFile(board.getBoardSeq()));
	        if (resultMessage.isResult()) {
	        	List<BoardFile> boardFileList = (List<BoardFile>)resultMessage.getObject(); //1
	        	for(int i=0; i < boardFileList.size(); i++){
	        		BoardFile boardFile  =  boardFileList.get(i);
	        		// 삭제된 파일 목록..fileDel
	        		if (fileDel.contains(String.valueOf(boardFile.getFileSeq()))){ //2
	        			boardFileList.remove(boardFile);
	        			continue;
	        		}
	        		
	        		// fileUpdateSeq 수정할 파일 목록.. fileUpdate //3
	        		for(String updateSeq : fileUpdateSeq){
	        			String[] updateSeqAry = updateSeq.split("\\^"); // fileSeq^업데이트파일명
	        			if (updateSeqAry.length == 2){
	        				if (updateSeqAry[0].equals(String.valueOf(boardFile.getFileSeq()))) {
	        					
	        					
	        					if (null != fileUpdate && fileUpdate.size() > 0) {
	        						for (int j=0; j < fileUpdate.size(); j++) {
	        							MultipartFile file = fileUpdate.get(j);
	        							
	        							System.out.println(updateSeqAry[1]);
	        							System.out.println(file.getName());
	        							if ("".equals(file.getOriginalFilename().trim()) || !FileUtil.getFileName(updateSeqAry[1]).equals(file.getOriginalFilename().trim()))continue;
	        							 
	        							fileFullPath = FileUtil.saveFile(fileUpdate.get(j), fsResource.getPath() + "Image/board");
	        							
	        							boardFile.setFileName(file.getOriginalFilename());
	        							boardFile.setFilePath(fileFullPath);
	        							boardFile.setFileDiv(FileUtil.getFileKind(file.getOriginalFilename()));
	        							
	        							boardFile.setUpdateId(userID);
	        							boardFile.setUpdateDt(new Date());
	        						}
	        					}
	        				}
	        			}
	        		}
	        		
	        	}
	        	// 추가된 파일 목록..
		        List<MultipartFile> files = board.getUploadfiles();
		        if (null != files && files.size() > 0) {
					for (int i=0; i < files.size(); i++) {
						MultipartFile file = files.get(i);
						
						if ("".equals(file.getOriginalFilename().trim())) continue; 
						fileFullPath = FileUtil.saveFile(files.get(i), fsResource.getPath() + "Image/board");
						
						BoardFile boardFile = new BoardFile(file.getOriginalFilename(), fileFullPath, FileUtil.getFileKind(file.getOriginalFilename()));
						boardFile.setCreateId(userID);
						boardFile.setCreateDt(new Date());

						boardFileList.add(boardFile);
					}
					board.setBoardFileList(boardFileList);
				}
	        }

	        if (boardService.update(board).isResult())
	        	redirectAttributes.addFlashAttribute("message", "수정을 완료했습니다.");
	        else
	        	redirectAttributes.addFlashAttribute("message", "수정중 오류가 발생하였습니다.");	
	        
	        return "redirect:/front/board/boardList?page="+page;
	}
	
	/**
	 * 게시판상세 페이지 로딩
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showBoardDetailPage
	 *@param seq
	 *@param model
	 *@param page
	 *@param searchString
	 *@return
	 */
	@RequestMapping(value = "/boardDetail/{seq}", method = RequestMethod.GET)
    public String showBoardDetailPage(@PathVariable int seq, Model model, 
    		@RequestParam(value = "page", required=false, defaultValue="1") int page,
    		@RequestParam(value = "searchString", required=false, defaultValue="") String searchString) // 요청 페이지 값
    {
		Board board = (Board) boardService.get(new Board(seq)).getObject();
    	model.addAttribute("board", board);
    	model.addAttribute("page", page);
        model.addAttribute("searchString", searchString);
        return "front/board/boardDetail";
    }
	
	/**
	 * 게시판 삭제처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 게시판, 게시판댓글, 게시판 첨부파일 del_yn='Y'로 세팅함 
	* </PRE>
	 *@Method Name : deleteBoard
	 *@param seq
	 *@param redirectAttributes
	 *@return
	 */
	@RequestMapping(value = "/boardDelete/{seq}", method = RequestMethod.GET)
    public String deleteBoard(@PathVariable int seq, RedirectAttributes redirectAttributes)
    {
		if (boardService.delete(new Board(seq)).isResult())
			redirectAttributes.addFlashAttribute("message", "삭제를 완료했습니다.");
		else
			redirectAttributes.addFlashAttribute("message", "삭제중 오류가 발생하였습니다.");
		
		return "redirect:/front/board/boardList";
    }
}