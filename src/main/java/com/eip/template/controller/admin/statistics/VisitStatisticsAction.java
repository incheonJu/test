package com.eip.template.controller.admin.statistics;


import com.eip.template.common.util.DateManager;
import com.eip.template.service.admin.statistics.VisitStatisticsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 방문자 통게 Action
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : VisitStatisticsAction.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Controller
@RequestMapping(value="/statistics")
public class VisitStatisticsAction
{
	@Autowired private VisitStatisticsService visitStatisticsService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
	/**
	 * 방문자 통계 목록 페이지 로딩
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : showVisitStatisticsPage
	 *@param model
	 *@param searchTab
	 *@param divPeriod
	 *@param year
	 *@param month
	 *@param schStartDay
	 *@param schEndDay
	 *@return
	 */
	@RequestMapping(value = "/visitStatisticsList", method = RequestMethod.GET)
    public String showVisitStatisticsPage(Model model,
    		@RequestParam(value = "searchTab", required=false, defaultValue="chart") String searchTab,
    		@RequestParam(value = "divPeriod", required=false, defaultValue="periodDay") String divPeriod,
    		@RequestParam(value = "year", required=false, defaultValue="") String year,
            @RequestParam(value = "month", required=false, defaultValue="") String month,
            @RequestParam(value = "schStartDay", required=false, defaultValue="") String schStartDay,
            @RequestParam(value = "schEndDay", required=false, defaultValue="") String schEndDay
    		)
    {
    	if ("".equals(year)) {
    		DateManager dm = new DateManager();
    		year = dm.getYear();
    		month = dm.getMonth();
    		schStartDay = "1";
    		schEndDay = dm.getDay();
    	}
    	
    	/*List<Visitor> visitorList = visitStatisticsService.searchListData(year, month, divPeriod, schStartDay, schEndDay);*/
    	
    	/*model.addAttribute("visitorList", visitorList);*/
    	model.addAttribute("searchTab", searchTab);
    	model.addAttribute("divPeriod", divPeriod);
    	model.addAttribute("year", year);
    	model.addAttribute("month", month);
    	model.addAttribute("schStartDay", schStartDay);
    	model.addAttribute("schEndDay", schEndDay);
    	
        return "admin/statistics/visitStatisticsList";
        
    }
    
	/**
	 * 방문자 통계 엑셀 파일 다운로드
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : visitExcelFile
	 *@param modelMap
	 *@param redirectAttributes
	 *@param divPeriod
	 *@param year
	 *@param month
	 *@param schStartDay
	 *@param schEndDay
	 *@return
	 */
    @RequestMapping(value = "/visitExcelFile", method = RequestMethod.GET)
    public String visitExcelFile(ModelMap modelMap, RedirectAttributes redirectAttributes,
    		@RequestParam(value = "divPeriod", required=false, defaultValue="periodDay") String divPeriod,
    		@RequestParam(value = "year", required=false, defaultValue="") String year,
            @RequestParam(value = "month", required=false, defaultValue="") String month,
            @RequestParam(value = "schStartDay", required=false, defaultValue="") String schStartDay,
            @RequestParam(value = "schEndDay", required=false, defaultValue="") String schEndDay)
    {
    	/*List<Visitor> visitorList = visitStatisticsService.searchListData(year, month, divPeriod, schStartDay, schEndDay);

    	if (visitorList == null) {
    		redirectAttributes.addFlashAttribute("message", "저장할 데이터가 없습니다.");
    		return "redirect:/admin/statistics/visitorStatistics";
    	}
    	modelMap.put("excelName", "방문자 통계");
    	modelMap.put("divPeriod", divPeriod);
    	modelMap.put("visitorList", visitorList);*/
    	return "VisitorStatExcelView";
    }
}
