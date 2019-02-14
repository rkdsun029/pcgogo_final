package project.go.pcgogo.lostandfound.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LostAndFoundController {

	@RequestMapping("/lostandfound/lnfList.do")
	public String getList() {
		return "lostandfound/lnfList";
	}
}
