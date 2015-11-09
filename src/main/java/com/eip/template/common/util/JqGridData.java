package com.eip.template.common.util;

import java.util.List;

/**
 * JqGrid를 사용하기 위해 필요한 내용.
 * 
 * @author AhnJungMin
 * @param <T> 넣어서 보낼 정보
 */
public class JqGridData<T>
{
    /** Total number of pages */
    private int total;
    
    /** The current page number */
    private int page;
    
    /** Total number of records */
    private int records;
    
    /** The actual data */
    private List<T> rows;

    public JqGridData(int total, int page, int records, List<T> rows) {
      this.total = total;
      this.page = page;
      this.records = records;
      this.rows = rows;
    }

    public int getTotal() {
      return total;
    }

    public int getPage() {
      return page;
    }

    public int getRecords() {
      return records;
    }

    public List<T> getRows() {
      return rows;
    }
  }