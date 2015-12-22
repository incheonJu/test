<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<security:authentication property="authorities" var="authorities" />

<div class="stitle">
   	<h3>방문자 통계</h3>
</div>

		
<div id="scArea">
	<div class="wsarea">
				<div class="selist">
					<ul class="tm">
						<li><a href="javascript:tabSearch('chart');" <c:if test="${searchTab eq '' or searchTab eq 'chart'}">  class="on"</c:if>>차트보기</a></li>
						<li><a href="javascript:tabSearch('table');" <c:if test="${searchTab eq 'table'}">  class="on"</c:if>>표로보기</a></li>
					</ul>
				</div>
	</div>
	<table class="table_view">
		<tr>
			<td colspan="2">
				<div id="radio">
					<input type="radio" name="divPeriod" class="chkbox" id="periodDay" value="periodDay"> <label for="periodDay">  일간  </label>
					<input type="radio" name="divPeriod" class="chkbox" id="periodMonth" value="periodMonth"> <label for="periodMonth">  월간  </label>
					<input type="radio" name="divPeriod" class="chkbox" id="periodYear" value="periodYear"> <label for="periodYear">  연간  </label>
				</div>
			</td>
		</tr>
		<tr id="periodSearch" >
			<th width="15%">월별 검색</th>
			<td width="85%">
				<select name="yearSelector" id="yearSelector" style="width: 80px;">
					<script type="text/javascript">
						var myDate = new Date();
						var year = myDate.getFullYear();
						for (var i = 2013; i < year + 1; i++)
						{
							document.write('<option value="' + i + '">' + i + '년</option>');
						}
						if ('${year}' != '')  year = '${year}'; 
						$('#yearSelector').val(year);
					</script>
				</select>
				<span id="daySearch">
				<select name="monthSelector" id="monthSelector" style="width: 80px;">
					<option value="1">1월</option>
					<option value="2">2월</option>
					<option value="3">3월</option>
					<option value="4">4월</option>
					<option value="5">5월</option>
					<option value="6">6월</option>
					<option value="7">7월</option>
					<option value="8">8월</option>
					<option value="9">9월</option>
					<option value="10">10월</option>
					<option value="11">11월</option>
					<option value="12">12월</option>
				</select>
				<select name="schStartDay" id="schStartDay" style="width: 80px;">
				</select> ~
				<select name="schEndDay" id="schEndDay" style="width: 80px;">
				</select>
				</span>
				<script type="text/javascript">
				
					var myDate = new Date();
					var month = myDate.getMonth() + 1;
					if ('${month}' != '')  month = '${month}';	
					$('#monthSelector').val(month);
				</script>
				<img src="${pageContext.request.contextPath}/img/admin/button/btn_search.gif" width="35" height="23" alt="조회" onclick="search()"  alt="검색"/>
			</td>
		</tr>
	</table><br/>
	
	<div align="right" id="excelDiv">
		<button id="excelFileDownButton" onclick="downloadExcelFile()">Excel File Download</button>
	</div>
	<br/>
	
	<div align="left" id="chart_div" style="width: 800px; height: 500px; margin-top:30px; margin-left:10px; text-align: left;"></div>
	
	<div id="jqList">
		<table id="list"></table>
		<div id="pager"></div>
	</div><br/><br/>
</div>

