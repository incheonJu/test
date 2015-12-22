package com.eip.template.service.admin.code;

import com.eip.template.common.util.*;
import com.eip.template.domain.share.code.DetailCode;
import com.eip.template.domain.share.code.MasterCode;
import com.eip.template.repository.admin.code.CodeRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class CodeServiceImpl implements CodeService
{
    @Autowired private CodeRepository codeRepository;

    @Autowired
    private StandardPasswordEncoder encoder;

    private ResultMessage reMessage;
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage insert(MasterCode entity)
    {
        try
        {
            entity = codeRepository.save(entity);
            reMessage = new ResultMessage(true, Message.SUCCUSS, entity);

            logger.debug("Operator Register Succuss! - " + entity.toString());
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }

        return reMessage;
    }

    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage update(MasterCode entity)
    {
        /*try
        {
            int updateCount = codeRepository.update(entity);
            if (updateCount > 0 )
            	reMessage = new ResultMessage(true, Message.SUCCUSS, entity);
            else
            	reMessage = new ResultMessage(false, Message.ERR_FAIL);
            logger.debug("Operator Modify Succuss! - " + entity.toString());
        }
        catch (Exception e)
        {
            logger.error(e);
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }*/

        return reMessage;
    }

    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage delete(MasterCode _masterCode)
    {
        /*try
        {
        	int deleteCnt = codeRepository.delete(_masterCode);

        	if( deleteCnt > 0) {
        		reMessage = new ResultMessage(true, Message.SUCCUSS);
        	} else {
        		reMessage = new ResultMessage(false, Message.ERR_FAIL);
        	}

            logger.debug("Operator Delete Succuss! - Delete Data " + _masterCode.getGrpCd());
        }
        catch (IllegalArgumentException e)
        {
            reMessage = new ResultMessage(false, Message.ERR_NODATA);
        }
        catch (Exception e)
        {
            logger.error(e);
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }*/
        return reMessage;
    }

    @Override
    public ResultMessage get(MasterCode _masterCode)
    {
        /*try
        {
        	MasterCode masterCode = codeRepository.get(_masterCode);

            logger.debug("Get Operator Single Information");

            if (masterCode == null)
            {
                logger.debug("NO DATA!");

                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                logger.debug(masterCode.toString());
                reMessage = new ResultMessage(true, Message.SUCCUSS, masterCode);
            }
        }

        catch (Exception e)
        {
            logger.error(e);
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
*/
        return reMessage;
    }

    @Override
    public ResultMessage getAll()
    {
        /*try
        {
            List<MasterCode> masterCodeList = codeRepository.getAll();
            reMessage = new ResultMessage(true, Message.SUCCUSS, masterCodeList);
            logger.debug("Get All");
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }*/

        return reMessage;
    }

    /*@Override
    public List<MasterCode> getMasterCodeList(Map parameters)
    {
        try
        {
            List<MasterCode> masterCodeList = codeRepository.getMasterCodeList(parameters);   // 해당 페이지 데이터
            return masterCodeList;
        }
        catch (Exception e)
        {
            logger.error(e);
            return null;
        }

    }

    @Override
    public PagingData getMasterCodeList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters)
    {
        PagingData pagingData = null;

        try
        {
            int totalRecode = (int) codeRepository.getMasterCodeCount(parameters);

            // 페이징 매니저를 통해 페이징 계산.
            pagingData = PagingManager.getPagingList(pageNumber, totalRecode, rows, 1); // grid 1, paging 10
            List<MasterCode> masterCodeList = codeRepository.getMasterCodeList(pagingData.getStartRow(), pagingData.getPageSize(), orderType, orderColumn, parameters);   // 해당 페이지 데이터
            pagingData.setObject(masterCodeList);
        }
        catch (Exception e)
        {
            logger.error(e);
            pagingData = null;
        }
        return pagingData;
    }

    @Override
    public JqGridData<MasterCode> getMasterCodeGridList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters)
    {
    	PagingData pagingData = getMasterCodeList(pageNumber, rows, orderType, orderColumn, parameters);
    	JqGridData<MasterCode> gridData = new JqGridData<MasterCode>(pagingData.getTotalPageSize(), pagingData.getCurrentPage(), pagingData.getTotalRecordSize(), (List<MasterCode>)pagingData.getObject());
        return gridData;
    }

    // 상세코드 부분-----------------------------------------------------------------------------------------------------------------------------
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage insertDetail(DetailCode entity)
    {
        try
        {

            entity = codeRepository.insertDetail(entity);
            reMessage = new ResultMessage(true, Message.SUCCUSS, entity);

            logger.debug("Operator Register Succuss! - " + entity.toString());
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
    public ResultMessage updateDetail(DetailCode entity)
    {
        try
        {
            int updateCount = codeRepository.updateDetail(entity);
            if (updateCount > 0 )
            	reMessage = new ResultMessage(true, Message.SUCCUSS, entity);
            else
            	reMessage = new ResultMessage(false, Message.ERR_FAIL);
            logger.debug("Operator Modify Succuss! - " + entity.toString());
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
    public ResultMessage deleteDetail(DetailCode _detailCode)
    {
        try
        {
        	int deleteCnt = codeRepository.deleteDetail(_detailCode);

        	if( deleteCnt > 0) {
        		reMessage = new ResultMessage(true, Message.SUCCUSS);
        	} else {
        		reMessage = new ResultMessage(false, Message.ERR_FAIL);
        	}

            logger.debug("Operator Delete Succuss! - Delete Data " + _detailCode.getGrpCd());
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
    public ResultMessage getDetail(DetailCode _detailCode)
    {
        try
        {
        	DetailCode detailCode = codeRepository.getDetail(_detailCode);

            logger.debug("Get Operator Single Information");

            if (detailCode == null)
            {
                logger.debug("NO DATA!");

                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                logger.debug(detailCode.toString());
                reMessage = new ResultMessage(true, Message.SUCCUSS, detailCode);
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
    public ResultMessage getAllDetail()
    {
        try
        {
            List<DetailCode> detailCodeList = codeRepository.getAllDetail();
            reMessage = new ResultMessage(true, Message.SUCCUSS, detailCodeList);
            logger.debug("Get All");
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }

        return reMessage;
    }

    @Override
    public PagingData getDetailCodeList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters)
    {
        PagingData pagingData = null;

        try
        {
            int totalRecode = (int) codeRepository.getDetailCodeCount(parameters);

            // 페이징 매니저를 통해 페이징 계산.
            pagingData = PagingManager.getPagingList(pageNumber, totalRecode , rows, 1); // grid 1, paging 10
            List<DetailCode> detailCodeList = codeRepository.getDetailCodeList(pagingData.getStartRow(), pagingData.getPageSize(), orderType, orderColumn, parameters);   // 해당 페이지 데이터
            pagingData.setObject(detailCodeList);
        }
        catch (Exception e)
        {
            logger.error(e);
            pagingData = null;
        }
        return pagingData;
    }

    @Override
    public JqGridData<DetailCode> getDetailCodeGridList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters)
    {
    	PagingData pagingData = getDetailCodeList(pageNumber, rows, orderType, orderColumn, parameters);
    	JqGridData<DetailCode> gridData = new JqGridData<DetailCode>(pagingData.getTotalPageSize(), pagingData.getCurrentPage(), pagingData.getTotalRecordSize(), (List<DetailCode>)pagingData.getObject());
        return gridData;
    }*/

}
