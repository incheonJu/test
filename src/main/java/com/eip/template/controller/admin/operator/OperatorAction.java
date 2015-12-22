package com.eip.template.controller.admin.operator;

import java.security.Principal;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.eip.template.domain.share.operator.Operator;
import com.eip.template.service.admin.operator.OperatorService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 처리자 관리 Action
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : OperatorAction.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Controller
@RequestMapping(value="/operator")
public class OperatorAction
{
	@Autowired private OperatorService operatorService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
	/**
	 * 처리자 회원가입 페이지 로딩
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
        model.addAttribute("operator", new Operator());
        return "admin/register";
    }
    
	/**
	 * 처리자 회원가입 처리
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : operatorJoin
	 *@param redirectAttributes
	 *@param operator
	 *@return
	 */
    @RequestMapping(value = "/operRegister", method = RequestMethod.POST)
    public String operRegisterProcess(
            RedirectAttributes redirectAttributes,
            @ModelAttribute Operator operator)
    {

        /*ResultMessage resultMessage = operatorService.join(operator);
        
        if (resultMessage.isResult())
        {
            redirectAttributes.addFlashAttribute("message", "회원가입에 성공하였습니다. 관리자 승인 처리후 사용하실수 있습니다.");
        }
        else
        {
            redirectAttributes.addFlashAttribute("message", "회원가입에 실패하였습니다.");
        }*/
        return "redirect:/admin/login";
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
    @RequestMapping(value = "/findOperator", method = RequestMethod.GET)
    public String showFindIdPage()
    {
        return "admin/findOperator";
    }
   
    /**
     * 처리자 목록 조회 페이지 로딩
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : showOperatorListPage
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
    @RequestMapping(value = "/operatorList", method = RequestMethod.GET)
    public String showOperatorListPage(Model model, HttpServletRequest request,
    		@RequestParam(value = "page", required=false, defaultValue="1") int page ,
    		@RequestParam(value = "searchField", required=false, defaultValue="all") String searchField,
    		@RequestParam(value = "searchString", required=false, defaultValue="") String searchString,
    		@RequestParam(value = "state01", required=false, defaultValue="") String state01,
            @RequestParam(value = "state02", required=false, defaultValue="") String state02,
            @RequestParam(value = "state03", required=false, defaultValue="") String state03,
            @RequestParam(value = "priv01", required=false, defaultValue="0") int priv01,
            @RequestParam(value = "priv02", required=false, defaultValue="0") int priv02,
            @RequestParam(value = "priv03", required=false, defaultValue="0") int priv03,
		    @RequestParam(value = "priv04", required=false, defaultValue="0") int priv04,
		    @RequestParam(value = "priv05", required=false, defaultValue="0") int priv05)
    {
        model.addAttribute("page", page);
        model.addAttribute("searchField", searchField);
        model.addAttribute("searchString", searchString);
        model.addAttribute("state01", state01);
        model.addAttribute("state02", state02);
        model.addAttribute("state03", state03);
        model.addAttribute("priv01", priv01);
        model.addAttribute("priv02", priv02);
        model.addAttribute("priv03", priv03);
        model.addAttribute("priv04", priv04);
        model.addAttribute("priv05", priv05);
        return "admin/operator/operatorList";
    }
    
    /**
     * 처리자 상세 페이지 룅
     * <PRE>
     * 개요 : 
     * 처리내용 : 로그인한 처리자가 1차권한을 갖고있거나 탈퇴가 아닌경우 상세페이지를 보여주고, 아닌경우 readonly 페이지를 보여준다.
    * </PRE>
     *@Method Name : showOperatorDetailPage
     *@param operId
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
    @RequestMapping(value = "/{operId}", method = RequestMethod.GET)
    public String showOperatorDetailPage(@PathVariable String operId, Model model, Principal principal, HttpSession httpSession,
    		@RequestParam(value = "page", required=false, defaultValue="1") int page ,
    		@RequestParam(value = "searchField", required=false, defaultValue="all") String searchField,
    		@RequestParam(value = "searchString", required=false, defaultValue="") String searchString,
    		@RequestParam(value = "searchState01", required=false, defaultValue="") String state01,
            @RequestParam(value = "searchState02", required=false, defaultValue="") String state02,
            @RequestParam(value = "searchState03", required=false, defaultValue="") String state03,
            @RequestParam(value = "searchPriv01", required=false, defaultValue="0") int priv01,
            @RequestParam(value = "searchPriv02", required=false, defaultValue="0") int priv02,
            @RequestParam(value = "searchPriv03", required=false, defaultValue="0") int priv03,
		    @RequestParam(value = "searchPriv03", required=false, defaultValue="0") int priv04,
		    @RequestParam(value = "searchPriv05", required=false, defaultValue="0") int priv05)
    {
        
        /*Operator operator = (Operator) operatorService.get(new Operator(operId)).getObject();
        
        model.addAttribute("operator", operator);*/
        model.addAttribute("page", page);
        model.addAttribute("searchField", searchField);
        model.addAttribute("searchString", searchString);
        model.addAttribute("searchState01", state01);
        model.addAttribute("searchState02", state02);
        model.addAttribute("searchState03", state03);
        model.addAttribute("searchPriv01", priv01);
        model.addAttribute("searchPriv02", priv02);
        model.addAttribute("searchPriv03", priv03);
        model.addAttribute("searchPriv04", priv04);
        model.addAttribute("searchPriv05", priv05);
        
        Operator loginOperator = (Operator)httpSession.getAttribute("loginUser");
        if (loginOperator == null) return "admin/login";
        /*if (loginOperator.isPriv01() == true && !"2".equals(operator.getOperState()) )
        {
            return "admin/operator/operatorDetail";
        }*/
        return "admin/operator/operatorReadOnlyDetail";
    }
    
