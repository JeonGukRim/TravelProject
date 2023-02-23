<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/calendar.css">
		<link rel="stylesheet" href="css/common_contain.css" type="text/css">
		<script src="js/jquery.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
		<title>플래너 만들기</title>
	</head>
	<body>
		<div id="header_jsp">
			<!-- 헤더 -->
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<!-- 컨테이너 -->
		<div class="container" >
			<div role="navigation">
				<jsp:include page="navigator.jsp"></jsp:include>
			</div>
			<div id="mainField" class="createplanField">
				<div  id="createplan_jsp">
					<div class="createplan_date">
						<div class="start_date">
							<span class="dateFont">출발 날짜</span>
							<input class="selectDate" type="text" name="from" id="from" autocomplete="off"/>
						</div>
						<div class="seperate_date">
							▶
						</div>
						<div class="arrive_date">
							<span class="dateFont">도착 날짜</span>
							<input class="selectDate" type="text" name="to" id="to" autocomplete="off"/>
						</div>
						<div class="switch">
							<input type="checkbox" id="toggle" hidden checked="checked" @click="switchOnOff"/>
							<label for="toggle" class="toggleSwitch">
								<span class="toggleButton"></span>
							</label>
						</div>
						<div class="createPlanner_btn" @click="fnDate">
							<span>생성하기</span>
						</div>
					</div>
					<div class="createplan_plan" v-if="diffDate > 1">
						<div class="createplan_tab">
							<div v-bind:id="'tab_' + n" :class="flg==n ? 'tab_menu' : 'tab_menu_sub'" v-for="n in diffDate" @click="showContent(n, diffDate)">
								<span class="tab_label">{{n}}일차</span>
							</div>
						</div>
						<!-- <div v-bind:id="'content_' + n" class="createplan_content" v-for="n in diffDate"> -->
						<div class="createplan_content"> 	
							<div class="spotName_date">
								<input class="spotName" placeholder="지역명을 입력해주세요."/>
								<span class="spotDate">{{year}}.{{month}}.{{date + flg - 1}}</span>
							</div>
							<div class="createplan_area">
								<div v-for="(item, index) in dayList[flg-1]" class="planBox" >
									<div class="delItem_raBtn" >
										<input type="radio" name="addDel" :value="index" v-model="delBtn" @click="delPlan(index)"/>
									</div>
									<div class="time" v-if="timePrint">
										<form>
											<select class="time_hour" name="hour" id="select_hour" v-model="item.hour_combo">
												<option value="">시</option>
												<option v-for="item2 in 24" :value="item2">{{item2}}</option>
											</select>
										</form>
										<span class="seperate_time"> : </span>
										<form>
											<select class="time_minute" name="minute" id="select_minute" v-model="item.minute_combo">
												<option value="">분</option>
												<option v-for="item3 in 60" :value="item3">{{item3}}</option>
											</select>
										</form>
									</div>
									<div class="inputPlan">
										<input placeholder="내용을 입력해주세요." v-model="item.plan"/>
									</div>
								</div>
								<div class="addItem_btn" @click="addPlan">
									<span>+</span>
								</div>
							</div>
						</div>
					</div>
					<div class="bucket_save_btn" v-if="diffDate > 1 && logIn == 1">		<!-- 이 부분 수정해야 합니다~ -->
						<div class="bucketBtn" onclick="window.open('/bucket.do')">
							<span>버킷 확인하기</span>
						</div>
						<div class="saveBtn" @click="planSaveBtn(planList)">
							<span>저장</span>
						</div>
					</div>
				</div>
				<div class="createPlan_map">
					<jsp:include page="/layout/createplanMap.jsp"></jsp:include>
				</div>
			</div>
		</div>
		<!-- 푸터 -->
 		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
