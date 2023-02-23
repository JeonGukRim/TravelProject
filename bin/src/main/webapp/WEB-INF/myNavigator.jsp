<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
		<link rel="stylesheet" href="css/myNavigator.css" type="text/css">
		<title>Insert title here</title>
	</head>
	
	<body>
		<div id="myNavigator_jsp">
			<div class="nav_member" role="navigation" v-if="type == 'm' || type == '' ">
				<div class="nav_Area">
					<div id="link_deco" class="nav_font">
						<a href="mypage.do">
							<span id="nav_item">정보수정  ></span>
						</a>
					</div>
				</div>
				<div class="nav_Area">
					<div id="link_deco" class="nav_font">
						<a href="contactlist.do">
							<span id="nav_item">문의내역 확인 ></span>
						</a>
					</div>
				</div>
				<div class="nav_Area">
					<div id="link_deco" class="nav_font">
						<a href="bucket.do">
							<span id="nav_item">버킷리스트 ></span>
						</a>
					</div>
				</div>
				<div class="nav_plannerArea">
					<div id="link_deco" class="nav_font">
						<a href="myplanner.do">
							<span id="nav_item">나의 여행 플래너 ></span>
						</a>
					</div>
				</div>
			</div>
			
			<div class="nav_admin" role="navigation" v-else-if="type == 'a'">
				<div class="nav_Area">
					<div id="link_deco" class="nav_font">
						<a href="adminNotice.do">
							<span id="nav_item">공지사항  ></span>
						</a>
					</div>
				</div>
				<div class="nav_plannerArea">
					<div id="link_deco" class="nav_font">
						<a href="adminContactlist.do">
							<span id="nav_item">문의내역 ></span>
						</a>
					</div>
				</div>
				<div class="nav_plannerArea">
					<!-- <div id="link_deco" class="nav_font">
						<a href="reviewlist.do">
							<span id="nav_item">게시글 관리 ></span>
						</a>
					</div> -->
				</div>
			</div>
		</div>
	</body>
</html>
<script type="text/javascript">
var myNavigator_jsp = new Vue({ 
    el: '#myNavigator_jsp',
    data: {
    	type : "${userStatus}"   /* (네비게이션) 로그인>> 사용자: 1, 관리자: 2 */
    }   
    , methods: {
    	
    }
    , created: function () { <!-- 최초 실행을 정의하는 부분-->
	     
	}
});
</script>