package project.go.pcgogo.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("/signUp.do")
	public String register() {
		return "member/signUp";
	}
	
	@RequestMapping("/signUp/manager.do")
	public String register_manager() {
		return "member/register_manager2";
	}
}
