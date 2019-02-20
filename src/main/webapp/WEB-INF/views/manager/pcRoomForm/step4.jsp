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
</head>
<body>
<div id="outer-container">
	<h1 id="head-title">PCGOGO.COM</h1>
	<h3>좌석 배치도 입력을 시작합니다.</h3>
	<span>여기는 도움말자리</span><br>
	<button onclick="goToStep5();">다음</button>
</div>
<script>
$(function(){
	console.log("${option}");
});
function goToStep5(){
	location.href = "${pageContext.request.contextPath}/manager/pcRoomForm_step5.do?option=${option}";
}
</script>
</body>
</html>