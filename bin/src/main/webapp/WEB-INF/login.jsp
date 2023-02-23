<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="css/login.css" type="text/css">

<title>Insert title here</title>
</head>
<body>
	<!-- 로그인_header -->
	<div id="logInHeader" role="banner">
		<h1 onclick="location.href='main.do'">Destination's me</h1>
	</div>
	<!-- 로그인 컨테이너 -->
	<div id="logInContainer">
		<div id="app">
			<div id="logInField">
				<div class="inputInfo">
					<div>
						<input type="text" v-model="id" placeholder="아이디"></input>
					</div>
					<div>
						<input type="password" v-model="password"
							onkeyup="if(window.event.keyCode==13){test()}" placeholder="비밀번호"></input>
					</div>
				</div>

				<div class="logIn_btn">
					<div id="loginBtn" @click="fnLogin">로그인</div>
					<!-- 태그변경(button > 일반태그: @click="fnLogin" 혹시몰라서 주석처리해놓음-->
				</div>
				<div class="search_join">
					<div id="searchJoin">
						<a href="join.do"> <span class="searchJoin_font">회원가입</span>
						</a>
					</div>
					<span class="seperateLine"> | </span>
					<div id="searchJoin">
						<a href="findId.do"> <span class="searchJoin_font">ID/PW
								찾기</span>
						</a>
					</div>
				</div>
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
		el : '#app',
		data : {
			list : [],
			id : "",
			password : "",
			name : ""
		},
		methods : {
			fnLogin : function() {
				var self = this;
				var nparmap = {
					mId : self.id,
					password : self.password
				};
				$.ajax({
					url : "/login.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data.list);
						if (data.result == "성공") {
							alert("로그인 성공!!");
							self.name = data.list[0].mName;
							if (data.list[0].status == "m") {
								self.pageChange("/main.do", {});
							}else{
								self.pageChange("/adminNotice.do", {});
							}
							/* 	self.pageChange("/contactlist.do",{});  */
						} else {
							alert("로그인 실패!!");
						}
					}
				});
				console.log(self.list);
			},
			fnJoin : function() {
				var self = this;
				self.pageChange("/join.do", {
					id : self.id
				});
			},
			fnFindInfo : function() {
				var self = this;
				self.pageChange("/findIdPw.do", {});
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
		},
		created : function() {

		}
	});
		function test() {
		var self = app;
       	self.fnLogin();
		}
</script>