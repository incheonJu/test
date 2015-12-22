<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<security:authentication property="authorities" var="authorities" />

<div class="stitle">
	<h3>시스템 로그</h3>
</div>

<div id="scArea">
	<table class="table_search">
		<tr>
			<th width="15%">검색</th>
			<td width="85%">
				<select name="searchField" id="searchField" style="width:80px;">
					<option value="all">전체</option>
					<option value="opCode">OP코드</option>
					<option value="opId">아이디</option>
					<option value="opContents">내용</option>
				</select>
				<input name="searchString" type="text" id="searchString" size="30" onkeydown = "if(event.keyCode==13) search(1);" />
				<img id="searchButton" src="${pageContext.request.contextPath}/img/admin/button/btn_search.gif" width="35" height="23" alt="조회" />
			</td>
		</tr>
		<tr>
			<th width="15%">발생시간</th>
			<td width="85%">
				<input type="text" id="searchStartDate" name="searchStartDate"/> ~ <input type="text" id="searchEndDate" name="searchEndDate"/>
			</td>
		</tr>
	</table>
	<br/>

	<div id="jqList">
		<table id="list"></table>
		<div id="pager"></div>
	</div><br/><br/>
</div>


<!-- 메세지 알림 Dialog -->
<div id="alertDialog" title="알림">
	<table class="table_search">
		<tr>
			<th height="50">
				<div id="alertMessage"></div>
			</th>
		</tr>
	</table>
</div>

	<script src="${pageContext.request.contextPath}/js/lib/jqGrid/js/i18n/grid.locale-kr.js"></script>
	<script src="${pageContext.request.contextPath}/js/lib/jqGrid/js/jquery.jqGrid.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/lib/jqGrid/plugins/ui.multiselect.js"></script>
	<script src="${pageContext.request.contextPath}/js/lib/jqGrid/plugins/jquery.tablednd.js"></script>
	<script type="text/javascript">
		$(function() {
			if ('${searchString}' != '') {
				$('#searchString').val('${searchString}');
			}

			var pageNum = 1;
			if ('${page}' != '') {
				pageNum = '${page}';
			}
			search(pageNum);

			$("#searchButton").click(function() {
				search(1);
			});
			
			$("#searchStartDate").change(function() {
				searchDate();
			});
			
			$("#searchEndDate").change(function() {
				searchDate();
			});
			
			$("#alertDialog").dialog({
				width : 500,
				autoOpen : false,
				modal : true,
				resizable : true,
				buttons : {
					확인 : function() {
						$("#alertDialog").dialog("close");
					}
				}
			});
			
			if ('${message}' != "")
			{
				openAlertDialog('${message}');
			}
		});

		function jqGrid(url, pageNum) {
			
			jQuery("#list").jqGrid({
				url : url,
				datatype : "json",
				autowidth : true,
				height: "100%",
				colNames : [ 'OP코드', '아이디', '발생일시', '내용', '비고' ],
				colModel : [
					{name : 'opCode', index : 'OP_CODE', width : 70, align : "center"}, 
					{name : 'opId', index : 'OP_ID', width : 70, align : "center"},
					{name : 'createDt', index : 'CREATE_DT', width : 100, align : "left"},
					{name : 'opContents', index : 'OP_CONTENTS', width : 400, align : "left", formatter:titleFormat}, 
					{name : 'opEtc', index : 'OP_ETC', width : 100, align : "left"}
				],
				rowNum : 10,
				rowList : [ 10, 20, 30 ],
				pager : '#pager',
				page : pageNum,
				sortname : 'OP_CODE',
				viewrecords : true,
				sortorder : "desc",
				onSelectRow : function(rowid, iRow, iCol, e) {
				},
				caption : "시스템 Log"
			});
			$(".ui-jqgrid-titlebar").css('height', 20);
		}

		// Title Format (현재 날짜와 비교해서 신규 게시글에 new 이미지 추가.)
		function titleFormat(cellvalue, options, rowObject)
		{
			var title = rowObject.opContents;
			
			
			if (isBetweenDay(rowObject.createDt))
			{
				title += " <img src='${pageContext.request.contextPath}/img/admin/button/new_icons.gif' alt='new'/>";
			}
			return title;
		}
		
		function search(pageNum) {
			var searchField = $('#searchField').val();
			var searchString = $('#searchString').val();
			var startDate = $('#searchStartDate').val();
			var endDate = $('#searchEndDate').val();

			searchDataGrid(searchField, searchString, startDate, endDate, pageNum);
		}
		
		function searchDataGrid(searchField, searchString, startDate, endDate, pageNum){
			// 검색 필드 URL 인코딩
			searchString = encodeURIComponent(searchString);
			
			$('#jqList').empty();
			$('#jqList').append("<table id='list'></table><div id='pager'></div>");
			var url = "${pageContext.request.contextPath}/admin/system/systemLogJqList?searchField=" + searchField + "&searchString=" + searchString + "&searchStartDate=" + startDate + "&searchEndDate=" + endDate;
			
			jqGrid(url, pageNum);
		}
		
		function openAlertDialog(msg){
			$("#alertMessage").empty();
			$("#alertMessage").append("<b>" + msg + "<b>");
			$("#alertDialog").dialog("open");
		}
		
		function searchDate(){
			var startDate = $('#searchStartDate').val();
			var endDate = $('#searchEndDate').val();
			if (startDate != '' && endDate != ''){
				if (startDate > endDate) {
					openAlertDialog("검색일자를 바르게 선택해 주세요");	
					return false;
				}
				search(1);
			}
		}
	</script>