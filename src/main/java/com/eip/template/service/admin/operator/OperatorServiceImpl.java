package com.eip.template.service.admin.operator;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;

import com.eip.template.common.util.*;
import com.eip.template.domain.share.operator.Operator;
import com.eip.template.repository.admin.operator.OperatorRepository;
import org.apache.poi.ss.formula.functions.T;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OperatorServiceImpl implements OperatorService
{
    @Autowired private OperatorRepository operatorRepository;
    
    @Autowired
    private StandardPasswordEncoder encoder;

    private ResultMessage reMessage;
    private Operator operator;
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /*@Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage insert(Operator entity)
    {
        try {
        	entity.setOperPwd(encoder.encode(entity.getOperPwd()));
            entity.setCreateDt(new Date());
            entity.setOperState("0");
            
            entity = operatorRepository.save(entity);
            reMessage = new ResultMessage(true, Message.SUCCUSS, entity);
            
            logger.debug("Operator Register Succuss! - " + entity.toString());
        }
        catch (Exception e) {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        
        return reMessage;
    }
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage update(Operator entity)
    {
        try {
            int updateCount = operatorRepository.update(entity);
            if (updateCount > 0 )
            	reMessage = new ResultMessage(true, Message.SUCCUSS, entity);
            
            logger.debug("Operator Modify Succuss! - " + entity.toString());
        }
        catch (Exception e) {
            logger.error(e);
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        
        return reMessage;
    }*/

    /*@Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage delete(Operator _operator)
    {
        try {
        	Operator operator = operatorRepository.get(_operator);
        	operator.setOperState("2");
        	operator.setUpdateDt(new Date());
        	
        	// 기존 부여된 권한 해제.
        	operator.setPriv01(false);
            operator.setPriv02(false);
            operator.setPriv03(false);
            operator.setPriv04(false);
            operator.setPriv05(false);
            
            operatorRepository.update(operator);
            
            reMessage = new ResultMessage(true, Message.SUCCUSS);
            
            logger.debug("Operator Delete Succuss! - Delete Data Operator ID" + _operator.getOperId());
        }
        catch (IllegalArgumentException e)
        {
            reMessage = new ResultMessage(false, Message.ERR_NODATA);
        }
        catch (Exception e)
        {
            logger.error(e);
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        return reMessage;
    }
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage join(Operator operator)
    {
        try {
            // 회원 가입 처리.
        	operator.setOperPwd(encoder.encode(operator.getOperPwd()));
        	operator.setCreateDt(new Date());
        	operator.setOperState("0");
            operator = operatorRepository.insert(operator);
            
            reMessage = new ResultMessage(true, Message.SUCCUSS);
        }
        catch (Exception e)
        {
            logger.error(e);
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        return reMessage;
    }
   
    @Override
    public ResultMessage get(Operator _operator)
    {
        try
        {
            operator = operatorRepository.get(_operator);
            logger.debug("Get Operator Single Information");
            
            if (operator == null) {
                logger.debug("NO DATA!");
                
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else {
                reMessage = new ResultMessage(true, Message.SUCCUSS, operator);
            }
        }
        
        catch (Exception e)
        {
            logger.error(e);
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        
        return reMessage;
    }

    @Override
    public ResultMessage getAll()
    {
        try {
            List<Operator> operators = operatorRepository.getAll();
            reMessage = new ResultMessage(true, Message.SUCCUSS, operators);
            logger.debug("Get All");
        }
        catch (Exception e) {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        
        return reMessage;
    }
    
    @Override
    public PagingData getOperatorList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters)
    {
        PagingData pagingData = null;
        
        try {
            int totalRecode = (int) operatorRepository.getOperatorCount(parameters); 
            
            // 페이징 매니저를 통해 페이징 계산.
            pagingData = PagingManager.getPagingList(pageNumber, totalRecode, rows, 1); // grid 1, paging 10 
            List<Operator> operatorList = operatorRepository.getOperatorList(pagingData.getStartRow(), pagingData.getPageSize(), orderType, orderColumn, parameters);   // 해당 페이지 데이터
            pagingData.setObject(operatorList);
        }
        catch (Exception e) {
            logger.error(e);
            pagingData = null;
        }
        return pagingData;
    }
    
    @Override
    public JqGridData<Operator> getOperatorGridList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters)
    {
    	PagingData pagingData = getOperatorList(pageNumber, rows, orderType, orderColumn, parameters);
    	JqGridData<Operator> gridData = new JqGridData<Operator>(pagingData.getTotalPageSize(), pagingData.getCurrentPage(), pagingData.getTotalRecordSize(), (List<Operator>)pagingData.getObject());
        return gridData;
    }
    
    @Override
    public ResultMessage findOperatorID(String id)
    {
        try
        {
            Operator operator = operatorRepository.findOperatorID(id);
            
            if (operator == null)
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, operator);
            }
        }
        catch (Exception e)
        {
            logger.error(e);
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
            
        }
        return reMessage;
    }
    
    @Override
    public ResultMessage login(String id, String pw)
    {
        try
        {
            Operator operator = operatorRepository.findOperatorID(id); // ID 존재 여부 확인.
            
            if (!encoder.matches(pw, operator.getOperPwd())) //패스워드 불일치.
            {
                reMessage = new ResultMessage(false, Message.ERR_PASSWORD);
            }
            
            else if (operator.getOperState().equals("0"))
            {
                reMessage = new ResultMessage(false, Message.ERR_NO_ACCEPT_OPER);
            }
            else if (operator.getOperState().equals("2"))
            {
                reMessage = new ResultMessage(false, Message.ERR_DELETE_USER_DATA);
            }
            else //로그인 성공.
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, operator);
            }
        }
        catch (NoResultException e)
        {
            reMessage = new ResultMessage(false, Message.ERR_NOUSER);
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        
        return reMessage;
    }
    
    @Override
    public ResultMessage checkDuplicateID(String id)
    {
        try
        {
            Operator operator = operatorRepository.findOperatorID(id);
            
            if(operator != null && operator.getOperId().equals(id))
            {
                reMessage = new ResultMessage(false, Message.ERR_DUPLICATE_ID);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS);
            }
        }
        catch (NoResultException e)
        {
            reMessage = new ResultMessage(true, Message.SUCCUSS);
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        
        return reMessage;
    }
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage updataMyInfoProcess(Operator operator, String newOperPwd)
    {
        try
        {
            String operID = operator.getOperId();
            Operator temp = operatorRepository.findOperatorID(operator.getOperId());
            
            // 요청 PW와 저장된 PW가 일치하지 않을 경우.
            if (!encoder.matches(operator.getOperPwd(), temp.getOperPwd()))
            {
                reMessage = new ResultMessage(false, Message.ERR_PASSWORD);
            }
            else{
                // 비밀번호 변경시
                if (!newOperPwd.equals("")){
                    operator.setOperPwd(encoder.encode(newOperPwd));
                }
                else{
                    operator.setOperPwd(temp.getOperPwd());
                }
                operator.setOperState(temp.getOperState());
                operator.setPriv01(temp.isPriv01());
                operator.setPriv02(temp.isPriv02());
                operator.setPriv03(temp.isPriv03());
                operator.setPriv04(temp.isPriv04());
                operator.setPriv05(temp.isPriv05());
                
                int updateCnt = operatorRepository.update(operator);
                reMessage = new ResultMessage(true, Message.SUCCUSS, operator);
            }
            
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        return reMessage;
    }
    
    */


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
