<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.go.pcgogo.user.model.vo.Member, java.util.*, java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Anton|Black+Han+Sans|Do+Hyeon|Fredoka+One|Nanum+Gothic|Noto+Serif+KR" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/messageHeader.css" />
<title>PCGOGO 채팅</title>

	<div id="headertitle">
		<h2><em>PCGOGO</em></h2>
	
	<pre>비방 및 욕설, 홍보메세지 등은
불이익이 있을 수 있으니 주의하여 주시길 바랍니다.
※ 개인적인 메세지 전달로 예약은 불가능합니다. ※</pre>
	</div>

	
	<div id="selectChatRoom">
		<button type="button" class="btn btn-primary" id="memberMessage"
				onclick="location.href='${pageContext.request.contextPath}/chat/memberMessage.do'">회원</button>
		<button type="button" class="btn btn-primary" id="managerMessage"
				onclick="location.href='${pageContext.request.contextPath}/chat/managerMessage.do'">업주</button>
	</div>
	
	