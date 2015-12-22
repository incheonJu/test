<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="stitle">
	<h3>처리자 목록 조회</h3>
</div>
               
<div id="scArea">
	<table class="table_search">
		<tr>
			<th width="15%">검색</th>
			<td width="85%">
				<select name="keyfield" id="keyfield" style="width:80px;">
					<option value="all">전체</option>
					<option value="operId">아이디</option>
					<option value="operName">이름</option>
				</select>
				<input name="keyword" type="text" id="keyword" size="30" onkeydown = "if(event.keyCode==13) search(1);"/>
				<img src="${pageContext.request.contextPath}/img/admin/button/btn_search.gif" width="35" height="23" alt="조회" onclick="search(1)" />
			</td>
		</tr>
		<tr>
			<th>권한</th>
			<td>
				<div id="checkboxs">
					<input type="checkbox" name="checkbox1" class="chkbox" id="priv1" onclick="search(1)" /><label for="priv1">1차권한</label>
					<input type="checkbox" name="checkbox2" class="chkbox" id="priv2" onclick="search(1)" /><label for="priv2">2차권한</label>
					<input type="checkbox" name="checkbox3" class="chkbox" id="priv3" onclick="search(1)" /><label for="priv3">3차권한</label>
					<input type="checkbox" name="checkbox4" class="chkbox" id="priv4" onclick="search(1)" /><label for="priv4">4차권한</label>
					<input type="checkbox" name="checkbox5" class="chkbox" id="priv5" onclick="search(1)" /><label for="priv5">5차권한</label>
				</div>
			</td>
		</tr>
		<tr>
		<th>회원상태</th>
			<td>
				<div id="checkboxs2">
					<input type="checkbox" name="checkbox1" class="chkbox" id="state1" onclick="search(1)" /><label for="state1">승인 대기</label>
					<input type="checkbox" name="checkbox2" class="chkbox" id="state2" onclick="search(1)" /><label for="state2">승인</label>
					<input type="checkbox" name="checkbox3" class="chkbox" id="state3" onclick="search(1)" /><label for="state3">탈퇴회원</label>
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
		
		if ('${priv01}' == '1') {
			$('#priv1').attr("checked","checked");
		}
		if ('${priv02}' == '1') {
			$('#priv2').attr("checked","checked");
		}
		if ('${priv03}' == '1') {
			$('#priv3').attr("checked","checked");
		}
		if ('${priv04}' == '1') {
			$('#priv4').attr("checked","checked");
		}
		if ('${priv05}' == '1') {
			$('#priv5').attr("checked","checked");
		}
		if ('${state01}' == '1') {
			$('#state1').attr("checked","checked");
		}
		if ('${state02}' == '1') {
			$('#state2').attr("checked","checked");
		}
		if ('${state03}' == '1') {
			$('#state3').attr("checked","checked");
		}
		
		$("#checkboxs").buttonset();
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
		   	colNames:['아이디', '아이디', '이름', '가입일','상태', '1차 권한', '2차 권한', '3차 권한', '4차 권한', '5차 권한'],
		   	colModel:[
				{name:'operId',index:'operId', width:100, align:"left", classes: 'wrappedJqGridCell', hidden: true },
		   		{name:'operId',index:'OPER_ID', width:100, align:"left", classes: 'wrappedJqGridCell', formatter:titleFormat},
		   		{name:'operName',index:'OPER_NAME', width:80, align:"center", classes: 'wrappedJqGridCell'},
		   		{name:'createDt',index:'CREATE_DT', width:80, align:"center", classes: 'wrappedJqGridCell'},
		   		{name:'operStateName',index:'operStateName', width:50, align:"center", classes: 'wrappedJqGridCell'},
		   		{name:'priv01',index:'PRIV01', width:50, align:"center",formatter:'checkbox'},
		   		{name:'priv02',index:'PRIV02', width:50, align:"center",formatter:'checkbox'},
		   		{name:'priv03',index:'PRIV03', width:50, align:"center",formatter:'checkbox'},
		   		{name:'priv04',index:'PRIV04', width:50, align:"center",formatter:'checkbox'},
		   		{name:'priv05',index:'PRIV05', width:50, align:"center",formatter:'checkbox'}
		   	],
		   	rowNum:10,
		   	rowList:[10,20,30],
		   	pager: '#pager',
		   	page : pageNum,
		   	sortname: 'CREATE_DT',
		    viewrecords: true,
		    sortorder: "desc",
		    onSelectRow: function(rowid,iRow,iCol,e){
		    	var operId = jQuery("#list").jqGrid('getCell', rowid, 0);
		    	$(location).attr('href',operId+ "?page="+$("#list").getGridParam('page')+"&"+getSearchParameter());
		    	},
		    caption:"처리자 목록"
		});
		$(".ui-jqgrid-titlebar").css('height', 20);
	}
	
	// Title Format (현재 날짜와 비교해서 신규 게시글에 new 이미지 추가.)
	function titleFormat(cellvalue, options, rowObject)
	{
		var title = rowObject.operId;
		
		if (isBetweenDay(rowObject.createDt))
		{
			title += " <img src='${pageContext.request.contextPath}/img/admin/button/new_icons.gif' alt='new'/> ";
		}
		return title;
	}
	
	function search(pageNum){
		var searchField = $('#keyfield').val();
		var searchString = $('#keyword').val();
		var priv01 = $('#priv1');
		var priv02 = $('#priv2');
		var priv03 = $('#priv3');
		var priv04 = $('#priv4');
		var priv05 = $('#priv5');
		
		if (priv01.is(":checked")){
			priv01 = 1;	
		}
		else{
			priv01 = 0;
		}
		
		if (priv02.is(":checked")){
			priv02 = 1;
		}
		else{
			priv02 = 0;
		}
		
		if (priv03.is(":checked")){
			priv03 = 1;
		}
		else{
			priv03 = 0;
		}
		
		if (priv04.is(":checked")){
			priv04 = 1;
		}
		else{
			priv04 = 0;
		}
		
		if (priv05.is(":checked")){
			priv05 = 1;
		}
		else{
			priv05 = 0;
		}
		
		var state01 = '';
		var state02 = '';
		var state03 = '';
		
		
		if ($('#state1').is(":checked")){
			state01 = 1;	
		}
		if ($('#state2').is(":checked")){
			state02 = 1;
		}
		if ($('#state3').is(":checked")){
			state03 = 1;
		}
		searchDataGrid(searchField, searchString, state01, state02, state03, priv01, priv02, priv03, priv04, priv05, pageNum);
	}
	
	function getSearchParameter()
	{
		var parameter = "";
		var searchField = $('#keyfield').val();
		var searchString = $('#keyword').val();
		var state = "";
		var priv01 = $('#priv1');
		var priv02 = $('#priv2');
		var priv03 = $('#priv3');
		var priv04 = $('#priv4');
		var priv05 = $('#priv5');
		
		if (priv01.is(":checked")){
			priv01 = 1;	
		}
		else{
			priv01 = 0;
		}
		if (priv02.is(":checked")){
			priv02 = 1;
		}
		else{
			priv02 = 0;
		}
		if (priv03.is(":checked")){
			priv03 = 1;
		}
		else{
			priv03 = 0;
		}
		if (priv04.is(":checked")){
			priv04 = 1;
		}
		else{
			priv04 = 0;
		}
		if (priv05.is(":checked")){
			priv05 = 1;
		}
		else{
			priv05 = 0;
		}
		
		var state01 = '';
		var state02 = '';
		var state03 = '';
		
		
		if ($('#state1').is(":checked")){
			state01 = 1;	
		}
		if ($('#state2').is(":checked")){
			state02 = 1;
		}
		if ($('#state3').is(":checked")){
			state03 = 1;
		}
		searchString = encodeURIComponent(searchString);
		parameter = "searchField=" + searchField + "&searchString=" + searchString + "&state01=" + state01 + "&state02=" + state02 + "&state03=" + state03 + "&priv01=" + priv01 + "&priv02=" + priv02 + "&priv03=" + priv03 + "&priv04=" + priv04 + "&priv05=" + priv05;
		
		return parameter;
	}
	
	function searchDataGrid(searchField, searchString, state01, state02, state03, priv01, priv02, priv03, priv04, priv05, pageNum)
	{
		// 검색 필드 URL 인코딩
		searchString = encodeURIComponent(searchString);
		
		$('#jqList').empty();
		$('#jqList').append("<table id='list'></table><div id='pager'></div>");
		var url = "${pageContext.request.contextPath}/admin/operator/operatorJqList?searchField="
				+ searchField + "&searchString=" + searchString
				+ "&state01=" + state01 + "&state02=" + state02 + "&state03=" + state03
				+ "&priv01=" + priv01 + "&priv02=" + priv02 + "&priv03=" + priv03+ "&priv04=" + priv04 + "&priv05=" + priv05;
		
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
