<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
<link rel="stylesheet" href="css/common_contain.css" type="text/css">
<link rel="stylesheet" href="css/join.css" type="text/css">
<link rel="stylesheet" href="css/mypageContainer.css" type="text/css">
<link rel="stylesheet" href="css/modifyInfo.css" type="text/css">
<title>정보수정</title>
</head>

<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
<!-- 로그인한 유저 정보 채워넣어야 하는 것 많음 -->

<body>
	<!-- 헤더 -->
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<!-- 컨테이너 -->
	<!-- 가입할 때 있었던 정보 불러와야 함 -->
	<div class="container">
		<!-- navigator -->
		<jsp:include page="myNavigator.jsp"></jsp:include>
		<!-- 메인 컨테이너 -->
		<div id="smallCategroy">
			<!-- 소분류명 ex. 정보수정, 문의내역 확인 등 -->
			<span class="small_category">정보수정</span>
		</div>
		<div id="modifyInfo_jsp">
			<div id=mainField class="mypageField">
				<div class="modifyField">
					<div class="selPhoto_area">
						<div class="photo">
							<img :src="img" width="150px" height="150px">
						</div>
						<div class="selPhoto">
							<div class="profile_label">
								<span>프로필 사진</span>
							</div>
							<div class="selPhotoBtn">
								<div class="selBtn">
									<!-- 사진 선택하는 거 열려야함 -->
									<span> <input type="file" accept=".gif, .jpg, .png"
										id="file1" name="file1" @change="previewFile"
										style="display: none;"></input> <label for="file1">프로필
											선택</label>
									</span>
								</div>
							</div>
						</div>
					</div>
					<!-- 수정불가 항목 -->
					<div class="id_area">
						<div id="id">아이디</div>
						<div class="userID">
							<!-- 로그인 된 아이디 가져와서 노출 -->
							<span class="userID_deco">{{userId}}</span>
						</div>
					</div>
					<div class="pw_area">
						<div id="pw">비밀번호</div>
						<div class="input_loca">
							<input id="inputInfo" type="password" v-model="changePw"
								placeholder="변경 원하시면 입력해주세요." @keyup="check_essential" />
							<div class="failSuc_notice">
								<span v-if="flg_pw" class="fail">8~20자 영어, 숫자, 특수문자를 사용
									(공백X)</span>
							</div>
						</div>
					</div>
					<div class="rePw_area">
						<div id="rePw">비밀번호 재확인</div>
						<div class="input_loca">
							<input id="inputInfo" type="password" v-model="changeRePw"
								placeholder="비밀번호 재확인" @keyup="check_essential" />
							<div class="failSuc_notice">
								<span v-if="flg_pw_fail" class="fail">비밀번호가 일치하지 않습니다.</span> <span
									v-else-if="flg_pw_success" class="success">비밀번호 일치</span>
							</div>
						</div>
					</div>
					<div class="nickName_area">
						<div id="nickName">닉네임</div>
						<div class="input_loca">
							<!-- 로그인한 유저의 닉네임으로 채워놓기 -->
							<input id="inputInfo" type="text" v-model="changeNickName"
								placeholder="변경 원하시면 입력해주세요. (입력 후 엔터 필수)"
								@keyup="duplicate_nickName" />
							<div class="failSuc_notice">
								<span v-if="flg_nickName_fail" class="fail">이미 있는 닉네임
									입니다.</span> <span v-else-if="flg_nickName_success" class="success">사용가능</span>
							</div>
						</div>
					</div>
					<div class="name_area">
						<div id="name">이름</div>
						<div class="input_loca">
							<input id="inputInfo" type="text" v-model="changeName"
								placeholder="변경 원하시면 입력해주세요." @keyup="join_essential" />
							<div class="failSuc_notice">
								<span v-if="flg_name_fail" class="fail">한글만 입력 가능합니다.</span>
							</div>
						</div>
					</div>
					<div class="birthday_area">
						<div id="birthday">생년월일</div>
						<div class="birth_combo">
							<!-- 임시용, 데이터베이스에서 생년월일 꺼내와서 넣기 -->
							<form>
								<select class="birth_item" name="yyyy"
									v-model="changeBirth_year" id="select_year" @change="lastday">
									<!-- <option value="">년</option> -->
									<option v-for="item in yearList" v-bind:value="item.year">{{item.year}}</option>
								</select>
							</form>
							<form>
								<select class="birth_item" name="mm" v-model="changeBirth_month" id="select_month" @change="lastday">
									<!-- <option value="">월</option> -->
									<option v-for="item in monthList" v-bind:value="item.month">{{item.month}}</option>
								</select>
							</form>
							<form>
								<select class="birth_item" name="dd" v-model="changeBirth_day" id="select_day">
									<!-- <option value="">일</option> -->
									<option v-for="item in dayList" v-bind:value="item.day">{{item.day}}</option>
								</select>
							</form>
						</div>
					</div>
					<div class="gender_area">
						<div id="gender">성별</div>
						<div class="gender_combo">
							<form>
								<select class="genderMF" name="MF" v-model="changeGender">
									<option value="M">남</option>
									<option value="F">여</option>
								</select>
							</form>
						</div>
					</div>
					<div class="email_area">
						<div id="email">이메일</div>
						<div class="input_loca">
							<input id="inputInfo" type="text" v-model="changeEmail"
								placeholder="변경 원하시면 입력해주세요." @keyup="join_essential" />
							<div class="failSuc_notice">
								<span v-if="flg_email" class="fail">이메일 형식에 맞게 입력해주세요.</span>
							</div>
						</div>
					</div>
					<div class="modify_btn">
						<div class="modifyBtn" @click="fnEdit">수정하기</div>
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
	var modifyInfo_jsp = new Vue(
			{
				el : '#modifyInfo_jsp',
				data : {
					logIn : "${userLogin}",
					userId : "${userId}",
					userNickname : "${userNickname}",
					userType : "${userStatus}",
					userName : "${userName}",
					userPw : "${userPassword}",
					userGender : "${userGender}",
					userEmail : "${userEmail}",
					userBirth_year : "${userBirthday}",
					userBirth_day : "${userDd}",
					userBirth_month : "${userMm}",
					proImg : "",
					img : "",

					changePw : "",
					changeRePw : "",
					changeNickName : "",
					changeName : "",
					changeBirth_year : "",
					changeBirth_month : "",
					changeBirth_day : "",
					changeGender : "",
					changeEmail : "",
					flg_pw : false,
					flg_pw_fail : false,
					flg_pw_success : false,
					flg_nickName_fail : false,
					flg_nickName_success : false,
					flg_name_fail : false,
					flg_email : false
					, yearList : []
			        , monthList : []
			        , dayList : []
				},
				methods : {
					fnEdit : function() {
						var self = this;
						console.log(self.img);
						if (self.changePw && self.changeRePw
								&& self.changeNickName && self.changeName
								&& self.changeEmail) {
							if (!self.flg_name_fail
									&& !self.flg_email
									&& ((self.flg_pw_success && !self.flg_pw) || (!self.flg_pw_success && !self.flg_pw))
									&& ((!self.flg_nickName_fail && !self.flg_nickName_success) || (!self.flg_nickName_fail && self.flg_nickName_success))) {
								console.log("규칙 준수 O");
								var nparmap = {
									mId : self.userId,
									profileImg : self.img,
									changePw : self.changePw,
									changeNickName : self.changeNickName,
									changeName : self.changeName,
									changeBirthyear : self.changeBirth_year,
									changeBirthmonth : self.changeBirth_month,
									changeBirthday : self.changeBirth_day,
									changeGender : self.changeGender,
									changeEmail : self.changeEmail
								};
								$.ajax({
									url : "/add.dox",
									dataType : "json",
									type : "POST",
									data : nparmap,
									success : function(data) {
										var form = new FormData();
										form.append("file1",
												$("#file1")[0].files[0]);
										form.append("mId", data.mId);
										console.log(data.mId);
										$.ajax({
											url : "/upload",
											type : "POST",
											processData : false,
											contentType : false,
											data : form,
											success : function(response) {
											},
											error : function(jqXHR) {

											}
										});
										alert("저장되었습니다..");
										location.href = "/mypage.do";
									}
								});
							} else {
								alert("하기 사항 확인 후 다시 시도해주시기 바랍니다.\n1. 비밀번호: 8~20자 영어, 숫자, 특수문자를 사용하세요. (공백X)"
										+ "\n2. 비밀번호 재확인: 일치 여부\n3. 닉네임: 중복확인\n4. 이름: 한글 외 문자 입력여부\n5. 이메일: 입력형식 준수 여부");
							}
						} else {
							alert("모든 정보가 입력되어 있는지 확인해주시기 바랍니다.");
						}
					},
					upload : function() {
						var form = new FormData();
						form.append("file1", $("#file1")[0].files[0]);
						$.ajax({
							url : "/upload",
							type : "POST",
							processData : false,
							contentType : false,
							data : form,
							success : function(response) {
							},
							error : function(jqXHR) {
							}
						});
					},
					fnGetdata : function() {
						var self = this;
						var nparmap = {
							mId : self.userId
						};
						$.ajax({
							url : "/getimg.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								console.log(data.list[0].password);
								console.log(data.list[0].profileImg);
								self.img = data.list[0].profileImg;
								self.changePw = data.list[0].password;
								self.changeRePw = data.list[0].password;
								self.changeNickName = data.list[0].mNickname;
								self.changeName = data.list[0].mName;
								self.changeBirth_year = data.list[0].mBirthday;
								self.changeBirth_month = data.list[0].mBirthmm;
								self.changeBirth_day = data.list[0].mBirthdd;
								self.changeGender = data.list[0].mGender;
								self.changeEmail = data.list[0].mEmail;
							}
						});
					},
					duplicate_nickName : function() {
						var self = this;
						var nparmap = {
							m_nickname : self.changeNickName
						};
						$
								.ajax({
									url : "/join/checkNick.dox",
									dataType : "json",
									type : "POST",
									data : nparmap,
									success : function(data) {
										if (self.changeNickName) {
											if (data.dup == "ok") {
												self.flg_nickName_fail = false;
												self.flg_nickName_success = true;
											}
											if (data.dup == "no") {
												if (self.changeNickName == self.userNickname) {
													self.flg_nickName_fail = false;
													self.flg_nickName_success = false;
												} else {
													self.flg_nickName_fail = true;
													self.flg_nickName_success = false;
												}
											}
										} else {
											self.flg_nickName_fail = false;
											self.flg_nickName_success = false;
										}
									}
								});

					},
					join_essential : function() {
						var self = this;
						const regKor = /^[가-힣]+$/;
						const regEmail = /(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))/;

						/* 이름 */
						if (self.changeName) {
							if (regKor.test(self.changeName)) {
								self.flg_name_fail = false;
							} else {
								self.flg_name_fail = true;
							}
						} else {
							self.flg_name_fail = false;
						}

						/* 이메일 */
						if (self.changeEmail) {
							if (regEmail.test(self.changeEmail)) {
								self.flg_email = false;
							} else {
								self.flg_email = true;
							}
						} else {
							self.flg_email = false;
						}
					},
					check_essential : function() {
						var self = this;
						const regNum = /[0-9]/g;
						const regEng = /[a-z]/ig;
						const regGap = /[\s]/gi;
						const regSpe = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
						if (self.changePw) {
							if (8 <= self.changePw.length <= 20) {
								if (!(regNum.test(self.changePw)
										&& regEng.test(self.changePw)
										&& regSpe.test(self.changePw) && !regSpe
										.test(self.changePw))) {
									self.flg_pw = true;
									self.flg_pw_fail = true;
								} else {
									self.flg_pw = false;
									self.flg_pw_fail = true;
								}
							} else {
								self.flg_pw = true;
								self.flg_pw_fail = true;
							}
						} else {
							self.flg_pw = false;
							self.flg_pw_fail = false;
						}

						if (self.changeRePw) {
							if (self.changeRePw == self.changePw) {
								if (self.changeRePw == self.userPw) {
									self.flg_pw_fail = false;
									self.flg_pw_success = false;
								} else {
									self.flg_pw_fail = false;
									self.flg_pw_success = true;
								}
							} else {
								self.flg_pw_fail = true;
								self.flg_pw_success = false;
							}
						} else {
							self.flg_pw_fail = false;
							self.flg_pw_success = false;
						}
					},
					previewFile : function() {
						var self = this;
						self.img = URL.createObjectURL($("#file1")[0].files[0]);
						console.log(self.img);
					}
					, fnDate : function(){
				    	var self = this;
				    	var start_year="1940";// 시작할 년도
				    	var today = new Date();
				    	var today_year= "2002";
				    	for(var y=today_year; y>=start_year; y--){ //start_year ~ 현재 년도
				    		self.yearList.push({"year" : y});
				    	}
				    	for(var m=1; m<=12; m++){
				    		self.monthList.push({"month" : m});
				    	}
				    	self.dayList = [];
				    	var Year=self.changeBirth_year;
			    		var Month=self.changeBirth_month;
			    		/* var dd=self.changeBirth_day; */
			    		var day=new Date(new Date(Year,Month,1)-86400000).getDate();
			    	    
			   			for(var i=1; i<=day; i++){
			   				self.dayList.push({"day" : i});
			   			}

				    }
				    , lastday : function(){ //년과 월에 따라 마지막 일 구하기 
			    		var self = this;
			    		self.dayList = [];
				    	var Year=self.changeBirth_year;
			    		var Month=self.changeBirth_month;
			    		/* var dd=self.changeBirth_day; */
			    		var day=new Date(new Date(Year,Month,1)-86400000).getDate();
			    	    
			   			for(var i=1; i<=day; i++){
			   				self.dayList.push({"day" : i});
			   			}
			    	}
				},
				created : function() {
					var self = this;
					self.fnGetdata();
					self.fnDate();
					/* self.changePw = self.userPw;
					self.changeRePw = self.userPw;
					self.changeNickName = self.userNickname;
					self.changeName = self.userName;
					self.changeBirth_year = self.userBirth_year;
					self.changeBirth_month = self.userBirth_month;
					self.changeBirth_day = self.userBirth_day;
					self.changeGender = self.userGender;
					self.changeEmail = self.userEmail; */
				}
			});
</script>
