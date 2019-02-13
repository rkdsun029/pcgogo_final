<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="분실물 찾기" name="pageTitle"></jsp:param>
</jsp:include>

<style>
div#lostandfound-container{
	font-family:'Nanum Gothic', sans-serif;	
}
table#lostandfound-help{
	width:350px;
	margin:0 auto;
	font-size:17px;
	text-align:center;
	margin-top:20px;
}
table#lostandfound-help th, table#lostandfound-help td{
	height:30px;
	margin:15px;
}
table#lostandfound-help th{
	border-bottom:1px solid #c8c8c8;
}
div#search-bar{
	position:relative;
	text-align:center;
	width:900px;
	margin:0 auto;
	margin-top:30px;
	margin-bottom:30px;
}
div#search-bar h3{
	display:inline-block;
}
div#search-bar select{
	display:inline-block;
	width:250px;
	height:30px;
	font-family:'Nanum Gothic', sans-serif;
	font-size:15px;
}
div#search-bar input{
	display:inline-block;
	width:250px;
	height:30px;
	font-family:'Nanum Gothic', sans-serif;
	font-size:15px;
	border-style:none;
	border-bottom:1px solid gray;
}
div#search-bar button{
	display:inline-block;
	width:70px;
	height:35px;
	border-radius:5px;
	border: 1px rgba(255, 40, 40, .7);
	background:rgba(255, 40, 40, .7);
	color:white;
	font-size:18px;
	font-family:'Nanum Gothic', sans-serif;
	cursor:pointer;
}
div#map{
	position:relative;
	width:300px;
	height:300px;
}
table#lnfList{
	margin:0 auto;
	text-align:center;
	width:1000px;
}
</style>

<div id="lostandfound-container">
	<table id="lostandfound-help">
		<tr><th colspan="2">분류번호를 이용하면 빠르게 찾을 수 있습니다.</tr>
		<tr><td>분류1</td><td>핸드폰 / 지갑 / 가방</td></tr>
		<tr><td>분류2</td><td>충전기 / USB</td></tr>
		<tr><td>분류3</td><td>카드 / 신분증 / 면허증</td></tr>
		<tr><td>분류4</td><td>악세사리 / 의류</td></tr>
		<tr><td>분류5</td><td>기타</td></tr>
	</table>
	<div id="search-bar">
		<h3>분실물 검색</h3>
		&nbsp;&nbsp;&nbsp;
		<select name="areaOption1" id="areaOption1">
			<option value="" disabled selected>분류를 선택해 주세요.</option>
			<option value="1">분류1 : 핸드폰 / 지갑 / 가방</option>
			<option value="2">분류2 : 충전기 / USB</option>
			<option value="3">분류3 : 카드 / 신분증 / 면허증</option>
			<option value="4">분류4 : 악세사리 / 의류</option>
			<option value="5">분류5 : 기타</option>
		</select>
		&nbsp;&nbsp;&nbsp;
		<input type="text" id="lnfName" name="lnfName" placeholder="이름을 입력해주세요."/>
		&nbsp;&nbsp;&nbsp;
		<button onclick="keywordSearch();">찾기</button>
	</div>   
	
	<div id="lnfList-container">
		<table id="lnfList">
			<tr>
				<th>번호</th>
				<th>분류</th>
				<th>물품명</th>
				<th>사진유무</th>
				<th>보관 중인 pc방</th>
				<th>습득날짜</th>
			</tr>
		</table>
	</div>
</div>

<script>
function keywordSearch(){
	
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>