package com.eip.template.service.share.board;

import java.util.Map;

import com.eip.template.domain.share.board.Faq;
import com.eip.template.service.share.GenericService;
import com.eip.template.common.util.JqGridData;
import com.eip.template.common.util.PagingData;

public interface FaqService extends GenericService<Faq>
{
	//게시판
	public PagingData getFaqList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters);
	public JqGridData<Faq> getFaqGridList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters);
}