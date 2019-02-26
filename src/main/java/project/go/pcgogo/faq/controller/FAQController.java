package project.go.pcgogo.faq.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import project.go.pcgogo.common.util.Utils;
import project.go.pcgogo.faq.model.exception.FAQException;
import project.go.pcgogo.faq.model.service.FAQService;
import project.go.pcgogo.faq.model.vo.AttachFile;
import project.go.pcgogo.faq.model.vo.Post;
import project.go.pcgogo.faq.model.vo.PostComment;

@Controller
public class FAQController {
	Logger logger = Logger.getLogger(getClass());

	@Autowired
	FAQService faqService;

	// FAQ게시판 목록
	@RequestMapping("/faq/faq.do")
	public ModelAndView selectFaqList(@RequestParam(value="cPage", defaultValue="1") int cPage, ModelAndView mav) {

		if (logger.isDebugEnabled()) 
			logger.debug("FAQ게시판 목록 페이지");

		// (페이징용) 한 페이지에 표시할 게시글 수
		int numPerPage = 10;

		// 업무로직
		// 1. 게시글 리스트(페이징 적용)
		List<Map<String, String>> list = faqService.selectFaqList(cPage, numPerPage);
		logger.debug("list=" + list);

		// 2. 전체 컨텐츠 수
		int totalContents = faqService.selectFaqTotalContents();
		
		mav.addObject("list", list);
		mav.addObject("totalContents", totalContents);
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("cPage", cPage);
		mav.setViewName("/faq/faq");
		return mav;
	}

	// FAQ게시판 검색하기
	@RequestMapping(value="/faq/faqSearch.do")
	public ModelAndView faqList(@RequestParam(defaultValue="") String searchKeyword, @RequestParam(value="cPage", defaultValue="1") int cPage, ModelAndView mav) {

		if (logger.isDebugEnabled()) 
			logger.debug("검색된 FAQ게시판 목록 페이지");

		// 페이징용 한 페이지에 표시할 게시글 수
		int numPerPage = 10;

		// 업무 로직 
		// 1. 검색된 게시글 리스트
		List<Map<String, String>> searchList = faqService.selectSearchFaqList(searchKeyword);
		logger.debug("searchList=" + searchList);

		// 2. 검색된 컨텐츠 수
		int totalContents = faqService.selectSearchFaqtotalContents(searchKeyword);

		// 데이터를 mav에 저장
		mav.addObject("searchList", searchList); // 전체 게시글 목록
		mav.addObject("totalContents", totalContents); // 검색된 게시글 수
		mav.addObject("searchKeyword", searchKeyword); // 검색 키워드
		mav.addObject("numPerPage", numPerPage); // 한 페이지에 표시할 게시글 수
		mav.addObject("cPage", cPage); // 전체 페이지 수 mav.setViewName("/faq/faqSearch");
		// 뷰를 faqSearch.do로 설정
		return mav;
	}

	// FAQ게시판 상세보기
	@RequestMapping(value="/faq/faqView.do")
	public ModelAndView faqView(@RequestParam(defaultValue="") int postNo, @RequestParam(defaultValue="") int postReadCount, ModelAndView mav) {

		if (logger.isDebugEnabled()) 
			logger.debug("FAQ게시판 상세보기 페이지");

		Map<String, String> map = faqService.selectFaqView(postNo);
		List<AttachFile> attachList = new ArrayList<>();

		// 조회수 증가
		faqService.increaseReadCount(postReadCount);
		
		mav.addObject("map", map);
		mav.addObject("attachList", attachList);
		mav.setViewName("/faq/faqView");
		return mav;
	}

