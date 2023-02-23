<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<link rel="stylesheet" href="css/header.css" type="text/css">
<title>Insert title here</title>
</head>

<body>
	<div id="mainHeader_jsp">
		<div id="header" role="banner">
			<div id="banner_area">
				<div id="main_logo">
					<h1>Destination's me</h1>
				</div>
				<div id="sub_title">
					<h5>나에게로 떠나는 여행</h5>
				</div>
			</div>
			<div id="nav_area" role="navigation">
				<div id="navigator">
					<span v-if="type =='a'"> 
					<a href="adminNotice.do">공지사항</a>
					</span> 
					<span v-else> 
					<a href="notice.do">공지사항</a>
					</span> 
					<span> 
					<a href="selectpj.do">플래너</a>
					</span> 
					<span> 
					<a href="introduce.do">소개</a>
					</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var mainHeader_jsp = new Vue({ 
    el: '#mainHeader_jsp',
    data: {
    	type : "${userStatus}"
    }   
    , methods: {
    	}
    , created: function () { <!-- 최초 실행을 정의하는 부분-->
	}
});
</script>