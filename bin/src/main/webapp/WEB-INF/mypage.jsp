<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="css/common_contain.css" type="text/css">
<link rel="stylesheet" href="css/join.css" type="text/css">
<link rel="stylesheet" href="css/mypageContainer.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<!-- 헤더 -->
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<!-- 컨테이너 -->
	<div class="container">
		<div role="navigation">
			<!-- 카테고리 -->
			<jsp:include page="myNavigator.jsp"></jsp:include>
		</div>
		<div id="smallCategroy">
			<!-- 소분류명 ex. 정보수정, 문의내역 확인 등 -->
			<span class="small_category">정보수정</span>
		</div>
		<!-- 메인컨테이너 -->
		<div id="mypage_jsp">
			<div id="mainField" class="mypageField">
				<div id="modifyPwInputField">
					<div class="pwField">
						<div id="pwCheck">
							<span class="pwCheck_detail">비밀번호 확인</span>
						</div>
						<div id="pwInput">
							<input type="password" v-model="inputPW" onkeyup="if(window.event.keyCode==13){test()}" @keyup="matchPW"
								placeholder="비밀번호를 입력해주세요."></input>
						</div>
						<div class="pwWarn">
							<span v-if="flg" class="fail">비밀번호가 일치하지 않습니다.</span>
						</div>
						<div class="enter_modify">
							<div id="inModi_btn" @click="goModifyInfo">
								<span>확인</span>
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
	var mypage_jsp = new Vue({
		el : '#mypage_jsp',
		data : {
			list : [],
			inputPW : "",
			flg : false,
			logIn : "${userLogin}",
			userId : "${userId}",
			nickname : "${userNickname}",
			type : "${userStatus}",
			name : "${userName}",
			userPw : "${userPassword}",
			userGender : "${userGender}",
			userEmail : "${userEmail}",
			userBirthday : "${userBirthday}",
			userDd : "${userDd}",
			userMm : "${userMm}",
			checkPw : ""

		},
		methods : {
			goModifyInfo : function() {
				var self = this;
				if (self.inputPW) {
					if (!self.flg) {
						alert("수정페이지로 이동합니다.");
						self.inputPW = "";
						self.flg = false;
						self.pageChange("/modifyInfo.do", {});
					} else {
						alert("비밀번호가 일치하지 않습니다.");
						self.inputPW = "";
						self.flg = false;
					}
				} else {
					alert("비밀번호를 입력해주세요.");
				}

			},
			matchPW : function() {
				var self = this;

				if (self.inputPW) {
					if (self.inputPW) {
						if (self.checkPw == self.inputPW) {
							self.flg = false;
						} else {
							self.flg = true;
						}
					} else {
						self.flg = false;
					}
				} else {
					self.flg = false;
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
			},
			fnGetdata : function() {
				var self = this;
				var nparmap = {
					mId : self.userId,
					/* password : self.userPw */
				};
				$.ajax({
					url : "/getimg.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.checkPw = data.list[0].password;
						console.log(self.checkPw);
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.fnGetdata();
		}	
	});
	function test() {
		var self = mypage_jsp;
		self.goModifyInfo();
		}
</script>

