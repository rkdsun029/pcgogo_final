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
	width:600px;
	height:400px;
	margin-top:150px;
}
</style>
</head>
<body>
<div id="outer-container">
	<h1 id="head-title">PCGOGO.COM</h1>
	<h3 class="blah">PC방 등록이 완료되었습니다.</h3><br>
	<h3 class="blah">해당 PC방은 관리자의 승인을 거쳐 검색결과로 노출됩니다.</h3><br>
	<h3 class="blah">저희 서비스를 이용해 주셔서 감사합니다.</h3>
	
	<button class="submit-info">닫기</button>
</div>

<script>
$("button.submit-info").on("click", function(){
	window.close();
});
</script>
</body>
</html>
