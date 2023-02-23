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
		<div id="app" class="container">
				<div role="navigation">
					<jsp:include page="navigator.jsp"></jsp:include>
				</div>
				<div id="mainField">
					
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