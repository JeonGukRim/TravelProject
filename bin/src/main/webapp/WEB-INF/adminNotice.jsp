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
	<!-- <div id="adminNotice_jsp"> -->
		<div>
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<div class="container">
			<div role="navigation">
				<!-- 카테고리 -->
				<jsp:include page="myNavigator.jsp"></jsp:include>
			</div>
			<div id="mainField" class="adminField">
				<jsp:include page="noticeList.jsp"></jsp:include>
			</div>
		</div>
<!-- 	</div> -->
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
