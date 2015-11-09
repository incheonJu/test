package com.eip.template.controller.admin.operator;

import com.eip.template.domain.operator.Operator;
import com.eip.template.service.operator.OperatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

@Controller
@RequestMapping("/operator")
public class OperatorController {

	@Autowired
	private OperatorService operatorService;

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String operatorInsert(Model model, RedirectAttributes redAttr, HttpServletRequest req, @ModelAttribute Operator entity){

		// 처리자 권한 별 페이지 분류.
		Principal principal = req.getUserPrincipal();   // 접속 사용자 정보를 가져옴.
		if (principal == null)	// 세션 만료시 로그인 페이지 이동.
		{
			return "redirect:/admin";
		}

		if(operatorService.insert(entity).isResult()){
			redAttr.addFlashAttribute("message", "등록에 성공하였습니다.");
		} else {
			redAttr.addFlashAttribute("message", "등록에 실패하였습니다.");
		}
		return "redirect:/admin/operator/list";
	}

}