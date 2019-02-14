<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/managerFixMenu.css" />
<div id="outer-container">
	<div id="left-nav">
		<div class="card"><span>내 점포 관리하기</span></div>
		<div class="sub-card">
			<ul id="sub-card-list">
				<li>ROMARU PC CAFE&nbsp;&nbsp;&nbsp;<span id="change">전환 &gt;</span></li>
				<li><a href="${pageContext.request.contextPath }/manager/pcRoomView_manager.do">- 기본정보</a></li>
				<li><a href="${pageContext.request.contextPath }/manager/placement.do">- 자리배치도</a></li>
				<li><a href="${pageContext.request.contextPath }/manager/priceList.do">- 가격표</a></li>
				<li><a href="${pageContext.request.contextPath }/manager/reservationList.do">- 예약현황</a></li>
				<li><a href="#">- 광고문의</a></li>
			</ul>
		</div>
		<div class="card"><span>PC방 등록하기</span></div>
		<div class="card"><span>사장님 커뮤니티</span></div>
	</div>
	<div id="manager-body">
		<h3>${param.smallTitle}</h3>