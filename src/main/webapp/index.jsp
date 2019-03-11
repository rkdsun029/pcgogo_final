<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<style>
div#main-outer-container{
	position:relative;
	width:100%;
	text-align:center;
	font-family:'Nanum Gothic', sans-serif;
}
img#main_home{
	position:relative;
	width:100%;
	margin:0 auto;
	top:-20px;
}
img#messenger_banner{
	position:relative;
	width:900px;
	margin:0 auto;
}
div#padding hr:first-of-type{display:none;}
div#marketShare-container{
	position:relative;
	width:400px;
	height:370px;
	margin:0 auto;
}
table#marketShare{
	margin:0 auto;
	width:400px;
	font-size:17px;
	border-collapse:collapse;
}
table#marketShare tr:first-of-type{
	border-bottom:1px solid #c8c8c8;
}
table#marketShare th, table#marketShare td{
	padding-top:7px;
	padding-bottom:7px;
}
</style>

<div id="main-outer-container">
	<img id="main_home" src="${pageContext.request.contextPath }/resources/image/main/temphome.png" alt="" />
	<br>
	<h1>인기게임 PC방 점유율 순위</h1>
	<h4 id="todayDate"></h4>
	<br>
	<div id="marketShare-container">
		<table id="marketShare">
			<tr>
				<th>순위</th>
				<th>이름</th>
				<th>점유율(%)</th>
			</tr>
			<tr>
				<td>1위</td>
				<td>리그오브레전드</td>
				<td>39.37</td>
			</tr>
		</table>
	</div>
	<br /><br />
	<img id="messenger_banner" src="${pageContext.request.contextPath }/resources/image/main/banner.png" alt="" />
</div>
<script>
$(function(){
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd < 10) dd = '0'+dd;
	if(mm < 10) mm = '0'+mm;

	today = yyyy + '년 ' + mm + '월 '+ dd + '일 기준';
	$("h4#todayDate").html("- " + today + " -");
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>