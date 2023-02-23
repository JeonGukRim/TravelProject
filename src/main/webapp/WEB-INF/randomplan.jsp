<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script id="rendered-js">
				$(function () {
				  $('.play').click(function () {
				    $('ul').css('animation-play-state', 'running');
				  });
				  $('.stop').click(function () {
				    $('ul').css('animation-play-state', 'paused');
				  });
				});
   			 </script>
<link rel="stylesheet" href="css/common_contain.css" type="text/css">
<link rel="stylesheet" href="css/selectpjContain.css" type="text/css">
<link rel="stylesheet" href="css/randomPlan.css" type="text/css">
<title>Choose spot!</title>
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
			<div id="fontDeco" class="randomPlan_font">
				<p>즉흥으로 떠나는 여행을 좋아하시는군요!</p>
				<p>그런 당신을 위해서</p>
				<p>여행지를 지금 바로! 정해드릴게요 😆</p>
			</div>
			<div class="notice_cursor">
				<span>👇 마우스를 올려보세요 👇</span>
			</div>
			<!-- Math.floor(Math.random()) -->
			<div class="slot_loca">
				<ul class="slot">
					<li>서울</li>
					<li>인천</li>
					<li>경기</li>
					<li>강원</li>
					<li>충청</li>
					<li>경상</li>
					<li>전라</li>
					<li>제주</li>
				</ul>
			</div>
			<!-- <div class="selectLoca">
						<input class="input_loca" placeholder="지역명을 입력해주세요."></input>
					</div> -->
		<!-- 	<div class="move_eiPage">
				<button class="play">다시 추천</button>
				<button class="stop">스톱!</button>
			</div> -->
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
    el: '#app',
    data: {
    	num:""
    }   
    , methods: {
    }
    , created: function () { <!-- 최초 실행을 정의하는 부분-->
    }
  
});
</script>
