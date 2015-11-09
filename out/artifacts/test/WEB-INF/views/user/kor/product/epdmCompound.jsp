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
					<li class="on"><a href="epdmCompound">컴파운드 특성</a></li>
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
						<h3 class="stitle">컴파운드 특성</h3>
						<p class="txt">EP(D)M 컴파운드는 최종 고무 부품이 요구하는 성능에 부합하는<br />적절한 EP(D)M Base Polymer의 선택과 배합제를 적용하여<br />최적의 성능을 발휘 할 수 있습니다.</p>
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

						<h4 class="stitle">컴파운드 특성</h4>
						<table class="tbl_prd_basic">
							<caption>컴파운드 특성 표</caption>
							<colgroup>
								<col width="25%" /><col width="25%" /><col width="25%" /><col width="25%" />
							</colgroup>
							<thead>
								<tr>
									<th>우수한 내오존성</th>
									<th>우수한 전기적 특성</th>
									<th>우수한 내후성</th>
									<th>우수한 저온특성</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>우수한 내열성</td>
									<td>극성 물질에 대한 우수한 내화확성</td>
									<td>광범위한 물성 범위</td>
									<td>수분, 스팀에 대한 우수한 저항성</td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
				<div class="bgGray">
					<div class="contentWrap">

						<h4 class="stitle">컴파운드 상세정보</h4>
						<ul class="tabBasic wide">
							<li class="on"><a href="#aTab1">일반특징</a></li>
							<li><a href="#aTab2">내약품성</a></li>
							<li><a href="#aTab3">각종 Polymer특성비교</a></li>
						</ul>
						<div id="aTab1">
							<table class="tbl_prd_basic">
								<caption>컴파운드 일반특징 표</caption>
								<colgroup>
									<col width="25%" /><col width="64%" /><col />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" rowspan="5" class="al f15 pl30">Mechanical Properties</th>
										<td class="al pl30">Hardness, Shore A</td>
										<td class="al">35 to 90</td>
									</tr>
									<tr>
										<td class="al pl30">Tensile Strength, MPa</td>
										<td class="al">4 to 22</td>
									</tr>
									<tr>
										<td class="al pl30">Elongation, %</td>
										<td class="al">150 to 800</td>
									</tr>
									<tr>
										<td class="al pl30">Tear Strength, kN/m</td>
										<td class="al">15 to 50</td>
									</tr>
									<tr>
										<td class="al pl30">Compression Set, 70 hr at 150℃, %</td>
										<td class="al">15 to 100</td>
									</tr>
									<tr>
										<th scope="row" rowspan="4" class="al f15 pl30">Electrical Properties</th>
										<td class="al pl30">Dielectnic Constant</td>
										<td class="al">2.8</td>
									</tr>
									<tr>
										<td class="al pl30">Power Factor, %</td>
										<td class="al">0.25</td>
									</tr>
									<tr>
										<td class="al pl30">Dielectric Strength, kV/mm</td>
										<td class="al">26</td>
									</tr>
									<tr>
										<td class="al pl30">Volume Resistivity, ohm</td>
										<td class="al">1 X 10 16</td>
									</tr>
									<tr>
										<th scope="row" rowspan="5" class="al f15 pl30">Thermal Properties</th>
										<td class="al pl30">Brittleness Point ,℃</td>
										<td class="al">-55 to -66</td>
									</tr>
									<tr>
										<td class="al pl30">Minimum for Continuous Service, ℃</td>
										<td class="al">-50</td>
									</tr>
									<tr>
										<td class="al pl30">Maximum for Continuous Service, ℃</td>
										<td class="al">150</td>
									</tr>
									<tr>
										<td class="al pl30">Maximum for intermittent Service, ℃</td>
										<td class="al">175</td>
									</tr>
									<tr>
										<td class="al pl30">Maximum Theoretical Temperature to Break Hydrocarbon Bonds, ℃</td>
										<td class="al">204</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div id="aTab2" style="display:none">
							<div class="halfWr">
								<div class="left">
									<table class="tbl_prd_row">
										<caption>내약품성 표</caption>
										<colgroup>
											<col width="68%" /><col width="" />
										</colgroup>
										<tbody>
											<tr>
												<th class="al" scope="row"><span class="dot fcGrayB2">Chemical</span></th>
												<td class="al">Excellent</td>
											</tr>
											<tr>
												<th class="al" scope="row"><span class="dot fcGrayB2">Weather</span></th>
												<td class="al">Excellent</td>
											</tr>
											<tr>
												<th class="al" scope="row"><span class="dot fcGrayB2">Ozone</span></th>
												<td class="al">Excellent</td>
											</tr>
											<tr>
												<th class="al" scope="row"><span class="dot fcGrayB2">Radiation</span></th>
												<td class="al">Excellent</td>
											</tr>
											<tr>
												<th class="al" scope="row"><span class="dot fcGrayB2">Water</span></th>
												<td class="al">Excellent</td>
											</tr>
											<tr>
												<th class="al" scope="row"><span class="dot fcGrayB2">Acids and Alkalis</span></th>
												<td class="al">Excellent to good</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="right">
									<table class="tbl_prd_row">
										<caption>내약품성 표</caption>
										<colgroup>
											<col width="78%" /><col width="" />
										</colgroup>
										<tbody>
											<tr>
												<th class="al" scope="row"><span class="dot fcGrayB2">Aliphatic Hydrocarbons</span></th>
												<td class="al">Fair to Poor</td>
											</tr>
											<tr>
												<th class="al" scope="row"><span class="dot fcGrayB2">ASTM Oils</span></th>
												<td class="al">Fair to Poor</td>
											</tr>
											<tr>
												<th class="al" scope="row"><span class="dot fcGrayB2">Oxygenated Solvents</span></th>
												<td class="al">Good</td>
											</tr>
											<tr>
												<th class="al" scope="row"><span class="dot fcGrayB2">Animal and Vegetable Oils</span></th>
												<td class="al">fair</td>
											</tr>
											<tr>
												<th class="al" scope="row"><span class="dot fcGrayB2">Brake Fluid (non-petroleum)</span></th>
												<td class="al">Excellent</td>
											</tr>
											<tr>
												<th class="al" scope="row"><span class="dot fcGrayB2">Glycol-Water</span></th>
												<td class="al">Excellent</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div id="aTab3" style="display:none">
							<table class="tbl_prd_basic">
								<caption>각종 Polymer 특성 비교 표</caption>
								<colgroup>
									<col width="30%" /><col width="" /><col width="" /><col width="" /><col width="" /><col />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">Rubber type</th>
										<th scope="col">EP(D)M</th>
										<th scope="col">Naturar</th>
										<th scope="col">SBR</th>
										<th scope="col">IIR</th>
										<th scope="col">CR</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">Specific Gravity</th>
										<td>0.86</td>
										<td>0.92</td>
										<td>0.94</td>
										<td>0.92</td>
										<td>1.23</td>
									</tr>
									<tr>
										<th scope="row">Tensile Strength MPa</th>
										<td>22</td>
										<td>28</td>
										<td>24</td>
										<td>21</td>
										<td>28</td>
									</tr>
									<tr>
										<th scope="row">Elongation, %</th>
										<td>500</td>
										<td>700</td>
										<td>500</td>
										<td>700</td>
										<td>500</td>
									</tr>
									<tr>
										<th scope="row">Top Operation Temperature, ℃</th>
										<td>150-175</td>
										<td>75 to 120</td>
										<td>75 to 120</td>
										<td>135 to 185</td>
										<td>90 to 150</td>
									</tr>
									<tr>
										<th scope="row">Brittleness Point, ℃</th>
										<td>-5 to -65</td>
										<td>-55</td>
										<td>60</td>
										<td>-60</td>
										<td>-45</td>
									</tr>
									<tr>
										<th scope="row">Compression Set, 22 hr at 100℃, %</th>
										<td>10 to 30</td>
										<td>10 to 15</td>
										<td>15 to 30</td>
										<td>15 to 30</td>
										<td>15 to 30</td>
									</tr>
									<tr>
										<th scope="row">Resilience</th>
										<td>75</td>
										<td>80</td>
										<td>65</td>
										<td>30</td>
										<td>75</td>
									</tr>
									<tr>
										<th scope="row">Tear Strength, kN/m</th>
										<td>15 to 50</td>
										<td>35 to 45</td>
										<td>12 to 35</td>
										<td>25 to 35</td>
										<td>35 to 45</td>
									</tr>
									<tr>
										<th scope="row">Dielectric Constant</th>
										<td>2.8</td>
										<td>29</td>
										<td>29</td>
										<td>28</td>
										<td>6.7</td>
									</tr>
									<tr>
										<th scope="row">Volume Resistivity, ohm-cm</th>
										<td>10^16</td>
										<td>10^15</td>
										<td>10^15</td>
										<td>10^15</td>
										<td>10^12</td>
									</tr>
									<tr>
										<th scope="row">Dielectric Strength, kV/mm</th>
										<td>22 to 55</td>
										<td>16 to 24</td>
										<td>24 to 32</td>
										<td>24 to 36</td>
										<td>16 to 24</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
				</div>
				<!-- contentWrap (e) -->

			</div>
            <!-- content (e) -->
