<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
		<link rel="stylesheet" href="css/join.css" type="text/css">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 회원가입_header -->
		<div id="joinHeader" role="banner">
			<h1 onclick="location.href='main.do'">
				Destination's me
			</h1>
		</div>
		<!-- 컨테이너 -->
		<div id="app" class="joinContainer">
			<div id="joinField">
				<div class="id_area">
					<div id="id">
						아이디
					</div>
					<div>
						<input id="inputInfo" type="text" @keyup="duplicate_id" v-model="id" placeholder="아이디"></input>
					</div>
					<div class="failSuc_notice">
						<span v-if="flg_id_fail" class="fail">이미 있는 아이디 입니다.</span>
						<span v-else-if="flg_id_success" class="success">사용 가능</span>
					</div>
				</div>
				<div class="pw_area">
					<div id="pw">
						비밀번호
					</div>
					<div>
						<input id="inputInfo" type="password" @keyup="check_essential" v-model="pw" placeholder="비밀번호"></input>
					</div>
					<div class="failSuc_notice">
						<span v-if="flg_pw" class="fail">8~20자 영어, 숫자, 특수문자를 사용하세요. (공백X)</span>
					</div>
				</div>
				<div class="rePw_area">
					<div id="rePw">
						비밀번호 재확인
					</div>
					<div>
						<input id="inputInfo" type="password" @keyup="check_essential" v-model="rePw" placeholder="비밀번호 재확인"></input>
					</div>
					<div class="failSuc_notice">
						<span v-if="flg_pw_fail" class="fail">비밀번호가 일치하지 않습니다.</span>
						<span v-else-if="flg_pw_success" class="success">비밀번호 일치</span>
					</div>
				</div>
				<div class="nickName_area">
					<div id="nickName">
						닉네임
					</div>
					<div>
						<input id="inputInfo" type="text" @keyup="duplicate_nickName" v-model="nickName" placeholder="닉네임 + Enter"></input>
					</div>
					<div class="failSuc_notice">
						<span v-if="flg_nickName_fail" class="fail">이미 있는 닉네임 입니다.</span>
						<span v-else-if="flg_nickName_success" class="success">사용 가능</span>
					</div>
				</div>
				<div class="name_area">
					<div id="name">
						이름
					</div>
					<div>
						<input id="inputInfo" type="text" @keyup="join_essential" v-model="name" placeholder="이름"></input>
					</div>
					<div class="failSuc_notice">
						<span v-if="flg_name_fail" class="fail">한글만 입력 가능합니다.</span>
					</div>
				</div>
				<div class="birthday_area">
					<div id="birthday">
						생년월일
					</div>
					<div class="birth_combo">
						<form>
							<select class="birth_item" name="yyyy" v-model="birth_year" id="select_year" @change="lastday">
								<option value="">년</option>
								<option v-for="item in yearList" v-bind:value="item.year">{{item.year}}</option>
							</select>
						</form>
						<form>
							<select class="birth_item" name="mm" v-model="birth_month" id="select_month" @change="lastday">
								<option value="">월</option>
								<option v-for="item in monthList" v-bind:value="item.month">{{item.month}}</option>
							</select>
						</form>
						<form>
							<select class="birth_item" name="dd" v-model="birth_day" id="select_day">
								<option value="">일</option>
								<option v-for="item in dayList" v-bind:value="item.day">{{item.day}}</option>
							</select>
						</form>
					</div>
				</div>
				<div class="gender_area">
					<div id="gender">
						성별
					</div>
					<div class="gender_combo">
						<form>
							<select class="genderMF" name="MF" v-model="gender">
								<option value = "" disabled selected> 성별 </option>
								<option value = "M" selected> 남 </option>
								<option value = "F"> 여 </option>
							</select>
						</form>
					</div>
				</div>
				<div class="email_area">
					<div id="email">
						이메일
					</div>
					<div>
						<input id="inputInfo" type="text" @keyup="join_essential" v-model="email" placeholder="이메일"></input>
					</div>
					<div class="failSuc_notice">
						<span v-if="flg_email" class="fail">이메일 형식에 맞게 입력해주세요.</span>
					</div>
				</div>
				<div class="join_btn">
					<!-- alert 등 알림창 > 바로 로그인? > OK > 로그인창 이동
													NO > 메인창 이동 -->
					<div id="joinBtn" @click="fnJoin">회원가입</div>
				</div>
			</div>
		</div>
		<!-- 푸터 -->
		<div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	id : ""
    	, pw : ""
    	, rePw : ""
    	, nickName : ""
    	, name : ""
    	, birth_year : ""
   		, birth_month : ""
 		, birth_day : ""
    	, gender : ""
    	, email : ""
   		, flg_id_fail: false
        , flg_id_success: false
    	, flg_pw: false
       	, flg_pw_fail: false
       	, flg_pw_success: false
       	, flg_nickName_fail: false
        , flg_nickName_success: false
        , flg_name_fail: false
        , flg_email: false
        , yearList : []
        , monthList : []
        , dayList : []
    }   
    
    , methods: {
    	fnJoin : function() {
    		var self = this;
    		if(self.id && self.pw && self.rePw && self.nickName && self.name && self.birth_year && self.birth_month && self.birth_day && self.gender && self.email){
    			
    			if(self.flg_id_success && self.flg_pw_success && !self.flg_pw && self.flg_nickName_success && !self.flg_name_fail && !self.flg_email){
    				
        			var nparmap = {m_id : self.id, password : self.pw, m_nickname : self.nickName, m_name : self.name
            				, m_birthday : self.birth_year, m_birthmm : self.birth_month, m_birthdd : self.birth_day 
            				, m_gender : self.gender, m_email : self.email}; 
        			
    		        $.ajax({
    		        	url:"/login/join.dox",
    		            dataType:"json",	
    		            type : "POST", 
    		            data : nparmap,
    		            success : function(data) {   
    		             	if(data.num != 0) {
    		             		alert(self.name + "님 회원가입을 환영합니다.");
    			             	self.pageChange("/login.do",{});
    		             	} else {
    		             	}
    		             }
    				});
        		} else {
        			alert("하기 사항 확인 후 다시 시도해주시기 바랍니다.\n1. 아이디: 중복확인\n2. 비밀번호: 8~20자 영어, 숫자, 특수문자를 사용하세요. (공백X)"
        													+ "\n3. 비밀번호 재확인: 일치 여부\n4. 닉네임: 중복확인\n5. 이름: 한글 외 문자 입력여부\n6. 이메일: 입력형식 준수 여부");
        		}	
    		} else {
    			alert("모든 정보가 필수입력입니다.\n정보가 다 입력되었는지 확인 해주시기 바랍니다.");
    		}
    		
	        
     	}
    	, duplicate_id : function() {
    		var self = this;
   			var nparmap = {m_id : self.id}; 
       		$.ajax({
   	        	url: "/join/checkId.dox",
   	            dataType:"json",	
   	            type : "POST", 
   	            data : nparmap,
   	            success : function(data) {  
   	            	if(self.id != ''){
   	            		if(data.dup == "ok") {
   	            			self.flg_id_fail = false;
   	            			self.flg_id_success = true;
       	             	}
   	            		if (data.dup == "no") {
       	             		self.flg_id_fail = true;
       	             		self.flg_id_success = false;
       	             	} 	
   	            	} else {
   	            		self.flg_id_fail = false;
   	            		self.flg_id_success = false;
   	            	}
   	            }
   			}); 	
    		
    	}
    	, duplicate_nickName : function() {
    		var self = this;
   			var nparmap = {m_nickname : self.nickName}; 
       		$.ajax({
   	        	url: "/join/checkNick.dox",
   	            dataType:"json",	
   	            type : "POST", 
   	            data : nparmap,
   	            success : function(data) {  
   	            	if(self.nickName != ''){
   	            		if(data.dup == "ok") {
   	            			self.flg_nickName_fail = false;
   	            			self.flg_nickName_success = true;
       	             	} 
   	            		if (data.dup == "no") {
       	             		self.flg_nickName_fail = true;
       	             		self.flg_nickName_success = false;
       	             	} 	
   	            	} else {
   	            		self.flg_nickName_fail = false;
   	            		self.flg_nickName_success = false;
   	            	}
   	            }
   			}); 
    		
    	}
    	, join_essential : function() {
    		var self = this;
    		const regKor = /^[가-힣]+$/;
    		const regEmail = /(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))/;
			
    		/* 이름 */
			if(self.name != '') {
				if (regKor.test(self.name)) {
					self.flg_name_fail = false;
				} else {
					self.flg_name_fail = true;
				}
			} else {
				self.flg_name_fail = false;
			}
			
			/* 이메일 */
			if(self.email != '') {
				if(regEmail.test(self.email)){
					self.flg_email = false;
				} else {
					self.flg_email = true;
				}
			} else {
				self.flg_email = false;
			}
    	}
	    , check_essential:function() {
			var self = this;
			const regNum = /[0-9]/g;
			const regEng = /[a-z]/ig;
			const regGap = /[\s]/gi;
			const regSpe = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
			if (self.pw != ''){
					if(8<=self.pw.length<=20){
						if(!(regNum.test(self.pw) && regEng.test(self.pw) && regSpe.test(self.pw) && !regSpe.test(self.pw))) {
	      					self.flg_pw = true;
	          			} else {
	          				self.flg_pw = false;
	          			}		
					} else {
						self.flg_pw = true;
					}
				} else {
					self.flg_pw = false;
				}
			
			if (self.rePw != '') {
					if (self.rePw == self.pw) {
						self.flg_pw_fail = false;
						self.flg_pw_success = true;					
					} else {
						self.flg_pw_fail = true;
						self.flg_pw_success = false;
					}
				} else {
					self.flg_pw_fail = false;
					self.flg_pw_success = false;
				}
			
		}
	    , lastday : function(){ //년과 월에 따라 마지막 일 구하기 
    		var self = this;
    		self.dayList = [];
	    	var Year=self.birth_year;
    		var Month=self.birth_month;
    		var day=new Date(new Date(Year,Month,1)-86400000).getDate();
    	    
   			for(var i=1; i<=day; i++){
   				self.dayList.push({"day" : i});
   			}
    	}
	    , fnDate : function(){
	    	var self = this;
	    	var start_year="1940";// 시작할 년도
	    	var today = new Date();
	    	var today_year= "2023";
	    	for(var y=today_year; y>=start_year; y--){ //start_year ~ 현재 년도
	    		self.yearList.push({"year" : y});
	    	}
	    	for(var m=1; m<=12; m++){
	    		self.monthList.push({"month" : m});
	    	}

	    },
		pageChange : function(url, param) {
			var target = "_self";
			if (param == undefined) {
				//   this.linkCall(url);
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
   	}
    
    , created: function () { <!-- 최초 실행을 정의하는 부분-->
    	var self= this;
    	self.fnDate();
	}
});
</script>