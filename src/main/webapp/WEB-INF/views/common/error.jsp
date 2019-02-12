<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String status = String.valueOf(response.getStatus());
	System.out.println("Status@errorPage="+status);
	String msg = exception!=null?exception.getMessage():status;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<script src="js/jquery-3.3.1.js"></script>
<style>
body{
    background:skyblue;
    font-family: 'Nanum Gothic', sans-serif;
}
div#error-container{
    text-align:center;
    width:600px;
    min-height:500px;
    background:white;
    margin:0 auto;
    border-radius:50px;
    margin-top:100px;
    margin-bottom:100px;
    padding-bottom:50px;
}
button.go{
    text-align:center;
    width:200px;
    height:50px;
    border-radius:10px;
    background:salmon;
    border:1px solid salmon;
    font-weight:bold;
    font-size:17px;
    cursor:pointer;
    margin:10px;
    font-family: 'Nanum Gothic', sans-serif;
}
button.error-code{
    text-align:center;
    width:420px;
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
h1#oh{
    padding-top:50px;
}
div#error-code-container{
    width:420px;
    min-height:100px;
    margin:0 auto;
    background:beige;
}
.hide{
    display:none;
}
div#error-code-container p{
    color:red;
}
</style>
</head>
<body>
<div id="error-container">
    <h1 id="oh">앗! 에러가 발생했습니다!</h1>
    <p>페이지를 불러오는 과정에서 문제가 발생하였습니다.</p>
    <p>서비스 이용에 불편을 드려 죄송합니다.</p>
    <button class="go" onclick="goFAQ();">FAQ로 이동하기</button>
    <button class="go" onclick="goHome();">홈으로 돌아가기</button>

    <button class="error-code" id="show-error-code" onclick="showErrorCode();">에러코드 보기 ▼</button>
    <div id="error-code-container">
        <p><%= msg %></p>
    </div>
    <button class="error-code" id="close-error-code" onclick="closeErrorCode();">에러코드 접기 ▲</button>
</div>
    
<script>
$(function(){
    $("#error-code-container").addClass("hide");
    $("#close-error-code").addClass("hide");
});
function showErrorCode(){
    $("#show-error-code").attr("disabled");
    $("#show-error-code").css({
        "cursor":"default",
        "background" : "lightgray",
        "border" : "1px solid lightgray"
    });
    $("#error-code-container").removeClass("hide");
    $("#close-error-code").removeClass("hide");
}
function closeErrorCode(){
    $("#show-error-code").removeAttr("disabled");
    $("#show-error-code").css({
        "cursor":"pointer",
        "background" : "rgb(170, 170, 170)",
        "border" : "1px solid rgb(170, 170, 170)"
    });
    $("#error-code-container").addClass("hide");
    $("#close-error-code").addClass("hide");
}

function goHome(){
    location.href="#";
}    
function goFAQ(){
    location.href="#";
}
</script>
</body>
</html>