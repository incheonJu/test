package com.eip.template.controller.admin.statistics;


import com.eip.template.common.util.JqGridData;
import com.eip.template.domain.share.visitor.Visitor;
import com.eip.template.service.admin.statistics.VisitStatisticsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 방문자 통계 Ajax Action
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : VisitStatisticsAjaxAction.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Controller
@RequestMapping(value="/statistics")
public class VisitStatisticsAjaxAction
{
	@Autowired private VisitStatisticsService visitStatisticsService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
	/**
	 * 방문자 grid 목록 조회
	 * <PRE>
	 * 개요 : 
	 * 처리내용 : 
	* </PRE>
	 *@Method Name : getVisitJqGridData
	 *@param page
	 *@param rows
	 *@param sidx
	 *@param sord
	 *@param year
	 *@param month
	 *@param divPeriod
	 *@param schStartDay
	 *@param schEndDay
	 *@return
	 */
    @RequestMapping(value = "/visitJqGridList", method = RequestMethod.GET)
    @ResponseBody
    public JqGridData<Visitor> getVisitJqGridData(
            @RequestParam(value = "page", required=false) int page,
            @RequestParam(value = "rows", required=false) int rows,
            @RequestParam(value = "sidx", required=false) String sidx,
            @RequestParam(value = "sord", required=false) String sord,
            @RequestParam(value = "year", required=false, defaultValue="") String year,
            @RequestParam(value = "month", required=false, defaultValue="") String month,
            @RequestParam(value = "divPeriod", required=false, defaultValue="periodDay") String divPeriod,
            @RequestParam(value = "schStartDay", required=false, defaultValue="") String schStartDay,
            @RequestParam(value = "schEndDay", required=false, defaultValue="") String schEndDay)
    {
        /*return visitStatisticsService.searchListDataToJqGrid(page, sidx, sord, rows, year, month, divPeriod, schStartDay, schEndDay);*/
        return null;
    }
}
