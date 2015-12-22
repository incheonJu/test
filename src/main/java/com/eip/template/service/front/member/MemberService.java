package com.eip.template.service.front.member;

import java.util.Map;

import com.eip.template.domain.share.member.Member;
import com.eip.template.service.share.GenericService;
import com.eip.template.common.util.JqGridData;
import com.eip.template.common.util.PagingData;
import com.eip.template.common.util.ResultMessage;


public interface MemberService extends GenericService<Member>
{
	ResultMessage findMemberID();
	ResultMessage login(String id, String pw);
	ResultMessage join(Member member);
	ResultMessage checkDuplicateID(String id);
	public PagingData getMemberList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters);
	public JqGridData<Member> getMemberGridList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters);
	public ResultMessage updataMyInfoProcess(Member member, String newMemberPwd);
}
