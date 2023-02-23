<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="css/common_contain.css" type="text/css">
<link rel="stylesheet" href="css/contactlist.css" type="text/css">
<link rel="stylesheet" href="css/notice.css" type="text/css">
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
<title>문의내역</title>
</head>
<body>
	<!-- 헤더 -->
	<div>
		<jsp:include page="header.jsp"></jsp:include>
		<!-- 컨테이너 -->
		<div class="container">
			<!-- 카테고리 -->
			<div role="navigation">
				<jsp:include page="myNavigator.jsp"></jsp:include>
			</div>
			<!-- 소분류명 ex. 정보수정, 문의내역 확인 등 -->
			<div id="smallCategroy"></div>
			<!-- 메인컨테이너 -->
			<div id="mainField">
				<div id="app">
					<h1>문의 내역 확인</h1>
					<div class="notice_list">
						<h2>제목: {{info.qTitle}}</h2>
						<h3 v-if="info.aContent != null">{{info.createDate}} 답변완료</h3>
						<h3 v-else>{{info.createDate}} 문의중</h3>
					</div>
					<div style="width: 100%; min-height: 300px;" class="notice_list">
						{{info.qContent}}</div>
					<div class="notice_list">
						<h3>Admin {{info.aCreateDate}}</h3>
					</div>
					<div style="width: 100%; min-height: 100px;"
						v-if="info.aContent != null">
						<b>{{info.aContent}}</b>
					</div>
					<div v-else>
						<i style="color: #999999">답변하기</i>
						<td colspan="2"><textarea rows="10" cols="139" id="content"
								name="content" v-model="content"></textarea></td>
						<button @click="fnSave" class="btn" style="float: right;">답변
							제출</button>
					</div>
					<!-- 			<div class="card"> -->
					<!-- 					<table class="notice_list"> -->
					<!-- 						<colgroup> -->
					<!-- 							<col width="2%" /> -->
					<!-- 							<col width="15%" /> -->
					<!-- 							<col width="15%" /> -->
					<!-- 							<col width="15%" /> -->
					<!-- 							<col width="15%" /> -->
					<!-- 							<col width="15%" /> -->
					<!-- 						</colgroup> -->
					<!-- 						<thead> -->
					<!-- 							<tr> -->
					<!-- 								관리자ID판단후 레디오버튼추가  -->
					<!-- 								<th scope="col"></th> -->
					<!-- 								<th scope="col"><h3>문의내용</h3></th> -->
					<!-- 								<th scope="col"><h3>작성자</h3></th> -->
					<!-- 								<th scope="col"><h3>작성일</h3></th> -->
					<!-- 							</tr> -->
					<!-- 						</thead> -->
					<!-- 						<tbody> -->
					<!-- 							<tr v-for="(item, index) in list"> -->
					<!-- 								<td><input type="radio" name="reviewContact" -->
					<!-- 									v-bind:value="item" v-model="selectedItemList"></td> -->
					<!-- 								@click="fnView(item)"  -->
					<!-- 								<td  @click="fnView(item)" class="name1">{{item.aContent}}</td> -->
					<!-- 								<td  @click="fnView(item)">{{item.mNickname}}</td> -->
					<!-- 								<td  @click="fnView(item)">{{item.createDate}}</td> -->
	
					<!-- 							</tr> -->
					<!-- 						</tbody> -->
					<!-- 					</table> -->
					<!-- 				</div> -->
					<button @click="fnList" class="btn" style="float: right;">목록</button>
					<!-- 			<button v-if="info.aContent == null" @click="fnEdit" class="btn" style="float: right;">수정</button> @click="fnEdit" -->
	
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
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			info : [],
			content : "",
			qNo : "${map.qNo}",
			userId : "${userId}",
			type : "${userStatus}"
		},
		methods : {
			fnGetContact : function() {
				var self = this;
				var nparmap = {
					qNo : self.qNo
				};
				$.ajax({
					url : "/selectcontact.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.info = data.question;
						console.log(self.info);
					}
				});
			},
			fnList : function() {
				location.href = "/adminContactlist.do";
			},
			fnEdit : function() {
				var self = this;
				self.pageChange("./editcontact.do", {
					qNo : self.qNo
				});
			},
			pageChange : function(url, param) {
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
			},
			fnSave : function() {
				var self = this;
				var nparmap = {
					content : self.content,
					// 					mId : self.userId
					qNo : self.qNo
				};
				console.log(nparmap);
				$.ajax({
					url : "/admincommentcontact.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert("저장되었습니다..");
						// 						location.href = "/adminselectcontact.do";
						self.fnGetContact();
					}
				});

			}
		},

		created : function() {
			var self = this;
			self.fnGetContact();

		}
	});
</script>