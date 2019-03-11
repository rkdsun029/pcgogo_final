package project.go.pcgogo.victolee.util;

import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

public class EchoHandler {
	/**
	 * 클라이언트가 접속하여 Session이 생성되면 afterConnectionEstablished() 함수에서 sessionList에 해당 Session을 추가하고,
	 * 클라이언트에서 메세지를 보내면 handleTextMessage() 함수에서 연결된 모든 Session에 메세지를 보내고,
	 * 클라이언트와 접속이 끊기면 afterConnectionClosed() 함수에서 해당 Session의 연결을 끊어버린다.
	 * handleTextMessage()에서 파라미터로 넘어오는 한 Session 객체에만 sendMessage()를 할 경우 해당 Session에게만 메세지가 전송되므로,
	 * 여기서는 반복문을 돌며 전체 세션에 메세지를 발송하도록 했다. 
	 */
	
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	// 클라이언트와 연결 이후에 실행되는 메소드
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info("{} 연결됨", session.getId());
		System.out.println("채팅방 입장자 : " + session.getId());
	}
	
	// 클라이언트가 서버로 메세지를 전송했을 때 실행되는 메소드
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		logger.info("{}로부터 {} 받음", session.getId(), message.getPayload());
	
		// 한 개인에게만 가는 메세지를 for문을 이용하여 전체 세션에게 메세지를 발송하도록 한다.
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(session.getId() + " : " + message.getPayload()));
		}
		
		/**
		 * 이것은 저의 지난 노력들입니다.
		 * 지우지 말아주세요ㅎㅎ..
		 */
//		WebSocketSession s = null;
//		s.sendMessage(new TextMessage(session.getId() + " : " + message.getPayload()));
		
//		Map<String, Object> map = null;
//		
//		Chat chat = Chat.convertMessage(message.getPayload());
//		
//		System.out.println("1 : " + chat.toString());
//		
//		for(WebSocketSession s : sessionList) {
//			map = s.getAttributes();
//			Member memberLoggedIn = (Member) map.get("memberLoggedIn");
//			
//			if(memberLoggedIn.getMemberId().equals(chat.getFromId())) {
//				Gson gson = new Gson();
//				String msgJson = gson.toJson(chat);
//				s.sendMessage(new TextMessage(msgJson));
//			}
//		}
		
	}
	
	// 클라이언트와 연결을 끊었을 떄 실행되는 메소드
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("{} 연결 끊김", session.getId());
		System.out.println("채팅방 퇴장자 : " + session.getId());
	}
}
