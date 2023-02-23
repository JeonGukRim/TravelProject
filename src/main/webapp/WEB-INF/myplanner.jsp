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
			<span class="small_categoryadmin">나의 여행 플래너</span>
		</div>
		<!-- 메인컨테이너 -->
		<div id="mainField">
			<div id="myplanner_jsp">
				<template v-if="plannerNum == 0">
					<div class="nonePlan" v-if="plannerNum == 0">
						<div class="notice_noPlan">
							<span>아직 플래너가 없네요!</span>
						</div>
						<div class="goPlan_btn" onClick="location.href='createplan.do'">
							<span>플랜 만들러 GO!</span>
						</div>
					</div>
				</template>
				<template v-else-if="plannerNum != 0" >
					<div class="bePlan" v-for="(item, index) in countPlan" v-if="chkIndex == index">
						<div class="spotDate_plan">
							<input type="radio" name="planItem_radios" class="planner_raBtn" />
							<span class="spot">{{pAddress}}</span>
							<span>
							<select v-model="pCreatDate" @change="fnGetList">
								<option v-for="item in list" v-bind:value="item.pCreatDate" >{{item.pCreatDate}}</option>
							</select>
							</span>
							<!-- 지역명 -->
							<span class="date">{{planStartdate}}~{{planOverdate}}</span>
							<!-- 날짜 -->
						</div>
						<div class="list_plan">
							<div class="day_btn">
								<span class="day">{{chkIndex+1}}일차</span>
								<!-- ex.1일차 -->
								<span class="dayDate">{{planStartdate + chkIndex}}</span>
								<!-- 해당일차의 날짜(ex.2023.02.03) -->
								
								<div class="nextBtn" @click="fnNext(index, 'n')">
									<!-- 다음 일차로 넘어가는 버튼 //애니메이션 효과 주면 좋을 것 같아요(슬롯 처럼) -->
									<span>next＞</span>
								</div>
								<div v-if="chkIndex != 0" class="nextBtn" @click="fnNext(index, 'p')">
									<span >＜prev </span>
								</div>
								
							</div>
							<div class="listPlan" v-for="(item, index) in listPlan">
								<div v-if="selectPJ == 'P'">
									<!-- 플래너 만들때 시간 선택 안했으면 해당 div 출력 -->
									<ul class="listUp">
										<li class="list">회</li>
										<!-- 메모한 것 -->
										<li class="list">{{pContent}}</li>
										<!-- 메모한 것 -->
										<li class="list">qwerrtyuyioasdfghjklzxcvbnm</li>
										<!-- 메모한 것 -->
									</ul>
								</div>
							<!-- 	<div v-else-if="selectPJ == 'J'"  v-for="(item,index) in listPlan">
									플래너 만들때 시간 선택 했으면 해당 div 출력
									<div class="listJ">
										<span>{{item[index].pHour}} 시 {{item[index].pMin}} 분: {{item[index].pContent}}</span>
										반복문 사용예정 
									</div>
								</div>
								 -->
									<div v-else-if="selectPJ == 'J'"  >
									<!-- 플래너 만들때 시간 선택 했으면 해당 div 출력 -->
									<div class="listJ">
										<span>{{item.pHour}} 시 {{item.pMin}} 분: {{item.pContent}}</span>
										<!--반복문 사용예정  -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</template>
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
		el : '#myplanner_jsp',
		data : {
			list : [],
			plannerNum : "",
			countPlan : "",
			listPlan : 1,
			selectPJ : "J",
			spot : "",
			date : "",
			userId : "${userId}",
			pAddress : "<지역변수>",
			planStartdate : "<시작일>",
			planOverdate : "<종료일>",
			pHour : "<시간>",
			pMin : "<분>",
			pContent : "<내용>",
			pDayCount : "",
			date : "",
			startnum : 1,
			chkIndex : 0,
			pCreatDate : ""
		},
		methods : {
			fnGetList : function(){
				var self = this;
				console.log("zzzz");
				var nparmap = {
					mId : self.userId,
					pCreatDate : self.pCreatDate,
					index : 1
				};
				$.ajax({
					url : "/myplanner.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.listPlan = data.list;
						console.log(1+self.pCreatDate);
						self.pAddress = self.listPlan[0].pAddress;
						self.planStartdate = self.listPlan[0].planStartdate;
						self.planOverdate =  self.listPlan[0].planOverdate;
						self.countPlan = self.listPlan[0].planOverdate-self.listPlan[0].planStartdate+1;
					}
				});
			},
			fnGetItem : function(index){
				var self = this;
				var nparmap = {
					mId : self.userId,
					pCreatDate : self.pCreatDate,
					index : index
				};
				$.ajax({
					url : "/myplanner.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if(data.list.length == 0){
							alert("마지막 일정입니다.");
							self.chkIndex = self.chkIndex - 1;
							return;
						} else {
							self.listPlan = data.list;
							console.log(data.list);
							self.pAddress = self.listPlan[0].pAddress;
							self.planStartdate = self.listPlan[0].planStartdate;
							self.planOverdate =  self.listPlan[0].planOverdate;
							self.countPlan = self.listPlan[0].planOverdate-self.listPlan[0].planStartdate+1;
							console.log(self.countPlan);
						}
						
					}
				});
			},
			fnNext : function(index, str){
				var self = this;
				if(str == "n"){
					self.chkIndex = index + 1;
					self.fnGetItem(index+2);
				} else {
					self.chkIndex = index - 1;
					self.fnGetItem(index);
				}
				
			},fnGetdate : function(){
				var self = this;
				var nparmap = {
					mId : self.userId,
				};
				$.ajax({
					url : "/myplanner1.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						 console.log(self.list[0].pCreatDate);
						if(self.list){
							self.plannerNum = 1;
							self.pCreatDate = self.list[0].pCreatDate;
							self.fnGetList();
							}else{
							self.plannerNum = 0;
							}
						}
				});
			},pageChange : function(url, param) {
				var target = "_self";
				if (param == undefined) {
					//	this.linkCall(url);
					return;
				}
				var form = document.createElement("form");
				form.name = "dataform";
				form.action = url;
				form.method = "post";
				form.target = target;
				for ( var name in param) {
					var item = name;
					var val = "";
					if (param[name] instanceof Object) {
						val = JSON.stringify(param[name]);
					} else {
						val = param[name];
					}
					var input = document.createElement("input");
					input.type = "hidden";
					input.name = item;
					input.value = val;
					form.insertBefore(input, null);
				}
				document.body.appendChild(form);
				form.submit();
				document.body.removeChild(form);
			}
		},created : function() {
				var self = this;
				/* self.fnGetList(); */
				self.fnGetdate();
		
			}

	});
</script>