package com.eip.template.repository.share.board;

import com.eip.template.domain.share.board.Board;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 게시판 Dao interface
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : BoardRepository.java
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
public interface BoardRepository extends JpaRepository<Board, Integer>
{

	/*// 게시판
	public int getBoardCount(Map mapSearchParameter);
    public List<Board> getBoardList(int startRow, int endRow, String orderType, String orderColumn, Map mapSearchParameter);
    
    //게시판 파일
    public int insertBoardFileList(List<BoardFile> boardFileList);
    public int insertBoardFile(BoardFile boardFile);
    public List<BoardFile> getFileList(BoardFile boardFile);
    public int updateBoardFile(BoardFile boardFile);
    public int updateBoardFileList(List<BoardFile> boardFileList);
    public int deleteBoardFile(BoardFile boardFile);
    
    //게시판 댓글
    public BoardReply getBoardReply(BoardReply boardReply);
    public int insertBoardReplyList(List<BoardReply> boardReplyList);
    public int insertBoardReply(BoardReply boardReply);
    public List<BoardReply> getBoardReplyList(BoardReply boardReply);
    public int updateBoardReply(BoardReply boardReply);
    public int updateBoardReplyList(List<BoardReply> boardReplyList);
    public int deleteBoardReply(BoardReply boardReply);*/
    
}