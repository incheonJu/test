<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
window.onload = function(){
	// gnb 현재 활성화 메뉴 표시
	gnb({
		depth01: 1,
		depth02: 0
	});
};
var MAIN_PAGE = false;
</script>
			<!-- Tab 3depth (s) -->
			<div class="tab3Depth">
				<ul class="t6">
					<li class="on"><a href="epdm?seq=1">제품개요</a></li>
					<li><a href="epdmProperty">제품특성</a></li>
					<li><a href="epdmCompound">컴파운드 특성</a></li>
					<li><a href="epdmProcess">제조공정 및 가공방법</a></li>
					<li><a href="epdmApplication">등록분야</a></li>
					<li><a href="epdmMap">석유화학계통도</a></li>
				</ul>
			</div>
			<!-- Tab 3depth (e) -->

			<!-- title Wrap (s) -->
			<div id="titleWr">
				<h2>EPDM</h2>
			</div>
			<!-- title Wrap (e) -->

            <!-- content (s) -->
			<div id="content">

				<!-- Top Box (s) -->
				<div class="prdTopWr epdm">
					<div class="inner">
						<h3 class="stitle">제품 개요</h3>
						<p class="txt">금호폴리켐이 생산하는 EP(D)M는 자동차 부품에 주로 쓰이는 고기능성 <br />특수합성고무로 내열성, 내오존성, 내약품성 등이 탁월합니다. <br />다른 합성고무에 비해 비중이 낮으면서 고충진 배합이 가능하여 경제성<br />또한 뛰어나 자동차용 Body Sealing이나 타이어 튜브, 호스는 물론, <br />전선, 건설 부자재 등 우리 생활 속에 폭넓게 활용되고 있습니다.</p>
						<div class="btns">
							<a href="" class="btnMore mr20">카탈로그</a>
							<a href="/kor/customer/qna" class="btnMore">제품문의</a>
						</div>
					</div>
				</div>
				<!-- Top Box (e) -->

				<!-- contentWrap (s) -->
				<div class="bgWhite pb80">
					<div class="contentWrap">

						<h4 class="stitle">제품상세정보</h4>
						<ul class="tabBasic li7 line2">
							<li class="on"><a href="#tab1" class="line1">EPM</a></li>
							<li><a href="#tab2">EPDM [ENB Type]<br />Low Diene</a></li>
							<li><a href="#tab3">EPDM [ENB Type]<br />Medium Diene</a></li>
							<li><a href="#tab4">EPDM [ENB Type]<br />High Diene</a></li>
							<li><a href="#tab5">EPDM [ENB Type]<br />Oil Extened</a></li>
							<li><a href="#tab6">MAH-grafted<br />EP[D]M</a></li>
							<li><a href="#tab7">Grade<br />Selection Map</a></li>
						</ul>
						<div id="tab1">
							<table class="tbl_prd_basic">
								<caption>EPM 상세정보 표</caption>
								<colgroup>
									<col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="20%" /><col width="" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">Product<br />Name</th>
										<th scope="col">Mooney<br />Viscosity<br />(ML1+4,100°C) (2)</th>
										<th scope="col">ENB<br />Content<br />(Wt.%)</th>
										<th scope="col">Ethylene<br />Content<br />(Wt.%)</th>
										<th scope="col">Extender<br />Oil (PHR)</th>
										<th scope="col">Product<br />Form (3)</th>
										<th scope="col">Characteristic</th>
										<th scope="col">Purpose</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
									<c:when test="${productEPDM.exposureYn == 'Y' && productEPDM.langKorYn == 'checked'}">
										<c:if test="${fn:length(productEPDM_EPM) == 0}">
											<tr style="height: 300px">
												<td scope="row"></td>
												<td></td>
												<td></td>
												<td></td>
												<td>제품이 없습니다.</td>
												<td></td>
												<td class="al"></td>
												<td class="al"></td>
											</tr>
										</c:if>
										<c:forEach var="data" items="${productEPDM_EPM}" varStatus="i">
											<tr>
												<td scope="row">${data.productName}</td>
												<td>${data.contentKor1}</td>
												<td>${data.contentKor2}</td>
												<td>${data.contentKor3}</td>
												<td>${data.contentKor4}</td>
												<td>${data.contentKor5}</td>
												<td class="al">${data.contentKor6}</td>
												<td class="al">${data.contentKor7}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr style="height: 300px">
											<td scope="row"></td>
											<td></td>
											<td></td>
											<td></td>
											<td>제품이 없습니다.</td>
											<td></td>
											<td class="al"></td>
											<td class="al"></td>
										</tr>
									</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<p class="noti">(1) Product Form : P = Pellet, B = Dense Bale</p>
						</div>
						<div id="tab2" style="display:none">
							<table class="tbl_prd_basic">
								<caption>EPM 상세정보 표</caption>
								<colgroup>
									<col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="20%" /><col width="" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">Product<br />Name</th>
										<th scope="col">Mooney<br />Viscosity<br />(ML1+4,100°C) (2)</th>
										<th scope="col">ENB<br />Content<br />(Wt.%)</th>
										<th scope="col">Ethylene<br />Content<br />(Wt.%)</th>
										<th scope="col">Extender<br />Oil (PHR)</th>
										<th scope="col">Product<br />Form (3)</th>
										<th scope="col">Characteristic</th>
										<th scope="col">Purpose</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${productEPDM.exposureYn == 'Y' && productEPDM.langKorYn == 'checked'}">
										<c:if test="${fn:length(productEPDM_ENB_Low) == 0}">
											<tr style="height: 300px">
												<td scope="row"></td>
												<td></td>
												<td></td>
												<td></td>
												<td>제품이 없습니다.</td>
												<td></td>
												<td class="al"></td>
												<td class="al"></td>
											</tr>
										</c:if>
										<c:forEach var="data" items="${productEPDM_ENB_Low}" varStatus="i">
											<tr>
												<td scope="row">${data.productName}</td>
												<td>${data.contentKor1}</td>
												<td>${data.contentKor2}</td>
												<td>${data.contentKor3}</td>
												<td>${data.contentKor4}</td>
												<td>${data.contentKor5}</td>
												<td class="al">${data.contentKor6}</td>
												<td class="al">${data.contentKor7}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr style="height: 300px">
											<td scope="row"></td>
											<td></td>
											<td></td>
											<td></td>
											<td>제품이 없습니다.</td>
											<td></td>
											<td class="al"></td>
											<td class="al"></td>
										</tr>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
							<p class="noti">(1) Product Form : B = Dense Bale</p>
						</div>
						<div id="tab3" style="display:none">
							<table class="tbl_prd_basic">
								<caption>EPM 상세정보 표</caption>
								<colgroup>
									<col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="20%" /><col width="" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">Product<br />Name</th>
										<th scope="col">Mooney<br />Viscosity<br />(ML1+4,100°C) (2)</th>
										<th scope="col">ENB<br />Content<br />(Wt.%)</th>
										<th scope="col">Ethylene<br />Content<br />(Wt.%)</th>
										<th scope="col">Extender<br />Oil (PHR)</th>
										<th scope="col">Product<br />Form (3)</th>
										<th scope="col">Characteristic</th>
										<th scope="col">Purpose</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${productEPDM.exposureYn == 'Y' && productEPDM.langKorYn == 'checked'}">
										<c:if test="${fn:length(productEPDM_ENB_Medium) == 0}">
											<tr style="height: 300px">
												<td scope="row"></td>
												<td></td>
												<td></td>
												<td></td>
												<td>제품이 없습니다.</td>
												<td></td>
												<td class="al"></td>
												<td class="al"></td>
											</tr>
										</c:if>
										<c:forEach var="data" items="${productEPDM_ENB_Medium}" varStatus="i">
											<tr>
												<td scope="row">${data.productName}</td>
												<td>${data.contentKor1}</td>
												<td>${data.contentKor2}</td>
												<td>${data.contentKor3}</td>
												<td>${data.contentKor4}</td>
												<td>${data.contentKor5}</td>
												<td class="al">${data.contentKor6}</td>
												<td class="al">${data.contentKor7}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr style="height: 300px">
											<td scope="row"></td>
											<td></td>
											<td></td>
											<td></td>
											<td>제품이 없습니다.</td>
											<td></td>
											<td class="al"></td>
											<td class="al"></td>
										</tr>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
							<p class="noti">(1) ML1+8, 125°C<br />(2) Mooney Viscosity : Massed Value<br />(3) Product Form : B = Dense Bale, FB = Friable Bale, P = Pellet, SFB = Semi-Friable Bale</p>
						</div>
						<div id="tab4" style="display:none">
							<table class="tbl_prd_basic">
								<caption>EPM 상세정보 표</caption>
								<colgroup>
									<col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="20%" /><col width="" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">Product<br />Name</th>
										<th scope="col">Mooney<br />Viscosity<br />(ML1+4,100°C) (2)</th>
										<th scope="col">ENB<br />Content<br />(Wt.%)</th>
										<th scope="col">Ethylene<br />Content<br />(Wt.%)</th>
										<th scope="col">Extender<br />Oil (PHR)</th>
										<th scope="col">Product<br />Form (3)</th>
										<th scope="col">Characteristic</th>
										<th scope="col">Purpose</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${productEPDM.exposureYn == 'Y' && productEPDM.langKorYn == 'checked'}">
										<c:if test="${fn:length(productEPDM_ENB_High) == 0}">
											<tr style="height: 300px">
												<td scope="row"></td>
												<td></td>
												<td></td>
												<td></td>
												<td>제품이 없습니다.</td>
												<td></td>
												<td class="al"></td>
												<td class="al"></td>
											</tr>
										</c:if>
										<c:forEach var="data" items="${productEPDM_ENB_High}" varStatus="i">
											<tr>
												<td scope="row">${data.productName}</td>
												<td>${data.contentKor1}</td>
												<td>${data.contentKor2}</td>
												<td>${data.contentKor3}</td>
												<td>${data.contentKor4}</td>
												<td>${data.contentKor5}</td>
												<td class="al">${data.contentKor6}</td>
												<td class="al">${data.contentKor7}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr style="height: 300px">
											<td scope="row"></td>
											<td></td>
											<td></td>
											<td></td>
											<td>제품이 없습니다.</td>
											<td></td>
											<td class="al"></td>
											<td class="al"></td>
										</tr>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
							<p class="noti">(1) ML1+8, 125°C<br />(2) Mooney Viscosity : Massed Value<br />(3) Product Form : B = Dense Bale , FB = Friable Bale, SFB = Semi-Friable Bale</p>
						</div>
						<div id="tab5" style="display:none">
							<table class="tbl_prd_basic">
								<caption>EPM 상세정보 표</caption>
								<colgroup>
									<col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="20%" /><col width="" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">Product<br />Name</th>
										<th scope="col">Mooney<br />Viscosity<br />(ML1+4,100°C) (2)</th>
										<th scope="col">ENB<br />Content<br />(Wt.%)</th>
										<th scope="col">Ethylene<br />Content<br />(Wt.%)</th>
										<th scope="col">Extender<br />Oil (PHR)</th>
										<th scope="col">Product<br />Form (3)</th>
										<th scope="col">Characteristic</th>
										<th scope="col">Purpose</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${productEPDM.exposureYn == 'Y' && productEPDM.langKorYn == 'checked'}">
										<c:if test="${fn:length(productEPDM_ENB_Oil) == 0}">
											<tr style="height: 300px">
												<td scope="row"></td>
												<td></td>
												<td></td>
												<td></td>
												<td>제품이 없습니다.</td>
												<td></td>
												<td class="al"></td>
												<td class="al"></td>
											</tr>
										</c:if>
										<c:forEach var="data" items="${productEPDM_ENB_Oil}" varStatus="i">
											<tr>
												<td scope="row">${data.productName}</td>
												<td>${data.contentKor1}</td>
												<td>${data.contentKor2}</td>
												<td>${data.contentKor3}</td>
												<td>${data.contentKor4}</td>
												<td>${data.contentKor5}</td>
												<td class="al">${data.contentKor6}</td>
												<td class="al">${data.contentKor7}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr style="height: 300px">
											<td scope="row"></td>
											<td></td>
											<td></td>
											<td></td>
											<td>제품이 없습니다.</td>
											<td></td>
											<td class="al"></td>
											<td class="al"></td>
										</tr>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
							<p class="noti">(1) Value of base polymer<br />(2) Mooney Viscosity : Massed Value<br />(3) Product Form : B = Dense Bale , FB = Friable Bale</p>
						</div>
						<div id="tab6" style="display:none">
							<table class="tbl_prd_basic">
								<caption>MAH-GRAFTED EP[D]M 상세정보 표</caption>
								<colgroup>
									<col width="10%" /><col width="11%" /><col width="11%" /><col width="11%" /><col width="30%" /><col width="" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">Product<br />Name</th>
										<th scope="col">Melt Index<br />(2.16kg / 230°C)</th>
										<th scope="col">Yellowness</th>
										<th scope="col">Product<br />Form</th>
										<th scope="col">Characteristic</th>
										<th scope="col">Purpose</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${productEPDM.exposureYn == 'Y' && productEPDM.langKorYn == 'checked'}">
										<c:if test="${fn:length(productEPDM_MAH) == 0}">
											<tr style="height: 300px">
												<td scope="row"></td>
												<td></td>
												<td></td>
												<td></td>
												<td class="al">제품이 없습니다.</td>
												<td class="al"></td>
											</tr>
										</c:if>
										<c:forEach var="data" items="${productEPDM_MAH}" varStatus="i">
											<tr>
												<td scope="row">${data.productName}</td>
												<td>${data.contentKor1}</td>
												<td>${data.contentKor2}</td>
												<td>${data.contentKor3}</td>
												<td class="al">${data.contentKor4}</td>
												<td class="al">${data.contentKor5}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr style="height: 300px">
											<td scope="row"></td>
											<td></td>
											<td></td>
											<td></td>
											<td class="al">제품이 없습니다.</td>
											<td class="al"></td>
										</tr>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
							<p class="noti">(1) Product form : P = Pellet<br />* 상기 물성값은 대표치이며 제품규격이 아닙니다.</p>
						</div>
						<div id="tab7" style="display:none">
							<c:choose>
								<c:when test="${productEPDM.exposureYn == 'Y' && productEPDM.langKorYn == 'checked'}">
									<c:choose>
										<c:when test="${productEPDM_Grade[0] == null}">
											<img src="" alt="이미지없음" />
										</c:when>
										<c:otherwise>
											<img src="/download${productEPDM_Grade[0].filePath}" alt="" />
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<img src="" alt="이미지없음" />
								</c:otherwise>
							</c:choose>

						</div>

					</div>
				</div>
				<div class="bgGray">
					<div class="contentWrap">

						<h4 class="stitle">EPDM 구조</h4>
						<ul>
							<li>
								<span class="tag">Copolymer</span>
								<div><img src="/resources/image/user/kor/sub/product/img_epdm_structure1.gif" alt="" /></div>
							</li>
							<li>
								<span class="tag">Terpolymer</span>
								<div><img src="/resources/image/user/kor/sub/product/img_epdm_structure2.gif" alt="" /></div>
							</li>
						</ul>

					</div>
				</div>
				<!-- contentWrap (e) -->

			</div>
            <!-- content (e) -->
