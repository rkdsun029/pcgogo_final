<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
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
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<head>
<style>
div#outer-container{
	position:relative;
	width:400px;
	height:300px;
	border-radius:10px;
	border:1px solid #c8c8c8;
	margin:0 auto;
	margin-top:175px;
	text-align:center;
}
div#outer-container h3{
	font-family:'Nanum Gothic', sans-serif;
	text-align:center;
	font-size:15px;
}
div#outer-container h3:first-of-type{
	padding-top:20px;
}
input#password{
	width:200px;
	height:30px;
	margin-top:30px;
	outline:none;
	border-radius:5px;
	border:1px solid #c8c8c8;
	font-size:20px;
	padding:3px;
}
button#checkPassword{
	width:80px;
	height:35px;
	font-size:15px;
	color:white;
	background:rgb(255, 40, 40, .7);
	border-radius:5px;
	border:1px rgb(255, 40, 40, .7);
	cursor:pointer;
}
h1#head-title{
	text-align:center;
    display:inline-block;
    font-family: 'Fredoka One', cursive; 
    font-size:30px;
    color:rgb(255, 40, 40, .7);
}
</style>
</head>
<body>
<div id="outer-container">
	<h1 id="head-title">PCGOGO.COM</h1>
	<h3>신규 PC방 등록화면입니다.</h3>
	<h3>비밀번호를 한 번 더 입력하여 주십시오.</h3>
	
	<input type="password" id="password" name="password"/>
	<button id="checkPassword" type="submit">확인</button>
</div>
</body>
</html>