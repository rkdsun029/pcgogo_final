package project.go.pcgogo.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.go.pcgogo.user.model.service.UserService;

@Controller
public class MemberChatController {
	
	// @Autowired 추가하기
	@Autowired
	UserService userService;
	
	@RequestMapping("/chat/memberChat.do")
	public String memberChatMain() {
		return "chat/memberChat";
	}
	
//	@RequestMapping("/chat/selectByName.do")
//	@ResponseBody
//	public List<User> selectByName(@RequestParam("memberName") String memberId, Model model) {
//		
//		List<User> list = userService.selectByName(memberId);
//		
//		System.out.println("이름으로 되어있지만 아이디로 검색했을 떄 : " + list);
//		
//		model.addAttribute("list", list);
//		
//		return list;
//	}
}
