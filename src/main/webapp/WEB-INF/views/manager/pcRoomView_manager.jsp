<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="사장님 메뉴" name="pageTitle"></jsp:param>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/managerFixMenu.jsp">
	<jsp:param value="기본정보" name="smallTitle"></jsp:param>
</jsp:include>

<style>
table#pc-info{
	width:550px;
	border-collapse:collapse;
	text-align:center;
	margin:0 auto;
	font-family:'Nanum Gothic', sans-serif;
	font-size:17px;
}
table#pc-info tr{
	padding-bottom:30px;
}
div#map{
	border:1px solid;
	width:500px;
	height:500px;
	margin:0 auto;
}
</style>
<table id="pc-info">
	<tr>
		<th>상호명</th>
		<td><input type="text" id="PcRoomName" value="${selectedPcRoom.pcRoomName }" readonly/></td>
		<td><button id="changePcRoomName">수정</button></td>
	</tr>
	<tr>
		<th>소개글</th>
		<td><textarea name="" id="" cols="30" rows="10"></textarea></td>
	</tr>
	<tr>
		<th>주소</th>
		<td>${selectedPcRoom.pcRoomAddress }</td>
		<td><button id="changePcRoomAddress">주소 변경</button></td>
	</tr>
</table>
<br><br>
<div id="map">
	
</div>

<jsp:include page="/WEB-INF/views/common/managerFixMenu_foot.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>