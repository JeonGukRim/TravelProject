<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
		<link rel="stylesheet" href="css/common_contain.css" type="text/css">
		<link rel="stylesheet" href="css/notice.css" type="text/css">
		<script src="https://unpkg.com/vuejs-paginate@latest"></script>
		<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
		<title>공지사항</title>
	</head>
	<body>
<!-- 	<div id="notice_jsp"> -->
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
				<jsp:include page="noticeList.jsp"></jsp:include>
			</div>
		</div>
		<!-- 푸터  -->
		<div>
			<jsp:include page="footer.jsp"></jsp:include> 
		</div>
		<!-- </div> -->
	</body>
</html>

