package com.eip.template.controller.front.member;

import com.eip.template.service.front.member.MemberService;
import com.eip.template.domain.share.member.Member;
import com.eip.template.common.util.ResultMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.Date;

/**
 * 사용자 관리 Action
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : MemberAction.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Controller
@RequestMapping(value="/member")
public class MemberAction
{
	@Autowired private MemberService memberService;

    static final Logger logger = LoggerFactory.getLogger(MemberAction.class);
    
	/**
	 * 사용자 회원가입 페이지 로딩
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showRegisterPage
	 *@param model
	 *@return
	 */
	@RequestMapping(value = "/register")
    public String showRegisterPage(Model model)
    {
        model.addAttribute("member", new Member());
        return "front/register";
    }
    
	/**
	 * 사용자 회원가입 처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : memberJoin
	 *@param redirectAttributes
	 *@param member
	 *@return
	 */
    @RequestMapping(value = "/memberRegister", method = RequestMethod.POST)
    public String memberRegisterProcess(
            RedirectAttributes redirectAttributes,
            @ModelAttribute Member member)
    {
        logger.debug("data:", member);
        
        ResultMessage resultMessage = memberService.join(member);
        
        if (resultMessage.isResult())
        {
            redirectAttributes.addFlashAttribute("message", "회원가입에 성공하였습니다.");
        }
        else
        {
            redirectAttributes.addFlashAttribute("message", "회원가입에 실패하였습니다.");
        }
        return "redirect:/front/login";
    }
    
    /**
     * 아이디찾기 페이지 로딩
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : showFindIdPage
     *@return
     */
    @RequestMapping(value = "/findMember", method = RequestMethod.GET)
    public String showFindIdPage()
    {
        return "front/findMember";
    }
   
    /**
     * 사용자 목록 조회 페이지 로딩
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : showMemberListPage
     *@param model
     *@param request
     *@param page
     *@param searchField
     *@param searchString
     *@param state01
     *@param state02
     *@param state03
     *@param priv01
     *@param priv02
     *@param priv03
     *@param priv04
     *@param priv05
     *@return
     */
    @RequestMapping(value = "/memberList", method = RequestMethod.GET)
    public String showMemberListPage(Model model, HttpServletRequest request,
    		@RequestParam(value = "page", required=false, defaultValue="1") int page ,
    		@RequestParam(value = "searchField", required=false, defaultValue="all") String searchField,
    		@RequestParam(value = "searchString", required=false, defaultValue="") String searchString,
    		@RequestParam(value = "state01", required=false, defaultValue="") String state01,
            @RequestParam(value = "state02", required=false, defaultValue="") String state02,
            @RequestParam(value = "state03", required=false, defaultValue="") String state03)
    {
        model.addAttribute("page", page);
        model.addAttribute("searchField", searchField);
        model.addAttribute("searchString", searchString);
        model.addAttribute("state01", state01);
        model.addAttribute("state02", state02);
        model.addAttribute("state03", state03);
        return "front/member/memberList";
    }
    
    /**
     * 사용자 상세 페이지 룅
     * <PRE>
     * 개요 : 
     * 처리내용 : 로그인한 사용자가 1차권한을 갖고있거나 탈퇴가 아닌경우 상세페이지를 보여주고, 아닌경우 readonly 페이지를 보여준다.
    * </PRE>
     *@Method Name : showMemberDetailPage
     *@param memberId
     *@param model
     *@param principal
     *@param httpSession
     *@param page
     *@param searchField
     *@param searchString
     *@param state01
     *@param state02
     *@param state03
     *@param priv01
     *@param priv02
     *@param priv03
     *@param priv04
     *@param priv05
     *@return
     */
    @RequestMapping(value = "/{memberId}", method = RequestMethod.GET)
    public String showMemberDetailPage(@PathVariable String memberId, Model model, Principal principal, HttpSession httpSession,
    		@RequestParam(value = "page", required=false, defaultValue="1") int page ,
    		@RequestParam(value = "searchField", required=false, defaultValue="all") String searchField,
    		@RequestParam(value = "searchString", required=false, defaultValue="") String searchString,
    		@RequestParam(value = "searchState01", required=false, defaultValue="") String state01,
            @RequestParam(value = "searchState02", required=false, defaultValue="") String state02,
            @RequestParam(value = "searchState03", required=false, defaultValue="") String state03)
    {
        
        Member member = (Member) memberService.get(new Member(memberId)).getObject();
        
        model.addAttribute("member", member);
        model.addAttribute("page", page);
        model.addAttribute("searchField", searchField);
        model.addAttribute("searchString", searchString);
        model.addAttribute("searchState01", state01);
        model.addAttribute("searchState02", state02);
        model.addAttribute("searchState03", state03);
        
        Member loginMember = (Member)httpSession.getAttribute("loginUser");
        if (loginMember == null) return "front/login";
        if ( !"2".equals(member.getMemberState()) )
        {
            return "front/member/memberDetail";
        }
        return "front/member/memberReadOnlyDetail";
    }
    
    /**
     * 사용자 수정 처리
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : updateProcess
     *@param redirectAttributes
     *@param request
     *@param member
     *@param priv1
     *@param priv2
     *@param priv3
     *@param priv4
     *@param priv5
     *@param page
     *@return
     */
    @RequestMapping(value="/updateProcess", method = RequestMethod.POST)
    public String updateProcess(RedirectAttributes redirectAttributes, HttpServletRequest request,
            @ModelAttribute Member member,
            @RequestParam(value = "priv1", required=false, defaultValue="false") boolean priv1,
            @RequestParam(value = "priv2", required=false, defaultValue="false") boolean priv2,
            @RequestParam(value = "priv3", required=false, defaultValue="false") boolean priv3,
            @RequestParam(value = "priv4", required=false, defaultValue="false") boolean priv4,
            @RequestParam(value = "priv5", required=false, defaultValue="false") boolean priv5,
    		@RequestParam(value = "page", required=false, defaultValue="1") int page ) // 요청 페이지 값
    {
        // 수정 정보 추가
        Principal principal = request.getUserPrincipal();
        member.setUpdateDt(new Date());
        if (principal != null)
        {
            String userID = principal.getName();
            member.setUpdateId(userID);
        }
        
        memberService.update(member);
        
        redirectAttributes.addFlashAttribute("message", "사용자 정보 수정 완료");
        return "redirect:/front/member/memberList?page="+page;
    }
   
    /**
     * 사용자 삭제 처리 (del_yn='Y'로 세팅함)
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : deleteData
     *@param memberId
     *@param redirectAttributes
     *@return
     */
    @RequestMapping(value = "/delete/{memberId}", method = RequestMethod.GET)
    public String deleteData(@PathVariable String memberId, RedirectAttributes redirectAttributes)
    {
        if (memberService.delete(new Member(memberId)).isResult())
        {
            redirectAttributes.addFlashAttribute("message", "사용자를 삭제했습니다.");
        } else {
        	redirectAttributes.addFlashAttribute("message", "사용자 삭제중 오류가 발생하였습니다.");
        }
        return "redirect:/front/member/memberList";
    }
    /*
    
    @RequestMapping(value="/modify", method = RequestMethod.POST)
    public String modifyData(RedirectAttributes redirectAttributes, HttpServletRequest request,
            @ModelAttribute Member member,
            @RequestParam(value = "depart.seq") int departSeq,
            @RequestParam(value = "priv.seq", required=false, defaultValue="0") int privSeq,
            @RequestParam(value = "priv1", required=false, defaultValue="false") boolean priv1,
            @RequestParam(value = "priv2", required=false, defaultValue="false") boolean priv2,
            @RequestParam(value = "priv3", required=false, defaultValue="false") boolean priv3,
            @RequestParam(value = "memberAreas", required=false, defaultValue = "") String memberAreas,
    		@RequestParam(value = "page", required=false, defaultValue="1") int page ) // 요청 페이지 값
    {
        // 수정 정보 추가
        Principal principal = request.getUserPrincipal();
        Member loginMemberInfo = (Member) memberService.findMemberID(principal.getName()).getObject();
        
        if (member.getState().equals(MemberStateKind.READY))
        {
            member.setState(MemberStateKind.ACCESS);
        }
        
        member.setUpdateDate(new Date());
        member.setUpdateID(loginMemberInfo.getId());
        member.setUpdateIP(request.getLocalAddr());
        
        // 지역별 통계용 nAreaSeq 추가
    	String addr1 = member.getAddr1(); // 인천 남구 도화1동
    	if (addr1 != null) {
	    	String[] addr1Ary = addr1.split(" ");
	    	
	    	if (addr1Ary.length > 2) {
	    		Area area = (Area)areaService.findByAreaName(addr1Ary[1], addr1Ary[2]).getObject();
	    		member.setAreaSeq(area.getSeq());
	    	}
    	}
        ////
        
        boolean member = false;
        Depart depart = new Depart();
        depart.setSeq(departSeq);
        member.setDepartName(depart);
        
        if (priv1 == true) member = true;
        
        MemberPrivilege memberPrivilege = new MemberPrivilege(privSeq, member, priv1, priv2, priv3, member);
        
        memberService.updateMemberData(member, memberPrivilege, memberAreas);
        
        redirectAttributes.addFlashAttribute("message", "사용자 정보 수정 완료");
        return "redirect:/admin/member/list?page="+page;
    }
   
    @RequestMapping(value = "/delete/{seq}", method = RequestMethod.GET)
    public String deleteData(@PathVariable int seq, RedirectAttributes redirectAttributes)
    {
        if (memberService.delete(seq).isResult())
        {
            redirectAttributes.addFlashAttribute("message", "사용자를 삭제했습니다.");
            return "redirect:/admin/member/list";
        }
        
        redirectAttributes.addFlashAttribute("message", "사용자 삭제중 오류가 발생하였습니다.");
        return "redirect:/admin/member/list";
    }
    
    @RequestMapping(value = "/excelDownload", method = RequestMethod.GET)
    public String excelTransform(
            ModelMap modelMap,
            RedirectAttributes redirectAttributes,
            @RequestParam(value = "searchField", required=false, defaultValue="all") String searchField,
            @RequestParam(value = "searchString", required=false, defaultValue="") String searchString,
            @RequestParam(value = "state01", required=false, defaultValue="") String state01,
            @RequestParam(value = "state02", required=false, defaultValue="") String state02,
            @RequestParam(value = "state03", required=false, defaultValue="") String state03,
            @RequestParam(value = "priv01", required=false, defaultValue="0") int priv01,
            @RequestParam(value = "priv02", required=false, defaultValue="0") int priv02,
            @RequestParam(value = "priv03", required=false, defaultValue="0") int priv03)
    {
        List<MemberPrivilege> memberPrivileges = (List<MemberPrivilege>) memberPrivilegeService.getSearchDataNoPaging(searchField, searchString, state01, state02, state03, priv01, priv02, priv03).getObject();
        
        if (memberPrivileges == null)
        {
            redirectAttributes.addFlashAttribute("message", "저장할 데이터가 없습니다.");
            return "redirect:/admin/member/list";
        }
        
        modelMap.put("excelName", "사용자_목록");
        modelMap.put("list", memberPrivileges);
        modelMap.put("searchField", searchField);
        modelMap.put("searchString", searchString);
        modelMap.put("state01", state01);
        modelMap.put("state02", state02);
        modelMap.put("state03", state03);
        modelMap.put("priv01", priv01);
        modelMap.put("priv02", priv02);
        modelMap.put("priv03", priv03);
        
        return "MembersExcelView";
    }
    
    @RequestMapping(value = "/result")
    public String findMemberID()
    {
    	return null;
    }
    */
}
