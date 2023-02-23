<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
		<link rel="stylesheet" href="css/common_contain.css" type="text/css">
		<link rel="stylesheet" href="css/myplanner.css" type="text/css">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 헤더 -->
		<div>
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<!-- 컨테이너 -->
		<div class="container">
				<!-- 카테고리 -->
			<div role="navigation">
				<jsp:include page="myNavigator.jsp"></jsp:include>
			</div>
			<!-- 소분류명 ex. 정보수정, 문의내역 확인 등 -->
			<div id="smallCategroy">
				<span class="small_category">나의 여행 플래너</span>					
			</div>
			<!-- 메인컨테이너 -->
			<div id="mainField">
				<div id="myplanner_jsp">
					<div class="nonePlan" v-if="plannerNum == 0">
						<div class="notice_noPlan">
							<span>아직 플래너가 없네요!</span>
						</div>
						<div class="goPlan_btn" onClick="location.href='createplan.do'">
							<span>플랜 만들러 GO!</span>
						</div>
					</div>
					<div class="bePlan" v-for="(item, index) in countPlan" v-else-if="plannerNum != 0">
						<div class="spotDate_plan">
							<input type="radio" name="planItem_radios" class="planner_raBtn"/>
							<span class="spot">부산</span>	<!-- 지역명 -->
							<span class="date">2023.02.03~2023.02.05</span>	<!-- 날짜 -->
						</div>
						<div class="list_plan">
							<div class="day_btn">
								<span class="day">1일차</span>	<!-- ex.1일차 -->
								<span class="dayDate">2023.02.03</span>	<!-- 해당일차의 날짜(ex.2023.02.03) -->
								<div class="nextBtn">	<!-- 다음 일차로 넘어가는 버튼 //애니메이션 효과 주면 좋을 것 같아요(슬롯 처럼) -->
									<span>next ></span>
								</div>
							</div>
							<div class="listPlan" v-for="(item, index) in listPlan">
								<div v-if="selectPJ == 'P'">	<!-- 플래너 만들때 시간 선택 안했으면 해당 div 출력 -->
									<ul class="listUp">
										<li class="list">회</li>	<!-- 메모한 것 -->
										<li class="list">가나다라마바사아자차카타파하</li>	<!-- 메모한 것 -->
										<li class="list">qwerrtyuyioasdfghjklzxcvbnm</li>	<!-- 메모한 것 -->
									</ul>
								</div>
								<div v-else-if="selectPJ == 'J'">	<!-- 플래너 만들때 시간 선택 했으면 해당 div 출력 -->
									<div class="listJ">
										<span>hour 시 minute 분: 가나다라마바사아자차카타파하</span>
									</div>
									<div class="listJ">
										<span>hour 시 minute 분: 가나다라마바사아자차카타파하</span>
									</div>
								</div>
							</div>
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
var myplanner_jsp = new Vue({ 
    el: '#myplanner_jsp',
    data: {
    	plannerNum: 1
    	, countPlan: 1
    	, listPlan: 1
    	, selectPJ: "J"
    	, spot: ""
    	, date: ""
	    , userId : "${userId}"
    }   
    , methods: {
    	}
    , created: function () { <!-- 최초 실행을 정의하는 부분-->
	}
});
</script>