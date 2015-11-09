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
					<li class="on"><a href="epdmProcess">제조공정 및 가공방법</a></li>
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
						<h3 class="stitle">제조공정 및 가공방법</h3>
						<p class="txt">EP(D)M의 제조공정 및 가공방법입니다. </p>
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

						<h4 class="stitle">제조공정</h4>
						<ol class="epdmProcess">
							<li class="s1">
								<span>STEP 01</span>
								<strong>원료 제조 공정</strong>
								<p>원료저장 / 촉매조제 / 농도관리</p>
							</li>
							<li class="s2">
								<span>STEP 02</span>
								<strong>중합 반응 공정</strong>
								<p>원료+촉매 반응<br />원료 조성 및 촉매에 따른 <br />제품 특성 결정</p>
							</li>
							<li class="s3">
								<span>STEP 03</span>
								<strong>촉매 제거 공정</strong>
								<p>유화제로 촉매 제거<br />제품 색상 관리 <br />탈촉수 폐수 처리</p>
							</li>
							<li class="s4">
								<span>STEP 04</span>
								<strong>균일화 공정</strong>
								<p>제품 규격 균일화 <br />오일 제품 오일 첨가<br />제품 중 불순물 제거</p>
							</li>
							<li class="s5">
								<span>STEP 05</span>
								<strong>용매모노머 회수 및 정제</strong>
								<p>자동창고 보관 / 고무 출하</p>
							</li>
							<li class="s6">
								<span>STEP 06</span>
								<strong>탈수 및 건조 공정</strong>
								<p>고무 형상화 <br />중량 검사 <br />고무 내 이물 검사</p>
							</li>
							<li class="s7">
								<span>STEP 07</span>
								<strong>성형 및 검사 공정</strong>
								<p>1차 수분 제거 <br />2차 휘발분 제거<br />이송 및 건조</p>
							</li>
							<li class="s8">
								<span>STEP 08</span>
								<strong>보관 / 출하 공정</strong>
								<p>용매 회수 및 정제 <br />미반응 모노머 회수</p>
							</li>
						</ol>

					</div>
				</div>
				<div class="bgGray">
					<div class="contentWrap">

						<h4 class="stitle">가공방법</h4>
						<p class="pTxt">KEP EP(D)M은 내후성과 내화학성이 우수하며, 고충진 컴파운드에서도 우수한 기계적 물성을 유지하고 가공성이 우수합니다.<br />EP(D)M 컴파운드의 가공특성은 Base Polymer의 구조 및 형태 뿐만 아니라 충전제의 함량 및 구조, 가공유의 종류와 함량에 의해서 결정되어집니다. <br />따라서, EP(D)M 컴파운드의 설계에 있어서 최종 고무 부품의 요구물성과 우수한 가공성을 얻기 위해서는 적절한 배합제의 선택이 필수적입니다.</p>
						<ul class="tabBasic mt50">
							<li class="on"><a href="#tab1">컴파운드 특성인자</a></li>
							<li><a href="#tab2">가교방법</a></li>
							<li><a href="#tab3">가공방법</a></li>
						</ul>
						<div id="tab1">
							<p class="pTxt">“최종 고무 부품의 물성 보강 및 증량을 목적으로 사용되는 배합제를 충진제라하며 EP(D)M의 경우 일반 고무산업에 사용되는 모든 종류의 충진제를 사용할 수 있습니다. <br />EP(D)M의 분자량, 에틸렌 함량, DIENE 함량에 따라 다소 차이가 있지만 일반 합성고무에 비해 많은 양의 충진제를 고무 컴파운드에 충진할 수 있습니다.</p>
							<div class="dotBox">
								<p class="pTxtH mt40">POLYMER</p>
								<p class="pTxt">컴파운드의 기본특성을 부여하여, 최종 가류물의 용도에 따라 선택되어집니다. 또한 특수한 경우 EP(D)M은 BLEND를 통하여 가공특성과 물리특성의 조화를 이룰 수 있습니다.</p>
								<p class="pTxtH mt40">CARBON BLACK</p>
								<p class="pTxt">고무 컴파운드 보강성 부여에 가장 광범위하게 적용되고 있습니다. CARBON BLACK의 종류와 함량에 따라 최종 고무 부품의 물리특성(강도와 경도)가 결정되어 집니다. <br />일반적으로 입자경이 작을수록, 구조가 발달할수록 기계적 물성 및 경도는 향상되고, 가공성은 입자경이 클수록 양호합니다. <br />중간정도의 입자경과 HIGH STRUCTURE TYPE의 CARBON BLACK인 FEF, GPF 등은 보강성 및 가공성의 균형을 고루 갖추어 EP(D)M 컴파운드에 광범위하게<br />사용되고 있습니다.</p>
								<p class="pTxtH mt40">CARBON BLACK 특성인자</p>
								<p class="pTxt"><span class="dot">입자경 (Particle Size)과 구조</span><span class="dot ml30">표면활성 : Surface area &amp; Activity</span><span class="dot ml30">Degree of aggregation</span></p>
								<p class="pTxtH mt40">MINERAL FILLER (무기충진제)</p>
								<p class="pTxt">무기충진제의 경우 색물배합(COLOR COMPOUND) 또는 흑색배합의 가공성 향상과 COST DOWN을 위해 주로 사용되며 보강성, 가공성, 경제성 등 배합목적에 따라<br />여러 가지 무기 충진제가 사용될 수 있습니다. 무기충진제의 경우도 CORBON BLACK처럼 입자경, 입자의 형태, 입자의 표면성질 등에 의해 고무 제품의 물성에 영향을 미칩니다. <br />무기충진제로는 탄산칼슘(CALCIUM CARBONATE), CLAY 류, TALC 등이 주로 사용되며, 난연 고무 소재에는 산화알루미늄이 가장 많이 적용됩니다.</p>
								<p class="pTxtH mt40">PLASTICIZER (PROCESS OIL, 연화제)</p>
								<p class="pTxt">EP(D)M은 PARAFFINIC 및 NAPHTHENIC과 같은 모든 석유계 OIL과 상용성이 높습니다. PROCESS OIL의 선택에 있어서 가장 중요한 것은 OIL의 점도입니다. <br />일반적으로 높은 점도의 OIL은 높은 기계적 물성과 내열성, 낮은 수축률을 나타내며 낮은 점도의 OIL은 저온특성과 탄성이 우수합니다. <br />EP(D)M 컴파운드에서는 AROMATIC 함량이 높은 HYDROCARBON OIL은 가교 효율에 부정적 영향을 미치며, 특히 과산화물 가교(PEROXIDE CURE)에서는 반드시<br />피해야 합니다.</p>
							</div>
						</div>
						<div id="tab2" style="display:none">
							<p class="pTxtH">EP(D)M의 가교방법</p>
							<p class="pTxt">가교반응은 2개의 고분자 사슬을 1개 또는 여러 개의 1차 결합을 형성하는 반응이며 고무 컴파운드에 황 또는 가황제를 첨가하여 가열 또는 기타 적절한 처리에 의해 고무 분자<br />사슬간의 결합을 형성시켜 탄성 및 인장강도를 증가시키고 용매에 대한 화학적 팽윤도를 감소시키는 화학적 변화를 가황(VULCANIZATION), 또는<br />가교(CROSSLINK, CURE)라고 말합니다.<br />고분자 사슬이 가교 결합을 이루면 아래와 같은 3차원 망상 구조 형태를 띄게 됩니다.</p>
							<div class="mt60"><img src="/resources/image/user/kor/sub/product/img_epdm_crosslink.gif" alt="" /></div>
							<p class="pTxtH mt60">CARBON BLACK 특성인자</p>
							<p class="pTxt">- 유황가황(SULFUR VULCANIZATION) : 가장 광범위하게 적용되는 EP(D)M 합성고무의 가교 방법<br />- 과산화물 가교(PEROXIDE CURE) : 우수한 내열성 및 영구압축줄음률 특성을 요구하는 분야에 적합<br />- RESIN 가교 : POLYHALOMETHYLENE RESIN을 적용하여 고내열성을 요구하는 특수 분야에 적용</p>
						</div>
						<div id="tab3" style="display:none">
							<p class="pTxtH">EP(D)M의 가공방법</p>
							<p class="pTxt">EP(D)M의 가공특성은 기본적으로 아래의 인자에 의해 결정되어지며, 컴파운드 설계 시 반드시 고려하여야 할 중요한 특성인자 입니다.</p>
							<p class="pTxtH mt40">POLYMER 구조 및 형태</p>
							<p class="pTxt">- 분자량 (MOLECULAR WEIGHT)<br />- 분자량분포 (MOLECULAR WEIGHT DISTRIBUTION)<br />- ETHYLENE / PROPYLENE 조성 분포<br />- ENB 함량<br />- 제품의 물리적 형태 : DENSE BALE, FRIABLE BALE, PELLET, CRUMB </p>
							<p class="pTxtH mt40">CARBON BLAK 종류 및 함량</p>
							<p class="pTxtH">가공유 (PROCESS OIL) 종류 및 함량</p>
							<ul class="tabBasicSub mt50">
								<li class="on"><a href="#aTab1">EP(D)M MIXING</a></li>
								<li><a href="#aTab2">EXTRUSION</a></li>
								<li><a href="#aTab3">MOLDING</a></li>
								<li><a href="#aTab4">카렌다 가공</a></li>
							</ul>
							<div id="aTab1">
								<div class="mixing">
									<div class="img"><img src="/resources/image/user/kor/sub/product/img_epdm_mixing.jpg" alt="일반적인 INTERNAL MIER" /><span>일반적인 INTERNAL MIER</span></div>
									<p class="pTxtH">EP(D)M의 가교방법</p>
									<p class="pTxt">EP(D)M의 가공특성은 기본적으로 아래의 인자에 의해 결정되어지며, 컴파운드 설계 시 반드시 고려하여야 할 중요한 특성인자 입니다.</p>
									<p class="pTxtH mt40">INTERNAL MIXING</p>
									<p class="pTxt">INTERNAL MIXING은 고무 컴파운드의 가장 균일한 분산 상태를 얻을 수 있기 때문에 가장 많이 이용되는 고무 혼련 방법입니다.</p>
								</div>
								<p class="pTxtH mt40">대표적인 internal mixng 방법</p>
								<p class="mt15"><img src="/resources/image/user/kor/sub/product/img_epdm_mixing2.gif" alt="1.CONVENTIONAL 방법 / 2.UP-SIDE-DOWN 방법 / 3.분할투입 방법 / 4.ONE PASS MIXING / 5.저경도 MIXING 방법" /></p>
								<p class="pTxtH mt40">MILL MIXING</p>
								<p class="pTxt">EP(D)M GRADE 가운데 저점도, 중간무늬점도, OIL EXTEND 제품은 OPEN ROLL MILL MIXING을 이용한 컴파운드가 가능하며,<br />MILL MIXING에 적용되는 대표적인 제품은 다음과 같습니다. <br />- KEP210, KEP7141, KEP240, KEP330, KEP960(F) - KEP2320</p>
							</div>
							<div id="aTab2" style="display:none">
								<div class="extrusion">
									<div class="img"><img src="/resources/image/user/kor/sub/product/img_epdm_extrusion.jpg" alt="" /></div>
									<p class="pTxtH">EXTRUSION</p>
									<p class="pTxt">고무의 압출가공은 타이어 튜브 성형을 처음으로하여 자동차용 내/외장재, 건축용 자재, 호스, 전선 등에 광범위하게 <br />사용 되어지고 있으며, 특히 EP(D)M 압출물은 우수한 외관과 형상유지성이 가장 중요한 특성인자 입니다.</p>
								</div>
								<table class="tbl_prd_basic">
									<caption>EXTRUSION 표</caption>
									<colgroup>
										<col width="25%" /><col width="25%" /><col width="25%" /><col width="25%" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">&nbsp;</th>
											<th scope="col">MOONEY 접도 증가</th>
											<th scope="col">ETHYLENE 함량 증가</th>
											<th scope="col">MWD 넓어짐</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td scope="row">압출성</td>
											<td><img alt="감소 또는 불량" src="/resources/image/user/kor/sub/product/ico_decrease.png" /></td>
											<td><img alt="감소 또는 불량" src="/resources/image/user/kor/sub/product/ico_increase.png" /></td>
											<td><img alt="감소 또는 불량" src="/resources/image/user/kor/sub/product/ico_increase.png" /></td>
										</tr>
										<tr>
											<td scope="row">FEED</td>
											<td><img alt="감소 또는 불량" src="/resources/image/user/kor/sub/product/ico_decrease.png" /></td>
											<td><img alt="증가 또는 양호" src="/resources/image/user/kor/sub/product/ico_increase.png" /></td>
											<td><img alt="증가 또는 양호" src="/resources/image/user/kor/sub/product/ico_increase.png" /></td>
										</tr>
										<tr>
											<td scope="row">압출속도</td>
											<td><img alt="감소 또는 불량" src="/resources/image/user/kor/sub/product/ico_decrease.png" /></td>
											<td><img alt="증가 또는 양호" src="/resources/image/user/kor/sub/product/ico_increase.png" /></td>
											<td><img alt="증가 또는 양호" src="/resources/image/user/kor/sub/product/ico_increase.png" /></td>
										</tr>
										<tr>
											<td scope="row">압출표면</td>
											<td><img alt="감소 또는 불량" src="/resources/image/user/kor/sub/product/ico_decrease.png" /></td>
											<td><img alt="증가 또는 양호" src="/resources/image/user/kor/sub/product/ico_increase.png" /></td>
											<td><img alt="증가 또는 양호" src="/resources/image/user/kor/sub/product/ico_increase.png" /></td>
										</tr>
										<tr>
											<td scope="row">DIE SWELL</td>
											<td><img alt="감소 또는 불량" src="/resources/image/user/kor/sub/product/ico_decrease.png" /></td>
											<td><img alt="감소 또는 불량" src="/resources/image/user/kor/sub/product/ico_decrease.png" /></td>
											<td><img alt="증가 또는 양호" src="/resources/image/user/kor/sub/product/ico_increase.png" /></td>
										</tr>
										<tr>
											<td scope="row">GREEN 강도</td>
											<td><img alt="증가 또는 양호" src="/resources/image/user/kor/sub/product/ico_increase.png" /></td>
											<td><img alt="증가 또는 양호" src="/resources/image/user/kor/sub/product/ico_increase.png" /></td>
											<td><img alt="증가 또는 양호" src="/resources/image/user/kor/sub/product/ico_increase.png" /></td>
										</tr>
										<tr>
											<td scope="row">형상유지성</td>
											<td><img alt="증가 또는 양호" src="/resources/image/user/kor/sub/product/ico_increase.png" /></td>
											<td><img alt="감소 또는 불량" src="/resources/image/user/kor/sub/product/ico_decrease.png" /></td>
											<td><img alt="영향이 적음" src="/resources/image/user/kor/sub/product/ico_x.png" /></td>
										</tr>
									</tbody>
								</table>
								<dl class="extrusionBtm">
									<dt><img alt="증가 또는 양호" src="/resources/image/user/kor/sub/product/ico_increase.png" /></dt>
									<dd>증가 또는 양호</dd>
									<dt><img alt="감소 또는 불량" src="/resources/image/user/kor/sub/product/ico_decrease.png" /></dt>
									<dd>감소 또는 불량</dd>
									<dt><img alt="영향이 적음" src="/resources/image/user/kor/sub/product/ico_x.png" /></dt>
									<dd>영향이 적음</dd>
								</dl>
							</div>
							<div id="aTab3" style="display:none">
								<p class="pTxtH">MOLDING</p>
								<p class="pTxt">EP(D)M은 가공방법으로 MOLDING을 이용하여 다양한 형태의 고무 부품을 제조할 수 있습니다.</p>
								<p class="pTxtH mt40">일반적인 MOLDING 방법</p>
								<p class="pTxt">- COMPRESSION MOLDING<br />- INJECTION MOLDING<br />- TRANSFER MOLDING</p>
								<div class="dotBox">
									<p class="pTxt mt40">각각의 MOLDING 가공방법에 따라 다른 컴파운드 특성을 요구하며 모든 KEP EP(D)M 제품을 MOLDING 가공에 적용할 수 있습니다. <br />특히, 저 MOONEY 점도의 제품은 고온에서 컴파운드 흐름성이 우수하여 복잡한 형태의 TRANSFER 또는 INJECTION MOLD에 적합합니다.<br />또한 EP(D)M을 적용한 각종 PROTECTOR SPONGE 또한 MOLDING 가공으로 제조가 가능합니다. <br />다양한 형태의 고무 부품 특성과 가공 조건에 따라 가장 적합한 EP(D)M GRADE의 선정이 중요합니다.</p>
									<div class="mt30"><img src="/resources/image/user/kor/sub/product/img_epdm_molding.jpg" alt="" /></div>
								</div>
							</div>
							<div id="aTab4" style="display:none">
								<p class="pTxtH">카렌다 가공 (CALENDERING)</p>
								<p class="pTxt">EP(D)M 컴파운드의 카렌다 가공 시 가장 중요한 점은 신축(치수안정성, LOW Shrinkage)과 표면 평활성의 유지입니다. <br />EP(D)M 카렌다 가공에 일반적으로 사용되는 충진제는 HIGH STRUCTURER 또는 그와 유사한 수준의 충진제와 고점도의 가공유(PROJECT OIL)을 사용하며, <br />CARBON BLACK은 50~80 phr(PART PER HUNDRED RUBBER), 무기충진제는 75~110 phr 적합합니다.<br />가공유는 일반적으로 충진제의 종류나 요구물성에 따라 다르지만 40~100 phr 정도 사용하는 것이 적당합니다.<br />KEP EP(D)M 제품은 2~4개의 ROLL CALENDER를 사용하며, 일반적인 온도조건은 FORMING ROLL의 경우 80~110℃, RELEASE ROLL의 경우 90~120℃<br />정도에서 사용합니다. <br />온도가 높은 120℃정도에서 카렌다 가공 시 수축이 거의 없게 되고 매끈한 SHEET 작업을 할 수 있습니다. EP(D)M 가공에 필요한 각 ROLL의 온도조건은 다음과 같습니다.</p>
								<p class="pTxtH mt40">ROLL의 온도조건</p>
								<p class="pTxt">- 상롤 93~104℃<br />- 중롤 88~93℃<br />- 하롤 93~120℃</p>
							</div>
						</div>

					</div>
				</div>
				<!-- contentWrap (e) -->

			</div>
            <!-- content (e) -->
