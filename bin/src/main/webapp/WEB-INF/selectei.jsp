<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
		<link rel="stylesheet" href="css/selecteiContain.css" type="text/css">
		<title>Insert title here</title>
	</head>
				
	<body>
		<!-- 헤더 -->
		<div>
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<!-- 컨테이너 -->
		<div id="app" class="ei_container">
				<div role="navigation">
					<jsp:include page="navigator.jsp"></jsp:include>
				</div>
				<div id="ei_mainField">
					<div id="fontDeco" class="fontLocation">
						<p>당신에게 딱! 맞는</p>
						<p>놀거리, 볼거리, 먹거리 추천을 위해</p>
						<p>선택 해주세요 :)</p>
					</div>
					<div id="selectEI_btn">
						<div id="selectE_btn">
							<a href="/finalRecommend.do">
								<span class="selEIbtn">Exxx</span>
							</a>
						</div>
						<div id="selectI_btn">
							<a href="/finalRecommend.do">
								<span class="selEIbtn">Ixxx</span>
							</a>							
						</div>
					</div>
					<div id="selEI_ex">
						<div id="selE_e">
							<span class="selEIex">사람 많은 곳 좋아! 😝</span>
						</div>
						<div id="selI_i">
							<span class="selEIex">한적한 곳 좋아! 😊</span>
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
    	}
    , created: function () { <!-- 최초 실행을 정의하는 부분-->
	}
});
</script>