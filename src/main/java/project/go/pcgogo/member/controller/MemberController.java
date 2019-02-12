package project.go.pcgogo.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("/register.do")
	public String register() {
		return "member/register";
	}
}