	// FAQ게시판 글쓰기
	@RequestMapping(value="/faq/insertFaq.do", method=RequestMethod.POST)
	public ModelAndView insertFaq(Post post, @RequestParam(name="upFile", required=false) MultipartFile[] upFiles, HttpServletRequest request, ModelAndView mav) {

		if (logger.isDebugEnabled()) 
			logger.debug("FAQ게시판 글쓰기");

		try {
			// 1. 파일업로드
			String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/faq");

			List<AttachFile> attachList = new ArrayList<>();
			
			// MultipartFile처리
			for(MultipartFile f : upFiles) {
				if(!f.isEmpty()) {
					// 파일명(업로드)
					String originalFileName = f.getOriginalFilename();
					//파일명(서버저장용)
					String renamedFileName = Utils.getRenamedFileName(originalFileName);
					logger.debug("renamedFileName="+renamedFileName);
					//실제서버에 파일저장
					try {
						f.transferTo(new File(saveDirectory+"/"+renamedFileName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					
					//첨부파일객체 생성. 리스트 추가
					AttachFile attach = new AttachFile();
					attach.setOriginalFileName(originalFileName);
					attach.setRenamedFileName(renamedFileName);
					attachList.add(attach);
				}
			}
			
			// 2. 업무 로직
			int result = faqService.insertFaq(post);

			// 3. 뷰단 처리
			String loc ="/faq/faqView.do";
			String msg = "";

			if (result > 0)
				msg = "게시물 등록 성공!";
			else
				msg = "게시물 등록 실패!";

			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			mav.setViewName("common/msg");
		} catch (Exception e) {
			logger.error("게시물 등록 에러", e);
			throw new FAQException("게시물 등록 에러", e);
		}

		return mav;
	}

	// FAQ게시판 글수정
	@RequestMapping("/faq/updateFaq.do")
	public ModelAndView updateFaq(Post post, ModelAndView mav) {

		if (logger.isDebugEnabled())
			logger.debug("FAQ게시판 글 수정");

		int result = faqService.updateFaq(post);

		String loc = "/faq/faq.do";
		String msg = "";

		if (result > 0)
			msg = "게시물 수정 성공!";
		else
			msg = "게시물 수정 실패!";

		mav.addObject("msg", msg);
		mav.addObject("loc", loc);

		mav.setViewName("/faq/updateFaq");
		return mav;
	}

	// FAQ게시판 글 삭제
	@RequestMapping("/faq/deleteFaq.do")
	public ModelAndView deleteFaq(Post post, ModelAndView mav, int postNo) {

		if (logger.isDebugEnabled())
			logger.debug("FAQ게시판 글 삭제");

		int result = faqService.deleteFaq(postNo);

		String loc = "/faq/faq.do";
		String msg = "";

		if (result > 0)
			msg = "게시물 삭제 성공!";
		else
			msg = "게시물 삭제 실패!";

		mav.addObject("msg", msg);
		mav.addObject("loc", loc);

		mav.setViewName("/faq/deleteFaq");
		return mav;
	}
	
	// FAQ게시판 댓글 보기
	@RequestMapping(value="/faq/faqComment.do", method=RequestMethod.GET)
	public ModelAndView faqCommentView(int o_postNo, ModelAndView mav) {
		
		// 코멘트용 페이징
		int numPerPage = 10;
		
		List<Map<String, String>> list = faqService.selectComment(o_postNo);
		int totalContents = faqService.selectFaqTotalContents();
		
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("list", list);
		mav.addObject("totalContents", totalContents);
		return mav;
	}

	// FAQ게시판 댓글 쓰기
	// @RequestMapping(value="/faq/insertComment.do")
	public int insertComment(PostComment pc) {
		int result = faqService.insertComment(pc);
		return 0;
	}
	
	// FAQ게시판 댓글 수정
	// @RequestMapping(value="/faq/updateComment.do")
	public int updateComment(PostComment pc) {
		int result = faqService.updateComment(pc);
		return 0;
	}
	
	// FAQ게시판 댓글 삭제
	// @RequestMapping(value="/faq/deleteComment.do")
	public int deleteComment(int c_postNo, ModelAndView mav) {
		int result = faqService.deleteComment(c_postNo);
		mav.addObject("result", result);
		return result;
	}

}
