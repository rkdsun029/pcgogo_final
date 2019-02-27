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
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<style>
div#outer-container{
	width:600px;
	height:420px;
	margin-top:120px;
}
table#basic-info{
	width:415px;
	margin:0 auto;
}
table#basic-info th{text-align:right;}
table#basic-info td{text-align:left;}
table#basic-info input{
	margin-left:20px;
	margin-bottom:7px;
	font-family:'Nanum Gothic', sans-serif;
	font-size:14px;
}
input[name=pcRoomName], input[name=mainAddress], input[name=detailAddress]{
	width:300px;
}
input[name=postCode]{
	width:150px;
}
button#postcodify_search_button{
	width:120px;
	height:30px;
	color:white;
	margin-left:10px;
	background:rgb(255, 40, 40, .7);
	border:1px rgb(255, 40, 40, .7);
	border-radius:5px;
	cursor:pointer;
	font-family:'Nanum Gothic', sans-serif;
	font-size:14px;
}
</style>
</head>
<body>
<!-- 기본정보 : 상호명, 주소 입력 -->
<div id="outer-container">
	<h1 id="head-title">PCGOGO.COM</h1>
	<h3>기본정보를 입력해 주세요.</h3>
	<form action="${pageContext.request.contextPath }/manager/pcRoomForm_step3.do">
		<table id="basic-info">
			<tr>
				<th>상호명</th>
				<td><input type="text" name="pcRoomName" required/></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>
					<input type="text" id="search-addr" name="postCode" class="postcodify_postcode5 form-control" required readonly/>
					<button id="postcodify_search_button">우편번호 검색</button>
				</td>
			</tr>
			<tr>
				<th>도로명주소</th>
				<td><input type="text" id="address" name="mainAddress" class="postcodify_address form-control" placeholder="우편번호 검색하기를 클릭하세요." readonly/></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type="text" id="details" name="detailAddress" class="postcodify_details form-control" placeholder="직접 입력해주세요." required/></td>
			</tr>
		</table>
		
		<button type="submit" class="submit-info">다음단계로 이동하기 →</button>
	</form>
</div>
</body>
</html>