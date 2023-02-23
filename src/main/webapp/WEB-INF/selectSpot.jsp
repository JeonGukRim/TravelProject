<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
		<link rel="stylesheet" href="css/common_contain.css" type="text/css">
		<link rel="stylesheet" href="css/selectpjContain.css" type="text/css">
		<link rel="stylesheet" href="css/randomPlan.css" type="text/css">
		<!-- 사용안하는 것 같아서 주석 처리 했어요! 혹시 이 페이지 어디에 해당 css 필요하신 거면 주석 풀면 됩니다! -->
		<!-- <link rel="stylesheet" href="css/finalRecommend.css" type="text/css"> -->
		<title>Choose spot!</title>
	</head>
	<body>
		<!-- 헤더 -->
		<div>
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<!-- 컨테이너 -->
		<div class="container">
			<div role="navigation">
				<jsp:include page="navigator.jsp"></jsp:include>
			</div>
			<div id="mainField" class="mypageField">
				<div id="fontDeco" class="randomPlan_font">
					<p>계획적인 여행을 좋아하시는군요!</p>
					<p>사진을 보면서 여행지를 선택해보세요 😉</p>
				</div>
				<div class="search_photo">
					<span>
						<jsp:include page="/layout/selectSpot2.jsp">
							<jsp:param value="id" name="11" />
						</jsp:include>
					</span>
				</div>
				<div id="app_list"></div>
				<div class="move_eiPage" onclick="location.href='selectei.do'">
					<div class="moveEI_btn">가보자고!</div>
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
    el: '#app_list',
    data: {
    }   
    , methods: {
    	}
    , created: function () { <!-- 최초 실행을 정의하는 부분-->
	}
});
</script>