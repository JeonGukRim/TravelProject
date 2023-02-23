<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
	<link rel="stylesheet" href="css/navigator.css" type="text/css">
<title>Insert title here</title>
</head>

<body>
	<div id="navigator_jsp">
		<div id="nav" role="navigation">
			<!-- 카테고리 만들기 -->
			<div class="nav_Area">
				<div  id="link_deco" class="nav_font">
					<a href="notice.do"> <span id="navNotice">공지사항 ></span>
					</a>
				</div>
			</div>
			<div class="nav_Area">
				<div id="link_deco" class="nav_font">
					<a href="selectpj.do"> <span id="navPlanner">플래너 ></span>
					</a>
				</div>
				<div>
					<div class="nav_planner">
						<!-- <div id="navPlanner_list">
							<a href="reviewlist.do"> <span>- 구경하기 > </span>
							</a>
						</div> -->
						<div id="navPlanner_list">
							<a href="selectpj.do"> <span>- 추천받기 > </span>
							</a>
						</div>
						<div id="navPlanner_list">
							<a href="createplan.do"> <span>- 만들기 > </span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="nav_introduceArea">
				<div id="link_deco" class="nav_font">
					<a href="introduce.do"> <span id="navIntroduce">소개 > </span>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var navigator_jsp = new Vue({ 
    el: '#navigator_jsp',
    data: {
    	type : "${userStatus}"
    }   
    , methods: {
    	}
    , created: function () { <!-- 최초 실행을 정의하는 부분-->
	}
});
</script>