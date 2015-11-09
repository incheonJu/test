package com.eip.template.common.util;

import java.util.Map;

/**
 * 페이징 계산
 */
public class PagingManager
{
    public static PagingData getPagingList(int currentPage, int totalRecordSize, int pageSize, int pageGroupSize)
    {
    	int startPage = 0;				
        int endPage = 0;
        
        PagingData paging = new PagingData(totalRecordSize, currentPage, pageSize, pageGroupSize);
        
        // 총 페이지 그룹 사이즈.
        int totalPageGroupSize = (int)Math.ceil((float)totalRecordSize / (float)(pageSize * pageGroupSize));
        
        // 총 페이지 수.
        int totalPageSize = (int)Math.ceil( (float)totalRecordSize / (float) pageSize );
        int currentPageGroup = (int)Math.ceil((float) currentPage / (float) pageGroupSize);
        
        // 현재 속한 페이지 그룹이 마지막 그룹일 경우.
        if (currentPageGroup == totalPageGroupSize)
        {
        	startPage = (currentPageGroup * pageGroupSize) -  (pageGroupSize - 1);
            endPage = totalPageSize;
        }
        else if(currentPageGroup < totalPageGroupSize)
        {
        	startPage = (currentPageGroup * pageGroupSize) - (pageGroupSize - 1);
            endPage = currentPageGroup * pageGroupSize;
        }
        
        int startRow = (currentPage -1) * pageSize ;
        int endRow = pageSize ;
        
        paging.setTotalPageGroupSize((int)Math.ceil((float)totalRecordSize / (float)(pageSize * pageGroupSize)));
        paging.setTotalPageSize(totalPageSize);
        paging.setCurrentPageGroup(currentPageGroup);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setStartRow(startRow);
        paging.setEndRow(endRow);
        
        return paging;
    }
}