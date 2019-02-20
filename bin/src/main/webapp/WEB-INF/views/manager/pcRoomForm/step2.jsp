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
table#basic-info{
	margin:0 auto;
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
				<td><input type="text" name="pcRoomName"/></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="pcRoomAddress"/></td>
			</tr>
		</table>
		
		<button type="submit">확인</button>
	</form>
</div>
</body>
</html>