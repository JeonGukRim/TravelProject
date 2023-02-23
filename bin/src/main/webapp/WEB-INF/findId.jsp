<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
		<link rel="stylesheet" href="css/login.css" type="text/css">
		<link rel="stylesheet" href="css/findIdPw.css" type="text/css">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- header  -->
		<div id="logInHeader" role="banner">
			<h1 onclick="location.href='main.do'">
				Destination's me
			</h1>
		</div>
		<!-- container -->
		<!-- ID 라디오버튼 선택시 -->
		<div id="app" class="findContainer">
			<div id="findField_ID">
				<div class="radioBtn">
					<div id="idBtn">
						<label>
							<input type='radio' name='find' value="id" checked class="findInfo" />
							<span id="btnFont">ID 찾기</span>
						</label>
					</div>
					<div id="pwBtn">
						<label>
							<a href="findPw.do">
								<input type='radio' name='find' value="pw" class="findInfo" onClick="location.href='findPw.do'"/>
								<span id="btnFont">PW 찾기</span>
							</a>
						</label>
					</div>
				</div>
				<div class="nickName_area">
					<div id="nickName">
						닉네임
					</div>
					<div id="">
						<input id="inputInfo" type="text" v-model="nickName" placeholder="닉네임"></input>
					</div>
				</div>
				<div class="email_area">
					<div id="email">
						이메일
					</div>
					<div>
						<input id="inputInfo" type="text" v-model="email" placeholder="이메일"></input>
					</div>
				</div>
				<div id="findIdPw_btn">
					<div class="findBtn" @click="findId">
						찾기
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
var app = new Vue({ 
    el: '#app',
    data: {
    	nickName: ""
    	, email: ""
    }   
    , methods: {
    	findId : function() {
    		var self = this;
    		var nparmap = {m_nickName: self.nickName, m_email: self.email};
    		$.ajax({
                url: "/login/findid.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.id == undefined){
                		alert("일치하는 회원정보가 없습니다.");
            		} else {
            			alert("회원님의 ID는 '" + data.id + "' 입니다.");
            		}
                	self.nickName = "";
                	self.email = "";
                } 
            });
    		
    	}
    	
    	
    
    }
    , created: function () { <!-- 최초 실행을 정의하는 부분-->
	}
});
</script>