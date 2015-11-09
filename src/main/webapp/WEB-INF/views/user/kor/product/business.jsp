<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript" src="/resources/js/user/kor/jquery.betterToggle.js"></script>
<script type="text/javascript" src="/resources/js/user/kor/jquery.visible.js"></script>
<script type="text/javascript">
	window.onload = function(){
		// gnb 현재 활성화 메뉴 표시
		gnb({
			depth01: 1,
			depth02: 3
		});
	};
	var MAIN_PAGE = false;
	$(document).ready(function() {
		var firstFlag = false;
		var secondFlag = false;
		var firstAnimation = function () {
			if(firstFlag == false){
				var delay = 300;
				$('[class^=obj]').each(function(){
					$(this).delay(delay).queue(function() {
						$(this).animate({marginTop: '-='+50}, 200).animate({marginTop: '+='+50}, 1300,'easeOutCubic');
						$(this).dequeue();
					});
					delay += 300;
				});
				firstFlag = true;
			}else{

			}
		};
		var secondAnimation = function () {
			if(secondFlag == false){
				var delay = 200;
				$('[class^=aAdd]').each(function(){
					$(this).delay(delay).queue(function() {
						$(this).betterToggle();
						$(this).dequeue();
					});
					delay += 500;
				});
				secondFlag = true;
			}else{

			}
		};
		$(window).scroll(function(){
			if($('#titleWr').visible(true) && $('.business .area2 .lists').visible(true)){
				setTimeout(firstAnimation, 100);
				setTimeout(secondAnimation, 1500);
			}
			if ($('#titleWr').visible(true)){
				setTimeout(firstAnimation, 100);
			}
			if ($('.business .area2 .lists').visible(true)){
				setTimeout(secondAnimation, 300);
			}
		});
		if($('#titleWr').visible(true) && $('.business .area2 .lists').visible(true)){
			setTimeout(firstAnimation, 100);
			setTimeout(secondAnimation, 1500);
		}
		if ($('#titleWr').visible(true)){
			setTimeout(firstAnimation, 100);
		}
		if ($('.business .area2 .lists').visible(true)){
			setTimeout(secondAnimation, 300);
		}
	});
</script>
<!-- title Wrap (s) -->
<div id="titleWr">
	<h2>사업영역안내</h2>
</div>
<!-- title Wrap (e) -->

<!-- content (s) -->
<div id="content" class="bgWhite">

	<!-- contentWrap (s) -->
	<div class="business">
		<div class="area1">
			<ol>
				<li>
					<div class="obj1"><strong>CRUDE OIL<br />IMPORTS</strong><span>원유수입</span></div>
					<span class="arrow"></span>
				</li>
				<li class="li2">
					<div class="obj2"><strong>CRUDE OIL<br />REFINING</strong><span>원유정제</span></div>
					<span class="arrow"></span>
					<p class="skip">LPG -30c / 휘발유 나프타 30c ~ 180c / 항공유, 등유 170c ~ 250c / 경유, 중유 240c ~ 350c / 아스팔트  - </p>
				</li>
				<li class="li3">
					<div class="obj3"><strong>NAPHTHA<br />CRACKING</strong><span>나프타 분해</span></div>
					<p class="skip">에틸렌(C2) / 프로필렌(C3) / 혼합부틸렌 / 기타</p>
				</li>
			</ol>
		</div>
		<div class="area2">
			<p class="aObj1"><span class="skip">BUSINESS AREA</span><span>사업영역</span></p>
			<span class="arrowDown"></span>
			<div class="lists">
				<ol>
					<li class="aAdd1">주 원재료<br />(C2,C3) 투입</li>
					<li class="aAdd2">부 원재료<br />(ENB외 투입) </li>
					<li class="bImg1"><div><span>EP(D)M 생산</span></div></li>
					<li class="aAdd3">PP투입<span class="arrowRight1"></span></li>
					<li class="bImg2"><div><span>TPV / KEPA 생산</span></div><span class="arrowRight2"></span></li>
					<li class="bImg3"><div><span>EP(D)M / TPV / KEPA 판매</span></div></li>
				</ol>
			</div>
		</div>
		<div class="area3">
			<p class="bObj1"><strong>PURPOSE<br />OF USE</strong><span>응용분야</span></p>
			<ul class="skip">
				<li class="bTxt1">EP(D)M</li>
				<li class="bTxt2">TPV/KEPA</li>
			</ul>
		</div>
	</div>

	<!-- contentWrap (e) -->

</div>
<!-- content (e) -->