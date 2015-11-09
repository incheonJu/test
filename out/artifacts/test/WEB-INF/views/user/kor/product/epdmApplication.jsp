<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

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
					<li><a href="epdm?seq=1">제품개요</a></li>
					<li><a href="epdmProperty">제품특성</a></li>
					<li><a href="epdmCompound">컴파운드 특성</a></li>
					<li><a href="epdmProcess">제조공정 및 가공방법</a></li>
					<li class="on"><a href="epdmApplication">등록분야</a></li>
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
						<h3 class="stitle">등록분야</h3>
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

						<h4 class="stitle">KEP EP(D)M의 응용</h4>
						<p class="pTxtB">Typical Characteristics and Main applications of KP EP(D)M</p>
						<div class="mt40 relative">
							<img src="/resources/image/user/kor/sub/product/img_epdm_application.gif" alt="" />
							<a class="graphImgDown" href="/resources/download/user/kor/images/EPDM_APPLICATION_TABLE.gif" target="_blank"><img src="/resources/image/user/kor/sub/product/btn_graph_more.png" alt="Download" /></a>
						</div>

					</div>
				</div>
				<div class="bgGray">
					<div class="contentWrap">

						<h4 class="stitle">부품용도별 요구특성 및 제품선택</h4>
						<ul class="tabBasic li9 line2">
							<li class="on"><a href="#tab1">WEATHER<br />STRIP SPONGE</a></li>
							<li><a href="#tab2">WEATHER<br />STRIP SOLID</a></li>
							<li><a href="#tab3" class="line1">TIRE &amp; TUBE</a></li>
							<li><a href="#tab4">RADIATOR<br />HOUSE</a></li>
							<li><a href="#tab5">WIRE &amp;<br />CABLE</a></li>
							<li><a href="#tab6" class="line1">MOLD PART</a></li>
							<li><a href="#tab7" class="line1">BRAKE PART</a></li>
							<li><a href="#tab8" class="line1">방진고무</a></li>
							<li><a href="#tab9">ROOFING<br />SHEET</a></li>
						</ul>
						<div id="tab1">
							<div class="halfWr">
								<div class="left">
									<table class="tbl_prd_basic">
										<caption>요구특성</caption>
										<thead>
											<tr>
												<th scope="col">요구특성</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>SOFTNESS, LOW LOAD DEFLECTION(DOOR 개폐 용이)</td>
											</tr>
											<tr>
												<td> 외부 소음 차단</td>
											</tr>
											<tr>
												<td>GOOD COMPRESSION SET - 형상유지성</td>
											</tr>
											<tr>
												<td> SMOOTH SPONGE SKIN - 양호한 외관</td>
											</tr>
											<tr>
												<td>낮은 흡수율(吸收率)</td>
											</tr>
											<tr>
												<td>내한성</td>
											</tr>
											<tr>
												<td>내마모성</td>
											</tr>
											<tr>
												<td>자체 장착 용이성</td>
											</tr>
											<tr>
												<td>비오염성 (차체 PAINT에 대한 비오염성)</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="right">
									<table class="tbl_prd_basic">
										<caption>POLYMER 선택기준</caption>
										<thead>
											<tr>
												<th scope="col">POLYMER 선택기준</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td> HIGH MOONEY VISCOSITY : 고충진, 형상유지성</td>
											</tr>
											<tr>
												<td>HIGH PROPYLENE CONTENT : 우수한 내한성</td>
											</tr>
											<tr>
												<td>HIGH DIENE CONTENT : 연속가황시 빠른 가황속도</td>
											</tr>
											<tr>
												<td>LOW COMPOUND MOONEY VISCOSITY : 우수한 압출특성</td>
											</tr>
											<tr>
												<td>BROAD to TAILORED 분자량분포 : 우수한 가공성 및 압출 형상 유지</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<p class="pTxtH mt40">추천제품</p>
							<p class="pTxt"><span class="dot mr20">KEP650(L), KEP350, KEP370F</span><span class="dot mr20">KEP960 / KEP350 BLEND</span><span class="dot mr20">KEP350 / KEP210 BLEND</span><span class="dot mr20">KEP990 / KEP2480</span></p>
						</div>
						<div id="tab2" style="display:none">
							<div class="halfWr">
								<div class="left">
									<table class="tbl_prd_basic">
										<caption>요구특성</caption>
										<thead>
											<tr>
												<th scope="col">요구특성</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>내후성, 내오존성, 내열성</td>
											</tr>
											<tr>
												<td>내수성</td>
											</tr>
											<tr>
												<td>양호한 기계적 물성 및 형상 유지성</td>
											</tr>
											<tr>
												<td>우수한 압출특성 (생산성)</td>
											</tr>
											<tr>
												<td>고충진 (COST COWN)</td>
											</tr>
											<tr>
												<td>비오염성 (차체 PAINT에 대한 비오염성)</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="right">
									<table class="tbl_prd_basic">
										<caption>POLYMER 선택기준</caption>
										<thead>
											<tr>
												<th scope="col">POLYMER 선택기준</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>HIGH MOONEY VISCOSITY : 고충진, LOW COST, 고층진시 우수한 물성 형상유지성</td>
											</tr>
											<tr>
												<td>MEDIUM to HIGH DIENE Content : 빠른 가류속도</td>
											</tr>
											<tr>
												<td>HIGH GREEN STRENGTH</td>
											</tr>
											<tr>
												<td>BROAD to TAILORED 분자량분포 : 우수한 가공성 및 압출 형상 유지</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<p class="pTxtH mt40">추천제품</p>
							<p class="pTxt"><span class="dot mr20">KEP2371, KEP281F, KEP1030F, KEP570F, KEP240</span><br /><span class="dot mr20">KEP350 / KEP210 BLEND, KEP960 / KEP270 BLEND, KEP570F / KEP270 BLEND, KEP570F/ KEP240 BLEND</span></p>
						</div>
						<div id="tab3" style="display:none">
							<div class="halfWr">
								<div class="left">
									<table class="tbl_prd_basic">
										<caption>요구특성</caption>
										<thead>
											<tr>
												<th scope="col">요구특성</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>내열성</td>
											</tr>
											<tr>
												<td>내피로특성</td>
											</tr>
											<tr>
												<td>내한성</td>
											</tr>
											<tr>
												<td>내공기투과성</td>
											</tr>
											<tr>
												<td>내오존성</td>
											</tr>
											<tr>
												<td>스코치 안전성</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="right">
									<table class="tbl_prd_basic">
										<caption>POLYMER 선택기준</caption>
										<thead>
											<tr>
												<th scope="col">POLYMER 선택기준</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>LOW DIENE CONTENT : IIR과의 BLEND 가황시 공가류특성 및 스코치 안정성</td>
											</tr>
											<tr>
												<td>양호한 가공성 및 분산 특성</td>
											</tr>
											<tr>
												<td>LOW MOONEY VISCOSITY : IIR과의 BLEND 시 우수한 점착특성 부여</td>
											</tr>
											<tr>
												<td>HIGH PROPYLENE CONTENT : 우수한 저온특성</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<p class="pTxtH mt40">추천제품</p>
							<p class="pTxt"><span class="dot mr20">KKEP435</span></p>
						</div>
						<div id="tab4" style="display:none">
							<div class="halfWr">
								<div class="left">
									<table class="tbl_prd_basic">
										<caption>요구특성</caption>
										<thead>
											<tr>
												<th scope="col">요구특성</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>내열성, 내구성</td>
											</tr>
											<tr>
												<td>내피로특성</td>
											</tr>
											<tr>
												<td>내압성</td>
											</tr>
											<tr>
												<td>내한성</td>
											</tr>
											<tr>
												<td>고충진</td>
											</tr>
											<tr>
												<td>양호한 가공성</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="right">
									<table class="tbl_prd_basic">
										<caption>POLYMER 선택기준</caption>
										<thead>
											<tr>
												<th scope="col">POLYMER 선택기준</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>HIGH MOONEY VISCOSITY : 고충진시 우수한 물성, 내피로특성, 형상유지성</td>
											</tr>
											<tr>
												<td>HIGH GREEN STRENGTH</td>
											</tr>
											<tr>
												<td>MIDIUM to HIGH PROPYLENE CONTENT : 우수한 내한성</td>
											</tr>
											<tr>
												<td>MEDIUM DIENE CONTENT : 내열성 및 가교속도 균형</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<p class="pTxtH mt40">추천제품</p>
							<p class="pTxt"><span class="dot mr20">KEP1030F,  KEP960 / KEP270 BLEND,  KEP570F / KEP270 BLEND</span><span class="dot mr20">KEP2380</span></p>
						</div>
						<div id="tab5" style="display:none">
							<div class="halfWr">
								<div class="left">
									<table class="tbl_prd_basic">
										<caption>요구특성</caption>
										<thead>
											<tr>
												<th scope="col">요구특성</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>전기절연특성</td>
											</tr>
											<tr>
												<td>양호한 유연성</td>
											</tr>
											<tr>
												<td>내오존성 및 내 CORONA성</td>
											</tr>
											<tr>
												<td>우수한 압출성 </td>
											</tr>
											<tr>
												<td>내열성 및 내한성</td>
											</tr>
											<tr>
												<td>낮은 영구압축줄음율(LOW DEFORMATION)</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="right">
									<table class="tbl_prd_basic">
										<caption>POLYMER 선택기준</caption>
										<thead>
											<tr>
												<th scope="col">POLYMER 선택기준</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>LOW MOONEY VISCOSITY : 우수한 가공성 및 압출특성 </td>
											</tr>
											<tr>
												<td>BROAD한 분자량 분포 : 우수한 가공성 유지</td>
											</tr>
											<tr>
												<td>HIGH ETHYLENE CONTENT : 우수한 압출성, PEROXIDE 가교효율향상</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<p class="pTxtH mt40">추천제품</p>
							<p class="pTxt"><span class="dot mr20">KEP210, KEP510</span><span class="dot mr20">KEP210, KEP510</span><span class="dot mr20">KEP570F </span></p>
						</div>
						<div id="tab6" style="display:none">
							<div class="halfWr">
								<div class="left">
									<table class="tbl_prd_basic">
										<caption>요구특성</caption>
										<thead>
											<tr>
												<th scope="col">요구특성</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>우수한 컴파운드 흐름성</td>
											</tr>
											<tr>
												<td>NO MOLD STAINING &amp; NO STICKING</td>
											</tr>
											<tr>
												<td>스코치 안정성</td>
											</tr>
											<tr>
												<td>우수한 고온 인열강도</td>
											</tr>
											<tr>
												<td>빠른 가교 속도</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="right">
									<table class="tbl_prd_basic">
										<caption>POLYMER 선택기준</caption>
										<thead>
											<tr>
												<th scope="col">POLYMER 선택기준</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>LOW MOONEY VISCOSITY : 우수한 컴파운드 흐름성</td>
											</tr>
											<tr>
												<td>MIDIUM MOONEY VISCOSITY : 고충진, 저경도 고무 부품</td>
											</tr>
											<tr>
												<td>MIDIUM DIENE CONTENT : 스코치 안정성과 가교 속도의 균형 확보</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<p class="pTxtH mt40">추천제품</p>
							<p class="pTxt"><span class="dot mr20">KEP210,  KEP220,  KEP2380,  KEP240,  KEP270,  KEP330,  KEP350,  KEP510,  KEP570F,  KEP650(L),  KEP7141,  KEP901,  KEP960,  KEP960,  KEP980,  KEP1030F</span></p>
						</div>
						<div id="tab7" style="display:none">
							<div class="halfWr">
								<div class="left">
									<table class="tbl_prd_basic">
										<caption>요구특성</caption>
										<thead>
											<tr>
												<th scope="col">요구특성</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>BRAKE FLUID RESISTANCE</td>
											</tr>
											<tr>
												<td>NO NEGATIVE VOLUME CHANGE</td>
											</tr>
											<tr>
												<td>우수한 내열성</td>
											</tr>
											<tr>
												<td>PEROXIDE 가교 적용</td>
											</tr>
											<tr>
												<td>치수안정성</td>
											</tr>
											<tr>
												<td>금속과의 접착성</td>
											</tr>
											<tr>
												<td>압축 및 응력완화 특성</td>
											</tr>
											<tr>
												<td>우수한 영구압축줄음율</td>
											</tr>
											<tr>
												<td>PEROXIDE 가교 및 OIL FREE COMPOUND 적용</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="right">
									<table class="tbl_prd_basic">
										<caption>POLYMER 선택기준</caption>
										<thead>
											<tr>
												<th scope="col">POLYMER 선택기준</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>LOW MOONEY VISCOSITY &amp; BROAD 분자량 분포 : 우수한 ROLL가공성 확보</td>
											</tr>
											<tr>
												<td>내 BRAKE 액성 (LOW NEGATIVE VOLUME CHANGE)의 향상과<br />무가소재 컴파운드 및 우수한 내열특성을 위해 POLYMER RICH COMPOUND 를<br />실시해야 하므로 ROLL 가공성이 우수한 POLYMER가 필수적</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<p class="pTxtH mt40">추천제품</p>
							<p class="pTxt"><span class="dot mr20">KEP7141, KEP210, KEP510</span></p>
						</div>
						<div id="tab8" style="display:none">
							<div class="halfWr">
								<div class="left">
									<table class="tbl_prd_basic">
										<caption>요구특성</caption>
										<thead>
											<tr>
												<th scope="col">요구특성</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>우수한 영구압축줄음율 및 내 CREEP 특성</td>
											</tr>
											<tr>
												<td>우수한 내열성</td>
											</tr>
											<tr>
												<td>내피로특성</td>
											</tr>
											<tr>
												<td>금속과의 접착성</td>
											</tr>
											<tr>
												<td>우수한 기계적 강도 및 반발탄성</td>
											</tr>
											<tr>
												<td>내구성 및 가공성</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="right">
									<table class="tbl_prd_basic">
										<caption>POLYMER 선택기준</caption>
										<thead>
											<tr>
												<th scope="col">POLYMER 선택기준</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>ULTRA HIGH MOONEY VISCOSITY</td>
											</tr>
											<tr>
												<td>고충진 컴파운드에서 우수한 기계적 물성 및 반발탄성과 내피로특성 유지를 위해서<br />매우 높은 MOONEY 점도의 제품 선택이 기본</td>
											</tr>
											<tr>
												<td>- MIDIUM DIENE CONTENT : 내열성 및 가교속도 균형</td>
											</tr>
											<tr>
												<td>- NARROW to MEDIUM 분자량분포</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<p class="pTxtH mt40">추천제품</p>
							<p class="pTxt"><span class="dot mr20">KEP960, KEP680, KEP901</span></p>
						</div>
						<div id="tab9" style="display:none">
							<div class="halfWr">
								<div class="left">
									<table class="tbl_prd_basic">
										<caption>요구특성</caption>
										<thead>
											<tr>
												<th scope="col">요구특성</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>내후성, 내오존성, 내열성</td>
											</tr>
											<tr>
												<td>내열성 및 내수성</td>
											</tr>
											<tr>
												<td>양호한 기계적 물성</td>
											</tr>
											<tr>
												<td>우수한 압출특성 (생산성)</td>
											</tr>
											<tr>
												<td>고충진</td>
											</tr>
											<tr>
												<td>CALENDER 가공성</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="right">
									<table class="tbl_prd_basic">
										<caption>POLYMER 선택기준</caption>
										<thead>
											<tr>
												<th scope="col">POLYMER 선택기준</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>EPDM과 IIR BLEND(*IIR : ISOBUTYLENE - ISOPRENE RUBBER)<br />IIR과의 공가류특성을 고려하여 낮은 DIENE 함량 GRADE 선택<br />LOW MOONEY VISCOSITY : IIR BLEND 시 점착성 확보</td>
											</tr>
											<tr>
												<td>EPDM 단독<br />고충진시 양호한 기계적 물성을 나타내는 <br />HIGH MOONEY VISCOSITYM, HIGH ETHYLENE 함량의 GRADE선택</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<p class="pTxtH mt40">추천제품</p>
							<p class="pTxt"><span class="dot mr20"> EPDM/IIR BLEND : KEP435</span><span class="dot mr20">EPDM : KEP570F, KEP1030F / KEP210 BLEND</span></p>
						</div>

					</div>
				</div>
				<!-- contentWrap (e) -->

			</div>
            <!-- content (e) -->
