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
<title>문의글수정</title>
</head>
<body>
	<!-- 헤더 -->
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<!-- 컨테이너 -->
	<div id="editcontact_jsp" class="container">
		<!-- 카테고리 -->
		<div role="navigation">
			<jsp:include page="myNavigator.jsp"></jsp:include>
		</div>
		<!-- 소분류명 ex. 정보수정, 문의내역 확인 등 -->
		<div id="smallCategroy"></div>
		<!-- 메인컨테이너 -->
		<div id="mainField">
			<h1>문의 글 수정</h1>
			<table class="board_detail">
				<colgroup>
					<col width="10%" />
					<col width="*" />
				</colgroup>
				<tr>
					<td style="text-align: center;">제목</td>
					<td><input type="text" id="title" name="title"
						v-model="qTitle"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea id="contents" name="contents"
							v-model="qContent"></textarea></td>
				</tr>
			</table>
			<button @click="fnList" class="btn" style="float: right;">목록</button>
			<button @click="fnSave" class="btn" style="float: right;">저장</button>
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
		el : '#editcontact_jsp',
		data : {
			list : [],
			info : [],
			selectedItemList : [],
			qContent : "",
			qTitle : "",
			userId : "${userId}",
			qNo : "${map.qNo}",
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
						self.qTitle = self.info.qTitle;
						self.qContent = self.info.qContent;
					}
				});
			},
			fnList : function() {
				location.href = "/contactlist.do";
			},
			fnSave : function() {
				var self = this;
				var nparmap = {
					qTitle : self.qTitle,
					qContent : self.qContent,
					qNo : self.qNo
				};
				$.ajax({
					url : "/editcontact.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert("저장되었습니다..");
						location.href = "/contactlist.do";
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