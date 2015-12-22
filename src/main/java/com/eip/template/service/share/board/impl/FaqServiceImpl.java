package com.eip.template.service.share.board.impl;

import com.eip.template.common.util.*;
import com.eip.template.domain.share.board.Faq;
import com.eip.template.repository.share.board.FaqRepository;
import com.eip.template.service.share.board.FaqService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class FaqServiceImpl implements FaqService
{
	@Autowired
    private FaqRepository faqRepository;
	
	private ResultMessage reMessage;

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage insert(Faq entity)
    {
    	Faq faq;
        try
        {
        	faq = faqRepository.save(entity);
        	
            reMessage = new ResultMessage(true, Message.SUCCUSS, faq);
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }

        return reMessage;
    }
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage update(Faq faq)
    {
    	int count;
        try
        {
        	/*count = faqRepository.update(faq);*/
            reMessage = new ResultMessage(true, Message.SUCCUSS, faq);
        	
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }

        return reMessage;
    }
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage delete(Faq entity)
    {
        try
        {
        	faqRepository.delete(entity);
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
    public ResultMessage get(Faq entity)
    {
    	Faq faq;
        try
        {
        	/*faq = faqRepository.get(entity);

        	if (faq == null)
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, faq);
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
        List<Faq> faqList;

        try
        {
        	faqList = faqRepository.findAll();
            if (faqList.isEmpty())
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, faqList);
            }
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }

        return reMessage;
    }
    
    @Override
    public PagingData getFaqList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters)
    {
        PagingData pagingData = null;
        
        try
        {
            /*int totalRecode = (int) faqRepository.getFaqCount(parameters);
            
            // 페이징 매니저를 통해 페이징 계산.
            pagingData = PagingManager.getPagingList(pageNumber, totalRecode, rows, 1); // grid 1, paging 10
            List<Faq> operatorList = faqRepository.getFaqList(pagingData.getStartRow(), pagingData.getPageSize(), orderType, orderColumn, parameters);   // 해당 페이지 데이터
            pagingData.setObject(operatorList);*/
        }
        catch (Exception e)
        {
            pagingData = null;
        }
        return pagingData;
    }
    
    @Override
    public JqGridData<Faq> getFaqGridList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters)
    {
    	PagingData pagingData = getFaqList(pageNumber, rows, orderType, orderColumn, parameters);
    	JqGridData<Faq> gridData = new JqGridData<Faq>(pagingData.getTotalPageSize(), pagingData.getCurrentPage(), pagingData.getTotalRecordSize(), (List<Faq>)pagingData.getObject());
        return gridData;
    }
    
}