<script type="text/javascript">
var createplan_jsp = new Vue({ 
    el: '#createplan_jsp',
    data: {
    	diffDate : 0
    	, year: 0
    	, month: 0
    	, date: 0
    	, delBtn: ""
    	, timePrint: true
    	, saveFlag: false
    	, spotList: [{tab_date: "", spot_name: "", spot_date: ""}]
    	, planList: [{hour_combo : "", minute_combo : "", plan : ""}] // 불필요
    	, dayList : []
    	, name: "팀원"
       	, logIn: 1	/* 로그인 정보가 있을 때는 1로 변경되게 하면 될 것 같습니다. */
       	, flg : 1
    }   
    , methods: {
    	fnDate : function(){
    		var self = this;
    		var startDateStr = document.getElementById("from").value;
    		startDate = self.parseDate(startDateStr);
    		var lastDate = document.getElementById("to").value;
    		lastDate = self.parseDate(lastDate);
    		var diffDateTime = lastDate.getTime() - startDate.getTime();
    		self.diffDate = Math.abs(diffDateTime / (1000 * 60 * 60 * 24)) + 1;
			if(self.diffDate>1){
				alert("[!!!!! 필독 !!!!!]\n플래너 만들기는 로그인 했을 때에만 저장이 가능합니다.\n로그인 하지 않으셨다면,\n로그인 후 플래너 만들기 진행하시는 것을 추천 드립니다 :)");
				for(var i=1; i<=self.diffDate; i++){
					self.dayList.push([{hour_combo : "", minute_combo : "", plan : ""}]);
					// $('#content_'+i).hide();
	    		}
				console.log(self.dayList);
				self.year = startDate.getFullYear();
	    		self.month = startDate.getMonth()+1;
	    		self.date = startDate.getDate();	
    		} else {
    			alert("날짜를 선택해주세요.");
    		}
    	}
    	, parseDate : function(str) {
    	    var y = str.substr(0, 4);
    	    var m = str.substr(5, 2);
    	    var d = str.substr(8, 2);
    	    return new Date(y,m-1,d);
    	}
    	, showContent : function(n, diffDate) {
    		var self = this;
    		console.log(n);
    		console.log(diffDate);
    		self.flg = n;
    		console.log(self.dayList);
    	}
    	, planSaveBtn : function(planList) {
    		var self = this;
    		if(planList.length > 0) {
    			if(self.timePrint) {
    				for(var i=0; i<planList.length; i++){
        				if(planList[i].hour_combo && planList[i].minute_combo && planList[i].plan){
        					self.saveFlag = true;
        				} else {
        					self.saveFlag = false;
        					alert("모든 칸의 시, 분, 내용이 입력되어 있는지 확인 후 다시 시도해주시기 바랍니다.");
        					break;
        				}
            		}
        			
    			} else {
    				for(var i=0; i<planList.length; i++){
        				if(planList[i].plan){
        					self.saveFlag = true;
        				} else {
        					self.saveFlag = false;
        					alert("모든 칸의 내용이 입력되어 있는지 확인 후 다시 시도해주시기 바랍니다.");
        					break;
        				}
            		}
    			}
    		} else {
    			alert("입력된 내용이 없습니다.");
    		}
    	}
    	, switchOnOff : function() {
    		var self = this;
    		const checkbox = document.getElementById('toggle');
    		const is_checked = checkbox.checked;
    		self.timePrint = is_checked; 
    	}
    	,addPlan : function() {
    		var self = this;
    		self.dayList[self.flg-1].push({hour_combo : "", minute_combo : "", plan : ""});
    	}
    	,delPlan : function(index) {
    		var self = this;
    		self.dayList[self.flg-1].splice(index, 1);
    	}
    }
    , created: function () { <!-- 최초 실행을 정의하는 부분-->
	}
});
</script>
<script>
	$(function() {
		var dateFormat = "yy/mm/dd", from = $("#from").datepicker(
				{
					showMonthAfterYear : true, //연도,달 순서로 지정
					changeMonth : true,//달 변경 지정
					dateFormat : "yy/mm/dd",//날짜 포맷
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],//요일 이름 지정
					monthNamesShort : [ "1", "2", "3", "4", "5", "6", "7", "8",
							"9", "10", "11", "12" ],//월 이름 지정
					minDate : 0
				//오늘 이전 날짜를 선택할 수 없음
				}).on("change", function() {
			to.datepicker("option", "minDate", getDate(this));//종료일의 minDate 지정
		}), to = $("#to").datepicker(
				{
					showMonthAfterYear : true,
					changeMonth : true,
					dateFormat : "yy/mm/dd",
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					monthNamesShort : [ "1", "2", "3", "4", "5", "6", "7", "8",
							"9", "10", "11", "12" ],
					minDate : '+1D' //내일부터 선택가능, 지정형식 예(+1D +1M +1Y)
				}).on("change", function() {
			from.datepicker("option", "maxDate", getDate(this));//시작일의 maxDate 지정
		});

		function getDate(element) {
			var date;
			try {
				date = $.datepicker.parseDate(dateFormat, element.value);
				if (element.id == 'from') {
					date.setDate(date.getDate() + 1);//종료일은 시작보다 하루 이후부터 지정할 수 있도록 설정
				} else {
					date.setDate(date.getDate() - 1);//시작일은 종료일보다 하루 전부터 지정할 수 있도록 설정
				}
			} catch (error) {
				date = null;
			}
			return date;
		}
	});
</script>