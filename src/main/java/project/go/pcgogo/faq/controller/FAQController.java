package project.go.pcgogo.faq.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView selectFaqList(@RequestParam(value = "cPage", defaultValue = "1") int cPage, 
									  ModelAndView mav) {

		logger.info("FAQ게시판 목록 페이지");

		// (페이징용) 한 페이지에 표시할 게시글 수
		int numPerPage = 10;

		// 업무로직
		// 1. 게시글 리스트(페이징 적용)
		List<Map<String, String>> list = faqService.selectFaqList(cPage, numPerPage);
		System.out.println("list = " + list);

		// 2. 전체 컨텐츠 수
		int totalContents = faqService.selectFaqTotalContents();
		System.out.println("totalContents = " + totalContents);

		// 데이터를 mav에 저장
		mav.addObject("list", list); // 전체 게시글 목록
		mav.addObject("totalContents", totalContents); // 전체 게시글 수
		mav.addObject("numPerPage", numPerPage); // 한 페이지에 표시할 게시글 수
		mav.addObject("cPage", cPage); // 전체 페이지 수

		// view 지정
		mav.setViewName("faq/faq");
		return mav;
	}
	
	// FAQ게시판 목록 카테고리로 정렬(JSON 사용)
	@RequestMapping("/faq/faq.do/{category}")
	@ResponseBody
	public Map<String, Object> selectFaqListCategory(@PathVariable("category") String category) {
		
		logger.info("FAQ게시판 카테고리로 보기");
		
		List<Map<String, Object>> list = faqService.selectFaqListCategory(category);
		System.out.println("list = " + list);
		
		int selectContents = faqService.selectFaqSelectContents(category);
		System.out.println("selectContents = " + selectContents);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("selectContents", selectContents);
		return map;
	}

	// FAQ게시판 검색하기
	@RequestMapping("/faq/faqSearch.do")
	public ModelAndView selectSearchFaqList(@RequestParam(defaultValue = "title") String searchOption,
											@RequestParam(defaultValue = "") String searchKeyword,
											@RequestParam(value = "cPage", defaultValue = "1") int cPage, 
											ModelAndView mav) throws Exception {

		logger.info("검색된 FAQ게시판 목록 페이지");

		// (페이징용) 한 페이지에 표시할 게시글 수
		int numPerPage = 10;

		// 업무 로직
		// 1. 검색된 게시글 리스트
		List<Map<String, String>> list = faqService.selectSearchFaqList(searchOption, searchKeyword);
		System.out.println("list = " + list);

		// 2. 검색된 컨텐츠 수
		int totalContents = faqService.selectSearchFaqTotalContents(searchOption, searchKeyword);

		// 데이터를 mav에 저장하기
		mav.addObject("list", list); // 전체 게시글 목록
		mav.addObject("totalContents", totalContents); // 검색된 게시글 수
		mav.addObject("searchOption", searchOption); // 검색 옵션
		mav.addObject("searchKeyword", searchKeyword); // 검색 키워드
		mav.addObject("numPerPage", numPerPage); // 한 페이지에 표시할 게시글 수
		mav.addObject("cPage", cPage); // 전체 페이지 수

		// view 지정
		mav.setViewName("faq/faq");
		return mav;
	}

	// FAQ게시판 상세보기
	@RequestMapping(value = "/faq/faqView.do")
	public ModelAndView faqView(@RequestParam("postNo") int postNo, 
								@RequestParam(value="cPage", defaultValue="1") int cPage,
								ModelAndView mav) {

		logger.info("FAQ게시판 상세보기 페이지");
		logger.info("postNo = " + postNo);
		
		Post p = faqService.selectFaqView(postNo);
		List<Map<String, Object>> attachList = faqService.selectFaqAttachView(postNo);
//		System.out.println("list = " + list);
		System.out.println("attachList = " + attachList);
		logger.info(p);
		// 조회수 증가
		faqService.increaseReadCount(postNo);

		// 댓글 페이징
		int numPerPage = 10;

		List<PostComment> commentList = (List<PostComment>) faqService.selectFaqCommentList(postNo);
		System.out.println("commentList = " + commentList);

		// 댓글 개수
		int totalContents = faqService.selectFaqCommentTotalContents(postNo);

		mav.addObject("numPerPage", numPerPage);
		mav.addObject("commentList", commentList);
		mav.addObject("totalContents", totalContents);
		mav.addObject("cPage", cPage);
		mav.addObject("Post", p);
		mav.addObject("attachList", attachList);
		mav.setViewName("faq/faqView");
		return mav;
	}

	// FAQ게시판 글쓰기 페이지로 이동
	@RequestMapping(value = "/faq/faqForm.do", method = RequestMethod.GET)
	public String faqForm() {
		return "faq/faqForm";
	}
	
	// FAQ게시판 글쓰기 처리
	@RequestMapping(value = "/faq/insertFaq.do", method = RequestMethod.POST)
	public ModelAndView insertFaq(Post post, 
								  @RequestParam(name = "upFile", required = false) MultipartFile[] upFiles, 
								  @RequestParam("postOpened") String postOpened, 
								  HttpServletRequest request,
								  ModelAndView mav) {

		logger.info("FAQ게시판 글쓰기 : POST");
		logger.debug("fileName1="+upFiles[0].getOriginalFilename());
		logger.debug("size1="+upFiles[0].getSize());

		try {
			// 1. 파일업로드
			String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/board");
			logger.info(saveDirectory);
			
			List<AttachFile> attachList = new ArrayList<>();

			// MultipartFile처리
			for (MultipartFile f : upFiles) {
				if (!f.isEmpty()) {
					// 파일명(업로드)
					String originalFileName = f.getOriginalFilename();
					// 파일명(서버저장용)
					String renamedFileName = Utils.getRenamedFileName(originalFileName);
					// 실제서버에 파일저장
					try {
						f.transferTo(new File(saveDirectory + "/" + renamedFileName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					
					logger.info("originalFileName = " + originalFileName);
					logger.info("originalFileContent" + f.getContentType());
					logger.info("originalFileSize" + f.getSize());
					logger.info("renamedFileName = " + renamedFileName);

					// 첨부파일객체 생성. 리스트 추가
					AttachFile attach = new AttachFile();
					attach.setOriginalFileName(originalFileName);
					attach.setRenamedFileName(renamedFileName);
					attachList.add(attach);

				}
			}

			// 2. 업무 로직
			int result = faqService.insertFaq(post, attachList);
			System.out.println("result = " + result);

			// 3. view단 처리
			String loc = "/faq/faq.do";
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

	// FAQ게시판 파일 다운로드
	@RequestMapping(value = "/faq/downloadFaqFile.do", method = RequestMethod.GET)
	public ModelAndView fileDownload(@RequestParam("postNo") int postNo, 
									 MultipartFile upFiles, 
									 ModelAndView mav) {
		// 파일 원본 이름 저장
		String originalFileName = upFiles.getOriginalFilename();
		
		logger.info("파일 이름 : " + originalFileName);
		logger.info("파일 속성 : " + upFiles.getContentType());
		logger.info("파일 크기 : " + upFiles.getSize());
		
		int result = faqService.fileDownload(postNo);
		
		mav.addObject("originalFileName", originalFileName);
		mav.setViewName("faq/faq");
		
		return mav;
	}
	
	// FAQ게시판 글수정
	@RequestMapping(value = "/faq/updateFaq.do", method = RequestMethod.POST)
	public ModelAndView updateFaq(Post post, ModelAndView mav) {

		logger.info("FAQ게시판 글 수정");

		int result = faqService.updateFaq(post);

		String loc = "/faq/faq.do";
		String msg = "";

		if (result > 0)
			msg = "게시물 수정 성공!";
		else
			msg = "게시물 수정 실패!";

		mav.addObject("msg", msg);
		mav.addObject("loc", loc);

		mav.setViewName("redirect:faq.do");
		return mav;
	}
	
	// FAQ게시판 첨부파일 수정
	@RequestMapping(value = "/faq/updateFaqFile.do", method = RequestMethod.GET)
	public ModelAndView updateFaqFile(AttachFile attach, 
							   ModelAndView mav, 
							   int attachNo) {
		logger.info("FAQ게시판 첨부파일 수정");
		
		int result = faqService.updateFaqFile(attachNo);
		
		String loc = "/faq/faq.do";
		String msg = "";
		
		if (result > 0)
			msg = "첨부파일 수정 성공!";
		else
			msg = "첨부파일 수정 실패!";
		
		mav.addObject("msg", msg);
		mav.addObject("loc", loc);
		
		mav.setViewName("redirect:faq.do");
		return mav;
	}

	// FAQ게시판 첨부파일 삭제
	@RequestMapping(value = "/faq/deleteFaqFile.do", method = RequestMethod.GET)
	public ModelAndView deleteFaqFile(AttachFile attach, 
							   ModelAndView mav, 
							   int attachNo) {
		logger.info("FAQ게시판 첨부파일 삭제");
		
		int result = faqService.deleteFaqFile(attachNo);
		
		String loc = "/faq/faq.do";
		String msg = "";
		
		if (result > 0)
			msg = "첨부파일 수정 성공!";
		else
			msg = "첨부파일 수정 실패!";
		
		mav.addObject("msg", msg);
		mav.addObject("loc", loc);
		
		mav.setViewName("redirect:faq.do");
		return mav;
	}
	
	// FAQ게시판 글 삭제
	@RequestMapping(value = "/faq/deleteFaq.do", method = RequestMethod.POST)
	public ModelAndView deleteFaq(Post post, ModelAndView mav, int postNo) {

		logger.info("FAQ게시판 글 삭제");

		int result = faqService.deleteFaq(postNo);

		String loc = "/faq/faq.do";
		String msg = "";

		if (result > 0)
			msg = "게시물 삭제 성공!";
		else
			msg = "게시물 삭제 실패!";

		mav.addObject("msg", msg);
		mav.addObject("loc", loc);

		mav.setViewName("redirect:faq.do");
		return mav;
	}

	// FAQ게시판 게시글 댓글 수 보여주기
	// json 사용
//	@RequestMapping("/faq/faqCmtNum.do")
//	public int faqCommentNum(PostComment pc, 
//							 int commentNum) {
//		return 0;
//	}

	// FAQ게시판 댓글 목록(Controller 방식, view를 리턴)
//	@RequestMapping("/faq/faqCmtList.do")
//	public ModelAndView faqCommentList(Post post, 
//									   @RequestParam int postNo, 
//									   @RequestParam(value="cPage", defaultValue = "1") int cPage,
//									   HttpSession session, 
//									   ModelAndView mav) {
//
//		// 댓글 페이징
//		int numPerPage = 10;
//
//		List<Map<String, String>> commentList = faqService.selectFaqCommentList(postNo);
//		System.out.println("commentList = " + commentList);
//
//		// 댓글 개수
//		int totalContents = faqService.selectFaqCommentTotalContents(postNo);
//
//		mav.addObject("numPerPage", numPerPage);
//		mav.addObject("commentList", commentList);
//		mav.addObject("totalContents", totalContents);
//		mav.addObject("cPage", cPage);
//		mav.setViewName("faq/faqView");
//		return mav;
//	}

	// FAQ게시판 댓글 목록(JSON 방식, 데이터를 리턴)
//	@RequestMapping("/faq/faqJsonList.do")
//	@ResponseBody // 리턴 데이터를 json으로 변환
//	public Map<String, Object> faqCommentListJson(@RequestParam int postNo) {
//		logger.info("postNo = " + postNo);
//
//		// 댓글용 페이징
//		int numPerPage = 10;
//
//		int totalContents = faqService.selectFaqCommentTotalContents(postNo);
//
//		List<Map<String, String>> list = faqService.selectFaqCommentList(postNo);
//		Map<String, Object> map = new HashMap<>();
//		map.put("numPerPage", numPerPage);
//		map.put("list", list);
//		map.put("totalContents", totalContents);
//		return map;
//	}

	// FAQ게시판 댓글 쓰기
	@RequestMapping("/faq/insertFaqCmt.do")
	public ModelAndView insertComment(PostComment pc, 
									  HttpSession session, 
									  String memberId, 
									  ModelAndView mav) {
		memberId = (String) session.getAttribute("memberId");
		pc.setC_PostWriter("memberId");
		
		logger.info("FAQ게시판 댓글 쓰기");		
		
		int result = faqService.insertComment(pc);
		
		String loc = "/faq/faq.do";
		String msg = "";
		
		if (result > 0)
			msg = "댓글 등록 성공!";
		else
			msg = "댓글 등록 실패!";
		
		mav.addObject("msg", msg);
		mav.addObject("loc", loc);
		
		mav.setViewName("redirect:faq.do");
		
		return mav;
	}

	// FAQ게시판 댓글 수정
	@RequestMapping("/faq/updateFaqCmt.do")
	public ModelAndView updateComment(int c_postNo, 
									  ModelAndView mav) {
		logger.info("FAQ게시판 댓글 수정");
		
		int result = faqService.updateComment(c_postNo);
		
		String loc = "/faq/faq.do";
		String msg = "";

		if (result > 0)
			msg = "댓글 수정 성공!";
		else
			msg = "댓글 수정 실패!";
		
		mav.addObject("msg", msg);
		mav.addObject("loc", loc);
		
		mav.setViewName("redirect:faq.do");
		
		return mav;
	}

	// FAQ게시판 댓글 삭제
	@RequestMapping("/faq/deleteFaqCmt.do")
	public ModelAndView deleteComment(int c_postNo, 
									  ModelAndView mav) {
		
		logger.info("FAQ게시판 댓글 삭제");
		
		int result = faqService.deleteComment(c_postNo);
		
		String loc = "/faq/faq.do";
		String msg = "";
		
		if (result > 0)
			msg = "댓글 삭제 성공!";
		else
			msg = "댓글 삭제 실패!";
		
		mav.addObject("msg", msg);
		mav.addObject("loc", loc);
		
		mav.setViewName("redirect:faq.do");
		
		return mav;
	}

}
