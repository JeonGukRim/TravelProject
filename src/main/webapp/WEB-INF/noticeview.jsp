<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
		<link rel="stylesheet" href="css/common_contain.css" type="text/css">
		<link rel="stylesheet" href="css/notice.css" type="text/css">
<!-- 		<link rel="stylesheet" href="css/myNavigator.css" type="text/css"> -->
		<script src="https://unpkg.com/vuejs-paginate@latest"></script>
		<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
		<title>공지사항</title>
	</head>
<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<!-- 컨테이너 -->
	<div class="container">
		<div role="navigation">
			<jsp:include page="navigator.jsp"></jsp:include>
		</div>
		<div id="app">
			<div id="mainField">
				<div class="notice_list">
					<h1>{{info.bTitle}}</h1>
					<h2>관리자 {{info.createDate}} 조회 : {{info.bView}}</h2>
				</div>
				<div>{{info.bContent}}</div>
				<div>
					<button v-if="type == 'a'" @click="fnEdit" id="btn_postion"
						style="float: right; margin-bottom: 200px; margin-right: 56px;">수정</button>
					<button @click="fnList" id="btn_postion"
						style="float: right; margin-bottom: 200px;">목록</button>
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
var app = new Vue({ 
    el: '#app',
    data: {
    	list:[]
    	,info:[]
    	,bno : "${map.bNo}"
    	,type : "${userStatus}"
    }   
    , methods: {
    	fnGetNotice : function(){
            var self = this;
            var nparmap = {bNo : self.bno};
            $.ajax({
                url:"/noticeview.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.info = data.notice;
	                
                }
            }); 
        }
	, fnList : function(){
		location.href="/notice.do";
	}, fnEdit : function(){
		var self = this;
		self.pageChange("./editNotice.do", {bNo : self.bno});
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
    	}
    , created: function () { <!-- 최초 실행을 정의하는 부분-->
	    var self = this;
		self.fnGetNotice();
	}
});
</script>