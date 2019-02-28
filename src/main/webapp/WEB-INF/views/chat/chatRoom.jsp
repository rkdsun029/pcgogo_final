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
    			<input type="hidden" id="fromId" name="fromId" value="${loggedInUser.memberId}" />
    			<input type="hidden" id="toId" name="toId" value="${param.toId}" />
    		</div>
    
    		<!--Widget body-->
    		<div id="demo-chat-body" class="collapse in">
    			<div class="nano has-scrollbar" style="height:700px">
    				<div id="messageList" class="nano-content pad-all" tabindex="0" style="right: -17px;">
    					
    					<c:if test="${!loggedInUser.memberId}">
    						<ul class="list-unstyled media-block">
    							
    						</ul>
    					</c:if>
    					
    				</div>
    			<div class="nano-pane">
    				<div class="nano-slider" style="height: 141px; transform: translate(0px, 0px);">
    				</div>
    			</div>
    		</div>
    
    			<!--Widget footer-->
    		<div class="chatSend-container">
    			<form id="chatSendFrm">
    				<div id="fromAndto-container">
    					
    				</div>
    				<div class="panel-footer">
    				<div class="row">
    					<div class="col-xs-9">
    						<input type="text" id="chatContent" name="chatContent" placeholder="메세지를 입력하세요." class="form-control chat-input">
    					</div>
    				</div>
    			</div>
    			</form>
    					<div class="col-xs-3">
    						<button class="btn btn-primary btn-block" type="submit" id="chatSend">전송</button>
    					</div>
    		</div>
    		</div>
    	</div>
    </div>
</div>

<script>
	$(".btn-block").click(function() {
		
		var fromId = $("input[name=fromId]").val();
		var toId = $("input[name=toId]").val();
		
		/* console.log(fromId, toId, chatContent); */
		
		var fromAndto = "";
		
		fromAndto += "<input type='hidden' id='fromId_' name='fromId_' value='" + fromId + "'/>";
		fromAndto += "<input type='hidden' id='toId_' name='toId_' value='" + toId + "'/>";
		
		$("#fromAndto-container").html(fromAndto);
		
		var fromId_ = $("input[name=fromId_]").val();
		var toId_ = $("input[name=toId_]").val();
		var chatContent = $("input[name=chatContent]").val();
		
		console.log(fromId_, toId_, chatContent);
		
		$.ajax({
			url: "${pageContext.request.contextPath}/chat/insertChat.do",
			data: {
				fromId_ : fromId_,
				toId_ : toId_,
				chatContent : chatContent
			},
			dataType: "text",
			type: "post",
			success: function(data) {
				console.log("ajax 전송 성공!");
				
			},
			error: function(jqxhr, textStatus, errorThrow) {
				console.log(jqxhr);
				console.log(textStatus);
				console.log(errorThrow);
				console.log("ajax 전송 실패ㅠㅠ");
			}
		});
		
		/* $.ajax({
			url: "${pageContext.request.contextPath}/chat/insertChat.do",
			data: {
				fromId : fromId,
				toId : toId,
				chatContent : chatContent
			},
			dataType: "json",
			type: "post",
			success: function(data) {
				console.log("ajax 성공");
			},
			error: function() {
				console.log("ajax 에러");
			}
		}); */
		
		/* $("#chatSendFrm").attr("action", "insertChat.do");
		$("#chatSendFrm").attr("method", "post");
		$("#chatSendFrm").submit(); */
		
		/* var fromId = $("#chatSendFrm [name=fromId]").val();
		var toId = $("#chatSendFrm [name=toId]").val();
		var chatContent = $("#chatSendFrm [name=chatContent]").val();
		
		console.log(fromId, toId, chatContent);
		
		$.ajax({
			url: "${pageContext.request.contextPath}/chat/insertChat.do",
			type: "post",
			data: {
				fromId : fromId,
				toId : toId,
				chatContent : chatContent
			},
			success: function(data) {
				console.log("성공!", fromId, toId, chatContent);
				
			},
			error: function() {
				console.log("ajax 에러ㅠㅠ");
			}
		}); */
		
		/* $.ajax({
			url: "${pageContext.request.contextPath}/chat/insertChat.do",
			type: "post",
			data: param,
			success: function(data) {
				console.log(data);
			},
			error: function() {
				console.log("ajax 에러!!");
			}
		}); */
	});
</script>
































