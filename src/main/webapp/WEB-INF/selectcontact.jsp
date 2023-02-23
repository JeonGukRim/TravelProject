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
	</div>
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
					<i style="color: #999999">답변대기중...</i>
				</div>
				<button @click="fnList" class="btn" style="float: right;">목록</button>
				<button v-if="info.aContent == null" @click="fnEdit" class="btn"
					style="float: right;">수정</button>
				<!-- @click="fnEdit" -->
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
			qNo : "${map.qNo}",
			userId : "${userId}"
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
					}
				});
			},
			fnList : function() {
				location.href = "/contactlist.do";
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
			}
		},
		created : function() {
			var self = this;
			self.fnGetContact();

		}
	});
</script>