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
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
<title>수정예정입니당</title>
</head>
<body>
	<!-- 헤더 -->
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<!-- 컨테이너 -->
	<div class="container">
		<div role="navigation">
			<jsp:include page="myNavigator.jsp"></jsp:include>
		</div>
		<div id="smallCategroy">
			<span class="small_category">문의내역</span>
			<!-- 			<span class="detail_smallCategroy" onclick="location.href='creatcontact.do'">문의하기 ▶</span> -->
		</div>
		<!-- 메인컨테이너 -->
		<div id="contactlist_jsp">
			<div id="mainField">
				<div style="margin-bottom: 20px;">
					<select v-model="sort" class="form-control" style="float: right;"
						@change="fnGetList">
						<option value="1">전체</option>
						<option value="2">답변완료</option>
						<option value="3">문의중</option>
					</select>
				</div>
				<div class="card">
					<table class="notice_list">
						<colgroup>
							<col width="2%" />
							<col width="15%" />
							<col width="15%" />
							<col width="15%" />
							<col width="15%" />
							<col width="15%" />
						</colgroup>
						<thead>
							<tr>
								<!--관리자ID판단후 레디오버튼추가  -->
								<th scope="col"></th>
								<th scope="col"><h3>제목</h3></th>
								<th scope="col"><h3>문의내용</h3></th>
								<th scope="col"><h3>작성자</h3></th>
								<th scope="col"><h3>작성일</h3></th>
								<th scope="col"><h3>답변여부</h3></th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="(item, index) in list">
								<td><input type="radio" name="selectContact"
									v-bind:value="item" v-model="selectedItemList"></td>
								<!--@click="fnView(item)"  -->
								<td @click="fnView(item)">{{item.qTitle}}</td>
								<td @click="fnView(item)" class="name1">{{item.qContent}}</td>
								<td @click="fnView(item)">{{item.mId}}</td>
								<td @click="fnView(item)">{{item.createDate}}</td>
								<td @click="fnView(item)" v-if="item.aContent != null">답변완료</td>
								<td @click="fnView(item)" v-else>문의중</td>

							</tr>
						</tbody>
					</table>
				</div>
				<template>
					<paginate :page-count="pageCount" :page-range="3" :margin-pages="2"
						:click-handler="changePage" :prev-text="'<'" :next-text="'>'"
						:container-class="'pagination'" :page-class="'page-item'">
					</paginate>
				</template>
				<div>
					<button @click="fnRemove" style="float: right; margin-right: 5px;">삭제</button>
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
	Vue.component('paginate', VuejsPaginate)
	var contactlist_jsp = new Vue({
		el : '#contactlist_jsp',
		data : {
			list : [],
			selectedItemList : [],
			selectPage : 1,
			pageCount : 1,
			sort : "1",
			qNo : "",
			type : "${userStatus}"
		/* ,userId : "${userId}" */
		},
		methods : {
			fnGetList : function() {
				var self = this;
				var startNum = ((self.selectPage - 1) * 10);
				var lastNum = self.selectPage * 10;
				var nparmap = {
					mId : self.userId,
					sort : self.sort,
					startNum : startNum,
					lastNum : lastNum
				};
				$.ajax({
					url : "/admincontactlist.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						self.pageCount = Math.ceil(data.cnt / 10);

					}
				});
			},
			changePage : function(pageNum) {
				var self = this;
				self.selectPage = pageNum;
				var startNum = ((pageNum - 1) * 10);
				var lastNum = pageNum * 10;
				var nparmap = {
					sort : self.sort,
					startNum : startNum,
					lastNum : lastNum
				};
				$.ajax({
					url : "/admincontactlist.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						self.pageCount = Math.ceil(data.cnt / 10);
					}
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
			fnRemove : function() {
				var self = this;
				var nparmap = {
					qNo : self.selectedItemList.qNo
				};
				$.ajax({
					url : "/admindelcontact.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert("삭제되었습니다.");
						self.selectedItemList = [];
						self.fnGetList();
					}
				});
			},
			fnView : function(item) {
				var self = this;
				self.pageChange("./adminselectcontact.do", {
					qNo : item.qNo
				});
			}
		},
		created : function() {
			var self = this;
			self.fnGetList();

		}
	});
</script>