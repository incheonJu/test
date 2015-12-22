package com.eip.template.service.admin.system;

import com.eip.template.common.util.*;
import com.eip.template.domain.share.system.SystemLog;
import com.eip.template.repository.admin.system.SystemRepository;
import org.apache.poi.ss.formula.functions.T;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class SystemServiceImpl implements SystemService
{
	@Autowired
    private SystemRepository systemRepository;
	
	private ResultMessage reMessage;

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /*@Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage insert(SystemLog entity)
    {
    	SystemLog systemLog;
        try
        {
        	systemLog = systemRepository.save(entity);
        	
            reMessage = new ResultMessage(true, Message.SUCCUSS, systemLog);
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }

        return reMessage;
    }
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage update(SystemLog entity)
    {
    	int count;
        try
        {
        	*//*count = systemRepository.update(entity);
        	if (count > 0)*//*
        		reMessage = new ResultMessage(true, Message.SUCCUSS, entity);
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }

        return reMessage;
    }
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage delete(SystemLog entity)
    {
        try
        {
        	systemRepository.delete(entity);
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
    public ResultMessage get(SystemLog entity)
    {
    	SystemLog systemLog;
        try
        {
        	systemLog = systemRepository.findOne(entity.getOpSeq());

        	if (systemLog == null)
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, systemLog);
            }
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
        List<SystemLog> systemLogList;

        try
        {
        	systemLogList = systemRepository.findAll();
            if (systemLogList.isEmpty())
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, systemLogList);
            }
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }

        return reMessage;
    }*/
    
    /*@Override
    public PagingData getSystemLogList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters)
    {
        PagingData pagingData = null;
        
        try
        {
            int totalRecode = (int) systemRepository.getSystemLogCount(parameters); 
            
            // 페이징 매니저를 통해 페이징 계산.
            pagingData = PagingManager.getPagingList(pageNumber, totalRecode, rows, 1); // grid 1, paging 10
            List<SystemLog> operatorList = systemRepository.getSystemLogList(pagingData.getStartRow(), pagingData.getPageSize(), orderType, orderColumn, parameters);   // 해당 페이지 데이터
            pagingData.setObject(operatorList);
        }
        catch (Exception e)
        {
            logger.error(e);
            pagingData = null;
        }
        return pagingData;
    }
    
    @Override
    public JqGridData<SystemLog> getSystemLogGridList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters)
    {
    	PagingData pagingData = getSystemLogList(pageNumber, rows, orderType, orderColumn, parameters);
    	JqGridData<SystemLog> gridData = new JqGridData<SystemLog>(pagingData.getTotalPageSize(), pagingData.getCurrentPage(), pagingData.getTotalRecordSize(), (List<SystemLog>)pagingData.getObject());
        return gridData;
    }*/

    @Override
    public ResultMessage insert(T entity) {
        return null;
    }

    @Override
    public ResultMessage update(T entity) {
        return null;
    }

    @Override
    public ResultMessage delete(T entity) {
        return null;
    }

    @Override
    public ResultMessage get(T entity) {
        return null;
    }

    @Override
    public ResultMessage getAll() {
        return null;
    }
}