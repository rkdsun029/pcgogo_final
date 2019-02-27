<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 맨 앞의 '/'는 webapp을 가리킨다. -->
<fmt:requestEncoding value="UTF-8"/>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300|Anton|Black+Han+Sans|Do+Hyeon|Fredoka+One|Nanum+Gothic|Noto+Serif+KR" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chatRoom.css" />
<title>PCGOGO 채팅</title>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
    <div class="col-md-12 col-lg-6">
        <div class="panel">
        	<!--Heading-->
    		<div class="panel-heading">
    			<h3 class="panel-title">PCGOGO</h3>
    		</div>
    
    		<!--Widget body-->
    		<div id="demo-chat-body" class="collapse in">
    			<div class="nano has-scrollbar" style="height:700px">
    				<div class="nano-content pad-all" tabindex="0" style="right: -17px;">
    					
    				</div>
    			<div class="nano-pane">
    				<div class="nano-slider" style="height: 141px; transform: translate(0px, 0px);">
    				</div>
    			</div>
    		</div>
    
    			<!--Widget footer-->
    			<form class="chatSendFrm" method="post" action="${pageContext.request.contextPath}/chat/insertChat.do">
    				<input type="hidden" name="fromId" value="${loggedInUser.memberId}" />
    				<input type="hidden" name="toId" value="${param.toId}" />
    				<div class="panel-footer">
    				<div class="row">
    					<div class="col-xs-9">
    						<input type="text" name="chatContent" placeholder="메세지를 입력하세요." class="form-control chat-input">
    					</div>
    					<div class="col-xs-3">
    						<button class="btn btn-primary btn-block" type="submit" id="chatSend">전송</button>
    					</div>
    				</div>
    			</div>
    			</form>
    		</div>
    	</div>
    </div>
</div>

<script>
	/* $("#chatSend").click(function() {
		
		location.href = "${pageContext.request.contextPath}/chat/insertChat.do";
		
	}); */
</script>
































