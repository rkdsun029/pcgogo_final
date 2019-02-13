package project.go.pcgogo.search.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {

	@RequestMapping("/search/search.do")
	public String searchMain() {
		return "search/searchMain";
	}
}
