package com.eip.template.service.share.board;

import java.util.Map;

import com.eip.template.domain.share.board.Qna;
import com.eip.template.service.share.GenericService;
import com.eip.template.common.util.JqGridData;
import com.eip.template.common.util.PagingData;

public interface QnaService extends GenericService<Qna>
{
	//게시판
	public PagingData getQnaList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters);
	public JqGridData<Qna> getQnaGridList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters);
	public boolean isQnaPwdConfirm(Qna qna);
}