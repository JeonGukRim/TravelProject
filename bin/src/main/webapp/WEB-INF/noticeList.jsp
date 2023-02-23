<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="css/notice.css" type="text/css">
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
<title>공지사항</title>
</head>
<body>
	<div id="noticeList_jsp">
		<tr>
			<td><input type="text" class="input1" v-model="searchText">
				<!-- id="title"  name="title" -->
				<button @click="fnSearch">
					<img src="/manageimage/search.png" height="30" width="30">
				</button> <select v-model="sort" class="form-control" style="float: right;"
				@change="fnGetList">
					<option value="1">최신순</option>
					<option value="2">예전순</option>
			</select></td>
		</tr>
		<table class="notice_list">
			<colgroup>
				<!--관리자ID판단후 레디오버튼추가  -->
				<col v-if="type == 'a'" width="10%">
				<col width="*" />
				<col width="25%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<!--관리자ID판단후 레디오버튼추가  -->
					<th scope="col" v-if="type == 'a'"></th>
					<th scope="col"><h1>제목</h1></th>
					<th scope="col"><h1>작성일</h1></th>
					<th scope="col"><h1>조회수</h1></th>
				</tr>
			</thead>
			<tbody>
				<tr v-for="(item, index) in list">
					<!--관리자ID판단후 레디오버튼추가  -->
					<td v-if="type == 'a'"><input type="radio" name="selectBoard"
						v-bind:value="item" v-model="selectedItemList"></td>
					<td @click="fnView(item)">{{item.bTitle}}</td>
					<td @click="fnView(item)">{{item.createDate}}</td>
					<td @click="fnView(item)">{{item.bView}}</td>
				</tr>
			</tbody>
		</table>
		<template>
			<paginate :page-count="pageCount" :page-range="3" :margin-pages="2"
				:click-handler="changePage" :prev-text="'<'" :next-text="'>'"
				:container-class="'pagination'" :page-class="'page-item'">
			</paginate>
		</template>
		<div v-if=" type == 'a'">
			<button @click="fnDel" style="float: right;">삭제</button>
			<button @click="fnAdd" style="float: right; margin-right: 10px;">공지작성</button>
		</div>

	</div>
</body>
</html>
<script type="text/javascript">
Vue.component('paginate', VuejsPaginate)
var noticeList_jsp = new Vue({ 
    el: '#noticeList_jsp',
    data: {
        list : [] 
  	  , selectedItemList : []
	   , selectPage: 1
	   , pageCount: 1
	   , sort : "1"
	   ,searchText : ""
	   ,type:  "${userStatus}"
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
             var startNum = ((self.selectPage-1) * 7);  /*게시판 조회되는 라인수  */
    		var lastNum = self.selectPage * 7 
            var nparmap = {sort : self.sort ,startNum : startNum, lastNum : lastNum};
            $.ajax({
                url:"/noticelist.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.list = data.list;
	               self.pageCount = Math.ceil(data.cnt / 7);
                }
            }); 
        }  
    , fnSearch : function(){
		var self = this;
				self.selectPage = 1;
				var startNum = ((self.selectPage-1) * 7);  
		  		var lastNum = self.selectPage * 7 ;
				var nparmap = {searchText : self.searchText ,startNum : startNum, lastNum : lastNum,sort :self.sort};
  			$.ajax({
				 url:"/noticelist.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
				}
			});
	}
    , changePage: function (pageNum) {
		var self = this;
		self.selectPage = pageNum;
		var startNum = ((pageNum-1) * 7);
		var lastNum = pageNum * 7
        var nparmap = {sort:self.sort ,startNum : startNum, lastNum : lastNum};
        $.ajax({
            url:"/noticelist.dox",
            dataType:"json",	
            type : "POST", 
            data : nparmap,
            success : function(data) {                                       
                self.list = data.list;
                self.pageCount = Math.ceil(data.cnt / 7);
            }
        }); 
    }
	    , fnView : function(item){
			var self = this;
			self.pageChange("./noticeview.do", {bNo : item.bNo});
		}
	    , pageChange : function(url, param) {
			var target = "_self";
			if(param == undefined){
			//	this.linkCall(url);
				return;
			}
			var form = document.createElement("form"); 
			form.name = "dataform";
			form.action = url;
			form.method = "post";
			form.target = target;
			for(var name in param){
				var item = name;
				var val = "";
				if(param[name] instanceof Object){
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
	    , fnAdd : function(){
    		var self = this;
    		self.pageChange("./createnotice.do", {});
    	}, fnDel : function(){
    		var self = this;
    		var nparmap = { bNo : self.selectedItemList.bNo};
             $.ajax({
                 url:"/delnotice.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {  
                	 if(data.num == 1){
                	 alert("삭제되었습니다.");
                	 self.selectedItemList = [];
                	 self.sort = 1;
                	 self.fnGetList();
                	 }
                 }
             }); 
    	}
    	}
    , created: function () { <!-- 최초 실행을 정의하는 부분-->
    var self = this;
	self.fnGetList();  
	}
});
</script>


