<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
		<link rel="stylesheet" href="css/common_contain.css" type="text/css">
		<title>Insert title here</title>
	</head>
	
	<body>
		<!-- 헤더 -->
		<div>
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<!-- 컨테이너 -->
		<div class="container">  <!-- id="bucket_jsp" -->
				<!-- 카테고리 -->
				<div role="navigation">
					<jsp:include page="myNavigator.jsp"></jsp:include>
				</div>
				<!-- 소분류명 ex. 정보수정, 문의내역 확인 등 -->
				<div id="smallCategroy">
					<span class="small_categoryadmin">버킷리스트</span>					
				</div>
				<!-- 메인컨테이너 -->
				<div id="mainField" class="bucketField">
				<!-- 지도 -->
				<jsp:include page="/layout/bucketMap.jsp"></jsp:include>
				</div>
		</div>
		<!-- 푸터  -->
		<div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</body>
</html>
<!-- <script type="text/javascript">
var bucket_jsp = new Vue({ 
    el: '#bucket_jsp',
    data: {
    userId : "${userId}"
    	/*  */
    }   
    , methods: {
    	}
    , created: function () { 최초 실행을 정의하는 부분 
	}
});
</script> -->