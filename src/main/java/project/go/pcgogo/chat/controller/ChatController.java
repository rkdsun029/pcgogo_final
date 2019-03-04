package project.go.pcgogo.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {

	@RequestMapping("/chat/chatting.do")
	public String chatMain() {
		return "chat/chatting";
	}
	
}