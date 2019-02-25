package project.go.pcgogo.faq.controller;

import java.util.List;

// import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.go.pcgogo.faq.model.service.FAQService;
import project.go.pcgogo.faq.model.vo.Post;

@Controller
public class FAQController {
	// Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	FAQService faqService;
	
	// FAQ게시판
	@RequestMapping("/faq/faq.do")
	public ModelAndView selectFaqList(@RequestParam(value="cPage",defaultValue="1") int cPage,
									  ModelAndView mav) {
		
		int numPerPage = 10;
		// 업무로직
		// 1. 게시글 리스트(페이징 적용)
		List<Post> list = faqService.selectFaqList(cPage, numPerPage);
				
		// 2. 전체 컨텐츠 수
		int totalContents = faqService.selectFaqTotalContents();
		mav.addObject("list",list);
		mav.addObject("totalContents",totalContents);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("cPage", cPage);
		mav.setViewName("faq/faq");
		return mav;
	}

	// FAQ게시판 검색하기
	@RequestMapping("/faq/faqSearch.do")
	public ModelAndView faqList(@RequestParam(defaultValue="postTitle") String searchOption, 
								@RequestParam(defaultValue="") String searchKeyword, 
								ModelAndView mav) {
		
		// 업무 로직
		// 1. 검색된 게시글 리스트
		List<Post> list = faqService.selectSearchFaqList(searchOption, searchKeyword);
		
		// 2. 검색된 컨텐츠 수
		int totalContents = faqService.selectSearchFaqtotalContents(searchOption, searchKeyword);
		
		// 데이터를 mav에 저장
		mav.addObject("list", list); // 전체 게시글 목록
		mav.addObject("totalContents", totalContents); // 검색된 게시글 수
		mav.addObject("searchOption", searchOption); // 검색 옵션
		mav.addObject("searchKeyword", searchKeyword); // 검색 키워드
		mav.setViewName("/faq/faqSearch.jsp"); // 뷰를 faqSearch.jsp로 설정
		return mav;
	}
	
	// FAQ게시판 상세보기
	// @RequestMapping("/faq/faqView.do")
	/*
	 * public void faqView() {
	 * 
	 * }
	 */
		
	// FAQ게시판 글쓰기
	//@RequestMapping("/faq/insertFaq.do")
	/*
	 * public ModelAndView insertFaq(Post post, 
	 * 								 @RequestParam(name="upFile", required=false) MultipartFile[] upFiles, 
	 * 								 HttpServletRequest request, 
	 * 								 ModelAndView mav) {
	 * 	logger.debug("post =" + post);
	 * 	logger.debug("oFileName =" + upFiles[0].getOriginalFilename());
	 * 	logger.debug("oSize = " + upFiles[0].getSize());
	 * 	logger.debug("rFileName =" + upFiles[1].getOriginalFilename());
	 * 	logger.debug("rSize = " + upFiles[1].getSize());
	 * 
	 * try {
	 *	 // 1. 파일업로드
	 * 	String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/faq");
	 * 	logger.debug(saveDirectory);
	 * 	
	 * 
	 *	// 2. 업무 로직
	 *	int result = faqService.insertFaq(post);
	 *
	 *	// 3. 뷰단 처리
	 *	String loc ="/faq/faqList.do";
	 *	String msg = "";
	 *	if(result > 0)
	 *		msg = "게시물 등록 성공!";
	 *	else
	 *		msg = "게시물 등록 실패!";
	 *
	 *	mav.addObject("msg", msg);
	 *	mav.addObject("loc", loc);
	 *	mav.setViewName("common/msg");
	 *	} catch(Exception e) {
	 *		logger.error("게시물 등록 에러", e);
	 *		throw FAQException("게시물 등록 에러", e);
	 *	}
	 *
	 * }
	 */
	
	// FAQ게시판 글쓰기 첨부파일
	// @RequestMapping("/faq/filedownload.do")
	/*
	 * public void searchFaq(Model model)
	 */

}
