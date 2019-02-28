package project.go.pcgogo.chat.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.go.pcgogo.chat.model.service.ChatService;
import project.go.pcgogo.chat.model.vo.Chat;
import project.go.pcgogo.user.model.service.UserService;

@Controller
public class MemberChatController {
	
	// @Autowired 추가하기
	@Autowired
	UserService userService;
	
	@Autowired
	ChatService chatService;
	
	@RequestMapping("/chat/memberChat.do")
	public String memberChatMain() {
		return "chat/memberChat";
	}
	
	@RequestMapping("/chat/selectByName.do")
	@ResponseBody
	public List<User> selectByName(@RequestParam("memberId") String memberId, Model model) {
		
		List<User> list = userService.selectByName(memberId);
		
		System.out.println("이름으로 되어있지만 아이디로 검색했을 떄 : " + list);
		
		model.addAttribute("list", list);
		
		return list;
	}
	
	@RequestMapping("/chat/chatRoom.do")
	@ResponseBody
	public String chatRoom(@RequestParam("fromId") String fromId, Model model) {
		
		Chat c = chatService.messageView(fromId);
		
		model.addAttribute("c", c);
		
		return "chat/chatRoom";
	}
	
	@RequestMapping("/chat/insertChat.do")
	@ResponseBody
	public String chatSend(@RequestParam("fromId_") String fromId,
						   @RequestParam("toId_") String toId,
						   @RequestParam("chatContent") String chatContent) {
		
		Chat chat = new Chat(fromId, toId, chatContent);
		
		int result = chatService.insertChat(chat);
		
		System.out.println(result > 0 ? "전송 성공" : "전송 실패");
		
		return "redirect:/";
	}
	
//	@PostMapping("/chat/insertChat.do")
//	public Map<String, String> insertChat(@RequestBody Chat chat) {
//		
//		Map<String, String> map = new HashMap<>();
//		
//		String msg = chatService.insertChat(chat) > 0 ? "메시지 전송에 성공했습니다." : "메세지 전송에 실패했습니다.";
//		
//		map.put("msg", msg);
//		
//		return map;
//	}
	
//	@RequestMapping("/chat/getChat.do")
//	@ResponseBody
//	public List<Chat> getChat(@RequestParam("fromId_") String fromId, Model model) {
//		
//		List<Chat> list = chatService.getChat(fromId);
//		
//		System.out.println("보낸 메세지 / 받은 메세지" + list);
//		
//		model.addAttribute("list", list);
//		
//		return list;
//		
//	}
}




































