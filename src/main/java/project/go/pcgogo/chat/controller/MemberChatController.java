package project.go.pcgogo.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.go.pcgogo.chat.model.service.ChatService;
import project.go.pcgogo.chat.model.vo.Chat;
import project.go.pcgogo.chat.model.vo.InsertChat;
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
	public String chatRoom() {
		
		return "chat/chatRoom";
	}
	
	@RequestMapping("/chat/selectByToId.do")
	@ResponseBody
	public List<Chat> selectByToId(@RequestParam("fromId") String fromId, Model model) {
		
		System.out.println("Controller@보내는 사람 : " + fromId);
		
		List<Chat> list = chatService.selectByToId(fromId);
		
		System.out.println("채팅방 들어왔을 때 메세지가 있으면! : " + list);
		
		model.addAttribute("list", list);
		
		return list;
	}
	
//	@RequestMapping("/chat/receiveMessage.do")
//	@ResponseBody
//	public List<Chat> receiveMessage(@RequestParam("fromId") String fromId, Model model) {
//		
//		System.out.println("Controller@수신할 때 : " + fromId);
//		
//		List<Chat> list = chatService.receiveMessage(fromId);
//		
//		System.out.println("채팅방 들어왔을 때 메세지가 있으면 (receive)" + list);
//		
//		model.addAttribute("list", list);
//		
//		return list;
//		
//	}
	
//	@RequestMapping("/chat/selectByToId.do")
//	@ResponseBody
//	public ModelAndView chat(@RequestParam("toId") String toId, ModelAndView mav, Model model, Chat chat) {
//		
//		List<Chat> list = chatService.selectByToId(toId);
//		
//		model.addAttribute("list", list);
//		
//		mav.setViewName("chat/chatRoom");
//		
//		return mav;
//	}
	
	@RequestMapping("/chat/insertChat.do")
	@ResponseBody
	public String chatSend(@RequestParam("fromId_") String fromId,
						   @RequestParam("toId_") String toId,
						   @RequestParam("chatContent") String chatContent) {
		
		InsertChat chat = new InsertChat(fromId, toId, chatContent);
		
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




































