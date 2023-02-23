<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bucketMap.css">
<script src="js/jquery.js"></script>
<style>
table.type11 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.5;
}
table.type11 th {
  width: 225px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: #AFC4E7 ;
}
table.type11 td {
  width: 225px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #F1F5FB;
}

</style>

</head>
<body>
	<div class="map_wrap">
		<div style="width: 112%; height:210px; overflow:auto; position:absolute; left:-51px; top:389px; margin-top:10px;">
			<table class="type11">
				<tr id="name0">
					<th>이름</th>
					<th>주소</th>
					<th>지번</th>
					<th>번호</th>
				</tr>
				<tbody id="table1">

				</tbody>
			</table>
		</div>
		<div id="map"
			style="top:-20px;left:-50px; width:112%; height:100%; position: absolute; overflow: hidden;"></div>
		<div id="menu_wrap" class="bg_white" style="top:-20px;left:-50px; height:90%">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						키워드 : <input type="text" value="서울역" id="keyword" size="15">
						<button type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9eca6b261ab27913f0996f542fcf8b0&libraries=services,clusterer,drawing"></script>
</body>
</html>

<script>
		// 마커를 담을 배열입니다
		var markers = [];
		var tableList = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places, index) {
			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';
			
			var index = 1 ;
			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();
			var placeList = [];
			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다
				placeList.push(places[i].place_name);
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
			
			var name = document.getElementById("name_" + index).innerText;
			var add = document.getElementById("add_" + index).innerText;
			var jibun = document.getElementById("jibun_" + index).innerText;
			var tel = document.getElementById("tel_" + index).innerText;
			var id = "${userId}"; 
			var nparmap = { m_id : id , b_name : name, b_add : add, b_jibun : jibun, b_tel : tel};
			 $.ajax({
	                url:"/getbucket.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {     
	                	if(data.result == "성공"){
// 	                		console.log(placeList);
	                		tableList = data.list;
	                		var list = data.list;
	                        var str = "";
	                        $.each(list, function(i){
	                            str += "<tr>"
	                            str += '<td>' + list[i].bName + '</td><td>' + list[i].bAdd + '</td><td>' + list[i].bJibun + '</td><td>' + list[i].bTel + '</td>'
	                            str += '</tr>'
	                       		for(var x=0; x < placeList.length; x++){
	                       			if(list[i].bName == placeList[x]){
	                       				document.getElementById('id_' + (x+1)).className = 'heart2';
	                       			}
	                       		}
	                        });
	                        
// 	                        console.log(placeList);
	                        $("#table1").append(str);
	                	} else {
	                		console.log("데이터 호출 실패");
	                	}
	                }
	            });
		}
		
		function fnlike(index, item){
			/* console.log(document.getElementById("name_" + index).innerText);
			console.log(document.getElementById("add_" + index).innerText);
			console.log(document.getElementById("jibun_" + index).innerText);
			console.log(document.getElementById("tel_" + index).innerText); */
			
			var name = document.getElementById("name_" + index).innerText;
			var add = document.getElementById("add_" + index).innerText;
			var jibun = document.getElementById("jibun_" + index).innerText;
			var tel = document.getElementById("tel_" + index).innerText;
			var id = "${userId}"; 
// 			console.log(id);
			
            var nparmap = { m_id : id , b_name : name, b_add : add, b_jibun : jibun, b_tel : tel}; 
            $.ajax({
                url:"/addbucket.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {     
                	if(data.result == "성공"){
                		alert("버킷리스트 등록 완료");
                		location.reload();
                	} else {
                		alert("버킷리스트 삭제 완료");
                   		document.getElementById('id_' + index).className = 'heart';
                   		location.reload();
                	}
                }
            });
			
			if(item.className == "heart"){
				item.className = "heart2";
			} else {
				item.className = "heart";
			}
			
			 $.ajax({
	                url:"/getbucket.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {     
	                	if(data.result == "성공"){
	                		console.log(data);
	                	} else {
	                		console.log("데이터 호출 실패");
	                	}
	                }
	            });
		}
		
		
		function listrefresh(){  
		      $("map_wrap").load(window.location.href + "map_wrap");
		}
		
		
		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)+ '"></span><span class="heart" id="id_'
					+ (index + 1)+ '" onclick="fnlike(' + (index+1) + ',this)"></span>'
					+ '<div class="info">'
					+ '   <h5 id="name_' + (index + 1) + '">' + places.place_name + '</h5>';
					
			el.setAttribute("id", "list_" + (index + 1));
			
			
			if (places.road_address_name) {
				itemStr += '    <span id="add_' + (index + 1) + '">' + places.road_address_name + '</span>'
						+ '   <span id="jibun_' + (index + 1) + '" + class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span id="add_' + (index + 1) + '">' + places.road_address_name + '</span>' 
					+ '    <span id="jibun_' + (index + 1) + '">' + places.address_name + '</span>';
			}

			itemStr += '  <span id="tel_' + (index + 1) + '" + class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}
		
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}

		// 좌표로 주소 얻어내기
		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new kakao.maps.InfoWindow({
			zindex : 1
		}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result,
					status) {
				if (status === kakao.maps.services.Status.OK) {
					var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
							+ result[0].road_address.address_name + '</div>'
							: '';
					detailAddr += '<div>지번 주소 : '
							+ result[0].address.address_name + '</div>';

					var content = '<div class="bAddr">'
							+ '<span class="title">법정동 주소정보</span>'
							+ detailAddr + '</div>';


					// 마커를 클릭한 위치에 표시합니다 
					marker.setPosition(mouseEvent.latLng);
					marker.setMap(map);
					/*
					// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					infowindow.setContent(content);
					infowindow.open(map, marker);
					 */
				}
			});
		});

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			// 클릭한 위도, 경도 정보를 가져옵니다 
			var latlng = mouseEvent.latLng;
		});

		var mapTypeControl = new kakao.maps.MapTypeControl();
		//지도에 컨트롤을 추가해야 지도위에 표시됩니다
		//kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
	</script>