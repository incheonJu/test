package com.eip.template.service.admin.statistics;

import com.eip.template.common.util.ResultMessage;
import com.eip.template.repository.share.VisitorRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class VisitStatisticsServiceImpl implements VisitStatisticsService
{
    @Autowired private VisitorRepository visitorRepository;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    private ResultMessage resultMessage;
    
    /*@Override
    public List<Visitor> searchListData(String year, String month, String periodDiv, String schStartDay, String schEndDay)
    {
        List<Visitor> visitList = null;
        
        try
        {
        	visitList = visitorRepository.searchListData(year, month, periodDiv, schStartDay, schEndDay);
            
        }
        catch (Exception e)
        {
            visitList = null;
        }
        
        return visitList;
    }
    
    @Override
    public JqGridData<Visitor> searchListDataToJqGrid(int page, String sidx, String sord, int rows, String year, String month, String periodDiv, String schStartDay, String schEndDay)
    {
        int totalRecodeSize = (int) visitorRepository.getSearchCount(year, month, periodDiv, schStartDay, schEndDay);
        
        PagingData paging = PagingManager.getPagingList(page, totalRecodeSize, rows, 1);
        
        int startRow = paging.getStartRow();
        int endRow = paging.getEndRow();
        int currentPage = paging.getCurrentPage();
        int totalPageSize = paging.getTotalPageSize();
        
        List<Visitor> visitList = visitorRepository.searchByDate(startRow, paging.getPageSize(), sord, sidx, year, month, periodDiv, schStartDay, schEndDay);
        
        JqGridData<Visitor> gridData = new JqGridData<Visitor>(totalPageSize, currentPage, totalRecodeSize, visitList);
        
        return gridData;
    }*/
    
}
