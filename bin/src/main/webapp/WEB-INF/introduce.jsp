<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
		<link rel="stylesheet" href="css/introduceContain.css" type="text/css">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 헤더 -->
		<div>
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<!-- 컨테이너 -->
		<div id="infroduce_jsp" >
			<div id="fontDeco">
				<p>
					반가워요!
				</p>
				<p>
					저희 사이트를 방문해주셔서 감사합니다 :)
				</p></br>
			</div>
			<div id="fontDeco">
				<p>
					Destination's me 는 mbti 를 이용하여
				</p>
				<p>
					혼자다니는 여행을 즐기시는 분들에게
				</p>
				<p>
					더 즐겁고 나에게 착 ! 맞는 여행계획을
				</p>
				<p>
					세울 수 있는 플래너 입니다.
				</p></br>
			</div>
			<div id="fontDeco">
				<p>
					mbti 가 뭔지 모른다고요?
				</p>
				<p>
					혼자 다니는 여행이 처음이라고요?
				</p>
				<p>
				정말 정말 괜찮아요 !
				</p></br>
			</div>
			
			<!-- 이미지 크기 추후 수정할 예정 -->
			<div class="example_img"> </div>
			
			<div id="fontDeco">
				<p>
					이렇게 알기 쉽게 선택할 수 있고,
				</p>
				<p>
					이에 따르는 다양한 것들을 추천해드려요!
				</p></br>
			</div>
			<div id="fontDeco">
				<p>
					그리고, 
				</p>
				<p>
					평소 '나' 의 모습을 곰곰히 생각해보면
				</p>
				<p>
					충분히 알 수 있는 것들이랍니다 :)
				</p></br>
			</div>
			<div id="fontDeco">
				<p>
					이렇게 '나' 에 대해 생각하면서
				</p>
				<p>
					'나' 를 위한 여행 계획을 세워 보세요!
				</p></br>
			</div>
			<div id="fontDeco">
				<p>
					'나' 에 대해 한 걸음 더 알아가는 것이
				</p>
				<p>
					저희의 바램 입니다 😘
				</p></br>
			</div>
			<div id="fontDeco">
				<p>
					그러면 이제 '나' 를 위한 여행을 떠나볼까요 ~ ?
				</p></br>
			</div>
			<div class="go_plan" onclick="location.href='selectpj.do'">
				플랜 만들러 GO!
			</div>
			<div class="notice_introduce">
				<span>* 본 서비스는 로그인을 해야 저장이 됩니다.</span>
			</div>
			
			<div class="seperate_line"> </div>
			
			<div class="inviteJoin">
				<div class="invite">
					<span>아직 Destination's me 의 회원이 아니라면?</span>
				</div>
				<div class="inviteBtn" onclick="location.href='join.do'">
					회원가입
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
var infroduce_jsp = new Vue({ 
    el: '#infroduce_jsp',
    data: {
    }   
    , methods: {
    	}
    , created: function () { <!-- 최초 실행을 정의하는 부분-->
	}
});
</script>