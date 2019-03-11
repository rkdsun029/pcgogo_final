<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="UTF-8" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300|Anton|Black+Han+Sans|Do+Hyeon|Fredoka+One|Nanum+Gothic|Noto+Serif+KR" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chatRoom.css" />
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<title>GOGO TALK</title>

	<body>
	<%-- <input type="hidden" id="fromId" name="fromId" value="${memberLoggedIn.memberId}" />
    <input type="hidden" id="toId" name="toId" value="${param.toId}" /> --%>
    
    <!-- <input type="text" id="message"/>
    <input type="button" id="sendBtn" value="전송" /> -->
	
	<!-- <div id="messageList"></div> -->
	
	<!-- UI 적용 -->
	<div class="container">
		<div class="col-md-12 col-lg-6">
			<div class="panel">
					<h3 class="panel-title">GOGO TALK</h3>
					<pre>욕설 및 비방, 도배, 홍보하는 메세지 등은 불이익이
있을 수 있으니 주의하여 주시길 바랍니다.</pre>
					<div id="renaming"></div>
			
				<!-- Heading -->
				<div class="panel-heading">
					<input type="hidden" id="fromId" name="fromId" value="${loggedInUser.memberId}" />
				</div>
				
				<!-- 말풍선 -->
				<div id="demo-chat-body" class="collapse in">
					<div class="nano has-scrollbar" style="height:700px">
					
						<div class="nano-content pad-all" tabindex="0" style="right: -17px;">
							<ul class="list-unstyled media-block" id="messageList" style="margin-bottom:0px;">
								
							</ul>
						</div>
						
						<div class="nano-pane">
							<div class="nano-slider" style="height: 141px; transform: translate(0px, 0px);"></div>
						</div>
						
					</div>
					
					<!-- 채팅 입력 부분 -->
					<div class="chatSend-container">
						<div id="fromAndto-container">
							
						</div>
						
						<div class="panel-footer">
							<div class="row">
								<div class="col-xs-9">
									<input type="text" class="form-control chat-input" id="message" name="message" placeholder="메세지를 입력하세요." />
								</div>
							</div>
						</div>
						
						<div class="col-xs-3">
							<input type="button" id="sendBtn" value="전송" />
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
</body>
		
	<script>
	var fromId = $("input[name=fromId]").val();
	var toId = $("input[name=toId]").val();
	
	console.log(fromId, toId);

	$(document).ready(function() {
		
		$("#sendBtn").click(function() {
			sendMessage();
			$('#message').val('')
		});
		
		$("#message").keydown(function(key) {
			if(key.keyCode == 13) { // 엔터
				sendMessage();
				$('#message').val('')
			}
		});
	});
	
	// 웹소켓을 지정한 url로 연결한다.
	let sock = new SockJS("<c:url value="/echo"/>");
	sock.id = fromId;
	console.log("소켓 아이디!", sock.id);
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	// 메세지 전송
	function sendMessage() {
		/* sock.send($("#message").val()); */
		
		message = $("#message").val();
		
		if(message.trim().length == 0) {
			alert("메세지를 작성해주세요!");
			return false;
		}
		
		sock.send(message);
	}
	
	// 서버로부터 메세지를 받았을 때
	// msg 파라미터는 websocket이 보내준 데이터이다.
	function onMessage(msg) { // 변수 안에 function 자체를 넣는다.
		var data = msg.data;
		var sessionId = null;
		var message = null;
		
		// 문자열 split
		var strArray = data.split(" : ");
		
		for(var i = 0; i < strArray.length; i++) {
			console.log("str[" + i + "]:" + strArray[i]);
		}
		
		// current sessionId
		var currentUser_session = $("input[name=fromId]").val();
		/* console.log("current sessionId : " + currentUser_session); */
		
		sessionId = strArray[0]; // 현재 메세지를 보낸 사람의 세션을 등록한다.
		message = strArray[1]; // 현재 매세지를 저장한다.
		
		var fromId_ = sessionId;
		/* console.log("엌ㅋ", fromId_); */
		
		var replacefromId = fromId.replace(sessionId, currentUser_session);
		/* console.log("치환후", replacefromId); // 로그인한 아이디로 잘 나옴 */
		
		strArray[0] = replacefromId;
		strArray[1] = message;
		
		for(var i = 0; i < strArray.length; i++) {
			console.log("치환후 ㅠㅠ : str[" + i + "]:" + strArray[i]);
		}
		
		/* var html = "<li class='mar-btm' style='margin-bottom:0px'>";
		
		// 나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.
		if(sessionId == currentUser_session) {
			
			html += "<div class='media-body pad-hor speech-right'>";
			html += "<div class='speech'>";
			html += "<p class='media-heading'>" + sessionId + "</p>";
			html += "<p>" + message + "</p>";
			html += "<p class='speech-time'>";
			html += "<i class='fa fa-clock-o fa-fw'></i></p>";
			html += "</div></div></li></br>";
		}
		else {
			html += "<div class='media-body pad-hor'>";
			html += "<div class='speech'>";
			html += "<p class='media-heading'>" + sessionId + "</p>";
			html += "<p>" + message + "</p>";
			html += "<p class='speech-time'>";
			html += "<i class='fa fa-clock-o fa-fw'></i></p>";
			html += "</div></div></li></br>";
		} */
		
		var rename = "채팅방에서의 " + fromId + "님의 아이디는 [" + sessionId + "]입니다.</br>";
		var html = "";
		console.log("세션 아이디, 리플레이스, 커렌트", sessionId, replacefromId, currentUser_session);
		
		if(replacefromId == currentUser_session) {
			html += sessionId + " : " + message + "</br>";
		}
		else {
			html += sessionId + " : " + message + "</br>";
		}
		
		/* $("#messageList").append(data + "</br>"); */
		$("#renaming").html(rename);
		$("#messageList").append(html);
	}
	
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageList").append("연결 끊김");
	}
	</script>