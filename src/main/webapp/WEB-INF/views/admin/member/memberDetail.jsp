<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<security:authentication property="authorities" var="authorities" />

<div class="stitle">
	<h3>회원 상세보기</h3>
</div>

<div id="scArea">
	<sf:form method="POST" modelAttribute="member" action="${pageContext.request.contextPath}/admin/member/updateProcess" >
		<input type="hidden" name="page" value="${page}">
		<sf:hidden path="memberPwd"/>
		<sf:hidden path="createDt"/>
		<sf:hidden path="createId"/>
		<table class="table_mem">
			<tr>
				<th width="15%" scope="col">아이디</th>
				<td colspan="3">
					<sf:input path="memberId" size="30" readonly="true" />
				</td>
			</tr>
			<tr>
				<th scope="col">이름</th>
				<td colspan="3">
					<sf:input path="memberName" size="30" />
				</td>
			</tr>
			<tr>
				<th scope="col">이메일</th>
				<td colspan="3">
					<sf:hidden path="email"/>
					
					<c:set var="arrEmail" value="${fn:split(member.email,'@')}"/>
                    <c:set var="strEmail1" value="${arrEmail[0]}" />
                    <c:set var="strEmail2" value="${arrEmail[1]}" />
					<input Type='Text' id='Ls_Email1' value='${strEmail1}' Size='30' MaxLength='20'> @ 
					<input Type='Text' id='Ls_Email2' value='${strEmail2}' Size='30' MaxLength='20'> 
					<select id='Ls_Email3' style='width: 130px;'>
						<option value=''>선택하십시오.</option>
						<option value='00' selected="selected">직접입력</option>
						<option value='gmail.com'>gmail.com</option>
						<option value='chol.com'>chol.com</option>
						<option value='dreamwiz.com'>dreamwiz.com</option>
						<option value='empal.com'>empal.com</option>
						<option value='freechal.com'>freechal.com</option>
						<option value='hanafos.com'>hanafos.com</option>
						<option value='hanmail.net'>hanmail.net</option>
						<option value='hanmir.com'>hanmir.com</option>
						<option value='hotmail.com'>hotmail.com</option>
						<option value='korea.com'>korea.com</option>
						<option value='nate.com'>nate.com</option>
						<option value='naver.com'>naver.com</option>
						<option value='netian.com'>netian.com</option>
						<option value='paran.com'>paran.com</option>
						<option value='sayclub.com'>sayclub.com</option>
						<option value='yahoo.co.kr'>yahoo.co.kr</option>
						<option value='yahoo.com'>yahoo.com</option>
					</select>
				</td>
				<script>
					$('#Ls_Email3').val('${strEmail2}');
					
					if ($('#Ls_Email3').val() == null)
					{
						$('#Ls_Email3').val('00');
					}
				</script>
				
			</tr>
			<tr>
				<th scope="col">전화번호</th>
				<td colspan="3">
					<select name='tel1' id="tel1" style='width: px;'>
						<option value=''>선택</option>
						<option value='010'>010</option>
						<option value='011'>011</option>
						<option value='0130'>0130</option>
						<option value='016'>016</option>
						<option value='017'>017</option>
						<option value='018'>018</option>
						<option value='019'>019</option>
						<option value='02'>02</option>
						<option value='031'>031</option>
						<option value='032'>032</option>
						<option value='033'>033</option>
						<option value='041'>041</option>
						<option value='042'>042</option>
						<option value='043'>043</option>
						<option value='0502'>0502</option>
						<option value='0505'>0505</option>
						<option value='051'>051</option>
						<option value='052'>052</option>
						<option value='053'>053</option>
						<option value='054'>054</option>
						<option value='055'>055</option>
						<option value='061'>061</option>
						<option value='062'>062</option>
						<option value='063'>063</option>
						<option value='064'>064</option>
						<option value='070'>070</option>
					</select> - 
					<sf:input path="tel2" maxlength="4" size="10" /> -
					<sf:input path="tel3" maxlength="4" size="10" />
					
					<script type="text/javascript">
						$("#tel1").val('${member.tel1}');
					</script>
				</td>
			</tr>
			<tr>
				<th scope="col">우편번호</th>
				<td colspan="3">
					<sf:hidden path="zipCode"/>
					<input name="Ls_Post1" type="text" maxlength="3" readonly="readonly" id="zipCode1" size="5" /> - 
					<input name="Ls_Post2" type="text" maxlength="3" readonly="readonly" id="zipCode2" size="5" />
					<img src="${pageContext.request.contextPath}/img/admin/button/btn_post.gif" width="59" height="23" alt="우편번호" onclick="fnPostSearchOpen('zipCode', 'zipCode1', 'zipCode2', 'addr1', 'addr2')" />
					
					<script type="text/javascript">
						var zipCode = $("#zipCode").val().split("-");
						$("#zipCode1").val(zipCode[0]);
						$("#zipCode2").val(zipCode[1]);
					</script>
				</td>
			</tr>
			<tr>
				<th scope="col">주소</th>
				<td colspan="3">
					<sf:input path="addr1" maxlength="100" readonly="true" size="60" />
				</td>
			</tr>
			<tr>
				<th scope="col">&nbsp;</th>
				<td colspan="3">
					<sf:input path="addr2" maxlength="100" size="60" />
				</td>
			</tr>
			<tr>
				<th scope="col">회원상태</th>
				<td colspan="3">
					<input type="radio" name="memberState" id="memberState" class="chkbox" value="1" <c:if test="${member.memberState == '1'}">checked="checked"</c:if>>
					<label for="memberState">가입</label>&nbsp;&nbsp;
					<input type="radio" name="memberState" id="memberState" class="chkbox" value="2" <c:if test="${member.memberState == '2'}">checked="checked"</c:if>>
					<label for="memberState">탈퇴</label>&nbsp;&nbsp; 
				</td>
			</tr>
			
		</table>
		<br/>
		
		<p class="joinBtn">
			<!-- 운영 권한을 가진 사람만 버튼 보여줌. -->
			<security:authorize ifAnyGranted="ROLE_OPER" >
				<img src="${pageContext.request.contextPath}/img/admin/button/btn_edit.gif" width="57" height="23" onclick="$('#modifyDialog').dialog('open')" alt="수정"/>
				<img src="${pageContext.request.contextPath}/img/admin/button/btn_del.gif" width="57" height="23" onclick="$('#deleteDialog').dialog('open')"  alt="삭제"/>
			</security:authorize>
			<a href="${pageContext.request.contextPath}/admin/member/memberList?page=${page}&searchField=${searchField}&searchString=${searchString}&searchState01=${searchState01}&searchState02=${searchState02}&searchState03=${searchState03}&searchPriv01=${searchPriv01}&searchPriv02=${searchPriv02}&searchPriv03=${searchPrive03}&searchPriv04=${searchPrive04}&searchPriv05=${searchPrive05}"><img src="${pageContext.request.contextPath}/img/admin/button/btn_list.gif" width="57" height="23"  alt="목록"/></a>
		</p>
		
	</sf:form>
