package com.eip.template.controller.admin;

import java.security.Principal;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.eip.template.common.util.ResultMessage;
import com.eip.template.domain.share.operator.Operator;
import com.eip.template.service.admin.operator.OperatorService;
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

@Controller
@RequestMapping
public class RootPathController
{
    @Autowired private OperatorService operatorService;
    
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
    	 if (principal == null)
         {
             return "redirect:/admin/login";
         }
        return "admin/main";
    }
    
    /**
     * 처리자 정보 수정 페이지 로딩
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
            return "redirect:/admin/login";
        }
        
        String loginOperID = principal.getName();
       /* Operator operator = (Operator) operatorService.findOperatorID(loginOperID).getObject();
        
        model.addAttribute("operator", operator);*/
        
        return "admin/myinfo";
    }
    
    /**
     * 처리자 정보 수정 처리
     * @param operator
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "/updateMyinfoProcess", method = RequestMethod.POST)
    public String updateMyinfoProcess(
            RedirectAttributes redirectAttributes, 
            HttpServletRequest request,
            @ModelAttribute Operator operator,
            @RequestParam(value = "newOperPwd", required=false) String newOperPwd)
    {
        
    	
        operator.setUpdateDt(new Date());
        operator.setUpdateId(operator.getOperId());

        /*ResultMessage resultMessage = operatorService.updataMyInfoProcess(operator, newOperPwd);
        
        if (resultMessage.isResult()){
            redirectAttributes.addFlashAttribute("message", resultMessage.getMessage());
        }
        else{
            redirectAttributes.addFlashAttribute("message", resultMessage.getMessage());
        }*/
        return "redirect:/admin/myInfo";
    }
    
    
    /**
     * 사용자 중복 안내 페이지 로딩
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : showDuplicationUserError
     *@param operator
     *@param model
     *@return
     */
    @RequestMapping(value = "/duplicationOper", method = RequestMethod.GET)
    public String showDuplicationUserError(@ModelAttribute(value = "operator") Operator operator, Model model)
    {
        model.addAttribute("operator", operator);
        
        return "admin/duplicationUserError";
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
    public ResultMessage findID(Model model,@RequestBody Operator operator)
    {
    	/*ResultMessage resultMessage = operatorService.get(operator);*/
    	ResultMessage resultMessage = null;

        if (resultMessage.isResult())
        {
            model.addAttribute("operator", resultMessage.getObject());
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
            @CookieValue(value = "ssnOperFindID", required = false) String operID)
    {
        /*
    	ResultMessage resultMessage = operatorService.findPWByAuthKey(operID, certificationKey);
        
        if (resultMessage.isResult())
        {
            model.addAttribute("newPW", resultMessage.getObject());
        }
        
        else
        {
            model.addAttribute("result", resultMessage);
        }
        */
        return "admin/findPW";
    }
}
