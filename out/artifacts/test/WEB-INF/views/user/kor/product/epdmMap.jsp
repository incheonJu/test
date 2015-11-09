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
					<li><a href="epdmApplication">등록분야</a></li>
					<li class="on"><a href="epdmMap">석유화학계통도</a></li>
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

				<!-- contentWrap (s) -->
				<div class="contentWrap">

					<h3 class="txtPoint f51">국내석유화학제품 계통도</h3>
					<div class="epdmMap">
						<ul>
							<li><span class="color1"></span>기초유분</li>
							<li><span class="color2"></span>중간원료</li>
							<li><span class="color3"></span>합성수지</li>
							<li><span class="color4"></span>합성원료</li>
							<li><span class="color5"></span>합성고무</li>
							<li><span class="color6"></span>기타</li>
						</ul>
						<p>2014 . 3 기준 ( 단위 : 1,000MTA )</p>
					</div>
					<div class="ac mt80"><img src="/resources/image/user/kor/sub/product/img_epdm_schematic.jpg" alt="" /></div>

				</div>
				<!-- contentWrap (e) -->

			</div>
            <!-- content (e) -->
