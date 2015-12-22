package com.eip.template.domain.share;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.eip.template.domain.share.visitor.Visitor;

public class VisitorStatExcelView extends AbstractExcelView
{
	
	@Override
	protected void buildExcelDocument(Map<String, Object> modelMap, HSSFWorkbook hssfWorkbook, HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		String divPeriod = modelMap.get("divPeriod").toString();
		String priodTitle = "일자";
		if ("periodMonth".equals(divPeriod)) priodTitle = "월";
		else if ("periodYear".equals(divPeriod)) priodTitle = "년";
	   
		
		String[] TITLE_LIST = new String[]{
				priodTitle , "방문자", "사용자 로그인", "관리자 로그인"
		};

		
		HSSFSheet workSheet = null;
		HSSFRow row = null;
		String excelName = modelMap.get("excelName").toString();
		workSheet = hssfWorkbook.createSheet(excelName + "WorkSheet");
		List<Visitor> visitorList = (List<Visitor>) modelMap.get("visitorList");
		excelName=URLEncoder.encode(excelName,"UTF-8");
		
		// Title Cell Style Setup (타이틀 셀 스타일 설정)
		CellStyle titleCellStyle = hssfWorkbook.createCellStyle();
		HSSFFont titleFont = hssfWorkbook.createFont();
		
		titleFont.setFontName("맑은고딕");
		titleFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		titleCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		titleCellStyle.setFont(titleFont);
		titleCellStyle.setWrapText(true);
		titleCellStyle.setBorderBottom(CellStyle.BORDER_THIN);
		titleCellStyle.setBorderLeft(CellStyle.BORDER_THIN);
		titleCellStyle.setBorderRight(CellStyle.BORDER_THIN);
		titleCellStyle.setBorderTop(CellStyle.BORDER_THIN);
		//
		
		// List Cell Style Setup (셀 내용 스타일 설정)
		CellStyle listCellStyle = hssfWorkbook.createCellStyle();
		HSSFFont listFont = hssfWorkbook.createFont();
		listFont.setFontName("맑은고딕");
		listCellStyle.setFont(listFont);
		listCellStyle.setWrapText(true);
		listCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		listCellStyle.setBorderBottom(CellStyle.BORDER_THIN);
		listCellStyle.setBorderLeft(CellStyle.BORDER_THIN);
		listCellStyle.setBorderRight(CellStyle.BORDER_THIN);
		listCellStyle.setBorderTop(CellStyle.BORDER_THIN);
		
	
		// 타이틀 생성
		HSSFRow titleRow = workSheet.createRow(3);
		HSSFCell titleCell = null;
		
		for (int idex = 0; idex < TITLE_LIST.length; idex++)
		{
		    titleCell = titleRow.createCell(idex);
		    titleCell.setCellValue(TITLE_LIST[idex]);
		    titleCell.setCellStyle(titleCellStyle);
		}
		//
		
		int listCellIndex = 4;
		for (Visitor visitor : visitorList)
		{
		    HSSFCell cell = null;
			row = workSheet.createRow(listCellIndex);
			
			int j = 0;
			String firstValue = "";
			if ("periodMonth".equals(divPeriod)) firstValue = visitor.getMm();
			else if ("periodYear".equals(divPeriod)) firstValue = visitor.getYyyy();
			else firstValue = visitor.getDd();
			
			cell = row.createCell(j++);
			cell.setCellValue(firstValue);
			cell.setCellStyle(listCellStyle);
			
		
			cell = row.createCell(j++);
			cell.setCellValue(visitor.getVisitCount());
			cell.setCellStyle(listCellStyle);
			
			cell = row.createCell(j++);
			cell.setCellValue(visitor.getFrontVisitCount());
			cell.setCellStyle(listCellStyle);
			
			cell = row.createCell(j++);
			cell.setCellValue(visitor.getBackofficeVisitCount());
			cell.setCellStyle(listCellStyle);
			
			listCellIndex ++;
		}
		
		for (int idex = 0; idex < TITLE_LIST.length; idex++)
		{
			workSheet.setColumnWidth(idex, 256 * 30);
		}
		
		
		response.setContentType("Application/Msexcel");
		response.setHeader("Content-Disposition", "ATTachment; Filename=" + excelName + "_" + convertDateTime(new Date()) + ".xls");
	}

    public String convertDateTime(Date date)
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        
        return sdf.format(date);
    }
}
