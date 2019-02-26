<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 맨 앞의 '/'는 webapp을 가리킨다. -->
<fmt:requestEncoding value="UTF-8"/>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/chat/chatting.jsp">
	<jsp:param value="PCGOGO 채팅" name="pageTitle"/>
</jsp:include>

<style>

	#navbar {
		width : 500px;
		margin : 0 auto;
		margin-top : -178px;
	}

	.table {
		text-align : center;
	}
	
	.table td {
		font-family: 'Nanum Gothic', sans-serif;
		font-weight : bold;
		background : rgb(255, 40, 40, 0.1);
		color : #1A2F4D;
	}
</style>

<nav class="navbar navbar-light bg-light" id="navbar">
		<form class="form-inline">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">@</span>
				</div>
				<input type="text" class="form-control" placeholder="회원아이디로 검색" name="memberName">
			</div>
		</form>
		
		<button type="submit" class="btn btn-primary" id="btn-search">검색</button>
	</nav>
	
   <div class="result" id="srchName-result">
   </div>
   
   <script>
   
   </script>