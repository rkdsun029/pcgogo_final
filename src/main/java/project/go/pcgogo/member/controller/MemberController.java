package project.go.pcgogo.member.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.go.pcgogo.member.model.vo.Manager;

@Controller
public class MemberController {
	
	Logger logger = Logger.getLogger(getClass());
	
	@RequestMapping("/signUp.do")
	public String signUp() {
		return "member/signUp";
	}
	
	@RequestMapping("/signUp/{flag}")
	public String register(@PathVariable String flag, @RequestParam("page") int page) {
		return "member/register_"+flag+page;
	}
	
	@RequestMapping("/signUpEnd/{flag}")
	public String insertMember(@PathVariable String flag, Manager manager) {
		logger.info(manager);
		return "member/signUpEnd";
	}
}
