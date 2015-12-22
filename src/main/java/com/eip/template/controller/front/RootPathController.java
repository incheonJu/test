package com.eip.template.controller.front;

import java.security.Principal;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.eip.template.service.front.member.MemberService;
import com.eip.template.domain.share.member.Member;
import com.eip.template.common.util.ResultMessage;

@Controller
@RequestMapping
public class RootPathController
{
    @Autowired private MemberService memberService;
    
    /**
     * 메인페이지 로딩
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : showMainPage
     *@param model
     *@param principal
     *@param httpSession
     *@return
     */
    @RequestMapping(value="/main", method = RequestMethod.GET)
    public String showMainPage(Model model, Principal principal, HttpSession httpSession)
    {
        return "front/main";
    }
    
    /**
     * 사용자 정보 수정 페이지 로딩
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : showMyInfoPage
     *@param model
     *@param principal
     *@return
     */
    @RequestMapping(value="/myInfo", method = RequestMethod.GET)
    public String showMyInfoPage(Model model, Principal principal)
    {
        if (principal == null)
        {
            return "redirect:/front/login";
        }
        
        String loginMemberID = principal.getName();
        Member member = (Member) memberService.findMemberID().getObject();
        
        model.addAttribute("member", member);
        
        return "front/myinfo";
    }
    
    /**
     * 사용자 정보 수정 처리
     * @param member
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "/updateMyinfoProcess", method = RequestMethod.POST)
    public String updateMyinfoProcess(
            RedirectAttributes redirectAttributes, 
            HttpServletRequest request,
            @ModelAttribute Member member,
            @RequestParam(value = "newMemberPwd", required=false) String newMemberPwd)
    {
        
    	
        member.setUpdateDt(new Date());
        member.setUpdateId(member.getMemberId());

        ResultMessage resultMessage = memberService.updataMyInfoProcess(member, newMemberPwd);
        
        if (resultMessage.isResult()){
            redirectAttributes.addFlashAttribute("message", resultMessage.getMessage());
        }
        else{
            redirectAttributes.addFlashAttribute("message", resultMessage.getMessage());
        }
        return "redirect:/front/myInfo";
    }
    
    
    /**
     * 사용자 중복 안내 페이지 로딩
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : showDuplicationUserError
     *@param member
     *@param model
     *@return
     */
    @RequestMapping(value = "/duplicationMember", method = RequestMethod.GET)
    public String showDuplicationUserError(@ModelAttribute(value = "member") Member member, Model model)
    {
        model.addAttribute("member", member);
        
        return "front/duplicationUserError";
    }
    
    /**
     * 아이디 찾기 처리
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : findID
     *@param model
     *@param operName
     *@param email
     *@return
     */
    @RequestMapping(value = "/findId", method = RequestMethod.POST)
    public ResultMessage findID(Model model,@RequestBody Member member)
    {
    	ResultMessage resultMessage = memberService.get(member);
        
        if (resultMessage.isResult())
        {
            model.addAttribute("member", resultMessage.getObject());
        }
        
        return resultMessage;
    }
    
    
    /**
     * 파일찾기 처리
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : findPW
     *@param model
     *@param certificationKey
     *@param name
     *@param operID
     *@return
     */
    @RequestMapping(value = "/findPW")
    public String findPW(Model model,
            @RequestParam(value = "certificationKey", required = false) String certificationKey,
            @RequestParam(value = "name", required = false) String name,
            @CookieValue(value = "ssnMemberFindID", required = false) String operID)
    {
        /*
    	ResultMessage resultMessage = memberService.findPWByAuthKey(operID, certificationKey);
        
        if (resultMessage.isResult())
        {
            model.addAttribute("newPW", resultMessage.getObject());
        }
        
        else
        {
            model.addAttribute("result", resultMessage);
        }
        */
        return "front/findPW";
    }
}