</div>

<!-- 메세지 알림 Dialog -->
<div id="modifyDialog" title="수정 알림">
	<table class="table_mem">
		<tr>
			<th height="50">해당 회원 정보를 수정하시겠습니까?</th>
		</tr>
	</table>
</div>
	
<div id="deleteDialog" title="삭제 확인">
	<table class="table_mem">
		<tr>
			<th height="50">해당 회원을 삭제(탈퇴처리)하시겠습니까?</th>
		</tr>
	</table>
</div>

<script type="text/javascript">
	$(function() {
		$('.searchButton').button({
			icons: {
				primary: "ui-icon-zoomin"
			}	
		});
		
		emailSelect();
		
		$("#modifyDialog").dialog({
			width : 340,
			autoOpen : false,
			modal : true,
			resizable : true,
			buttons : {
				확인 : function() {
					submit();
				},
				취소 : function() {
					$("#modifyDialog").dialog("close");
				}
			}
		});
		
		// 삭제 확인 Dialog 생성
		$("#deleteDialog").dialog({
			autoOpen : false,
			modal : true,
			buttons : {
				확인 : function() {
					$(location).attr('href', '${pageContext.request.contextPath}/admin/member/delete/${member.memberId}');
				},
				취소 : function() {
					$("#deleteDialog").dialog("close");
				}
			}
		});
		
		// 삭제 버튼
		$("#deleteDialogOpenButton").click(function() {
			$("#deleteDialog").dialog("open");
		});

		$("#Ls_Email3").change(function(){
			emailSelect();
		});
	});
	// 담당 지역 추가 Dialog Open
	function openAreaDialog(){
		$("#areaDialog").dialog("open");
	}
	
	// 알림 Dialog 처리.
	function openAlertDialog(msg){
		$("#alertMessage").empty();
		$("#alertMessage").append("<b>" + msg + "<b>");
		$("#alertDialog").dialog("open");
	}
	
	// 이메일 선택
	function emailSelect()
	{
		var varEmailSelect = $("#Ls_Email3 option:selected").val();
		
		if(varEmailSelect == "00")
		{
			$("#Ls_Email2").removeAttr("readonly");
			$("#Ls_Email2").val("${strEmail2}");
		}
		else
		{
			$("#Ls_Email2").attr("readonly",true);
			$("#Ls_Email2").val(varEmailSelect);
		}
	}
	
	// Form Data Submit
	function submit()
	{
		if (formDataCheck())
		{
			var email = $("#Ls_Email1").val() + "@" + $("#Ls_Email2").val();
			$("#email").val(email);
			$("#member").submit();
		}
		$("#modifyDialog").dialog("close");
	}
	
	function formDataCheck()
	{
		var name = $('#memberName');
		var email1 = $('#Ls_Email1');
		var email2 = $('#Ls_Email2');
		var tel1 = $('#tel1');
		var tel2 = $('#tel2');
		var tel3 = $('#tel3');
		
		console.log(name.val().trim().length <= 0);
		
		if (name.val().trim().length <= 0)
		{
			openAlertDialog("이름을 입력해 주세요");	
			focus = name;
			return false;
		}
		else if (email1.val().trim().length <= 0 || email2.val().trim().length <= 0)
		{
			openAlertDialog("이메일을 입력해 주세요");	
			focus = email1;
			return false;
		}
		else if (tel1 == null || tel1.val() == null  || (tel1.val().trim().length <= 0 || tel2.val().trim().length <= 0 || tel3.val().trim().length <= 0))
		{
			openAlertDialog("전화번호를 입력해 주세요.");
			focus = tel1;
			return false;
		}
		return true;
		
	}
	
</script>
<%@include file="../../common/findZip.jsp"%>
<%@include file="../../common/alertDialog.jsp"%>
