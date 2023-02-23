<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/header.css" type="text/css">
		<title>Insert title here</title>
	</head>
	
	<body>
		<div id="header_jsp">
			<div class="header" role="banner">
				<div class="banner_area">
					<div class="main_logo">
						<h1 v-if="type == 'a'">Destination's me</h1>
						<h1 v-else onclick="location.href='main.do'">Destination's me</h1>
					</div>
					<div id="seperate">></div>
					<div class="mediumCategroy">
						<span>{{ category }}</span>
					</div>
				</div>
				<div class="my_logout">
					<div v-if="type == 'm'" id="my_logout">
						<span> {{nickname}} 님 </span>
						<span id="my_seperate"> | </span> 
						<span class="cursor_on"	onclick="location.href='mypage.do'"> 마이페이지 </span> 
						<span id="my_seperate"> | </span> 
						<span class="cursor_on"	@click="fnLogout"> 로그아웃 <!-- alert 후 ok > 메인페이지 이동 -->
						</span>
					</div>
					<div v-else-if="type == 'm' || type == ''" class="my_logIn" onclick="location.href='login.do'">로그인</div>
					<div v-else-if="type == 'a'" class="admin_logOut" @click="fnLogout">로그아웃</div>
				</div>
			</div>
		</div>
	</body>
</html>
<script type="text/javascript">
var header_jsp = new Vue({ 
    el: '#header_jsp',
    data: {
   		logIn: "${userLogin}"  
       	,userId : "${userId}"
       	,nickname : "${userNickname}"
       	,type : "${userStatus}"
       	/* ,proImg : "${userImg}" */
    	, category: ""
    }   
    , methods: {
    	fnLogout : function(){
    		var self = this;
    		var nparmap = {};
    	     $.ajax({
    	         url:"/logout.dox",
    	         dataType:"json",	
    	         type : "POST", 
    	         data : nparmap,
    	         success : function(data) {
    	        	 self.logIn = "1";
     	        	location.href='/main.do';
    	        	
    	         } 
    	     });
    	}
    }
    , created: function () { <!-- 최초 실행을 정의하는 부분-->
    	var self = this;
    	var para = document.location.href.split("http://localhost:8080/");
	    if(para[1] == "mypage.do" || para[1] == "modifyInfo.do" || para[1] == "contactlist.do" || para[1] == "bucket.do" || para[1] == "myplanner.do") {
	    	self.category = "마이페이지";	
	    } else if (para[1] == "notice.do" || para[1] == "noticeview.do") {
	    	self.category = "공지사항";	
	    } else if (para[1] == "introduce.do") {
	    	self.category = "소개";
	    } else if (para[1] == "adminNotice.do") {
	    	self.category = "관리자";
	    }else if (para[1] == "adminContactlist.do") {
	    	self.category = "관리자";
	    }  else {
	    	self.category = "플래너";
	    }
	}
});
</script>