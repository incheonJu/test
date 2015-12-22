package com.eip.template.service.share.board.impl;

import java.util.List;
import java.util.Map;

import com.eip.template.common.util.*;
import com.eip.template.domain.share.board.Qna;
import com.eip.template.repository.share.board.QnaRepository;
import com.eip.template.service.share.board.QnaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class QnaServiceImpl implements QnaService
{
	@Autowired
    private QnaRepository qnaRepository;
	
	private ResultMessage reMessage;

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage insert(Qna entity)
    {
    	Qna qna;
        try
        {
        	qna = qnaRepository.save(entity);
        	
            reMessage = new ResultMessage(true, Message.SUCCUSS, qna);
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }

        return reMessage;
    }
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage update(Qna qna)
    {
    	int count;
        try
        {
        	/*count = qnaRepository.update(qna);*/
        	
            reMessage = new ResultMessage(true, Message.SUCCUSS, qna);
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }

        return reMessage;
    }
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage delete(Qna entity)
    {
        try
        {
        	qnaRepository.delete(entity);
        	
            reMessage = new ResultMessage(true, Message.SUCCUSS);
        }
        catch (IllegalArgumentException e)
        {
            reMessage = new ResultMessage(false, Message.ERR_NODATA);
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }

        return reMessage;
    }
    
    @Override
    public ResultMessage get(Qna entity)
    {
    	Qna qna;
        try
        {
        	/*qna = qnaRepository.get(entity);

        	if (qna == null)
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
            	// 답변 글을 가져온다.
            	Qna replyQna = qnaRepository.getReplyQna(entity);
            	if (replyQna != null) {
            		qna.setReplyQna(replyQna);
            	}
            	
                reMessage = new ResultMessage(true, Message.SUCCUSS, qna);
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
        List<Qna> qnaList;

        try
        {
        	qnaList = qnaRepository.findAll();
            if (qnaList.isEmpty())
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, qnaList);
            }
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }

        return reMessage;
    }
    
    @Override
    public PagingData getQnaList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters)
    {
        PagingData pagingData = null;
        
        try
        {
            /*int totalRecode = (int) qnaRepository.getQnaCount(parameters);
            
            // 페이징 매니저를 통해 페이징 계산.
            pagingData = PagingManager.getPagingList(pageNumber, totalRecode, rows, 1); // grid 1, paging 10
            List<Qna> operatorList = qnaRepository.getQnaList(pagingData.getStartRow(), pagingData.getPageSize(), orderType, orderColumn, parameters);   // 해당 페이지 데이터
            pagingData.setObject(operatorList);*/
        }
        catch (Exception e)
        {
            pagingData = null;
        }
        return pagingData;
    }
    
    @Override
    public JqGridData<Qna> getQnaGridList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters)
    {
    	PagingData pagingData = getQnaList(pageNumber, rows, orderType, orderColumn, parameters);
    	JqGridData<Qna> gridData = new JqGridData<Qna>(pagingData.getTotalPageSize(), pagingData.getCurrentPage(), pagingData.getTotalRecordSize(), (List<Qna>)pagingData.getObject());
        return gridData;
    }
    
    @Override
    public boolean isQnaPwdConfirm(Qna qna)
    {
    	/*try
        {
            return qnaRepository.isQnaPwdConfirm(qna);*//*
        }
        catch (Exception e)
        {
        	return false;
        }*/
        return false;
    }
    
    
}