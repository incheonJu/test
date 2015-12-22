package com.eip.template.service.share.board;

import java.util.Map;

import com.eip.template.domain.share.board.Board;
import com.eip.template.domain.share.board.BoardFile;
import com.eip.template.domain.share.board.BoardReply;
import com.eip.template.service.share.GenericService;
import com.eip.template.common.util.JqGridData;
import com.eip.template.common.util.PagingData;
import com.eip.template.common.util.ResultMessage;

public interface BoardService extends GenericService<Board>
{
	//게시판
	public PagingData getBoardList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters);
	public JqGridData<Board> getBoardGridList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters);

	//게시판 파일
	public ResultMessage getBoardFileList(BoardFile entity);
	
	//게시판 댓글
	public ResultMessage getBoardReplyList(BoardReply entity);
	public ResultMessage getBoardReply(BoardReply entity);
	public ResultMessage insertBoardReply(BoardReply entity);
	public ResultMessage updateBoardReply(BoardReply entity);
	public ResultMessage deleteBoardReply(BoardReply entity);
}