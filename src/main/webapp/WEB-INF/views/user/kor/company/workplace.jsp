<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;region=kr&amp;language=ko"></script>
<script type="text/javascript">
window.onload = function(){
	// gnb 현재 활성화 메뉴 표시
	gnb({
		depth01: 0,
		depth02: 7
	});
};
var MAIN_PAGE = false;

//구글 맵 api
function initialize() {
  var myLatlng = new google.maps.LatLng(37.567495,126.988718); //본사
  var myLatlng2 = new google.maps.LatLng(34.811431,127.657561); //여수 1
  var myLatlng3 = new google.maps.LatLng(34.841127,127.687278); //여수 2
  var myLatlng4 = new google.maps.LatLng(36.392170,127.355382); //대전
  var mapOptions = {
    zoom: 17,
    center: myLatlng
  };
  var mapOptions2 = {
    zoom: 15,
    center: myLatlng2
  };
  var mapOptions3 = {
    zoom: 15,
    center: myLatlng3
  };
  var mapOptions4 = {
    zoom: 15,
    center: myLatlng4
  };
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  var map2 = new google.maps.Map(document.getElementById('map-canvas2'), mapOptions2);
  var map3 = new google.maps.Map(document.getElementById('map-canvas3'), mapOptions3);
  var map4 = new google.maps.Map(document.getElementById('map-canvas4'), mapOptions4);
  var image = '/resources/image/user/kor/sub/company/ico_marker.png';

  var marker = new google.maps.Marker({
      position: myLatlng,
	  icon: image,
      map: map
  });
  var marker2 = new google.maps.Marker({
      position: myLatlng2,
	  icon: image,
      map: map2
  });
  var marker3 = new google.maps.Marker({
      position: myLatlng3,
	  icon: image,
      map: map3
  });
  var marker4 = new google.maps.Marker({
      position: myLatlng4,
	  icon: image,
      map: map4
  });
}
google.maps.event.addDomListener(window, 'load', initialize);
</script>
			<!-- title Wrap (s) -->
			<div id="titleWr">
				<h2>사업장 안내</h2>
			</div>
			<!-- title Wrap (e) -->

            <!-- content (s) -->
			<div id="content">

				<!-- contentWrap (s) -->
				<div class="contentWrap">

					<div class="workplace">
						<div class="maparea">
							<span class="city1">서울</span>
							<span class="place1"><img src="/resources/image/user/kor/sub/company/ico_marker.png" alt="" /></span>
							<span class="city2">여수 <span>1공장/2공장</span></span>
							<span class="place2"><img src="/resources/image/user/kor/sub/company/ico_marker.png" alt="" /></span>
							<span class="city4">대전</span>
							<span class="place4"><img src="/resources/image/user/kor/sub/company/ico_marker.png" alt="" /></span>
						</div>
						<ul>
							<li class="w1">
								<h3>본사</h3>
								<a href="#place1" class="btn"><img src="/resources/image/user/kor/sub/company/ico_workplace_plus.png" alt="보기" /></a>
								<div class="inner" id="place1">
									<p id="map-canvas" class="mapcanvas"></p>
									<p class="address"><b>주소</b> 서울시 중구 청계천로 100(수표동) 시그니쳐타워 동관 8층 <br /><b>TEL</b> (02) 6961-1114 <b class="ml10">FAX</b> (02) 6961-3811</p>
								</div>
							</li>
							<li class="w2">
								<h3>여수 1공장</h3>
								<a href="#place2" class="btn"><img src="/resources/image/user/kor/sub/company/ico_workplace_plus.png" alt="보기" /></a>
								<div class="inner" id="place2">
									<p id="map-canvas2" class="mapcanvas"></p>
									<p class="address"><b>주소</b> 전남 여수시 여수산단2로 116-46 (우, 555-290)<br /><b>TEL</b> (061) 688-2700</p>
								</div>
							</li>
							<li class="w3">
								<h3>여수 2공장</h3>
								<a href="#place2" class="btn"><img src="/resources/image/user/kor/sub/company/ico_workplace_plus.png" alt="보기" /></a>
								<div class="inner" id="place3">
									<p id="map-canvas3" class="mapcanvas"></p>
									<p class="address"><b>주소</b> 전남 여수시 산단중앙로 613 (우,555-200)<br /><b>TEL</b> (061) 808-2300</p>
								</div>
							</li>
							<li class="w4">
								<h3>대전연구소</h3>
								<a href="#place4" class="btn"><img src="/resources/image/user/kor/sub/company/ico_workplace_plus.png" alt="보기" /></a>
								<div class="inner" id="place4">
									<p id="map-canvas4" class="mapcanvas"></p>
									<p class="address"><b>주소</b> 대전시 유성구 신성동 487 (우, 305-805)<br /><b>TEL</b> (042) 712-2200</p>
								</div>
							</li>
						</ul>
					</div>

				</div>
				<!-- contentWrap (e) -->

			</div>
            <!-- content (e) -->