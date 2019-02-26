<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chatting.css" />
<link href="https://fonts.googleapis.com/css?family=Anton|Black+Han+Sans|Do+Hyeon|Fredoka+One|Nanum+Gothic|Noto+Serif+KR" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="PCGOGO 채팅" name="pageTitle"></jsp:param>
</jsp:include>

	<div id="warning-message">
		<pre>비방 및 욕설, 홍보메세지 등은
불이익이 있을 수 있으니 주의하여 주시길 바랍니다.
※ 개인적인 메세지 전달로 예약은 불가능합니다.※</pre>
	</div>
	
	<div id="selectChatRoom">
		<button type="button" class="btn btn-primary" id="userChat"
				onclick="location.href='${pageContext.request.contextPath}/chat/memberChat.do'">회원</button>
		<button type="button" class="btn btn-primary" id="bossChat"
				onclick="location.href='${pageContext.request.contextPath}/chat/bossChat.do'">업주</button>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>