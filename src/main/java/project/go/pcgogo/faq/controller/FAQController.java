package project.go.pcgogo.faq.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import project.go.pcgogo.faq.model.service.FAQService;

@Controller
public class FAQController {
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	FAQService faqService;
	
	// FAQ게시판 FAQ 검색하기
	// @RequestMapping("/faq/faqSearch.do")
	
	// FAQ게시판 작성된 글 불러오기
	// @RequestMapping("/faq/faqList.do")
	/*
	 * public ModelAndView selectFaqList(@RequestParam(value="cPage", defaultValue="1" int cPage,
	 * 									 ModelAndView mav) {
	 * if(logger.isDebugEnabled())
	 * 	logger.debug("FAQ게시판 목록 페이지");
	 * 	int numPerPage = 10;
	 *  
	 *  // 업무 로직
	 *  // 1. 게시글 리스트(페이징 적용)
	 *  List<Map<String, String>> list = faqService.selectFaqList(cPage, numPerPage);
	 *  logger(debug("list" + list);
	 *  
	 *  // 2. 전체 컨텐츠 수
	 *  int totalContents = faqService.selectFaqTotalContents();
	 *  
	 *  mav.addObject("list", list);
	 *  mav.addObject("totalContents", totalContents);
	 *  mav.addObject("numPerPage", numPerPage);
	 *  mav.addObject("cPage", cPage);
	 *  mav.setViewName("/faq/faq.jsp");
	 *  
	 *  return mav;
	 * }
	 */
	
	// FAQ게시판 글쓰기
	//@RequestMapping("/faq/faqWrite.do")
	

}
