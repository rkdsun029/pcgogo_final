package project.go.pcgogo.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public String chatRoom() {
		
		
		
		return "chat/chatRoom";
	}
	
	@RequestMapping("/chat/insertChat.do")
	public ModelAndView chatSend(ModelAndView mav, Chat chat, HttpServletRequest request) {
		
		int result = chatService.insertChat(chat);
		
		String loc = "/";
		String msg = "";
		String view = "";
		
		if(result > 0) {
			msg = "메세지 전송에 성공했습니다.";
			view = "common/msg";
			loc = "/chat/chatRoom.do";
		}
		else {
			msg = "메세지 전송에 실패했습니다.";
			loc = "common/msg";
		}
		
		request.setAttribute("loc", loc);
		request.setAttribute("msg", msg);
		
		mav.setViewName(view);
		
		return mav;
	}
}
