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
	min-height:420px;
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
button#addFloor, button#deleteFloor{
	text-align:center;
    width:100px;
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
	position:relative;
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
	
	<table id="floor-info">
		<tr>
			<th>층 수</th>
			<td>
				<select name="floorClass" id="floorClass">
					<option value="F" selected>지상</option>
					<option value="B">지하</option>
				</select>
				<input type="number" name="floorNum" step="1" value="0" id="floorNum"/>&nbsp;층
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
	<button id="addFloor">층 추가 ▼</button><button id="deleteFloor">층 삭제 ▲</button><br>
	<button type="submit" class="submit-info">다음단계로 이동하기 →</button>
</div>
<form action="${pageContext.request.contextPath}/manager/pcRoomForm_step4.do" method="POST">
	<input type="hidden" name="floorArr"/>
	<input type="hidden" name="seatsArr"/>
</form>
<script>
$("button#addFloor").on("click", function(){
	var temp_ = "<table id='floor-info'><tr><th>층 수</th><td>" +
				"<select name='floorClass' id='floorClass'>" +
				"<option value='F' selected>지상</option><option value='B'>지하</option>" +
				"</select><input type='number' name='floorNum' step='1' value='0' id='floorNum'/>&nbsp;층" +
				"</td></tr><tr><th>좌석 수</th><td>" +
				"<select name='seats' id='seats'>" +
					"<option value='none' disabled selected>예상 좌석 수를 선택해주세요.</option>" +
					"<option value='1'>200석 이하</option>" +
					"<option value='2'>200석~300석</option>" +
					"<option value='3'>300석~400석</option>" +
					"<option value='4'>400석 이상</option>" +
				"</select></td></tr></table>";
	$("table:last").after(temp_);
});

$("button#deleteFloor").on("click", function(){
	var table_length = $("table").length;
	if(table_length == 1) alert("더이상 제거할 층이 없습니다.");
	else $("table:last").remove();
});

$("button[type=submit]").on("click", function(){
	var floor_length = $("input[type=number]#floorNum").length;
	for(var i=0; i<floor_length; i++){
		if($("input[type=number]#floorNum").eq(i).val() == 0){
			alert("층 수가 지정되어 있지 않습니다.");
			return;
		}
	}
	
	var select_length = $("select#seats").length;
	for(var i=0; i<select_length; i++){
		if($("select#seats").eq(i).val() == null){
			alert("예상 좌석수가 지정되어 있지 않습니다.");
			return;
		}
	}
	
	var tableArr = $("table#floor-info");
	var tableArr_length = $("table#floor-info").length;
	
	var floorArr = new Array;
	var seatsArr = new Array;
	
	for(var i=0; i<tableArr_length; i++){
		var floor_ = $("select#floorClass").eq(i).val() + $("input[name=floorNum]").eq(i).val();
		floorArr.push(floor_);
		seatsArr.push($("select#seats").eq(i).val());
	}
	
	$("input[name=floorArr]").val(floorArr.toString());
	$("input[name=seatsArr]").val(seatsArr.toString());
	
	console.log($("input[name=floorArr]").val());
	console.log($("input[name=seatsArr]").val());
	
	$("form").submit();
});
</script>
</body>
</html>