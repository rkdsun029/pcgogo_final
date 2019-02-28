<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규 PC방 등록</title>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/pcRoomForm.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<style>
div#outer-container{
	width:500px;
	height:680px;
	margin-top:7px;
}
img#help1, img#help2{
	width:300px;
}
div#outer-container h2{
	font-size:17px;
}
div#outer-container span{
	margin:0px;
	padding:0px;
	font-size:12px;
}
</style>
</head>
<body>
<div id="outer-container">
	<h1 id="head-title">PCGOGO.COM</h1>
	<h2>&lt;배치도 입력 도움말&gt;</h2>
	<span>(창 최대화를 권장합니다.)</span>
	<h3>1. 좌석분류를 선택하고 현재 상태 색을 확인해주세요.</h3>
	<img id="help1" src="${pageContext.request.contextPath }/resources/image/manager/help1.png" alt="" />
	<br><br>
	<h3>2. 좌석을 클릭하여 배치도를 만들면 끝!</h3>
	<img id="help2" src="${pageContext.request.contextPath }/resources/image/manager/help2.png" alt="" />
	<br>
	<button onclick="goToStep5();" class="submit-info">배치도입력 시작하기 →</button>
</div>
<script>
$(function(){
	console.log("${floorArr}");
	console.log("${seatsArr}");
});
function goToStep5(){
	location.href = "${pageContext.request.contextPath}/manager/pcRoomForm_step5.do?floorArr=${floorArr}&seatsArr=${seatsArr}";
}
</script>
</body>
</html>