    /**
     * 처리자 수정 처리
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : updateProcess
     *@param redirectAttributes
     *@param request
     *@param operator
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
            @ModelAttribute Operator operator,
            @RequestParam(value = "priv1", required=false, defaultValue="false") boolean priv1,
            @RequestParam(value = "priv2", required=false, defaultValue="false") boolean priv2,
            @RequestParam(value = "priv3", required=false, defaultValue="false") boolean priv3,
            @RequestParam(value = "priv4", required=false, defaultValue="false") boolean priv4,
            @RequestParam(value = "priv5", required=false, defaultValue="false") boolean priv5,
    		@RequestParam(value = "page", required=false, defaultValue="1") int page ) // 요청 페이지 값
    {
        // 수정 정보 추가
        Principal principal = request.getUserPrincipal();
        operator.setUpdateDt(new Date());
        if (principal != null)
        {
            String userID = principal.getName();
            operator.setUpdateId(userID);
        }
        
       /* operatorService.update(operator);*/
        
        redirectAttributes.addFlashAttribute("message", "처리자 정보 수정 완료");
        return "redirect:/admin/operator/operatorList?page="+page;
    }
   
    /**
     * 처리자 삭제 처리 (del_yn='Y'로 세팅함)
     * <PRE>
     * 개요 : 
     * 처리내용 : 
    * </PRE>
     *@Method Name : deleteData
     *@param operId
     *@param redirectAttributes
     *@return
     */
    @RequestMapping(value = "/delete/{operId}", method = RequestMethod.GET)
    public String deleteData(@PathVariable String operId, RedirectAttributes redirectAttributes)
    {
        /*if (operatorService.delete(new Operator(operId)).isResult())
        {
            redirectAttributes.addFlashAttribute("message", "처리자를 삭제했습니다.");
        } else {
        	redirectAttributes.addFlashAttribute("message", "처리자 삭제중 오류가 발생하였습니다.");
        }*/
        return "redirect:/admin/operator/operatorList";
    }
    /*
    
    @RequestMapping(value="/modify", method = RequestMethod.POST)
    public String modifyData(RedirectAttributes redirectAttributes, HttpServletRequest request,
            @ModelAttribute Operator operator,
            @RequestParam(value = "depart.seq") int departSeq,
            @RequestParam(value = "priv.seq", required=false, defaultValue="0") int privSeq,
            @RequestParam(value = "priv1", required=false, defaultValue="false") boolean priv1,
            @RequestParam(value = "priv2", required=false, defaultValue="false") boolean priv2,
            @RequestParam(value = "priv3", required=false, defaultValue="false") boolean priv3,
            @RequestParam(value = "operAreas", required=false, defaultValue = "") String operAreas,
    		@RequestParam(value = "page", required=false, defaultValue="1") int page ) // 요청 페이지 값
    {
        // 수정 정보 추가
        Principal principal = request.getUserPrincipal();
        Operator loginOperInfo = (Operator) operService.findOperatorID(principal.getName()).getObject();
        
        if (operator.getState().equals(OperatorStateKind.READY))
        {
            operator.setState(OperatorStateKind.ACCESS);
        }
        
        operator.setUpdateDate(new Date());
        operator.setUpdateID(loginOperInfo.getId());
        operator.setUpdateIP(request.getLocalAddr());
        
        // 지역별 통계용 nAreaSeq 추가
    	String addr1 = operator.getAddr1(); // 인천 남구 도화1동
    	if (addr1 != null) {
	    	String[] addr1Ary = addr1.split(" ");
	    	
	    	if (addr1Ary.length > 2) {
	    		Area area = (Area)areaService.findByAreaName(addr1Ary[1], addr1Ary[2]).getObject();
	    		operator.setAreaSeq(area.getSeq());
	    	}
    	}
        ////
        
        boolean oper = false;
        Depart depart = new Depart();
        depart.setSeq(departSeq);
        operator.setDepartName(depart);
        
        if (priv1 == true) oper = true;
        
        OperPrivilege operPrivilege = new OperPrivilege(privSeq, operator, priv1, priv2, priv3, oper);
        
        operService.updateOperatorData(operator, operPrivilege, operAreas);
        
        redirectAttributes.addFlashAttribute("message", "처리자 정보 수정 완료");
        return "redirect:/admin/operator/list?page="+page;
    }
   
    @RequestMapping(value = "/delete/{seq}", method = RequestMethod.GET)
    public String deleteData(@PathVariable int seq, RedirectAttributes redirectAttributes)
    {
        if (operService.delete(seq).isResult())
        {
            redirectAttributes.addFlashAttribute("message", "처리자를 삭제했습니다.");
            return "redirect:/admin/operator/list";
        }
        
        redirectAttributes.addFlashAttribute("message", "처리자 삭제중 오류가 발생하였습니다.");
        return "redirect:/admin/operator/list";
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
        List<OperPrivilege> operPrivileges = (List<OperPrivilege>) operPrivilegeService.getSearchDataNoPaging(searchField, searchString, state01, state02, state03, priv01, priv02, priv03).getObject();
        
        if (operPrivileges == null)
        {
            redirectAttributes.addFlashAttribute("message", "저장할 데이터가 없습니다.");
            return "redirect:/admin/operator/list";
        }
        
        modelMap.put("excelName", "처리자_목록");
        modelMap.put("list", operPrivileges);
        modelMap.put("searchField", searchField);
        modelMap.put("searchString", searchString);
        modelMap.put("state01", state01);
        modelMap.put("state02", state02);
        modelMap.put("state03", state03);
        modelMap.put("priv01", priv01);
        modelMap.put("priv02", priv02);
        modelMap.put("priv03", priv03);
        
        return "OperatorsExcelView";
    }
    
    @RequestMapping(value = "/result")
    public String findOperID()
    {
    	return null;
    }
    */
}
