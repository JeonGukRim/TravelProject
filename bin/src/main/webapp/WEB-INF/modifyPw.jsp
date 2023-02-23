<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
		<link rel="stylesheet" href="css/login.css" type="text/css">
		<link rel="stylesheet" href="css/join.css" type="text/css">
		<link rel="stylesheet" href="css/findIdPw.css" type="text/css">
		<title>비밀번호 변경</title>
	</head>
	<body>
		<!-- header  -->
		<div id="logInHeader" role="banner">
			<h1 onclick="location.href='main.do'">
				Destination's me
			</h1>
		</div>
		<!-- container -->
		<div id="modifyPw_jsp" class="findContainer">
			<div id="modifyPwField">
				<div class="newPw_area">
					<div class="newPw">
						비밀번호
					</div>
					<div>
						<input id="inputInfo" type="password" @keyup="check_essential" v-model="newPw" placeholder="새로운 비밀번호"></input>
					</div>
					<div class="failSuc_notice">
						<span v-if="flg_pw" class="fail">8~20자 영어, 숫자, 특수문자를 사용하세요. (공백X)</span>
					</div>
				</div>
				<div class="newRePw_area">
					<div class="newRePw">
						비밀번호 재확인
					</div>
					<div>
						<input id="inputInfo" type="password" @keyup="check_essential" v-model="newRePw" placeholder="새로운 비밀번호 재확인"></input>
					</div>
					<div class="failSuc_notice">
						<span v-if="flg_rePw_fail" class="fail">비밀번호가 일치하지 않습니다.</span>
						<span v-else-if="flg_rePw_success" class="success">비밀번호 일치</span>
					</div>
				</div>
				<div id="modifyPw_btn">
					<div class="modifyBtn" @click="modifyPw">
						변경
					</div>
				</div>
			</div>
		</div>
		<!-- footer -->
		<div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</body>
</html>
<script type="text/javascript">
var modifyPw_jsp = new Vue({ 
    el: '#modifyPw_jsp',
    data: {
    	id: ""
    	, newPw: ""
    	, newRePw: ""
    	, flg_pw: false
    	, flg_rePw_fail: false
    	, flg_rePw_success: false
    	, flg_submit: false
    }
    , methods: {
    	modifyPw : function() {
    		var self = this;
    		if(self.flg_submit){
	    		var nparmap = {password: self.newPw, m_id: self.id};
	    		$.ajax({
	                url: "/login/modifyPw.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	console.log(data.id);
	                	if(data.num == 0){
	                		alert("실패");
	            		} else {
	            			alert("비밀번호 변경 성공");
	            			self.pageChange("/login.do", {})
	            		}
	                	self.newPw = "";
	                	self.newRePw = "";
	                	self.flg_pw = false;
	        			self.flg_rePw_fail = false;
	        			self.flg_rePw_success = false;
	                } 
	            });
    		} else {
    			alert("하기사항 확인 후 재시도 해주시기 바랍니다.\n1. (공백X) 8~20자 영어, 숫자, 특수문자를 사용여부\n2. 비밀번호와 비밀번호 재확인 일치여부");
    			self.newPw = "";
    			self.newRePw = "";
    			self.flg_pw = false;
    			self.flg_rePw_fail = false;
    			self.flg_rePw_success = false;
    			
    		}
    	}
    	, check_essential:function() {
    		var self = this;
    		const regNum = /[0-9]/g;
    		const regEng = /[a-z]/ig;
    		const regGap = /[\s]/gi;
    		const regSpe = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
    		console.log(self.newPw);
    		console.log(self.newRePw);
    		if (self.newPw != ''){
   				if(8<=self.newPw.length<=20){
   					if(!(regNum.test(self.newPw) && regEng.test(self.newPw) && regSpe.test(self.newPw) && !regSpe.test(self.newPw))) {
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
    		
    		if (self.newRePw != '') {
   				if (self.newRePw == self.newPw) {
   					self.flg_rePw_fail = false;
   					self.flg_rePw_success = true;					
   				} else {
   					self.flg_rePw_fail = true;
   					self.flg_rePw_success = false;
   				}
   			} else {
   				self.flg_rePw_fail = false;
				self.flg_rePw_success = false;
   			}
    		
    		if(self.newPw != '' && self.newRePw != ''){
    			if(!(self.flg_pw) && self.flg_rePw_success){
    				self.flg_submit = true;	
    			} else {
    				self.flg_submit = false;
    			}
    		} else {
    			self.flg_submit = false;
			}
    	}
    	,  pageChange : function(url, param) {
	        var target = "_self";
	        if(param == undefined){
	        //   this.linkCall(url);
	           return;
	        }
	        var form = document.createElement("form"); 
	        form.name = "dataform";
	        form.action = url;
	        form.method = "post";
	        form.target = target;
	        for(var name in param){
	          var item = name;
	          var val = "";
	          if(param[name] instanceof Object){
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
	}
});
</script>