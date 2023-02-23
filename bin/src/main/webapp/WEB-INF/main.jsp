<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
<link rel="stylesheet" href="css/mainCalendar.css" type="text/css">
<link rel="stylesheet" href="css/mainContainer.css" type="text/css">
<title>Destination's me</title>
</head>

<body>
	<!-- 헤더 -->
	<div>
		<jsp:include page="mainHeader.jsp"></jsp:include>
	</div>

	<!-- 컨테이너 -->
	<div id="main_jsp" class="container">
		<div class="float_clear" role="main">
			<!-- left  -->
			<div id="container_LEFT">
				<div id="recommend_label">
					<label> ✨ 여행지 추천해드려요! 😎 </label>
				</div>
				<div id="recommend_travelSpot">
					<div class="travelSpot_list">
						<div id="incheon" class="travelSpot">
							<a href="https://itour.incheon.go.kr/main/main.do"
								target='_blank' class="travelSpot_item"> </a>
						</div>
						<div id="seoul" class="travelSpot">
							<a
								href="https://blog.naver.com/PostList.nhn?isHttpsRedirect=true&blogId=haechiseoul&from=postList&categoryNo=52"
								target='_blank' class="travelSpot_item"> </a>
						</div>
						<div id="gangwon" class="travelSpot">
							<a href="https://www.gangwon.to/gwtour" target='_blank'
								class="travelSpot_item"> </a>
						</div>
						<div id="gyeonggi" class="travelSpot">
							<a href="https://ggtour.or.kr/main.php" target='_blank'
								class="travelSpot_item"> </a>
						</div>
						<div id="chungcheong" class="travelSpot">
							<a href="https://tour.chungnam.go.kr/html/kr/" target='_blank'
								class="travelSpot_item"> </a>
						</div>
						<div id="gyeongsang" class="travelSpot">
							<a
								href="https://www.visitbusan.net/index.do?menuCd=DOM_000000202002000000"
								target='_blank' class="travelSpot_item"> </a>
						</div>
						<div id="jeolla" class="travelSpot_Jeolla">
							<a href="https://tour.jb.go.kr/index.do" target='_blank'
								class="travelSpot_item"> </a>
						</div>
						<div id="jeju" class="travelSpot_Jeju">
							<a href="https://www.visitjeju.net/kr" target='_blank'
								class="travelSpot_Jeju"> </a>
						</div>
					</div>
				</div>
			</div>
			<!-- right -->
			<div id="container_RIGHT" class="column_right">
				<div v-if="logIn == 1" class="login_area">
					<div id="login">
						<div id="login_btn" onclick="location.href='login.do'">로그인</div>
					</div>
					<div id="memInfo_join">
						<span id="memInfo" onclick="location.href='join.do'"> 회원가입
						</span> <span id="join" onclick="location.href='findId.do'"> ID/PW
							찾기 </span>
					</div>
				</div>
				<div v-else-if="logIn == 0" class="logOn_area">
					<div class="logOn">
						<div class="profile_photo">
							<img :src="proImg" / width="120px" height="120px">
						</div>
					</div>
					<div class="memInfo_logOn">
						<div class="name_logout">
							<div class="memName">{{nickname}}님</div>
							<div class="logOut_btn" @click="fnLogout">
								<!-- 클릭하면 메인페이지이동인데(또는 새로고침), 로그인 버튼 보이는 거로 노출되게 하면 될 것 같아요 -->
								로그아웃
							</div>
						</div>
						<div class="go_mypage" onclick="location.href='mypage.do'">
							마이페이지</div>
					</div>
				</div>
				<div>
					<!-- 캘린더 -->
					<div class="wrapper">
						<div class="container-calendar">
							<h3 id="monthAndYear"></h3>
							<div class="button-container-calendar">
								<button id="previous" onclick="previous()">&#8249;</button>
								<button id="next" onclick="next()">&#8250;</button>
							</div>
							<table class="table-calendar" id="calendar" data-lang="en">
								<thead id="thead-month"></thead>
								<tbody id="calendar-body"></tbody>
							</table>
							<div class="footer-container-calendar">
								<label for="month">Jump To: </label> <select id="month"
									onchange="jump()">
									<option value=0>Jan</option>
									<option value=1>Feb</option>
									<option value=2>Mar</option>
									<option value=3>Apr</option>
									<option value=4>May</option>
									<option value=5>Jun</option>
									<option value=6>Jul</option>
									<option value=7>Aug</option>
									<option value=8>Sep</option>
									<option value=9>Oct</option>
									<option value=10>Nov</option>
									<option value=11>Dec</option>
								</select> <select id="year" onchange="jump()"></select>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="float_clear" role="main">
			<!-- bottom -->
			<div id="container_BOTTOM">
				<div id="bottmBanner">
					<a href="introduce.do"></a>
				</div>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>

