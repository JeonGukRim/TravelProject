<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="css/common_contain.css" type="text/css">
<link rel="stylesheet" href="css/finalRecommend.css" type="text/css">
<title>Insert title here</title>

</head>
<body>

	<!-- 헤더 -->
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<!-- 컨테이너 -->
	<div id="app" class="container">
		<div role="navigation">
			<jsp:include page="navigator.jsp"></jsp:include>
		</div>
		<div id="mainField">
			<!-- 1. 지역추천 필드입니다. !!지도API 필요!! -->
			<div class="recommendSpot">
				<div class="notice_txt">
					<div class="noticeBig" style="">
						<p>
							{{
							<!-- 앞 페이지에서 선택한 지역명 가져와야 합니다. -->
							}} 은(는) 이런 곳들을 추천 드려요!
						</p>
					</div>
					<div class="notcieSmall">
						<span>*카카오맵 기준</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 지도 API  -->
	<span
		style="position: relative; top: -650px; left: 580px; height: 410px;">
		<jsp:include page="/layout/finalRecommendMap.jsp">
			<jsp:param value="id" name="11" />
		</jsp:include> <!-- 지도 API 구역입니다. -->
	</span>
	<div id="app" style="position: relative; top: -600px; left: 200px;">
		<div class="bucket_btn" onclick="location.href='bucket.do'">
			버킷리스트 확인</div>
		<!-- 시각적으로 나뉘는 부분입니다 -->
		<div class="seperate_text">
			<span>&</span>
		</div>

		<!-- 2. 성향에 맞는 포스팅글 추천 글로 이동하는 필드입니다.  -->
		<div class="recommendPost">
			<div class="notice_txt">
				<div class="noticeBig">
					<p>
						당신이 좋아하는
						<!-- 앞페이지에서 선택한 것에 따라 다르게 노출되어야 합니다. (E: 사람 많은 or I: 한적한) -->
						곳에
					</p>
					<p>안성맞춤! 키워드로 검색한 다양한 글을 둘러보세요</p>
				</div>
			</div>
			<div class="searchNaver_Btn">
				<!-- 앞페이지에서 선택한 것에 맞춰 검색단어 설정해주어야 합니다. -->
				<!-- v-if 사용해서 E인지 I인지 구별하여 노출 시켜야 합니다. -->
				<div class="search_Eposting" onclick="window.open('')">
					#파워E #부산 #국내여행 #혼자여행
					<%-- #파워 {{ }} #{{ }} #국내여행 #혼자여행 --%>
					<!-- E or I	 지역명   : 앞페이지에서 선택한 것 가져와야 합니다.-->
				</div>
			</div>
		</div>

		<!-- 시각적으로 나뉘는 부분입니다 -->
		<div class="seperate_arrow"></div>

		<!-- 3. createPlan으로 이동할지 추가로 검색할지 정하는 필드입니다.  -->
		<div class="movePage">
			<div class="movePage_createPlan">
				<div class="item_location">
					<p class="noticeBig">OK! 다 골랐어! 😤</p>
					<div class="planner_btn" onclick="location.href='createplan.do'">
						플래너 완성하러 GO!</div>
				</div>
			</div>

			<div class="seperate_versus">
				<span> vs.</span>
			</div>

			<div class="movePage_naverSearch">
				<div class="item_location">
					<p class="noticeBig">아직인데.. 😢</p>

					<div class="search_btn"  onclick="javascript:void(window.open('https://search.naver.com/search.naver?where=view&sm=tab_jum&query=%23%ED%98%BC%EC%9E%90%EC%97%AC%ED%96%89+%23%EA%B5%AD%EB%82%B4%EC%97%AC%ED%96%89','win0','width=740,height=768,status=no,location=no,toolbar=no,scrollbars=no'))">
						검색 GO!</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 푸터  -->
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	
    }   
    , methods: {
    	window.onfocus=function(){
		},
		window.onload=function(){
		window.focus(); 
		window.moveTo(100,100); 
		window.resizeTo(740,768); 
		window.scrollTo(0,4000); 
		}
    }
    , created: function () { <!-- 최초 실행을 정의하는 부분-->
	}
    
});
</script>