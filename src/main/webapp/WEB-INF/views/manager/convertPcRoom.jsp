<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PC방 전환</title>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/pcRoomForm.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<style>
body{
	font-family:'Nanum Gothic', sans-serif;
	text-align:center;
}
ul#pcRoomList_{
	width:300px;
	list-style:none;
	padding:0;
	display:block;
	margin:0 auto;
	text-align:center;
}
ul#pcRoomList_ li{
	cursor:pointer;
	margin:0 auto;
	padding:0;
	width:250px;
}
h3{
	text-align:center;
}
h1#head-title{
    display:inline-block;
    font-family: 'Fredoka One', cursive; 
    font-size:30px;
    font-weight: bold;
    margin:0 auto;
    margin-top:15px;
}
</style>
</head>
<body>
<h1 id="head-title">PCGOGO.COM</h1>
<h4>소유하신 PC방 목록입니다.</h4>
<h4>전환할 PC방을 선택해주세요.</h4>
<br>
<ul id="pcRoomList_">
	<c:forEach var="p" items="${pcRoomList }">
		<li>
			${p.pcRoomName }
			<input type="hidden" id="pcRoomNo" value="${p.pcRoomNo }"/>
		</li>
	</c:forEach>
</ul>
<script>
$("ul#pcRoomList_ li").on("click", function(){
	var pcRoomNo = $(this).find(":first").val();
	var temp = confirm("해당 피시방으로 전환하시겠습니까?");
	if(!temp) return;
	else{
 		location.href="${pageContext.request.contextPath}/manager/convertPcRoomEnd.do?pcRoomNo="+pcRoomNo;
 		opener.location.reload();
	}
});
</script>

</body>
</html>
