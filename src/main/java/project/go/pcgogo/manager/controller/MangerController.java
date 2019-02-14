package project.go.pcgogo.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MangerController {

	@RequestMapping("/manager/manager.do")
	public String managerMain() {
		return "manager/managerMain";
	}
}
