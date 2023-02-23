<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>키워드로 장소검색하고 목록으로 표출하기</title>
<link rel="stylesheet" href="css/finalRecommendMap.css">
<script src="js/jquery.js"></script>
<!-- <link rel="stylesheet" href="css/common_contain.css" type="text/css">
<link rel="stylesheet" href="css/selectpjContain.css" type="text/css">
<link rel="stylesheet" href="css/randomPlan.css" type="text/css">
<link rel="stylesheet" href="css/finalRecommend.css" type="text/css"> -->
</head>
<body>
	<div id="blog">
		<input type="text" v-model="keywords"></input>
		<button @click="fnGet">검색하기</button>
		<h5></h5>
		
	</div>

	<script src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
		crossorigin="anonymous">
	</script>
	<script>
		var app = new Vue({
		el : '#blog',
		data : {
			keywords : "여수"
				},
		methods : {
			fnGet : function() {
				var self = this;
				$('h5').empty();
				$.ajax({
					method : "GET",
					url : "https://dapi.kakao.com/v2/search/image",
					data : {query : self.keywords},
					headers : {Authorization : "KakaoAK c55c53b54e44d68604d8bca10977499b"}
					}).done(
							function(msg) {
							/* $("h5").append("<h2>"+ msg.documents[0].title+ "</h2>");
							$("h5").append("<h2>"+ msg.documents[0].url+ "</h2>");
							$("h5").append("<h4>"+ msg.documents[0].contents+ "</h4>"); */
							/* $("p").append("<strong>" + msg.documents[0].url + "</strong>"); */
							var img =  msg.documents[0].image_url;
						/* referrerpolicy='no-referrer' 외부링크 이미지가 락이 걸려서 추가해야됨 */
							 $( "h5" ).append( "<img  referrerpolicy='no-referrer' src='"+ msg.documents[0].image_url+"' width = 200px ; height = 300px/>");
							 $( "h5" ).append( "<img referrerpolicy='no-referrer' src='"+ msg.documents[1].image_url+"' width = 200px; height = 300px/>" );
							 $( "h5" ).append( "<img referrerpolicy='no-referrer' src='"+ msg.documents[2].image_url+"' width = 200px; height = 300px/>" );
							 $( "h5" ).append( "<img referrerpolicy='no-referrer' src='"+ msg.documents[3].image_url+"' width = 200px; height = 300px/>" );
							 $( "h5" ).append( "<img referrerpolicy='no-referrer' src='"+ msg.documents[4].image_url+"' width = 200px; height = 300px/>" );
							 $( "h5" ).append( "<img referrerpolicy='no-referrer' src='"+ msg.documents[5].image_url+"' width = 200px; height = 300px/>" );
							 $( "h5" ).append( "<img referrerpolicy='no-referrer' src='"+ msg.documents[6].image_url+"' width = 200px; height = 300px/>" );
							 $( "h5" ).append( "<img referrerpolicy='no-referrer' src='"+ msg.documents[7].image_url+"' width = 200px; height = 300px/>" );
						});
			}
		},created : function() {
			var self = this;
			self.fnGet();
	      }
		});
	</script>
</body>
</html>