<script src="${pageContext.request.contextPath}/js/lib/jqGrid/js/i18n/grid.locale-kr.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/jqGrid/js/jquery.jqGrid.min.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/jqGrid/plugins/ui.multiselect.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/jqGrid/plugins/jquery.tablednd.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<script type="text/javascript">
	$(function(){
		
		$('#excelFileDownButton').button({
			icons: {
				primary: "ui-icon-folder-collapsed"
			}	
		});
		// 일간,주간,월간,연간
		
		if ('${divPeriod}' != '') {
			$("input:radio[name='divPeriod']:radio[value='${divPeriod}']").attr("checked",true);
			
			period = '${divPeriod}';
			if (period == "periodYear" ) {//연간
				$("#periodSearch").css("display","none");
			} else {//월간,일간
				$("#periodSearch").css("display","");
				if (period == "periodMonth") {//월간
					$("#daySearch").css("display","none");
				} else {//일간
					$("#daySearch").css("display","");
				}
			}
		}
		
		$("#radio").buttonset();
		
		// 일간,월간,연간 변경시 월별검색 항목이 달라진다.
		$('input[type=radio][name=divPeriod]').change(function(){
			search();
		});
		
		changeSelectDay();
		
		viewContent();
		
		$('#yearSelector').change(function(){
			viewContent();	
			changeSelectDay();
		});	
		
		$('#monthSelector').change(function(){
			viewContent();
			changeSelectDay();
		});
		
		$('#schStartDay').change(function(){
			if ( parseInt($('#schEndDay').val()) < parseInt($('#schStartDay').val()) ) { alert('검색일을 다시 지정하세요.');}
			else viewContent();
		});
		
		$('#schEndDay').change(function(){
			if ( parseInt($('#schEndDay').val()) < parseInt($('#schStartDay').val()) ) { alert('검색일을 다시 지정하세요.');}
			else viewContent();
		});
	});
	
	
	function changeSelectDay() {
		var year = $('#yearSelector').val();
		var month = $('#monthSelector').val();
		
		var myDate = new Date();
		var myYear = myDate.getFullYear();
		var myMonth = myDate.getMonth() + 1;
		
		var lastDay = (new Date(year, month, 0)).getDate();
		
		$('#schStartDay').empty();
		for(var i=1; i<lastDay+1; i++){
			$('#schStartDay').append("<option value='"+i+"'>"+i+"일</option>");
		}
		
		$('#schEndDay').empty();
		for(var i=1; i<lastDay+1; i++){
			$('#schEndDay').append("<option value='"+i+"'>"+i+"일</option>");
		}
		
		if (year == myYear && month == myMonth) { // 현재 달이면 마지막 검색일을 오늘날자로 세팅함.
			var myDay = myDate.getDate();
			$('#schEndDay').val(myDay);
		} else { // 아니면 검색한 달의 마지막날로 세팅함.
			$('#schEndDay').val(lastDay);
		}
	
	}
	
	
	//차트 시작----------------------------------------------------------b
	google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);
    
	function drawChart() {
        var data = google.visualization.arrayToDataTable([
<c:choose>
<c:when test="${divPeriod == 'periodDay'}">
<c:set value="dd" var="periodColumn"/>
<c:set value="일자" var="periodTitle"/>
          ['일자', '방문자', '사용자로그인', '관리자로그인'],
          <c:forEach var="result" items="${visitorList}" varStatus="status">
          ['${result.dd}', ${result.visitCount}, ${result.frontVisitCount}, ${result.backofficeVisitCount} ],
          </c:forEach>
</c:when>
<c:when test="${divPeriod == 'periodMonth'}">
<c:set value="mm" var="periodColumn"/>
<c:set value="월" var="periodTitle"/>
		['월', '방문자', '사용자로그인', '관리자로그인'],
		<c:forEach var="result" items="${visitorList}" varStatus="status">
		['${result.mm}월', ${result.visitCount}, ${result.frontVisitCount}, ${result.backofficeVisitCount} ],
		</c:forEach>
</c:when>
<c:when test="${divPeriod == 'periodYear'}">
<c:set value="yyyy" var="periodColumn"/>
<c:set value="년" var="periodTitle"/>
		['년', '방문자', '사용자로그인', '관리자로그인'],
		<c:forEach var="result" items="${visitorList}" varStatus="status">
		['${result.yyyy}년', ${result.visitCount}, ${result.frontVisitCount}, ${result.backofficeVisitCount} ],
		</c:forEach>
</c:when>
</c:choose>
        ]);

        var options = {
                title: 'Company Performance',
      			/*backgroundColor: 'red',*/
      			chartArea:{left:50,top:10,width:"90%",height:"80%"},
      			legend: { position: 'bottom' },
      			hAxis:  { textStyle: {fontSize: 8}},
      			vAxis:  { format:'#,###명', textStyle: {fontSize: 8}}
              };
        
        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        chart.draw(data, options);
    }
	
	//차트 끝----------------------------------------------------------
	
	// 차트보기, 표로보기 버튼 클릭시
	function viewContent() {
		// 차트보기인경우
		if ('${searchTab}' == 'chart') {
			
			$("#chart_div").css("display","");
			$("#jqList").css("display","none");
			$("#excelDiv").css("display","none");
			
			//search();
			
		} else { // 표로보기인경우
			
			$("#jqList").css("display","");
			$("#chart_div").css("display","none");
			$("#excelDiv").css("display","");
			
			JqGrid();
		}
	}
	
	// 그리드 
	function JqGrid()
	{
		var year = $('#yearSelector').val();
		var month = $('#monthSelector').val();
		var url = "${pageContext.request.contextPath}/admin/statistics/visitJqGridList? " + makeSearchUrl();
		
		$('#jqList').empty();
		$('#jqList').append("<table id='list'></table><div id='pager'></div>");
		
		
		jQuery("#list").jqGrid({
			url : url,
			datatype: "json",
			height: 'auto',
			autowidth : true,
			cmTemplate: {sortable: false},
			rowNum: 50,
			rowList: [50],
		   	colNames:['${periodTitle}', '방문자', '사용자 로그인', '관리자 로그인'],
		   	colModel:[
		   		{name:'${periodColumn}', index:'dd', width:60, align:"center"},
		   		{name:'visitCount', index:'visitCount', width:100, align:"center", formatter:'integer', formatoptions:{thousandsSeparator:','}, summaryType:'sum', summaryTpl:'Totals:'},
		   		{name:'frontVisitCount', index:'frontVisitCount', width:100 , align:"center", formatter:'integer', formatoptions:{thousandsSeparator:','}, summaryType:'sum', summaryTpl:'Totals:'},
		   		{name:'backofficeVisitCount', index:'backofficeVisitCount', width:100 , align:"center", formatter:'integer', formatoptions:{thousandsSeparator:','}, summaryType:'sum', summaryTpl:'Totals:'}
		   	],
		   	pager: "#pager",
		   	viewrecords: true,
		   	sortname: '${periodColumn}',
		   	sortorder : "asc",
		   	footerrow: true,
		   	userDataOnFooter : true,
		   	altRows : true,
		   	caption: "방문 통계",
	   		loadComplete: function () {
	   			$("#list").jqGrid('footerData', 'set', {crateName:'합계', ${periodColumn}:'총계' });
   		    	var visitCountSum = $("#list").jqGrid('getCol', 'visitCount', false, 'sum');
   		    	$("#list").jqGrid('footerData', 'set', {crateName:'합계', visitCount:visitCountSum });
   		    	var frontVisitCountSum = $("#list").jqGrid('getCol', 'frontVisitCount', false, 'sum');
   		    	$("#list").jqGrid('footerData', 'set', {crateName:'합계', frontVisitCount:frontVisitCountSum });
   		    	var backofficeVisitCountSum = $("#list").jqGrid('getCol', 'backofficeVisitCount', false, 'sum');
   		    	$("#list").jqGrid('footerData', 'set', {crateName:'합계', backofficeVisitCount:backofficeVisitCountSum });
		   	}
		});
			
		jQuery("#list").jqGrid('navGrid',"#pager",{edit:false,add:false,del:false});

		$(".ui-jqgrid-titlebar").css('height', 20);
	}
	
	function downloadExcelFile()
	{
		$(location).attr('href', "visitExcelFile?" +  makeSearchUrl());
	}
	
	// 탭 검색
	function tabSearch(tab){
		location.href = "${pageContext.request.contextPath}/admin/statistics/visitStatisticsList?searchTab=" + tab + makeSearchUrl();
	}
	
	function search(){
		location.href = "${pageContext.request.contextPath}/admin/statistics/visitStatisticsList?searchTab=${searchTab}" + makeSearchUrl();
	}
	
	function makeSearchUrl()
	{
		var divPeriod = $('input[name=divPeriod]:checked').val();
		var yearSelector = $("#yearSelector").val();
		var monthSelector = $("#monthSelector").val();
		var schStartDay = $('#schStartDay').val();
		var schEndDay = $('#schEndDay').val();
		return "&divPeriod=" + divPeriod + "&year=" + yearSelector + "&month=" + monthSelector + "&schStartDay=" + schStartDay + "&schEndDay=" + schEndDay ;
	}
</script>