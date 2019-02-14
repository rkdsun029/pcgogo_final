<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="사장님 모드" name="pageTitle"></jsp:param>
</jsp:include>

<style>
div#left-nav{
	display:inline-block;
	margin-top:20px;
	width:230px;
	min-height:40px;
}
div.card{
	width:230px;
	height:40px;
	border-bottom:1px solid white;
	background:rgb(255, 40, 40, .6);
	cursor:pointer;
}
div.card:last-of-type{
	border:none;
}
div.card span{
	position:relative;
	width:230px;
	height:40px;
	top:7px;
	padding-left:30px;
	color:white;
	font-family:'Nanum Gothic', sans-serif;
	font-size:15px;
}
div.sub-card{
	width:230px;
	height:170px;
	background:rgb(255, 40, 40, .6);
	border-bottom:1px solid white;
}
ul#sub-card-list{
	list-style:none;
	margin:0;
	padding:0;
	font-family:'Nanum-Gothic', sans-serif;
	font-size:13px;
	color:white;
}
ul#sub-card-list li{
	font-family:'Nanum-Gothic', sans-serif;
	padding-top:7px;
	padding-left:40px;
	padding-bottom:7px;
}
ul#sub-card-list li:first-of-type{
	font-family:'Nanum-Gothic', sans-serif;
	font-size:15px;
	font-weight:bold;
	padding-left:30px;
	padding-top:10px;
}
span#change{	
	position:relative;
	top:-2px;
	font-family:'Nanum-Gothic', sans-serif;
	font-size:10px;
	font-weight:normal;
	cursor:pointer;
}
</style>

<div id="left-nav">
	<div class="card">
		<span>내 점포 관리하기</span>
	</div>
	<div class="sub-card">
		<ul id="sub-card-list">
			<li>ROMARU PC CAFE&nbsp;&nbsp;&nbsp;<span id="change">전환 &gt;</span></li>
			<li>- 기본정보</li>
			<li>- 자리배치도</li>
			<li>- 예약현황</li>
			<li>- 광고문의</li>
		</ul>
	</div>
	<div class="card"><span>사장님 커뮤니티</span></div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>