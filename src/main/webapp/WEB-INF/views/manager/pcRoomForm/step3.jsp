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
div#outer-container{
	width:600px;
	height:420px;
	margin-top:120px;
}
select#seats{
	width:200px;
	height:30px;
	margin-left:20px;
	font-family: 'Nanum Gothic', sans-serif;
}
select#floorClass{
	width:55px;
	height:30px;
	margin-left:20px;
	font-family: 'Nanum Gothic', sans-serif;
}
button#addFloor{
	text-align:center;
    width:250px;
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
table#floor-info{
	margin:0 auto;
	margin-top:20px;
	margin-bottom:20px;
}
table#floor-info th{text-align:right;}
table#floor-info td{text-align:left;}
table#floor-info input[type=number]{
	width:40px;
	margin-left:20px;
	margin-bottom:7px;
	font-size:14px;
}
</style>
</head>
<body>
<!-- 층수, 층당 예상 좌석수 입력 -->
<div id="outer-container">
	<h1 id="head-title">PCGOGO.COM</h1>
	<h3>소유하신 PC방의 층 수와, 층 당 좌석 수를 대략적으로 입력해 주세요.</h3>
	<input type="hidden" name="floors" id="floors" value="1"/>
	
	<table id="floor-info">
		<tr>
			<th>층 수</th>
			<td>
				<select name="floorClass" id="floorClass">
					<option value="" selected>지상</option>
					<option value="B">지하</option>
				</select>
				<input type="number" name="floorNum" step="1" id="floorNum"/>&nbsp;층
			</td>
		</tr>
		<tr>
			<th>좌석 수</th>
			<td>
				<select name="seats" id="seats">
					<option value="none" disabled selected>예상 좌석 수를 선택해주세요.</option>
					<option value="1">200석 이하</option> <!-- 20 * 15 -->
					<option value="2">200석~300석</option> <!-- 25 * 15 -->
					<option value="3">300석~400석</option> <!-- 30 * 15 -->
					<option value="4">400석 이상</option> <!-- 40 * 20 -->
				</select>
			</td>
		</tr>
	</table>
	
	<button id="addFloor">층 추가 ▼</button><br>
	<button type="submit" class="submit-info">다음단계로 이동하기 →</button>
</div>
<script>
$("button[type=submit]").on("click", function(){
	location.href = "${pageContext.request.contextPath}/manager/pcRoomForm_step4.do?option=" + $("select#seats").val();
});
</script>
</body>
</html>