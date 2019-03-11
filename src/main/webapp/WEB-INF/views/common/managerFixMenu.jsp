<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/managerFixMenu.css" />
<script>
$(function(){
	$("div#insertPcRoom").on("click", function(){
		location.href = "${pageContext.request.contextPath}/manager/insertPcRoom.do";
	});
	
	$("div#managerCommunity").on("click", function(){
		location.href = "${pageContext.request.contextPath}/manager/managerCommunity.do";
	});
	
	$.ajax({
		url : "${pageContext.request.contextPath}/manager/getPcRoomList.do",
		dataType : "json",
		success : function(data){
			console.log(data);
			if(data == null) $("span#pcRoomName").html("등록한 피시방이 없습니다.");
			else $("span#pcRoomName").html(data.pcRoomName);
			console.log("AJAX SUCCEED");
		},
		error : function(data){
			console.log("AJAX FAILED");
		}
	});
	
	$("span#change").on("click", function(){
		window.open("${pageContext.request.contextPath}/manager/convertPcRoom.do",
				"pc방 전환", "width=700, height=500, left=50, top=50");
	});
});
</script>
<div id="outer-container">
	<div id="left-nav">
		<div class="card"><span>내 점포 관리하기</span></div>
		<div class="sub-card">
			<ul id="sub-card-list">
				<li><span id="pcRoomName"></span>&nbsp;&nbsp;&nbsp;<span id="change">전환 &gt;</span></li>
				<li><a href="${pageContext.request.contextPath }/manager/pcRoomView_manager.do">- 기본정보</a></li>
				<li><a href="${pageContext.request.contextPath }/manager/placement.do">- 자리배치도</a></li>
				<li><a href="${pageContext.request.contextPath }/manager/priceList.do">- 가격표</a></li>
				<li><a href="${pageContext.request.contextPath }/reservationLog.do">- 예약현황</a></li>
			</ul>
		</div>
		<div class="card" id="insertPcRoom"><span>PC방 등록하기</span></div>
		<div class="card" id="managerCommunity"><span>사장님 커뮤니티</span></div>
	</div>
	<div id="manager-body">
		<h3>${param.smallTitle}</h3>