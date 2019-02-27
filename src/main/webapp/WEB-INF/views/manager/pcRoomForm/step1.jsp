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
<!-- 비밀번호 재입력 -->
<div id="outer-container">
	<h1 id="head-title">PCGOGO.COM</h1>
	<h3>신규 PC방 등록화면입니다.</h3>
	<h3>비밀번호를 한 번 더 입력하여 주십시오.</h3>
	<form name="startInsertForm" action="${pageContext.request.contextPath}/manager/pcRoomForm_step2.do">
		<input type="hidden" id="managerId" name="managerId" value="${loggedInManager }"/>
		<input type="password" id="password" name="password"/>
		<button id="checkPassword">확인</button>
	</form>
</div>
<script>
$("button#checkPassword").on("click", function(){
	$.ajax({
		url : "${pageContext.request.contextPath}/manager/checkPassword.do",
		data : {
			"managerId" : managerId,
			"password" : password
		},
		type : "post",
		dataType : "json",
		success : function(data){
			console.log("AJAX SUCCEED");
			
			alert("PC방 등록을 시작합니다.");
			$("form[name=startInsertForm]").submit();
		},
		error : function(){
			console.log("AJAX ERROR");
		}
	});
});
</script>

</body>
</html>
