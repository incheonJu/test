package com.eip.template.service.share.board.impl;

import com.eip.template.common.util.*;
import com.eip.template.domain.share.board.Board;
import com.eip.template.domain.share.board.BoardFile;
import com.eip.template.domain.share.board.BoardReply;
import com.eip.template.repository.share.board.BoardRepository;
import com.eip.template.service.share.board.BoardService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService
{
	@Autowired
    private BoardRepository boardRepository;
	
	private ResultMessage reMessage;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage insert(Board entity)
    {
    	/*Board board;
        try
        {
        	board = boardRepository.save(entity);
        	
        	List<BoardFile> boardFileList = entity.getBoardFileList();
        	int insertCnt = 0;
        	if (boardFileList != null && boardFileList.size() > 0 ){
        		for (int i = 0; i < boardFileList.size(); i++) {
        			BoardFile boardFile = boardFileList.get(i);
        			boardFile.setBoardSeq(board.getBoardSeq());
            		int result = boardRepository.insertBoardFile(boardFile);
            		if (result > 0) insertCnt ++;
            	}
        	}
            reMessage = new ResultMessage(true, Message.SUCCUSS, board);
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }*/

        return reMessage;
    }
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage update(Board board)
    {
    	int count;
        try
        {
        	/*count = boardRepository.update(board);
        	
        	if (count > 0){
        		
            	int insertCnt = 0;
            	
            	boardRepository.deleteBoardFile(new BoardFile(board.getBoardSeq()));//파일 전체 삭제
            	List<BoardFile> boardFileList = board.getBoardFileList();
            	if (boardFileList != null && boardFileList.size() > 0 ){
            		for (int i = 0; i < boardFileList.size(); i++) {
            			BoardFile boardFile = boardFileList.get(i);
            			boardFile.setBoardSeq(board.getBoardSeq());
                		int result = boardRepository.insertBoardFile(boardFile);
                		if (result > 0) insertCnt ++;
                	}
            	}
                reMessage = new ResultMessage(true, Message.SUCCUSS, board);
        		
        	}*/
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }

        return reMessage;
    }
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage delete(Board entity)
    {
        /*try
        {
        	boardRepository.deleteBoardFile(new BoardFile(entity.getBoardSeq()));
        	boardRepository.deleteBoardReply(new BoardReply(entity.getBoardSeq()));
        	boardRepository.delete(entity);
        	
            reMessage = new ResultMessage(true, Message.SUCCUSS);
        }
        catch (IllegalArgumentException e)
        {
            reMessage = new ResultMessage(false, Message.ERR_NODATA);
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }*/

        return reMessage;
    }
    
    @Override
    public ResultMessage get(Board entity)
    {
    	Board board;
        try
        {
        	/*board = boardRepository.get(entity);

        	if (board == null)
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
            	List boardFileList = boardRepository.getFileList(new BoardFile(board.getBoardSeq()));
            	if (boardFileList.size() > 0)
            		board.setBoardFileList(boardFileList);
            	
            	List boardReplyList = boardRepository.getBoardReplyList(new BoardReply(board.getBoardSeq()));
            	if (boardReplyList.size() > 0)
            		board.setBoardReplyList(boardReplyList);
            	
                reMessage = new ResultMessage(true, Message.SUCCUSS, board);
            }*/
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }

        return reMessage;
    }
    
    @Override
    public ResultMessage getAll()
    {
        List<Board> boardList;

        try
        {
        	boardList = boardRepository.findAll();
            if (boardList.isEmpty())
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, boardList);
            }
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }

        return reMessage;
    }
    
    @Override
    public PagingData getBoardList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters)
    {
        PagingData pagingData = null;
        
        try
        {
            int totalRecode = (int) boardRepository.count(parameters);
            
            // 페이징 매니저를 통해 페이징 계산.
            pagingData = PagingManager.getPagingList(pageNumber, totalRecode, rows, 1); // grid 1, paging 10
            List<Board> operatorList = boardRepository.getBoardList(pagingData.getStartRow(), pagingData.getPageSize(), orderType, orderColumn, parameters);   // 해당 페이지 데이터
            pagingData.setObject(operatorList);
        }
        catch (Exception e)
        {
            pagingData = null;
        }
        return pagingData;
    }
    
    @Override
    public JqGridData<Board> getBoardGridList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters)
    {
    	PagingData pagingData = getBoardList(pageNumber, rows, orderType, orderColumn, parameters);
    	JqGridData<Board> gridData = new JqGridData<Board>(pagingData.getTotalPageSize(), pagingData.getCurrentPage(), pagingData.getTotalRecordSize(), (List<Board>)pagingData.getObject());
        return gridData;
    }
    
    
    @Override
    public ResultMessage getBoardFileList(BoardFile entity)
    {
        /*try
        {
        	List boardFileList = boardRepository.getFileList(entity);

        	if (boardFileList == null)
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, boardFileList);
            }
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
*/
        return reMessage;
    }
    
    @Override
    public ResultMessage getBoardReply(BoardReply entity)
    {
    	BoardReply boardReply;
        /*try
        {
        	boardReply = boardRepository.getBoardReply(entity);

        	if (boardReply == null)
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, boardReply);
            }
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }*/

        return reMessage;
    }
    
    @Override
    public ResultMessage getBoardReplyList(BoardReply entity)
    {
    	List<BoardReply> boardReplyList;
        /*try
        {
        	boardReplyList = boardRepository.getBoardReplyList(entity);

        	if (boardReplyList == null)
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, boardReplyList);
            }
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }*/

        return reMessage;
    }
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage insertBoardReply(BoardReply entity)
    {
    	int resultCount = 0;
        /*try
        {
        	resultCount = boardRepository.insertBoardReply(entity);
        	if (resultCount > 0)
        		reMessage = new ResultMessage(true, Message.SUCCUSS, entity);
        	else 
        		reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }*/

        return reMessage;
    }
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage updateBoardReply(BoardReply entity)
    {
    	int count;
        /*try
        {
        	count = boardRepository.updateBoardReply(entity);
        	if (count > 0)
        		reMessage = new ResultMessage(true, Message.SUCCUSS, entity);
        	else 
        		reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }*/

        return reMessage;
    }
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage deleteBoardReply(BoardReply entity)
    {
        /*try
        {
        	boardRepository.deleteBoardReply(entity);
            reMessage = new ResultMessage(true, Message.SUCCUSS);
        }
        catch (IllegalArgumentException e)
        {
            reMessage = new ResultMessage(false, Message.ERR_NODATA);
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }*/

        return reMessage;
    }
    
}