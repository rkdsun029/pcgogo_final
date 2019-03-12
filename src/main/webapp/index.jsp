<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
   integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
   crossorigin="anonymous">
<style>
div#main-outer-container{
	position:relative;
	width:100%;
	text-align:center;
	font-family:'Nanum Gothic', sans-serif;
}
img#main_home{
	position:relative;
	width:100%;
	margin:0 auto;
	top:-20px;
}
img#messenger_banner_login, img#messenger_banner_goToTalk{
	position:relative;
	width:900px;
	margin:0 auto;
	cursor:pointer;
}
div#padding hr:first-of-type{display:none;}
div#marketShare-container{
	position:relative;
	width:950px;
	height:500px;
	margin:0 auto;
}
table#marketShare{
	margin:0 auto;
	width:950px;
	font-size:17px;
	border-collapse:collapse;
}
table#marketShare tr:first-of-type{
	border-bottom:1px solid #c8c8c8;
}
table#marketShare th, table#marketShare td{
	padding-top:7px;
	padding-bottom:7px;
}
#size {
	width:130px;
	display:table-cell;
	vertical-align:middle;
	text-decoration: none;
}
#first-size {
	width:60px;
}
#ranking{
	display:table-cell;
	vertical-align:middle;
}
a{
    text-decoration: none;
    color : black;
}
h6#todayDate{
	font-size:15px;
}
</style>

<div id="main-outer-container">
   <img id="main_home" src="${pageContext.request.contextPath }/resources/image/main/temphome.png" alt="" />
   <br><br>
   <h1>인기게임 PC방 점유율 순위</h1>
   <br>
   <h6 id="todayDate"></h6>
   <br>
   <div id="marketShare-container">
      <table id="marketShare"></table>
   </div>
   <br><br>
<br><br>
    <c:if test="${loggedInUser == null }">
   		<img id="messenger_banner_login" src="${pageContext.request.contextPath }/resources/image/main/banner.png" alt="" />
    </c:if>
    <c:if test="${loggedInUser != null }">
    	<img id="messenger_banner_goToTalk" src="${pageContext.request.contextPath }/resources/image/main/banner.png" alt="" />
    </c:if>
</div>
<script>
	$(function(){
		$("img#messenger_banner_login").on("click", function(){
			var temp = confirm("로그인 후 이용가능한 서비스 입니다.");
			if(!temp) return;
			else location.href = "${pageContext.request.contextPath}/login.do";
		});
		
		$("img#messenger_banner_goToTalk").on("click", function(){
			location.href = "${pageContext.request.contextPath}/chat/chatting.do";
		});
		
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth() + 1;
		var yyyy = today.getFullYear();
		
		if(dd < 10) dd = '0'+dd;
		if(mm < 10) mm = '0'+mm;
		
		today = '포털검색, 게임메카 투표, 사이트 접속순위 기준 집계 (' + yyyy + '년 ' + mm + '월 '+ dd + '일)';
		$("h6#todayDate").html("- " + today + " -");
		
		var html = "<table class='table table-hover'><tbody>";
		
		$.ajax({
			url: "${pageContext.request.contextPath}/index",
			dataType: "json",
			type: "get",
			success: function(data){
				console.log(data);
				
				html+="<tr><th id='first-size'>순위</th><th></th><th colspan='2'>온라인게임</th><th></th><th colspan='2'>웹게임</th></tr>";
				
				for(var i=0; i<5; i++){
					html += "<tr><td id='ranking'><strong>"+[i+1]+"</strong></td>";   
					html += "<td id='size'></td>";    
					html += "<td id='size'><strong><a href='"+data.listOnline[i].Tag+"'>"+data.listOnline[i].hotTitle+"</a></strong></td>";
					html += "<td id='size'><img src='"+data.listOnline[i].img+"'></td>"; 
					html += "<td id='size'></td>";    
					html += "<td id='size'><strong><a href='https://www.gamemeca.com/"+data.listWeb[i].webTag+"'>"+data.listWeb[i].webHotTitle+"</a></strong></td>";
					html += "<td id='size'><img src='"+data.listWeb[i].imgWebGame+"'></td></tr>"; 
				}
				
				html+="</tbody></table>";
				$("#marketShare-container").html(html);
			},
			error : function(jqxhr, textStatus, errorThrown){
				console.log("ajax 처리 실패 : ", jqxhr, textStatus, errorThrown);
			}
		});
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>