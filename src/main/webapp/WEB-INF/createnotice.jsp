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
<title>Insert title here</title>
</head>
<body>
		<div>
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<div class="container">
			<div role="navigation">
				<!-- 카테고리 -->
				<jsp:include page="myNavigator.jsp"></jsp:include>
			</div>
			<div id="mainField" class="adminField">
				<div id="createnotice_jsp">
				<h1>공지글 작성</h1>
				<table class="board_title">
					<colgroup>
						<col width="10%" />
						<col width="70%" />
					</colgroup>
					<tr>
						<td style="text-align: center;">제목</td>
						<td><input type="text" id="title" name="title"
							v-model="title"></td>
					</tr>
				</table>

				<table class="board_detail">
					<tr>
						<td colspan="2"><textarea id="contents" name="contents"
								v-model="content"></textarea></td>
					</tr>
				</table>
				<button @click="fnSave" class="btn" style="float: right;">제출</button>
				<button @click="fnList" class="btn" style="float: right;">목록</button>
			</div>
		</div>
	</div>
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#createnotice_jsp',
		data : {
			list : [],
			content : "",
			title : "",
			userId : "${userId}",
			type :"${userStatus}",
			nickname : "${userName}"
		},
		methods : {
			fnSave : function() {
				var self = this;
				var nparmap = {
					bTitle : self.title,
					bContent : self.content,
				};
				$.ajax({
					url : "/addnotice.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert("저장되었습니다..");
						location.href = "/adminNotice.do";
					}
				});

			},
			fnList : function() {
				location.href = "/adminNotice.do";
			}
		},
		created : function() {

		}
	});
</script>
