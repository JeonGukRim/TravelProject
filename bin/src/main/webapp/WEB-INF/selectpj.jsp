<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
		<link rel="stylesheet" href="css/selectpjContain.css" type="text/css">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 헤더 -->
		<div>
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<!-- 컨테이너 -->
		<div id="app">
			<div id="pj_container"> 
				<div role="navigation">
					<jsp:include page="navigator.jsp"></jsp:include>
				</div>
				<div id="skip_btn">
					<a href="createplan.do">
						<span class="skip">skip ▶</span>
					</a>
				</div>
				<div id="pj_mainField">
					<div id="fontDeco" class="fontLocation">
						<p>안녕하세요 :)</p>
						<p>최고의 여행을 위해</p>
						<p>당신의 MBTI를 알려주세요!</p>
					</div>
					<div id="selectPJ_btn">
						<div id="selectP_btn">
							<a href="/randomplan.do">
								<span class="selPJbtn">xxxP</span>
							</a>
						</div>
						<div id="selectJ_btn">
							<a href="/selectSpot.do">
								<span class="selPJbtn">xxxJ</span>
							</a>							
						</div>
					</div>
					<div id="selPJ_ex">
						<div id="selP_p">
							<span class="selPJex">나는 즉흥적인게 좋아! 😁</span>
						</div>
						<div id="selJ_j">
							<span class="selPJex">나는 계획 세우는게 좋아! 😄</span>
						</div>
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