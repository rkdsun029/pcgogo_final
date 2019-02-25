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
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<style>
button#addFloor{
	text-align:center;
    width:300px;
    height:30px;
    border-radius:10px;
    background:rgb(170, 170, 170);
    border:1px solid rgb(170, 170, 170);
    color:white;
    font-size:14px;
    cursor:pointer;
    margin:10px;
    font-family: 'Nanum Gothic', sans-serif;	
}
button[type=submit]{
	width:120px;
	height:40px;
	font-size:15px;
	font-family:'Nanum Gothic', sans-serif;
	border-radius:5px;
	background:rgb(255, 40, 40, .7);
	color:white;
	cursor:pointer;
}
</style>
</head>
<body>
<!-- 층수, 층당 예상 좌석수 입력 -->
<div id="outer-container">
	<h1 id="head-title">PCGOGO.COM</h1>
	<h3>소유하신 PC방의 층수와<br>층당 좌석수를 대략적으로 입력해 주세요.</h3>
	<input type="hidden" name="floors" id="floors" value="1"/>
	
	<label for="floorNum">층 수</label>
	<input type="number" name="floorNum" id="floorNum"/>
	<br>
	<label for="seats">좌석 수</label>
	<select name="seats" id="seats">
		<option value="none" disabled selected>좌석수를 선택해주세요.</option>
		<option value="1">200석 이하</option> <!-- 20 * 15 -->
		<option value="2">200석~300석</option> <!-- 25 * 15 -->
		<option value="3">300석~400석</option> <!-- 30 * 15 -->
		<option value="4">400석 이상</option> <!-- 40 * 20 -->
	</select>
	<br>
	<button id="addFloor">층 추가 ▼</button>
	<button type="submit">확인</button>
</div>
<script>
$("button[type=submit]").on("click", function(){
	location.href = "${pageContext.request.contextPath}/manager/pcRoomForm_step4.do?option=" + $("select#seats").val();
});
</script>
</body>
</html>