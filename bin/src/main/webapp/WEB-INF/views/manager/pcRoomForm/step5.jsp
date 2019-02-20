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
div.wall{background:url("${pageContext.request.contextPath}/resources/image/manager/wall.png");}
</style>
</head>
<body>
<div id="placement-container">
	<h1 id="head-title">PCGOGO.COM</h1>
	<br>
	<div id="ready-placement">
		<label for="classification">구분&nbsp;&nbsp;&nbsp;</label>
		<select name="classification" id="classification">
			<option value="default" disabled selected>구분을 선택해 주세요.</option>
			<option value="plain">일반석</option>
			<option value="special">특별석</option>
			<option value="toilet">화장실</option>
			<option value="exit">출입구</option>
			<option value="counter">카운터</option>
			<option value="kiosk">무인기</option>
			<option value="water">정수기</option>
			<option value="smoking">흡연실</option>
			<option value="etc">기타</option>
			<option value="wall">벽</option>
		</select>
		<fieldset id="status-container">
			<legend>&nbsp;선택&nbsp;</legend>
			<div id="status"></div>
		</fieldset>
	</div>
	
	<table id="placement">
		<!-- for문으로 변경 예정 -->
		<tr>
			<td><div class="seat wall"></div></td>
			<td><div class="seat wall"></div></td>
			<td><div class="seat wall"></div></td>
			<td><div class="seat wall"></div></td>
			<td><div class="seat wall"></div></td>
		</tr>
		<tr>
			<td><div class="seat wall"></div></td>
			<td><div class="seat wall"></div></td>
			<td><div class="seat wall"></div></td>
			<td><div class="seat wall"></div></td>
			<td><div class="seat wall"></div></td>
		</tr>
		<tr>
			<td><div class="seat wall"></div></td>
			<td><div class="seat wall"></div></td>
			<td><div class="seat wall"></div></td>
			<td><div class="seat wall"></div></td>
			<td><div class="seat wall"></div></td>
		</tr>
		
	</table>
	<button class="formBtn" id="resetPlacement">초기화</button>
	<button class="formBtn" id="submitPlacement">등록</button>
</div>

<script>
$("select#classification").on("change", function(){
	var status = $(this).val();
	
	$("div#status").removeClass();
	$("div#status").addClass(status);
	
	$("[class*=seat]").on("click", function(){
		$(this).removeClass();
		$(this).addClass("seat");
		$(this).addClass(status);
	});
});

$("button#resetPlacement").on("click", function(){
	var temp = confirm("정말 초기화 하시겠습니까?");
	
	if(!temp){
		return;
	}
});

</script>
</body>
</html>