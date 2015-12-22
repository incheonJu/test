<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="stitle">
	<h3>회원 목록 조회</h3>
</div>
               
<div id="scArea">
	<table class="table_search">
		<tr>
			<th width="15%">검색</th>
			<td width="85%">
				<select name="keyfield" id="keyfield" style="width:80px;">
					<option value="all">전체</option>
					<option value="memberId">아이디</option>
					<option value="memberName">이름</option>
				</select>
				<input name="keyword" type="text" id="keyword" size="30" onkeydown = "if(event.keyCode==13) search(1);"/>
				<img src="${pageContext.request.contextPath}/img/admin/button/btn_search.gif" width="35" height="23" alt="조회" onclick="search(1)" />
			</td>
		</tr>
		<tr>
		<th>회원상태</th>
			<td>
				<div id="checkboxs2">
					<input type="checkbox" name="checkbox1" class="chkbox" id="state1" onclick="search(1)" /><label for="state2">가입</label>
					<input type="checkbox" name="checkbox2" class="chkbox" id="state2" onclick="search(1)" /><label for="state3">탈퇴회원</label>
				</div>
			</td>
		</tr>
	</table><br/>
	
	<div align="right">
		<button id="excelFileDownButton" onclick="downloadExcelFile()">Excel File Download</button>
	</div><br/>
	
	<div id="jqList">
		<table id="list"></table>
		<div id="pager"></div>
	</div>
	<br/><br/>
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
	$(function () {
		$('#excelFileDownButton').button({
			icons: {
				primary: "ui-icon-folder-collapsed"
			}	
		});
		
		if ('${state01}' == '1') {
			$('#state1').attr("checked","checked");
		}
		if ('${state02}' == '1') {
			$('#state2').attr("checked","checked");
		}
		
		$("#checkboxs2").buttonset();
		//상세보기 목록 클릭시 검색 세팅
		if ('${searchField}' != '') {
			$('#keyfield').val('${searchField}');
		}
		if ('${searchString}' != '') {
			$('#keyword').val('${searchString}');
		}
		
		var pageNum = 1;
		if ('${page}' != '') {
			pageNum = '${page}';
		}
		search(pageNum);
		
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
		
		// JqGrid를 다시 생성하기 위해 제거
		$('#jqList').empty();
		$('#jqList').append("<table id='list'></table><div id='pager'></div>");
		
		jQuery("#list").jqGrid({
		   	url:url,
			datatype: "json",
			contentType: "text/html; charset=utf-8",
			autowidth: true,
			height: "100%",
		   	colNames:['아이디', '아이디', '이름', '가입일','상태'],
		   	colModel:[
				{name:'memberId',index:'memberId', width:100, align:"left", classes: 'wrappedJqGridCell', hidden: true },
		   		{name:'memberId',index:'OPER_ID', width:100, align:"left", classes: 'wrappedJqGridCell', formatter:titleFormat},
		   		{name:'memberName',index:'OPER_NAME', width:80, align:"center", classes: 'wrappedJqGridCell'},
		   		{name:'createDt',index:'CREATE_DT', width:80, align:"center", classes: 'wrappedJqGridCell'},
		   		{name:'memberStateName',index:'memberStateName', width:50, align:"center", classes: 'wrappedJqGridCell'}
		   	],
		   	rowNum:10,
		   	rowList:[10,20,30],
		   	pager: '#pager',
		   	page : pageNum,
		   	sortname: 'CREATE_DT',
		    viewrecords: true,
		    sortorder: "desc",
		    onSelectRow: function(rowid,iRow,iCol,e){
		    	var memberId = jQuery("#list").jqGrid('getCell', rowid, 0);
		    	$(location).attr('href',memberId+ "?page="+$("#list").getGridParam('page')+"&"+getSearchParameter());
		    	},
		    caption:"회원 목록"
		});
		$(".ui-jqgrid-titlebar").css('height', 20);
	}
	
	// Title Format (현재 날짜와 비교해서 신규 게시글에 new 이미지 추가.)
	function titleFormat(cellvalue, options, rowObject)
	{
		var title = rowObject.memberId;
		
		if (isBetweenDay(rowObject.createDt))
		{
			title += " <img src='${pageContext.request.contextPath}/img/admin/button/new_icons.gif' alt='new'/> ";
		}
		return title;
	}
	
	function search(pageNum){
		var searchField = $('#keyfield').val();
		var searchString = $('#keyword').val();
		
		var state01 = '';
		var state02 = '';
		var state03 = '';
		
		
		if ($('#state1').is(":checked")){
			state01 = 1;	
		}
		if ($('#state2').is(":checked")){
			state02 = 1;
		}
		
		searchDataGrid(searchField, searchString, state01, state02, state03, pageNum);
	}
	
	function getSearchParameter()
	{
		var parameter = "";
		var searchField = $('#keyfield').val();
		var searchString = $('#keyword').val();
		var state = "";
		
		var state01 = '';
		var state02 = '';
		
		
		if ($('#state1').is(":checked")){
			state01 = 1;	
		}
		if ($('#state2').is(":checked")){
			state02 = 1;
		}
		
		searchString = encodeURIComponent(searchString);
		parameter = "searchField=" + searchField + "&searchString=" + searchString + "&state01=" + state01 + "&state02=" + state02 ;
		
		return parameter;
	}
	
	function searchDataGrid(searchField, searchString, state01, state02, state03, pageNum)
	{
		// 검색 필드 URL 인코딩
		searchString = encodeURIComponent(searchString);
		
		$('#jqList').empty();
		$('#jqList').append("<table id='list'></table><div id='pager'></div>");
		var url = "${pageContext.request.contextPath}/admin/member/memberJqList?searchField="
				+ searchField + "&searchString=" + searchString
				+ "&state01=" + state01 + "&state02=" + state02;
		
		jqGrid(url, pageNum);
	}
	
	function openAlertDialog(msg)
	{
		$("#alertMessage").empty();
		$("#alertMessage").append("<b>" + msg + "<b>");
		$("#alertDialog").dialog("open");
	}
	
	function downloadExcelFile()
	{
		$(location).attr('href', "excelDownload?" + getSearchParameter());
	}
	
</script>