<script type="text/javascript">
var main_jsp = new Vue({ 
    el: '#main_jsp',
    data: {
    	list : [],
    	logIn: "1"  
    	,userId : "${userId}"
    	,nickname : "${userNickname}"
    	,type : "${userStatus}"
    	,proImg :""
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
	        	 alert("로그아웃 되었습니다.");
	         } 
	     });
	},fnGetdata : function(){
		var self = this;
		var nparmap = { mId : self.userId };
	     $.ajax({
	         url:"/getimg.dox",
	         dataType:"json",	
	         type : "POST", 
	         data : nparmap,
	         success : function(data) {
	        	self.proImg = data.list[0].profileImg;
	        	self.nickname =data.list[0].mNickname;
	        	self.logIn = 0 ;  
	         } 
	     });
	}
}
    , created: function () { <!-- 최초 실행을 정의하는 부분-->
	var self = this;
	if(self.userId){
	self.fnGetdata();
	}
    }
});

function generate_year_range(start, end) {
    var years = "";
    for (var year = start; year <= end; year++) {
        years += "<option value='" + year + "'>" + year + "</option>";
    }
    return years;
}

today = new Date();
currentMonth = today.getMonth();
currentYear = today.getFullYear();
selectYear = document.getElementById("year");
selectMonth = document.getElementById("month");


createYear = generate_year_range(1970, 2050);
/** or
 * createYear = generate_year_range( 1970, currentYear );
 */

document.getElementById("year").innerHTML = createYear;

var calendar = document.getElementById("calendar");
var lang = calendar.getAttribute('data-lang');

var months = "";
var days = "";

var monthDefault = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

var dayDefault = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

if (lang == "en") {
    months = monthDefault;
    days = dayDefault;
} else if (lang == "id") {
    months = ["Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember"];
    days = ["Ming", "Sen", "Sel", "Rab", "Kam", "Jum", "Sab"];
} else if (lang == "fr") {
    months = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"];
    days = ["dimanche", "lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi"];
} else {
    months = monthDefault;
    days = dayDefault;
}


var $dataHead = "<tr>";
for (dhead in days) {
    $dataHead += "<th data-days='" + days[dhead] + "'>" + days[dhead] + "</th>";
}
$dataHead += "</tr>";

//alert($dataHead);
document.getElementById("thead-month").innerHTML = $dataHead;


monthAndYear = document.getElementById("monthAndYear");
showCalendar(currentMonth, currentYear);



function next() {
    currentYear = (currentMonth === 11) ? currentYear + 1 : currentYear;
    currentMonth = (currentMonth + 1) % 12;
    showCalendar(currentMonth, currentYear);
}

function previous() {
    currentYear = (currentMonth === 0) ? currentYear - 1 : currentYear;
    currentMonth = (currentMonth === 0) ? 11 : currentMonth - 1;
    showCalendar(currentMonth, currentYear);
}

function jump() {
    currentYear = parseInt(selectYear.value);
    currentMonth = parseInt(selectMonth.value);
    showCalendar(currentMonth, currentYear);
}

function showCalendar(month, year) {

    var firstDay = ( new Date( year, month ) ).getDay();

    tbl = document.getElementById("calendar-body");

    
    tbl.innerHTML = "";

    
    monthAndYear.innerHTML = months[month] + " " + year;
    selectYear.value = year;
    selectMonth.value = month;

    // creating all cells
    var date = 1;
    for ( var i = 0; i < 6; i++ ) {
        
        var row = document.createElement("tr");

        
        for ( var j = 0; j < 7; j++ ) {
            if ( i === 0 && j < firstDay ) {
                cell = document.createElement( "td" );
                cellText = document.createTextNode("");
                cell.appendChild(cellText);
                row.appendChild(cell);
            } else if (date > daysInMonth(month, year)) {
                break;
            } else {
                cell = document.createElement("td");
                cell.setAttribute("data-date", date);
                cell.setAttribute("data-month", month + 1);
                cell.setAttribute("data-year", year);
                cell.setAttribute("data-month_name", months[month]);
                cell.className = "date-picker";
                cell.innerHTML = "<span>" + date + "</span>";

                if ( date === today.getDate() && year === today.getFullYear() && month === today.getMonth() ) {
                    cell.className = "date-picker selected";
                }
                row.appendChild(cell);
                date++;
            }


        }

        tbl.appendChild(row);
    }

}

function daysInMonth(iMonth, iYear) {
    return 32 - new Date(iYear, iMonth, 32).getDate();
}
</script>