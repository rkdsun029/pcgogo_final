package project.go.pcgogo.member.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.go.pcgogo.member.model.vo.Manager;

@Controller
public class MemberController {
	
	Logger logger = Logger.getLogger(getClass());
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	@RequestMapping("/signUp.do")
	public String signUp() {
		return "member/signUp";
	}
	
	@RequestMapping("/signUp/{flag}")
	public String register(@PathVariable String flag, @RequestParam("page") int page) {
		return "member/register_"+flag+page;
	}
	
	@RequestMapping("/signUpEnd/{flag}")
	public String insertMember(@PathVariable String flag, Manager manager, @RequestParam("address") String[] address) {
		String addr = address[0]+" "+address[1];
		logger.info("암호화 전 : "+manager.getManagerPassword());
		String encPassword = pwdEncoder.encode(manager.getManagerPassword());
		logger.info("암호화 후 : "+encPassword);
		manager.setManagerAddress(addr);
		manager.setManagerPassword(encPassword);
		logger.info(manager);
		return "member/signUpEnd";
	}
}
