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
		depth02: 2
	});
};
var MAIN_PAGE = false;
</script>
			<!-- title Wrap (s) -->
			<div id="titleWr">
				<h2>KEPA</h2>
			</div>
			<!-- title Wrap (e) -->

            <!-- content (s) -->
			<div id="content">

				<!-- Top Box (s) -->
				<div class="prdTopWr kepa">
					<div class="inner">
						<h3 class="stitle">KEPA</h3>
						<p class="txt">EP(D)M에 MAH(Maleic Anhydride)등의 기능성 화합물질을<br />결합(Grafting)시켜 EP(D)M의 성질을 부분적으로 개질시킴으로서<br />극성 고분자 제품과 친화력을 향상시킨 제품으로 Nylon, ABS, PET, PBT 등의<br />극성수지의 충격보강용 및 사용화제로 사용되고 있습니다.</p>
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

						<h4 class="stitle">제품개요</h4>
						<p class="pTxt">KEPA 1150은 주요 분자사슬이 단일 구조로만 이루어진 폴리올레핀계 엘라스토머에 무수말레인산을 그라프트시킨 특수 고분자 고무로서 내열성, 내오존성 및 내후성이 우수한<br />특성을가지고 있으며, 또한 비결정성 고무로 이루어져 저온충격강도에 우수한 특성을 발휘합니다.</p>
						<div class="outline">
							<ul class="lists">
								<li><span>1</span>뛰어난 충격강도(Notched Sample)</li>
								<li><span>2</span>-40℃ 이하에서의 저온특성 유지</li>
								<li><span>3</span>엔지니어링 플라스틱과 혼련 시 상용성 향상</li>
								<li><span>4</span>뛰어난 유연성 / 탄성 유지</li>
								<li><span>5</span>흡습성을 최소화함으로써 건조시간 단축</li>
								<li><span>6</span>최종제품의 Flexural Modulus 유지 능력 탁월 </li>
							</ul>
						</div>

					</div>
				</div>
				<div class="bgGray pb80">
					<div class="contentWrap">

						<h4 class="stitle">특징</h4>
						<ul class="tabBasic">
							<c:forEach var="data" items="${productKEPA_DTL}" varStatus="i">
								<tr>
									<li <c:if test="${i.count == 1}"> class="on" </c:if>  ><a href="#tab${i.count}">${data.productName}</a></li>
								</tr>
							</c:forEach>

							<%--<li class="on"><a href="#tab1">KEPA1130</a></li>
							<li><a href="#tab2">KEPA1150</a></li>--%>
						</ul>
						<c:choose>
							<c:when test="${productKEPA.exposureYn == 'Y' && productKEPA.langKorYn == 'checked'}">
								<c:if test="${fn:length(productKEPA_DTL) == 0}">
									<div id="tab${i.count}">
										<table class="tbl_prd_basic">
											<caption>${data.productName} 특징 표</caption>
											<colgroup>
												<col width="34%" /><col width="33%" /><col width="" />
											</colgroup>
											<thead>
											<tr>
												<th scope="col">Physical properties</th>
												<th scope="col">Value</th>
												<th scope="col">Test method</th>
											</tr>
											</thead>
											<tbody>
											<tr style="height: 300px;">
												<td scope="row"></td>
												<td>제품이 없습니다.</td>
												<td></td>
											</tr>
											</tbody>
										</table>
									</div>
								</c:if>
								<c:forEach var="data" items="${productKEPA_DTL}" varStatus="i">
									<div id="tab${i.count}"  <c:if test="${i.count != 1}"> style="display: none;" </c:if>   >
										<table class="tbl_prd_basic">
											<caption>${data.productName} 특징 표</caption>
											<colgroup>
												<col width="34%" /><col width="33%" /><col width="" />
											</colgroup>
											<thead>
											<tr>
												<th scope="col">Physical properties</th>
												<th scope="col">Value</th>
												<th scope="col">Test method</th>
											</tr>
											</thead>
											<tbody>
											<tr>
												<td scope="row">${data.physicalPropertiesKor1}</td>
												<td>${data.valueKor1}</td>
												<td>${data.testMethodKor1}</td>
											</tr>
											<tr>
												<td scope="row">${data.physicalPropertiesKor2}</td>
												<td>${data.valueKor2}</td>
												<td>${data.testMethodKor2}</td>
											</tr>
											<tr>
												<td scope="row">${data.physicalPropertiesKor3}</td>
												<td>${data.valueKor3}</td>
												<td>${data.testMethodKor3}</td>
											</tr>
											<tr>
												<td scope="row">${data.physicalPropertiesKor4}</td>
												<td>${data.valueKor4}</td>
												<td>${data.testMethodKor4}</td>
											</tr>
											<tr>
												<td scope="row">${data.physicalPropertiesKor5}</td>
												<td>${data.valueKor5}</td>
												<td>${data.testMethodKor5}</td>
											</tr>
											</tbody>
										</table>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div id="tab${i.count}">
									<table class="tbl_prd_basic">
										<caption>${data.productName} 특징 표</caption>
										<colgroup>
											<col width="34%" /><col width="33%" /><col width="" />
										</colgroup>
										<thead>
										<tr>
											<th scope="col">Physical properties</th>
											<th scope="col">Value</th>
											<th scope="col">Test method</th>
										</tr>
										</thead>
										<tbody>
										<tr style="height: 300px;">
											<td scope="row"></td>
											<td>제품이 없습니다.</td>
											<td></td>
										</tr>
										</tbody>
									</table>
								</div>
							</c:otherwise>
						</c:choose>

						<p class="noti al">※ 상기 DATA는 KEPA의 대표 DATA이며 표준 SPEC을 의미하는 것이 아닙니다.</p>

					</div>
				</div>
				<div class="bgWhite pb80">
					<div class="contentWrap">

						<h4 class="stitle">저온특성</h4>
						<p class="pTxt">KEPA 1130은 기존 나일론의 충격강도를 보강하기 위한 제품으로 특히 저온(-40~-50℃)에서의 우수한 특성을 발휘할 수 있도록 비결정질의 이피디엠 고무를 변성하여<br />만들어진 제품입니다.</p>
						<div class="mt50"><img src="/resources/image/user/kor/sub/product/img_kepa_lowtemper.jpg" alt="" /></div>

					</div>
				</div>
				<div class="bgGray pb80">
					<div class="contentWrap">

						<h4 class="stitle">흐름성</h4>
						<p class="pTxt">KEPA 1130은 비결정성의 이피(디)엠 고무로 이루어져 있음에도 불구하고 우수한 흐름성을 발휘함으로서 가공성 및 작업성에 우수한 특성을 나타냅니다.</p>
						<div class="mt50"><img src="/resources/image/user/kor/sub/product/img_kepa_flow.jpg" alt="" /></div>

					</div>
				</div>
				<div class="bgWhite pb80">
					<div class="contentWrap">

						<h4 class="stitle">주요용도</h4>
						<table class="tbl_prd_row">
							<caption>주요용도</caption>
							<colgroup>
								<col width="23%" /><col width="" />
							</colgroup>
							<tbody>
								<tr>
									<th class="al f13 fc333" scope="row">충격보강제</th>
									<td class="al fc666">KEPA는 실온에서뿐만 아니라 특히 저온에서 충격보강제로 사용함으로서 폴리오레핀만 아니라 <br />극성 폴리머인 나이론등에서도 우수한 저온 충격강도를 유지한다.</td>
								</tr>
								<tr>
									<th class="al f13 fc333" scope="row">Coupling Agent</th>
									<td class="al fc666">KEPA는 폴리올레핀 소재의 접착성을 증가시키고 상용성을 향상시킴으로써 COUPLING &amp; AGENT로 작용한다. <br />또한 극성, 비극성 폴리머 및 기타 충진제와의 상용성을 향상시킴으로써 원가를 절감할 수 있으며  기계적 물성, 열적 안정성에 우수한 특성을 발휘한다.</td>
								</tr>
								<tr>
									<th class="al f13 fc333" scope="row">극성물질의 점/ 접착성 증가</th>
									<td class="al fc666">KEPA는 비극성물질인 폴리올레핀과 극성물질인 나일론, 폴리카보네이트, <br />폴리우레탄 등과 상용성 및 접착성을 향상시킴으로써 기계적 물성의 향상효과를 얻을 수 있다.</td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
				<div class="bgGray">
					<div class="contentWrap">

						<h4 class="stitle">저장 및 사용방법</h4>
						<div class="kepaKeep">
							<p class="pTxt">KEPA는 20KG의 흡습 방지용 BAG에 포장되며 작업자의 취급이 용이하게 펠렛형태로 생산되어 <br />추가 공정이 필요 없이 바로 인터널믹서(압축기)에 투입이 가능한 제품입니다.</p>
						</div>

					</div>
				</div>
				<!-- contentWrap (e) -->

			</div>
            <!-- content (e) -->
