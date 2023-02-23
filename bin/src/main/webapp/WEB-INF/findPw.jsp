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
		<!-- PW 라디오버튼 선택시 -->
		<div id="app" class="findContainer">
			<div id="findField_PW">
				<div class="radioBtn">
					<div id="idBtn">
						<label>
							<a href="findId.do">
								<input type='radio' name='find' value="id" class="findInfo" onClick="location.href='findId.do'"/>
								<span id="btnFont">ID 찾기</span>	
							</a>
						</label>
					</div>
					<div id="pwBtn">
						<label>
							<input type='radio' name='find' value="pw" checked class="findInfo" />
							<span id="btnFont">PW 찾기</span>					
						</label>
					</div>
				</div>
				<div class="nickName_area">
					<div id="nickName">
						닉네임
					</div>
					<div>
						<input id="inputInfo" type="text" v-model="nickName" placeholder="닉네임"></input>
					</div>
				</div>
				<div class="id_area">
					<div id="id">
						아이디
					</div>
					<div>
						<input id="inputInfo" type="text" v-model="id" placeholder="아이디"></input>
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
					<div class="findBtn" @click="findPw">
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
        , id: ""
    	, email: ""
    }   
    , methods: {
    	findPw : function() {
    		var self = this;
    		var nparmap = {m_nickName: self.nickName, m_id: self.id, m_email: self.email};
    		$.ajax({
                url: "/login/findpw.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	if(data.pw == null){
                		alert("일치하는 회원정보가 없습니다.");
            		} else {
            			alert("비밀번호 변경 페이지로 이동합니다.");
            			self.pageChange("/modifyPw.do", {})
            		}
                	self.nickName = "";
                	self.id = "";
                	self.email = "";
                } 
            });
    		
    	}
	    , pageChange : function(url, param) {
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