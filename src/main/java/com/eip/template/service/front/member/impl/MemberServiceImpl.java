package com.eip.template.service.front.member.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;

import com.eip.template.common.util.*;
import com.eip.template.domain.share.member.Member;
import com.eip.template.repository.front.repository.member.MemberRepository;
import com.eip.template.service.front.member.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService
{
    @Autowired private MemberRepository memberRepository;
    
    @Autowired
    private StandardPasswordEncoder encoder;

    private ResultMessage reMessage;
    private Member member;
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage insert(Member entity)
    {
        try {
        	entity.setMemberPwd(encoder.encode(entity.getMemberPwd()));
            entity.setCreateDt(new Date());
            entity.setMemberState("0");
            
            entity = memberRepository.save(entity);
            reMessage = new ResultMessage(true, Message.SUCCUSS, entity);
            
            logger.debug("Member Register Succuss! - " + entity.toString());
        }
        catch (Exception e) {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        
        return reMessage;
    }
    
    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage update(Member entity)
    {
        try {
            /*int updateCount = memberRepository.update(entity);
            if (updateCount > 0 )
            	reMessage = new ResultMessage(true, Message.SUCCUSS, entity);
            
            logger.debug("Member Modify Succuss! - " + entity.toString());*/
        }
        catch (Exception e) {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        
        return reMessage;
    }

    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage delete(Member _member)
    {
        try {
        	Member member = memberRepository.findByMemberSeq();
        	member.setMemberState("2");
        	member.setUpdateDt(new Date());
        	
            memberRepository.save(member);
            
            reMessage = new ResultMessage(true, Message.SUCCUSS);
            
            logger.debug("Member Delete Succuss! - Delete Data Member ID" + _member.getMemberId());
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
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage join(Member member)
    {
        try {
            // 회원 가입 처리.
        	member.setMemberPwd(encoder.encode(member.getMemberPwd()));
        	member.setCreateDt(new Date());
        	member.setMemberState("1");
            member = memberRepository.save(member);
            
            reMessage = new ResultMessage(true, Message.SUCCUSS);
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        return reMessage;
    }
   
    @Override
    public ResultMessage get(Member _member)
    {
        try
        {
            member = memberRepository.findByMemberSeq();
            logger.debug("Get Member Single Information");
            
            if (member == null) {
                logger.debug("NO DATA!");
                
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else {
                reMessage = new ResultMessage(true, Message.SUCCUSS, member);
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
        try {
            List<Member> members = memberRepository.findAll();
            reMessage = new ResultMessage(true, Message.SUCCUSS, members);
            logger.debug("Get All");
        }
        catch (Exception e) {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        
        return reMessage;
    }
    
    @Override
    public PagingData getMemberList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters)
    {
        PagingData pagingData = null;
        
        try {
            /*int totalRecode = (int) memberRepository.getMemberCount(parameters);
            
            // 페이징 매니저를 통해 페이징 계산.
            pagingData = PagingManager.getPagingList(pageNumber, totalRecode, rows, 1); // grid 1, paging 10
            List<Member> memberList = memberRepository.getMemberList(pagingData.getStartRow(), pagingData.getPageSize(), orderType, orderColumn, parameters);   // 해당 페이지 데이터
            pagingData.setObject(memberList);*/
        }
        catch (Exception e) {
            pagingData = null;
        }
        return pagingData;
    }
    
    @Override
    public JqGridData<Member> getMemberGridList(int pageNumber, int rows, String orderType, String orderColumn, Map parameters)
    {
    	PagingData pagingData = getMemberList(pageNumber, rows, orderType, orderColumn, parameters);
    	JqGridData<Member> gridData = new JqGridData<Member>(pagingData.getTotalPageSize(), pagingData.getCurrentPage(), pagingData.getTotalRecordSize(), (List<Member>)pagingData.getObject());
        return gridData;
    }
    
    @Override
    public ResultMessage findMemberID()
    {
        try
        {
            Member member = memberRepository.findByMemberId();
            
            if (member == null)
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, member);
            }
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
            
        }
        return reMessage;
    }
    
    @Override
    public ResultMessage login(String id, String pw)
    {
        try
        {
            Member member = memberRepository.findByMemberId(); // ID 존재 여부 확인.
            
            if (!encoder.matches(pw, member.getMemberPwd())) //패스워드 불일치.
            {
                reMessage = new ResultMessage(false, Message.ERR_PASSWORD);
            }
            
            else if (member.getMemberState().equals("0"))
            {
                reMessage = new ResultMessage(false, Message.ERR_NO_ACCEPT_OPER);
            }
            else if (member.getMemberState().equals("2"))
            {
                reMessage = new ResultMessage(false, Message.ERR_DELETE_USER_DATA);
            }
            else //로그인 성공.
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, member);
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
            Member member = memberRepository.findByMemberId();
            
            if(member != null && member.getMemberId().equals(id))
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
    public ResultMessage updataMyInfoProcess(Member member, String newMemberPwd)
    {
        try
        {
            String memberID = member.getMemberId();
            Member temp = memberRepository.findByMemberId();
            
            // 요청 PW와 저장된 PW가 일치하지 않을 경우.
            if (!encoder.matches(member.getMemberPwd(), temp.getMemberPwd()))
            {
                reMessage = new ResultMessage(false, Message.ERR_PASSWORD);
            }
            else{
                // 비밀번호 변경시
                if (!newMemberPwd.equals("")){
                    member.setMemberPwd(encoder.encode(newMemberPwd));
                }
                else{
                    member.setMemberPwd(temp.getMemberPwd());
                }
                member.setMemberState(temp.getMemberState());
                
                /*int updateCnt = memberRepository.update(member);*/
                reMessage = new ResultMessage(true, Message.SUCCUSS, member);
            }
            
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        return reMessage;
    }
    
    /*
    @Override
    public ResultMessage searchID(String id)
    {
        try
        {
            List<Member> members = memberRepository.searchMemberID(id);
            
            if (members.isEmpty())
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, members);
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
    public ResultMessage searchName(String name)
    {
        try
        {
            List<Member> members = memberRepository.searchMemberName(name);
            
            if (members.isEmpty())
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, members);
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
    public ResultMessage searchState(String state)
    {
        try
        {
            List<Member> members = memberRepository.searchMemberState(state);
            
            if (members.isEmpty())
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, members);
            }
        }
        catch (Exception e)
        {
            logger.error(e);
            reMessage = new ResultMessage(true, Message.ERR_FAIL);
        }
        
        return reMessage;
    }

    

    @Override
    public JqGridData<Member> getPageData(int page, String sidx, String sord, int rows)
    {
        int totalRecodeSize = (int) memberRepository.count();
        
        PagingData paging = PagingManager.getPagingList(page, totalRecodeSize, rows, 1);
        
        int startRow = paging.getStartRow();
        int endRow = paging.getPageSize();
        int currentPage = paging.getCurrentPage();
        int totalPageSize = paging.getTotalPageSize();
        
        List<Member> members = memberRepository.getPageData(startRow, endRow, sord, sidx);
        
        JqGridData<Member> gridData = new JqGridData<Member>(totalPageSize, currentPage, totalRecodeSize, members);
        
        return gridData;
    }

    @Override
    public JqGridData<Member> getSearchData(int page, String sidx, String sord, int rows, String searchColum, String searchQuery, String state)
    {
        int totalRecodeSize = (int) memberRepository.countSearchMemberData(searchColum, searchQuery, state);
        
        PagingData paging = PagingManager.getPagingList(page, totalRecodeSize, rows, 1);
        
        int startRow = paging.getStartRow();
        int endRow = paging.getPageSize();
        int currentPage = paging.getCurrentPage();
        int totalPageSize = paging.getTotalPageSize();
        
        List<Member> members = memberRepository.getSearchMemberData(startRow, endRow, sord, sidx, searchColum, searchQuery, state);
        
        JqGridData<Member> gridData = new JqGridData<Member>(totalPageSize, currentPage, totalRecodeSize, members);
        
        return gridData;
    }

	@Override
	public ResultMessage searchOrganAndPrivi(String organName, String privi) {
        try
        {
            List<Member> members = memberRepository.searchMemberByOrganWithPriv(organName, privi);
            
            if (members.isEmpty())
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, members);
            }
        }
        catch (Exception e)
        {
            logger.error(e);
            reMessage = new ResultMessage(true, Message.ERR_FAIL);
        }
        
        return reMessage;
	}
	
    @Override
    public ResultMessage searchOrganAndPrivi(int organSeq, String privi)
    {
        try
        {
            List<Member> members = memberRepository.searchMemberByOrganWithPriv(organSeq, privi);
            
            if (members.isEmpty())
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, members);
            }
        }
        catch (Exception e)
        {
            logger.error(e);
            reMessage = new ResultMessage(true, Message.ERR_FAIL);
        }
        
        return reMessage;
    }

    @Override
    @Transactional(value="mybatisTransactionManager")
    public ResultMessage updataMyInfoData(Member member, String newPW, String memberAreas)
    {
        try
        {
            String memberID = member.getMemberId();
            Member temp = memberRepository.findMemberID(member.getMemberId());
            
            // 요청 PW와 저장된 PW가 일치하지 않을 경우.
            if (!encoder.matches(member.getMemberPwd(), temp.getMemberPwd()))
            {
                reMessage = new ResultMessage(false, Message.ERR_PASSWORD);
            }
            else{
                // 비밀번호 변경시
                if (!newPW.equals("")){
                    member.setMemberPwd(encoder.encode(newPW));
                }
                else{
                    member.setMemberPwd(temp.getMemberPwd());
                }
                
                member = memberRepository.update(member);
                reMessage = new ResultMessage(true, Message.SUCCUSS, member);
            }
            
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        return reMessage;
    }

    @Override
    public ResultMessage getMemberByAreaSeqPriv(int areaSeq, String privi)
    {
        try
        {
            List<Member> members = memberRepository.searchMemberByAreaSeqPriv(areaSeq, privi);
            
            if (members.isEmpty())
            {
                reMessage = new ResultMessage(false, Message.ERR_NODATA);
            }
            else
            {
                reMessage = new ResultMessage(true, Message.SUCCUSS, members);
            }
        }
        catch (Exception e)
        {
            reMessage = new ResultMessage(false, Message.ERR_FAIL);
        }
        return reMessage;
    }

    @Override
    public ResultMessage findIDByAuthKey(String authKey)
    {
        Member member = null;
        
        try
        {
            member = memberRepository.findMemberIDByAuthKey(authKey);
            reMessage = new ResultMessage(true, Message.SUCCUSS, member);
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
    public ResultMessage findPWByAuthKey(String id, String authKey)
    {
        try
        {
            member = memberRepository.findMemberIDByAuthKey(authKey);
            
            if (member.getMemberId().equals(id))
            {
                String newPW = ShufflePasswordMaker.ShufflePasswordMaker(10);
                String encodeNewPW = encoder.encode(newPW);
                
                member.setMemberPwd(encodeNewPW);
                
                reMessage = new ResultMessage(true, Message.SUCCUSS, newPW);
            }
            else
            {
                reMessage = new ResultMessage(false, Message.ERR_CERTIFICATION_KEY_NOT_MATCH);
            }
        }
        catch (NullPointerException e)
        {
            reMessage = new ResultMessage(false, Message.ERR_NOUSER);
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
    */

}
