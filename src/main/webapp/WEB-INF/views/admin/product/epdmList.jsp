<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("newline", "\r\n"); %>
<form method="post" name="frmEdit" action="${pageContext.request.contextPath}/admin/productEPDM/update" enctype="multipart/form-data">
	<input id="type" name="type" type="hidden" value="${type == null ? '_epm' : type}">
	<input id="epdmSeq" name="productEPDM.seq" type="hidden" value="${productEPDM.seq}">
	<div id="area_base">
		<table class="uiTable write">
			<colgroup>
				<col style="width:130px" />
				<col />
			</colgroup>
			<tbody>
			<tr>
				<th>다국어 노출<span style="color:red;"> * </span></th>
				<td>
					<span class="uiInput check">
						<input type="checkbox" id="allchecked" class="exposureLang"/>
						<label for="allchecked">전체</label>
						<input name="langKorYn" class="exposureLang" id="langKorYn" type="checkbox" value="Y" ${productEPDM.langKorYn}/>
						<label for="langKorYn">국문</label>
						<input name="langEngYn" class="exposureLang" id="langEngYn" type="checkbox" value="Y" ${productEPDM.langEngYn}/>
						<label for="langEngYn">영문</label>
						<input name="langChnYn" class="exposureLang" id="langChnYn" type="checkbox" value="Y" ${productEPDM.langChnYn}/>
						<label for="langChnYn">중문</label>
						<input name="langJpnYn" class="exposureLang" id="langJpnYn" type="checkbox" value="Y" ${productEPDM.langJpnYn}/>
						<label for="langJpnYn">일문</label>
					</span>
				</td>
			</tr>
			<tr>
				<th>노출 여부<span style="color:red;"> * </span></th>
				<td>
					<input id="exposureY" name="exposureYn" type="radio" value="N" />
					<label for="exposureY">미노출</label>
					<input id="exposureN" name="exposureYn" type="radio" value="Y" />
					<label for="exposureN">노출</label>
				</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>
					<span class="uiInput text size300">
						<fmt:formatDate value="${productEPDM.createDt}" pattern="yyyy-MM-dd"/>
					</span>
				</td>
			</tr>
			</tbody>
		</table>

		<table class="uiTable write">
			<colgroup>
				<col style="width:150px" />
				<col style="width:250px" />
				<col style="width:100px" />
				<col style="width:70px" />
				<col />
			</colgroup>
			<tbody>
			<tr>
				<th colspan="5" style="text-align:center;">특징표</th>
			</tr>
			<tr>
				<td colspan="5">
					<ul class="uiTabmenu">
						<li><input type="radio" name="radio_epdm" id="radio0" value="_epm"><label for="radio0" name="EPDM_EPM" style="line-height:30px" class="on">EPM</label></li>
						<li><input type="radio" name="radio_epdm" id="radio1" value="_enb_low"><label for="radio1" name="EPDM_ENB_Low">EPDM [ENB Type]<br/>Low Diene</label></li>
						<li><input type="radio" name="radio_epdm" id="radio2" value="_enb_medium"><label for="radio2" name="EPDM_ENB_Medium">EPDM [ENB Type]<br/>Medium Diene</label></li>
						<li><input type="radio" name="radio_epdm" id="radio3" value="_enb_high"><label for="radio3" name="EPDM_ENB_High">EPDM [ENB Type]<br/>High Diene</label></li>
						<li><input type="radio" name="radio_epdm" id="radio4" value="_enb_oil"><label for="radio4" name="EPDM_ENB_Oil">EPDM [ENB Type]<br/>Oil Extened</label></li>
						<li><input type="radio" name="radio_epdm" id="radio5" value="_mah"><label for="radio5" name="EPDM_MAH">MAH-Grafted<br/>EP[D]M</label></li>
						<li><input type="radio" name="radio_epdm" id="radio6" value="_grade"><label for="radio6" name="EPDM_GRADE">Grade<br/>Selection Map</label></li>
					</ul>
				</td>
			</tr>
			</tbody>
		</table>

		<c:if test="${type == '_epm'}">
			<div name="product_div" id="EPDM_EPM">

				<table class="uiTable write">
					<colgroup>
						<col style="width:150px" />
						<col style="width:250px" />
						<col style="width:100px" />
						<col style="width:70px" />
						<col />
					</colgroup>
					<tbody>
					<tr name="add_product_epm_tr">
						<th style="background-color:#888888;">제품명 추가</th>
						<td>
					<span class="uiInput text size200">
						<input type="text" id="add_productName_epm" name="add_productName" value="" maxlength="20" />
					</span>
						</td>
						<th  style="background-color:#888888;">출력순서</th>
						<td>
					<span class="uiInput text size50">
						<input type="text" id="add_productOrder_epm" name="add_productOrder" class="onlyNum" value="" maxlength="2" />
					</span>
						</td>
						<td>
					<span style="margin-left:50px;">
						<a id="_epm" name="addButton" href="javascript:" class="uiButton"><span>등록</span></a>
					</span>
						</td>
					</tr>
					<tr name="product_epm_tr_clone" style="display: none">
						<th>제품명</th>
						<td>
						<span class="uiInput text size200">
							<input type="text" name="clone_productName" value="${data.productName}" maxlength="20" />
						</span>
						</td>
						<th>출력순서</th>
						<td>
						<span class="uiInput text size50">
							<input type="text" name="clone_productOrder" value="${data.productOrder}" maxlength="2" />
						</span>
						</td>
						<td>
						<span style="margin-left:50px;">
							<a onclick="delButton_Ajax('${data.seq}', '_epm');" class="uiButton"><span>삭제</span></a>
						</span>
						</td>
					</tr>
					<c:forEach var="data" items="${productEPDM_EPM}" varStatus="i">
						<input type="hidden" name="seq" value="${data.seq}">
						<tr name="product_tr">
							<th>제품명</th>
							<td>
						<span class="uiInput text size200">
							<input type="text" name="productName" value="${data.productName}" maxlength="20" />
						</span>
							</td>
							<th>출력순서</th>
							<td>
						<span class="uiInput text size50">
							<input type="text" name="productOrder" value="${data.productOrder}" maxlength="2" />
						</span>
							</td>
							<td>
						<span style="margin-left:50px;">
							<!--
							<a onclick="delButton_Ajax('${data.seq}', '_epm');" class="uiButton"><span>삭제</span></a>
							-->
							<a onclick="delButton('${data.seq}', '_epm');" class="uiButton"><span>삭제</span></a>
						</span>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

				<div id="area_epm_kor" style="margin-top:20px;">
					<strong>====국문(EPM)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<tr name="product_epm_content_tr_clone" style="display: none">
							<td></td>
							<td>
								<span class="uiInput text sizeFull">
									<input name="" type="text" value="" />
								</span>
							</td>
							<td>
								<span class="uiInput text sizeFull">
									<input name="" type="text" value="" />
								</span>
							</td>
							<td>
								<span class="uiInput text sizeFull">
									<input name="" type="text" value="" />
								</span>
							</td>
							<td>
								<span class="uiInput text sizeFull">
									<input name="" type="text" value="" />
								</span>
							</td>
							<td>
								<span class="uiInput text sizeFull">
									<input name="" type="text" value="" />
								</span>
							</td>
							<td>
								<span class="uiInput text sizeFull">
									<input name="" type="text" value="" />
								</span>
							</td>
							<td>
								<span class="uiInput text sizeFull">
									<input name="" type="text" value="" />
								</span>
							</td>
						</tr>
						<c:forEach var="data" items="${productEPDM_EPM}" varStatus="i">
							<tr name="product_epm_content_tr">
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor1" type="text" value="${data.contentKor1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor2" type="text" value="${data.contentKor2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor3" type="text" value="${data.contentKor3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor4" type="text" value="${data.contentKor4}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor5" type="text" value="${data.contentKor5}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentKor6">${fn:replace(fn:replace(data.contentKor6, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentKor7">${fn:replace(fn:replace(data.contentKor7, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>

				<div id="area_epm_eng" style="margin-top:20px;">
					<strong>====영문(EPM)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_EPM}" varStatus="i">
							<tr>
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng1" type="text" value="${data.contentEng1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng2" type="text" value="${data.contentEng2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng3" type="text" value="${data.contentEng3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng4" type="text" value="${data.contentEng4}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng5" type="text" value="${data.contentEng5}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentEng6">${fn:replace(fn:replace(data.contentEng6, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentEng7">${fn:replace(fn:replace(data.contentEng7, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>

						</tbody>
					</table>
				</div>

				<div id="area_epm_chn" style="margin-top:20px;">
					<strong>====중문(EPM)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_EPM}" varStatus="i">
							<tr>
								<td>${data.productName}</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentChn1" type="text" value="${data.contentChn1}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentChn2" type="text" value="${data.contentChn2}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentChn3" type="text" value="${data.contentChn3}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentChn4" type="text" value="${data.contentChn4}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentChn5" type="text" value="${data.contentChn5}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<textarea name="contentChn6">${fn:replace(fn:replace(data.contentChn6, "<br/>", newline), "&nbsp", " ")}</textarea>
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<textarea name="contentChn7">${fn:replace(fn:replace(data.contentChn7, "<br/>", newline), "&nbsp", " ")}</textarea>
							</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>

				<div id="area_epm_jpn" style="margin-top:20px;">
					<strong>====일문(EPM)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_EPM}" varStatus="i">
							<tr>
								<td>${data.productName}</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentJpn1" type="text" value="${data.contentJpn1}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentJpn2" type="text" value="${data.contentJpn2}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentJpn3" type="text" value="${data.contentJpn3}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentJpn4" type="text" value="${data.contentJpn4}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentJpn5" type="text" value="${data.contentJpn5}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<textarea name="contentJpn6">${fn:replace(fn:replace(data.contentJpn6, "<br/>", newline), "&nbsp", " ")}</textarea>
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<textarea name="contentJpn7">${fn:replace(fn:replace(data.contentJpn7, "<br/>", newline), "&nbsp", " ")}</textarea>
							</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div>
					<table>
						<tr>
							<td height="20">&nbsp;</td>
						</tr>
						<tr>
							<td align="left">

							</td>
							<td align="right">
								<a class="uiButton" name="updateButton"><span>확인</span></a>
									<%--<a class="uiButton" name="cancelButton"><span>취소</span></a>--%>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</c:if>

		<c:if test="${type == '_enb_low'}">
			<div name="product_div" id="EPDM_ENB_Low" style="display:;">

				<table class="uiTable write">
					<colgroup>
						<col style="width:150px" />
						<col style="width:250px" />
						<col style="width:100px" />
						<col style="width:70px" />
						<col />
					</colgroup>
					<tbody>
					<tr>
						<th style="background-color:#888888;">제품명 추가</th>
						<td>
					<span class="uiInput text size200">
						<input type="text" id="add_productName_enb_low" name="add_productName" value="" maxlength="20" />
					</span>
						</td>
						<th style="background-color:#888888;">출력순서</th>
						<td>
					<span class="uiInput text size50">
						<input type="text" id="add_productOrder_enb_low" name="add_productOrder" class="onlyNum" value="" maxlength="2" />
					</span>
						</td>
						<td>
					<span style="margin-left:50px;">
						<a id="_enb_low" name="addButton" href="javascript:" class="uiButton"><span>등록</span></a>
					</span>
						</td>
					</tr>
					<c:forEach var="data" items="${productEPDM_ENB_Low}" varStatus="i">
						<input type="hidden" name="seq" value="${data.seq}">
						<tr name="product_tr">
							<th>제품명</th>
							<td>
						<span class="uiInput text size200">
							<input type="text" name="productName" value="${data.productName}" maxlength="20" />
						</span>
							</td>
							<th>출력순서</th>
							<td>
						<span class="uiInput text size50">
							<input type="text" name="productOrder" value="${data.productOrder}" maxlength="2" />
						</span>
							</td>
							<td>
						<span style="margin-left:50px;">
							<!--
							<a onclick="delButton_Ajax('${data.seq}', '_epm');" class="uiButton"><span>삭제</span></a>
							-->
							<a onclick="delButton('${data.seq}', '_enb_low');" class="uiButton"><span>삭제</span></a>
						</span>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

				<div id="area_enb_low_kor" style="margin-top:20px;">
					<strong>====국문(Low Diene)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_ENB_Low}" varStatus="i">
							<tr name="product_enb_low_content_tr">
								<td>${data.productName}</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentKor1" type="text" value="${data.contentKor1}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentKor2" type="text" value="${data.contentKor2}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentKor3" type="text" value="${data.contentKor3}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentKor4" type="text" value="${data.contentKor4}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentKor5" type="text" value="${data.contentKor5}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<textarea name="contentKor6">${fn:replace(fn:replace(data.contentKor6, "<br/>", newline), "&nbsp", " ")}</textarea>
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<textarea name="contentKor7">${fn:replace(fn:replace(data.contentKor7, "<br/>", newline), "&nbsp", " ")}</textarea>
							</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>

				</div>

				<div id="area_enb_low_eng" style="margin-top:20px;">
					<strong>====영문(Low Diene)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_ENB_Low}" varStatus="i">
							<tr name="product_enb_low_content_tr">
								<td>${data.productName}</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentEng1" type="text" value="${data.contentEng1}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentEng2" type="text" value="${data.contentEng2}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentEng3" type="text" value="${data.contentEng3}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentEng4" type="text" value="${data.contentEng4}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentEng5" type="text" value="${data.contentEng5}" />
							</span>
								</td>
								<td>
								<span class="uiInput text sizeFull">
									<textarea name="contentEng6">${fn:replace(fn:replace(data.contentKor4, "<br/>", newline), "&nbsp", " ")}</textarea>
								</span>
								</td>
								<td>
								<span class="uiInput text sizeFull">
									<textarea name="contentEng7">${fn:replace(fn:replace(data.contentEng7, "<br/>", newline), "&nbsp", " ")}</textarea>
								</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>

				<div id="area_enb_low_chn" style="margin-top:20px;">
					<strong>====중문(Low Diene)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_ENB_Low}" varStatus="i">
							<tr name="product_enb_low_content_tr">
								<td>${data.productName}</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentChn1" type="text" value="${data.contentChn1}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentChn2" type="text" value="${data.contentChn2}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentChn3" type="text" value="${data.contentChn3}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentChn4" type="text" value="${data.contentChn4}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentChn5" type="text" value="${data.contentChn5}" />
							</span>
								</td>
								<td>
								<span class="uiInput text sizeFull">
									<textarea name="contentChn6">${fn:replace(fn:replace(data.contentChn6, "<br/>", newline), "&nbsp", " ")}</textarea>
								</span>
								</td>
								<td>
								<span class="uiInput text sizeFull">
									<textarea name="contentChn7">${fn:replace(fn:replace(data.contentChn7, "<br/>", newline), "&nbsp", " ")}</textarea>
								</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>

				</div>

				<div id="area_enb_low_jpn" style="margin-top:20px;">
					<strong>====일문(Low Diene)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_ENB_Low}" varStatus="i">
							<tr name="product_enb_low_content_tr">
								<td>${data.productName}</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentJpn1" type="text" value="${data.contentJpn1}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentJpn2" type="text" value="${data.contentJpn2}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentJpn3" type="text" value="${data.contentJpn3}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentJpn4" type="text" value="${data.contentJpn4}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
								<input name="contentJpn5" type="text" value="${data.contentJpn5}" />
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
									<textarea name="contentJpn6">${fn:replace(fn:replace(data.contentJpn6, "<br/>", newline), "&nbsp", " ")}</textarea>
							</span>
								</td>
								<td>
							<span class="uiInput text sizeFull">
									<textarea name="contentJpn7">${fn:replace(fn:replace(data.contentJpn7, "<br/>", newline), "&nbsp", " ")}</textarea>
							</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div>
					<table>
						<tr>
							<td height="20">&nbsp;</td>
						</tr>
						<tr>
							<td align="left">

							</td>
							<td align="right">
								<a class="uiButton" name="updateButton"><span>확인</span></a>
									<%--<a class="uiButton" name="cancelButton"><span>취소</span></a>--%>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</c:if>

		<c:if test="${type == '_enb_medium'}">
			<div name="product_div" id="EPDM_ENB_Medium" style="display:;">

				<table class="uiTable write">
					<colgroup>
						<col style="width:150px" />
						<col style="width:250px" />
						<col style="width:100px" />
						<col style="width:70px" />
						<col />
					</colgroup>
					<tbody>
					<tr>
						<th style="background-color:#888888;">제품명 추가</th>
						<td>
					<span class="uiInput text size200">
						<input type="text" id="add_productName_enb_medium" name="add_productName" value="" maxlength="20" />
					</span>
						</td>
						<th style="background-color:#888888;">출력순서</th>
						<td>
					<span class="uiInput text size50">
						<input type="text" id="add_productOrder_enb_medium" name="add_productOrder" class="onlyNum" value="" maxlength="2" />
					</span>
						</td>
						<td>
					<span style="margin-left:50px;">
						<a id="_enb_medium" name="addButton" href="javascript:" class="uiButton"><span>등록</span></a>
					</span>
						</td>
					</tr>
					<c:forEach var="data" items="${productEPDM_ENB_Medium}" varStatus="i">
						<input type="hidden" name="seq" value="${data.seq}">
						<tr name="product_tr">
							<th>제품명</th>
							<td>
						<span class="uiInput text size200">
							<input type="text" name="productName" value="${data.productName}" maxlength="20" />
						</span>
							</td>
							<th>출력순서</th>
							<td>
						<span class="uiInput text size50">
							<input type="text" name="productOrder" value="${data.productOrder}" maxlength="2" />
						</span>
							</td>
							<td>
						<span style="margin-left:50px;">
							<!--
							<a onclick="delButton_Ajax('${data.seq}', '_epm');" class="uiButton"><span>삭제</span></a>
							-->
							<a onclick="delButton('${data.seq}', '_enb_medium');" class="uiButton"><span>삭제</span></a>
						</span>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

				<div id="area_enb_medium_kor" style="margin-top:20px;">
					<strong>====국문(Medium Diene)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_ENB_Medium}" varStatus="i">
							<tr name="product_enb_medium_content_tr">
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor1" type="text" value="${data.contentKor1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor2" type="text" value="${data.contentKor2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor3" type="text" value="${data.contentKor3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor4" type="text" value="${data.contentKor4}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor5" type="text" value="${data.contentKor5}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
											<textarea name="contentKor6">${fn:replace(fn:replace(data.contentKor6, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
											<textarea name="contentKor7">${fn:replace(fn:replace(data.contentKor7, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>

				</div>

				<div id="area_enb_medium_eng" style="margin-top:20px;">
					<strong>====영문(Medium Diene)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_ENB_Medium}" varStatus="i">
							<tr name="product_enb_medium_content_tr">
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng1" type="text" value="${data.contentEng1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng2" type="text" value="${data.contentEng2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng3" type="text" value="${data.contentEng3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng4" type="text" value="${data.contentEng4}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng5" type="text" value="${data.contentEng5}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentEng6">${fn:replace(fn:replace(data.contentEng6, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentEng7">${fn:replace(fn:replace(data.contentEng7, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>

				<div id="area_enb_medium_chn" style="margin-top:20px;">
					<strong>====중문(Medium Diene)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_ENB_Medium}" varStatus="i">
							<tr name="product_enb_medium_content_tr">
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn1" type="text" value="${data.contentChn1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn2" type="text" value="${data.contentChn2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn3" type="text" value="${data.contentChn3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn4" type="text" value="${data.contentChn4}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn5" type="text" value="${data.contentChn5}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentChn6">${fn:replace(fn:replace(data.contentChn6, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentChn7">${fn:replace(fn:replace(data.contentChn7, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>

				</div>

				<div id="area_enb_medium_jpn" style="margin-top:20px;">
					<strong>====일문(Medium Diene)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_ENB_Medium}" varStatus="i">
							<tr name="product_enb_medium_content_tr">
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn1" type="text" value="${data.contentJpn1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn2" type="text" value="${data.contentJpn2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn3" type="text" value="${data.contentJpn3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn4" type="text" value="${data.contentJpn4}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn5" type="text" value="${data.contentJpn5}" />
									</span>
								</td>

								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentJpn6">${fn:replace(fn:replace(data.contentJpn6, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentJpn7">${fn:replace(fn:replace(data.contentJpn7, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div>
					<table>
						<tr>
							<td height="20">&nbsp;</td>
						</tr>
						<tr>
							<td align="left">

							</td>
							<td align="right">
								<a class="uiButton" name="updateButton"><span>확인</span></a>
									<%--<a class="uiButton" name="cancelButton"><span>취소</span></a>--%>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</c:if>

		<c:if test="${type == '_enb_high'}">
			<div name="product_div" id="EPDM_ENB_High" style="display:;">

				<table class="uiTable write">
					<colgroup>
						<col style="width:150px" />
						<col style="width:250px" />
						<col style="width:100px" />
						<col style="width:70px" />
						<col />
					</colgroup>
					<tbody>
					<tr>
						<th style="background-color:#888888;">제품명 추가</th>
						<td>
							<span class="uiInput text size200">
								<input type="text" id="add_productName_enb_high" name="add_productName" value="" maxlength="20" />
							</span>
						</td>
						<th style="background-color:#888888;">출력순서</th>
						<td>
							<span class="uiInput text size50">
								<input type="text" id="add_productOrder_enb_high" name="add_productOrder" class="onlyNum" value="" maxlength="2" />
							</span>
						</td>
						<td>
							<span style="margin-left:50px;">
								<a id="_enb_high" name="addButton" href="javascript:" class="uiButton"><span>등록</span></a>
							</span>
						</td>
					</tr>
					<c:forEach var="data" items="${productEPDM_ENB_High}" varStatus="i">
						<input type="hidden" name="seq" value="${data.seq}">
						<tr name="product_tr">
							<th>제품명</th>
							<td>
								<span class="uiInput text size200">
									<input type="text" name="productName" value="${data.productName}" maxlength="20" />
								</span>
							</td>
							<th>출력순서</th>
							<td>
								<span class="uiInput text size50">
									<input type="text" name="productOrder" value="${data.productOrder}" maxlength="2" />
								</span>
							</td>
							<td>
								<span style="margin-left:50px;">
									<!--
									<a onclick="delButton_Ajax('${data.seq}', '_epm');" class="uiButton"><span>삭제</span></a>
									-->
									<a onclick="delButton('${data.seq}', '_enb_high');" class="uiButton"><span>삭제</span></a>
								</span>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

				<div id="area_enb_high_kor" style="margin-top:20px;">
					<strong>====국문(High Diene)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_ENB_High}" varStatus="i">
							<tr name="product_enb_high_content_tr">
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor1" type="text" value="${data.contentKor1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor2" type="text" value="${data.contentKor2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor3" type="text" value="${data.contentKor3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor4" type="text" value="${data.contentKor4}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor5" type="text" value="${data.contentKor5}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentKor6">${fn:replace(fn:replace(data.contentKor6, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentKor7">${fn:replace(fn:replace(data.contentKor7, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>

				</div>

				<div id="area_enb_high_eng" style="margin-top:20px;">
					<strong>====영문(High Diene)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_ENB_High}" varStatus="i">
							<tr name="product_enb_high_content_tr">
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng1" type="text" value="${data.contentEng1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng2" type="text" value="${data.contentEng2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng3" type="text" value="${data.contentEng3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng4" type="text" value="${data.contentEng4}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng5" type="text" value="${data.contentEng5}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentEng6">${fn:replace(fn:replace(data.contentEng6, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentEng7">${fn:replace(fn:replace(data.contentEng7, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>

				</div>

				<div id="area_enb_high_chn" style="margin-top:20px;">
					<strong>====중문(High Diene)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_ENB_High}" varStatus="i">
							<tr name="product_enb_high_content_tr">
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn1" type="text" value="${data.contentChn1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn2" type="text" value="${data.contentChn2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn3" type="text" value="${data.contentChn3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn4" type="text" value="${data.contentChn4}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn5" type="text" value="${data.contentChn5}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentChn6">${fn:replace(fn:replace(data.contentChn6, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentChn7">${fn:replace(fn:replace(data.contentChn7, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>

				</div>

				<div id="area_enb_high_jpn" style="margin-top:20px;">
					<strong>====일문(High Diene)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_ENB_High}" varStatus="i">
							<tr name="product_enb_high_content_tr">
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn1" type="text" value="${data.contentJpn1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn2" type="text" value="${data.contentJpn2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn3" type="text" value="${data.contentJpn3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn4" type="text" value="${data.contentJpn4}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn5" type="text" value="${data.contentJpn5}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentJpn6">${fn:replace(fn:replace(data.contentJpn6, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentJpn7">${fn:replace(fn:replace(data.contentJpn7, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div>
					<table>
						<tr>
							<td height="20">&nbsp;</td>
						</tr>
						<tr>
							<td align="left">

							</td>
							<td align="right">
								<a class="uiButton" name="updateButton"><span>확인</span></a>
									<%--<a class="uiButton" name="cancelButton"><span>취소</span></a>--%>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</c:if>

		<c:if test="${type == '_enb_oil'}">
			<div name="product_div" id="EPDM_ENB_Oil" style="display:;">

				<table class="uiTable write">
					<colgroup>
						<col style="width:150px" />
						<col style="width:250px" />
						<col style="width:100px" />
						<col style="width:70px" />
						<col />
					</colgroup>
					<tbody>
					<tr>
						<th style="background-color:#888888;">제품명 추가</th>
						<td>
							<span class="uiInput text size200">
								<input type="text" id="add_productName_enb_oil" name="add_productName" value="" maxlength="20" />
							</span>
						</td>
						<th style="background-color:#888888;">출력순서</th>
						<td>
							<span class="uiInput text size50">
								<input type="text" id="add_productOrder_enb_oil" name="add_productOrder" class="onlyNum" value="" maxlength="2" />
							</span>
						</td>
						<td>
							<span style="margin-left:50px;">
								<a id="_enb_oil" name="addButton" href="javascript:" class="uiButton"><span>등록</span></a>
							</span>
						</td>
					</tr>
					<c:forEach var="data" items="${productEPDM_ENB_Oil}" varStatus="i">
						<input type="hidden" name="seq" value="${data.seq}">
						<tr name="product_tr">
							<th>제품명</th>
							<td>
								<span class="uiInput text size200">
									<input type="text" name="productName" value="${data.productName}" maxlength="20" />
								</span>
							</td>
							<th>출력순서</th>
							<td>
								<span class="uiInput text size50">
									<input type="text" name="productOrder" value="${data.productOrder}" maxlength="2" />
								</span>
							</td>
							<td>
								<span style="margin-left:50px;">
									<!--
									<a onclick="delButton_Ajax('${data.seq}', '_epm');" class="uiButton"><span>삭제</span></a>
									-->
									<a onclick="delButton('${data.seq}', '_enb_oil');" class="uiButton"><span>삭제</span></a>
								</span>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

				<div id="area_enb_oil_kor" style="margin-top:20px;">
					<strong>====국문(Oil Extened)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_ENB_Oil}" varStatus="i">
							<tr name="product_enb_oil_content_tr">
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor1" type="text" value="${data.contentKor1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor2" type="text" value="${data.contentKor2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor3" type="text" value="${data.contentKor3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor4" type="text" value="${data.contentKor4}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor5" type="text" value="${data.contentKor5}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentKor6">${fn:replace(fn:replace(data.contentKor6, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentKor7">${fn:replace(fn:replace(data.contentKor7, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>

				<div id="area_enb_oil_eng" style="margin-top:20px;">
					<strong>====영문(Oil Extened)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_ENB_Oil}" varStatus="i">
							<tr name="product_enb_oil_content_tr">
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng1" type="text" value="${data.contentEng1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng2" type="text" value="${data.contentEng2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng3" type="text" value="${data.contentEng3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng4" type="text" value="${data.contentEng4}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng5" type="text" value="${data.contentEng5}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentEng6">${fn:replace(fn:replace(data.contentEng6, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentEng7">${fn:replace(fn:replace(data.contentEng7, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>

				</div>

				<div id="area_enb_oil_chn" style="margin-top:20px;">
					<strong>====중문(Oil Extened)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_ENB_Oil}" varStatus="i">
							<tr name="product_enb_oil_content_tr">
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn1" type="text" value="${data.contentChn1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn2" type="text" value="${data.contentChn2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn3" type="text" value="${data.contentChn3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn4" type="text" value="${data.contentChn4}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn5" type="text" value="${data.contentChn5}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentChn6">${fn:replace(fn:replace(data.contentChn6, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentChn7">${fn:replace(fn:replace(data.contentChn7, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>

				</div>

				<div id="area_enb_oil_jpn" style="margin-top:20px;">
					<strong>====일문(Oil Extened)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Mooney<br/>Viscosity<br/>(ML1+4,100℃)</th>
							<th>ENB<br/>Content<br/>(WL%)</th>
							<th>Ethylence<br/>Content<br/>(WL%)</th>
							<th>Extender<br/>Ol<br/>(PHR)</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_ENB_Oil}" varStatus="i">
							<tr name="product_enb_oil_content_tr">
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn1" type="text" value="${data.contentJpn1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn2" type="text" value="${data.contentJpn2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn3" type="text" value="${data.contentJpn3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn4" type="text" value="${data.contentJpn4}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn5" type="text" value="${data.contentJpn5}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentJpn6">${fn:replace(fn:replace(data.contentJpn6, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentJpn7">${fn:replace(fn:replace(data.contentJpn7, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div>
					<table>
						<tr>
							<td height="20">&nbsp;</td>
						</tr>
						<tr>
							<td align="left">

							</td>
							<td align="right">
								<a class="uiButton" name="updateButton"><span>확인</span></a>
									<%--<a class="uiButton" name="cancelButton"><span>취소</span></a>--%>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</c:if>

		<c:if test="${type == '_mah'}">
			<div name="product_div" id="EPDM_MAH" style="display:;">

				<table class="uiTable write">
					<colgroup>
						<col style="width:150px" />
						<col style="width:250px" />
						<col style="width:100px" />
						<col style="width:70px" />
						<col />
					</colgroup>
					<tbody>
					<tr>
						<th style="background-color:#888888;">제품명 추가</th>
						<td>
							<span class="uiInput text size200">
								<input type="text" id="add_productName_mah"name="add_productName" value="" maxlength="20" />
							</span>
						</td>
						<th  style="background-color:#888888;">출력순서</th>
						<td>
							<span class="uiInput text size50">
								<input type="text" id="add_productOrder_mah" name="add_productOrder" class="onlyNum" value="" maxlength="2" />
							</span>
						</td>
						<td>
							<span style="margin-left:50px;">
								<a id="_mah" name="addButton" href="javascript:" class="uiButton"><span>등록</span></a>
							</span>
						</td>
					</tr>
					<c:forEach var="data" items="${productEPDM_MAH}" varStatus="i">
						<input type="hidden" name="seq" value="${data.seq}">
						<tr name="product_tr">
							<th>제품명</th>
							<td>
								<span class="uiInput text size200">
									<input type="text" name="productName" value="${data.productName}" maxlength="20" />
								</span>
							</td>
							<th>출력순서</th>
							<td>
								<span class="uiInput text size50">
									<input type="text" name="productOrder" value="${data.productOrder}" maxlength="2" />
								</span>
							</td>
							<td>
								<span style="margin-left:50px;">
									<!--
									<a onclick="delButton_Ajax('${data.seq}', '_epm');" class="uiButton"><span>삭제</span></a>
									-->
									<a onclick="delButton('${data.seq}', '_mah');" class="uiButton"><span>삭제</span></a>
								</span>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

				<div id="area_epdm_mah_kor" style="margin-top:20px;">
					<strong>====국문(MAH-Grafted)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Methodex<br/>(216kg,230℃)</th>
							<th>Yellowness</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_MAH}" varStatus="i">
							<tr name="product_mah_content_tr">
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor1" type="text" value="${data.contentKor1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor2" type="text" value="${data.contentKor2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentKor3" type="text" value="${data.contentKor3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentKor4">${fn:replace(fn:replace(data.contentKor4, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentKor5">${fn:replace(fn:replace(data.contentKor5, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>

				</div>

				<div id="area_epdm_mah_eng" style="margin-top:20px;">
					<strong>====영문(MAH-Grafted)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Methodex<br/>(216kg,230℃)</th>
							<th>Yellowness</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_MAH}" varStatus="i">
							<tr name="product_mah_content_tr">
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng1" type="text" value="${data.contentEng1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng2" type="text" value="${data.contentEng2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentEng3" type="text" value="${data.contentEng3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentEng4">${fn:replace(fn:replace(data.contentEng4, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentEng5">${fn:replace(fn:replace(data.contentEng5, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>

				</div>

				<div id="area_epdm_mah_chn" style="margin-top:20px;">
					<strong>====중문(MAH-Grafted)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Methodex<br/>(216kg,230℃)</th>
							<th>Yellowness</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_MAH}" varStatus="i">
							<tr name="product_mah_content_tr">
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn1" type="text" value="${data.contentChn1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn2" type="text" value="${data.contentChn2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentChn3" type="text" value="${data.contentChn3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentChn4">${fn:replace(fn:replace(data.contentChn4, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentChn5">${fn:replace(fn:replace(data.contentChn5, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>

				</div>

				<div id="area_epdm_mah_jpn" style="margin-top:20px;">
					<strong>====일문(MAH-Grafted)====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:80px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
						</colgroup>
						<thead>
						<tr>
							<th>Product<br/>Name</th>
							<th>Methodex<br/>(216kg,230℃)</th>
							<th>Yellowness</th>
							<th>Product<br/>Form</th>
							<th>Characteristic</th>
							<th>Purpose</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${productEPDM_MAH}" varStatus="i">
							<tr name="product_mah_content_tr">
								<td>${data.productName}</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn1" type="text" value="${data.contentJpn1}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn2" type="text" value="${data.contentJpn2}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<input name="contentJpn3" type="text" value="${data.contentJpn3}" />
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentJpn4">${fn:replace(fn:replace(data.contentJpn4, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
								<td>
									<span class="uiInput text sizeFull">
										<textarea name="contentJpn5">${fn:replace(fn:replace(data.contentJpn5, "<br/>", newline), "&nbsp", " ")}</textarea>
									</span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div>
					<table>
						<tr>
							<td height="20">&nbsp;</td>
						</tr>
						<tr>
							<td align="left">

							</td>
							<td align="right">
								<a class="uiButton" name="updateButton"><span>확인</span></a>
									<%--<a class="uiButton" name="cancelButton"><span>취소</span></a>--%>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</c:if>

		<c:if test="${type == '_grade'}">
			<div name="product_div" id="EPDM_GRADE" >
				<div id="area_img" style="margin-top:20px;">
					<strong>====이미지 등록====</strong>
					<table class="uiTable write">
						<colgroup>
							<col style="width:130px" />
							<col />
						</colgroup>
						<tbody>
						<tr>
							<th>이미지</th>
							<td>
							<span class="uiInput file">
								<input type="file" id="imgFile" name="imgFile" />
								<label style="cursor: default;">이미지크기(000px * 000px)</label>
								<c:if test="${productEPDM_Grade[0].filePath != '' && productEPDM_Grade[0].filePath != null}">
									<a href="${pageContext.request.contextPath}/download${productEPDM_Grade[0].filePath}" class="uiButton"><span>${productEPDM_Grade[0].fileName} 다운로드</span></a>
								</c:if>
							</span>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div>
				<table>
					<tr>
						<td height="20">&nbsp;</td>
					</tr>
					<tr>
						<td align="right">
							<a class="uiButton" name="updateButton"><span>확인</span></a>
								<%--<a class="uiButton" name="cancelButton"><span>취소</span></a>--%>
						</td>
					</tr>
				</table>
			</div>
		</c:if>
	</div>
</form>
<script>
	var f = document.frmEdit;

	$( document ).ready(function() {

		$("textarea").autoGrow();

		common.commonModule.checkedRadio(document.frmEdit.exposureYn, '${productEPDM.exposureYn}');
		common.commonModule.checkedRadio(document.frmEdit.radio_epdm, '${type}');

		formChange($("input[name='radio_epdm']:checked").val());
	});

	$("input[name='radio_epdm']").on('change', function(){

		$('#type').val($(this).val());
		var epdmSeq = $('#epdmSeq').val();

		var url = "/admin/productEPDM/list?type="+$(this).val()+"&seq="+epdmSeq;
		$(location).attr("href", url);

	});

	//등록버튼 클릭시
	$("a[name='addButton']").on('click', function(){

		if($("input[name='add_productName']").val() == ""){
			alert("제품명을 입력하십시오.");
			$("input[name='add_productName']").focus();
			return;
		}

		if($("input[name='add_productOrder']").val() == "")  {
			alert("출력순서를 입력하십시오.");
			$("input[name='add_productOrder']").focus();
			return;
		}else if($("input[name='add_productOrder']").val() == "0"){
			alert("0은 입력할 수 없습니다.");
			$("input[name='add_productOrder']").val("");
			$("input[name='add_productOrder']").focus();
			return;
		}

		var addProductName = $("#add_productName" + $(this).attr("id")).val();
		var addOrder = $("#add_productOrder" + $(this).attr("id")).val();
		var type = $(this).attr("id"); //_epm
		var epdmSeq = $("#epdmSeq").val(); //epdmSeq

		var url = "/admin/productEPDM/insert?epdmSeq="+ epdmSeq + "&type=" + type + "&addProductName=" + addProductName + "&addOrder=" + addOrder;
		$(location).attr("href", url);

	});

	$("#allchecked").on('click', function(){
		common.commonModule.allCheck("langKorYn", this);
		common.commonModule.allCheck("langEngYn", this);
		common.commonModule.allCheck("langChnYn", this);
		common.commonModule.allCheck("langJpnYn", this);
	});

	$(".exposureLang").bind("click", function(){
		formChange($("input[name='radio_epdm']:checked").val());
	});


	//확인버튼 클릭시
	$("a[name='updateButton']").on('click', function(){
		if(!common.commonModule.isCheck(f.exposureYn, "노출 여부를 선택하십시오.", "")) { return; }

		$( "form[name='frmEdit']" ).submit();
	});

	function delButton(_delProductSeq, _type) {

		var url = "/admin/productEPDM/delete?type=" + _type + "&delProductSeq=" + _delProductSeq;
		$(location).attr("href", url);
	}

	var formChange = function(_type){
		$(".exposureLang").each(function(index) {
			if($(this).is(":checked") == true){
				switch(_type) {
					case "_epm":
						if(index == 1) {
							$("#area_epm_kor").show();
						}else if(index == 2) {
							$("#area_epm_eng").show();
						}else if(index == 3) {
							$("#area_epm_chn").show();
						}else if(index == 4) {
							$("#area_epm_jpn").show();
						}
						break;
					case "_enb_low":
						if(index == 1) {
							$("#area_enb_low_kor").show();
						}else if(index == 2) {
							$("#area_enb_low_eng").show();
						}else if(index == 3) {
							$("#area_enb_low_chn").show();
						}else if(index == 4) {
							$("#area_enb_low_jpn").show();
						}
						break;
					case "_enb_medium":
						if(index == 1) {
							$("#area_enb_medium_kor").show();
						}else if(index == 2) {
							$("#area_enb_medium_eng").show();
						}else if(index == 3) {
							$("#area_enb_medium_chn").show();
						}else if(index == 4) {
							$("#area_enb_medium_jpn").show();
						}
						break;
					case "_enb_high":
						if(index == 1) {
							$("#area_enb_high_kor").show();
						}else if(index == 2) {
							$("#area_enb_high_eng").show();
						}else if(index == 3) {
							$("#area_enb_high_chn").show();
						}else if(index == 4) {
							$("#area_enb_high_jpn").show();
						}
						break;
					case "_enb_oil":
						if(index == 1) {
							$("#area_enb_oil_kor").show();
						}else if(index == 2) {
							$("#area_enb_oil_eng").show();
						}else if(index == 3) {
							$("#area_enb_oil_chn").show();
						}else if(index == 4) {
							$("#area_enb_oil_jpn").show();
						}
						break;
					case "_mah":
						if(index == 1) {
							$("#area_epdm_mah_kor").show();
						}else if(index == 2) {
							$("#area_epdm_mah_eng").show();
						}else if(index == 3) {
							$("#area_epdm_mah_chn").show();
						}else if(index == 4) {
							$("#area_epdm_mah_jpn").show();
						}
						break;
				}
			}else{
				$("#allchecked").attr("checked", false);  //국문, 영문, 중문 한개라도 체크 안될시 전체 체크박스 체크 해제
				switch(_type) {
					case "_epm":
						if(index == 1) {
							$("#area_epm_kor").hide();
						}else if(index == 2) {
							$("#area_epm_eng").hide();
						}else if(index == 3) {
							$("#area_epm_chn").hide();
						}else if(index == 4) {
							$("#area_epm_jpn").hide();
						}
						break;
					case "_enb_low":

						if(index == 1) {
							$("#area_enb_low_kor").hide();
						}else if(index == 2) {
							$("#area_enb_low_eng").hide();
						}else if(index == 3) {
							$("#area_enb_low_chn").hide();
						}else if(index == 4) {
							$("#area_enb_low_jpn").hide();
						}
						break;
					case "_enb_medium":
						if(index == 1) {
							$("#area_enb_medium_kor").hide();
						}else if(index == 2) {
							$("#area_enb_medium_eng").hide();
						}else if(index == 3) {
							$("#area_enb_medium_chn").hide();
						}else if(index == 4) {
							$("#area_enb_medium_jpn").hide();
						}
						break;
					case "_enb_high":
						if(index == 1) {
							$("#area_enb_high_kor").hide();
						}else if(index == 2) {
							$("#area_enb_high_eng").hide();
						}else if(index == 3) {
							$("#area_enb_high_chn").hide();
						}else if(index == 4) {
							$("#area_enb_high_jpn").hide();
						}
						break;
					case "_enb_oil":
						if(index == 1) {
							$("#area_enb_oil_kor").hide();
						}else if(index == 2) {
							$("#area_enb_oil_eng").hide();
						}else if(index == 3) {
							$("#area_enb_oil_chn").hide();
						}else if(index == 4) {
							$("#area_enb_oil_jpn").hide();
						}
						break;
					case "_mah":
						if(index == 1) {
							$("#area_epdm_mah_kor").hide();
						}else if(index == 2) {
							$("#area_epdm_mah_eng").hide();
						}else if(index == 3) {
							$("#area_epdm_mah_chn").hide();
						}else if(index == 4) {
							$("#area_epdm_mah_jpn").hide();
						}
						break;
				}
			}
		});

		// 국문, 영문, 중문, 일문 선택시 전체 체크박스 체크
		if(
				$("input:checkbox[id='langKorYn']").is(":checked")  &&  $("input:checkbox[id='langEngYn']").is(":checked")
				&&  $("input:checkbox[id='langChnYn']").is(":checked")  &&  $("input:checkbox[id='langJpnYn']").is(":checked")  ){

			$("#allchecked").attr("checked", true);
		}

	};
	/*
	 // Ajax 데이터 요청(addButton)
	 function addButton_Ajax(_addProductName, _addOrder, _type) {
	 // POST 데이터 요청
	 var xhr = $.getJSON("/admin/_Ajax/addButton_Ajax?type=" + _type + "&addProductName=" + _addProductName + "&addOrder=" + _addOrder);

	 xhr.done(function(result) {
	 list();
	 });

	 xhr.fail(function(result) {
	 alert(result.status + " : " + result.statusText);
	 });
	 }

	 // Ajax 데이터 요청(addButton)
	 function delButton_Ajax(_delProductSeq, _type) {

	 // POST 데이터 요청
	 var xhr = $.getJSON("/admin/_Ajax/delButton_Ajax?type=" + _type + "&delProductSeq=" + _delProductSeq);

	 xhr.done(function(result) {
	 list();
	 });

	 xhr.fail(function(result) {
	 alert(result.status + " : " + result.statusText);
	 });
	 }

	 // Ajax 데이터 요청(list)
	 function list() {
	 // POST 데이터 요청
	 var xhr = $.getJSON("/admin/_Ajax/list");

	 xhr.done(function(result) {
	 $("#add_productName_epm").val("");
	 $("#add_productOrder_epm").val("");

	 $("tr[name='product_tr']").remove();
	 $("tr[name='product_epm_content_tr']").remove();

	 for(var i = 0; i < result.object.length; i++){
	 if($("tr[name='product_tr']").length > 0){
	 //제품명 tr
	 $("tr[name='product_tr']:last").after($("tr[name='product_epm_tr_clone']").clone());
	 $("tr[name='product_epm_tr_clone']:last").attr('name', 'product_tr');
	 $("tr[name='product_tr']").filter(":last").css('display', '');
	 $("tr[name='product_tr']:last").find('input').filter(':eq(0)').val(result.object[i].productName);
	 $("tr[name='product_tr']:last").find('input').filter(':eq(1)').val(result.object[i].productOrder);
	 $("tr[name='product_tr']:last").find('a').attr('onclick',"delButton_Ajax(" + result.object[i].seq +", '" + $("tr[name='add_product_epm_tr']:last").find('a').attr("id") + "')");


	 }else{
	 $("tr[name='product_epm_content_tr_clone']").after($("tr[name='product_epm_tr_clone']").clone());
	 $("tr[name='product_epm_tr_clone']:last").attr('name', 'product_tr');
	 $("tr[name='product_tr']").filter(":last").css('display', '');
	 $("tr[name='product_tr']:last").find('input').filter(':eq(0)').val(result.object[i].productName);
	 $("tr[name='product_tr']:last").find('input').filter(':eq(1)').val(result.object[i].productOrder);
	 $("tr[name='product_tr']:last").find('a').attr('onclick',"delButton_Ajax(" + result.object[i].seq +", '" + $("tr[name='add_product_epm_tr']:last").find('a').attr("id") + "')");

	 }

	 }

	 });

	 xhr.fail(function(result) {
	 alert(result.status + " : " + result.statusText);
	 });

	 }
	 */
</script>
