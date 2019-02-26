package project.go.pcgogo.lostandfound.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import project.go.pcgogo.common.util.Utils;
import project.go.pcgogo.lostandfound.model.service.LofService;
import project.go.pcgogo.lostandfound.model.vo.LostAndFound;
import project.go.pcgogo.lostandfound.model.vo.Attachment;
import project.go.pcgogo.lostandfound.model.exception.LofException;
@Controller
public class LostAndFoundController {

	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	LofService lofService;
	
	/*
	 * @RequestMapping("/lostandfound/lnfList.do") public String getList() { return
	 * "lostandfound/lnfList"; }
	 */
	
	@RequestMapping("/lostandfound/lnfList.do")
	public ModelAndView selectlofList(@RequestParam(value="cPage",defaultValue="1") int cPage, 
									 ModelAndView mav) {
		if(logger.isDebugEnabled())
			logger.debug("게시판 목록페이지");
		
		int numPerPage = 10;
		//업무로직
		//1.게시글리스트(페이징적용) - 전체 분실물 건수
		List<Map<String, String>> list = lofService.selectlnfList(cPage, numPerPage);
		System.out.println("list"+list);
		
		
		//전체 컨텐츠 수
		int totalContents = lofService.selectlnfTotalContents();
		System.out.println("totalContents = "+totalContents);
		
		
		
		mav.addObject("list",list);
		mav.addObject("totalContents",totalContents);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("cPage", cPage);
		mav.setViewName("lostandfound/lnfList");
		
		return mav;
	}
	
	
	@RequestMapping("/lostandfound/lnfList/{no}") //경로변수
	@ResponseBody //ajax로 처리할대 내가 해둔 컨트롤러는 그냥 컨트롤러인데 이 ajax 처리를 할려면 responsebody가 필요함!!!!!!!!!!!!!!!!
	public Map<String, Object> selectlnfListType(@PathVariable("no") String no){
		logger.debug("no = "+no);
		List<LostAndFound> list = lofService.selectlnfListType(no);
		System.out.println("list"+list);
		
		int selectContents = lofService.selectlnfSelectContents(no);
		System.out.println("selectContents = "+selectContents);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list",list);
		map.put("selectContents",selectContents);
		return map;
		/*
		 * responsebody를 사용하면 jsontype으로 돌려주자나 거기에 근데 mav를 사용하지 않고 그냥 자바 객체를 보내면됨 방금은
		 * view단 코드때문에 오류난거였으니까
		 */
	}
	

	@RequestMapping("/bbb/aaa/lnfName/{lnfName}") //경로변수
	@ResponseBody 
	public Map<String, Object> selectLnfNameList(@PathVariable("lnfName") String lnfName){
		logger.info("물품 검색 = "+lnfName);
		List<LostAndFound> selectList = lofService.selectLnfNameList(lnfName);		
		System.out.println("selectList ="+selectList);
		
		int selectLnfNameCount = lofService.selectLnfNameCount(lnfName);
		System.out.println("selectLnfNameCount = "+selectLnfNameCount);
		
		Map<String, Object> map = new HashMap<>();
		map.put("selectList",selectList);
		map.put("selectLnfNameCount",selectLnfNameCount);
		return map;
	}
	
	
	
	@RequestMapping("/lostandfound/lnfView.do")
	public ModelAndView lnfView(@RequestParam("no") int no , ModelAndView mav) {
		if(logger.isDebugEnabled())
			logger.debug("게시판 뷰페이지");
	
		List<Map<String, String>> list = lofService.selectViewList(no);
		List<Map<String, String>> imgList = lofService.selectViewImgList(no);
	   
		System.out.println("list"+list);
	    System.out.println("imgList"+imgList);
	    
		mav.addObject("list",list);
		mav.addObject("imgList",imgList);
		mav.setViewName("lostandfound/lnfView");
		return mav;
	}
	
	
	
	@RequestMapping("/lostandfound/lnfForm.do")
	public void boardForm() {
		
	}
	
	@RequestMapping("/lostandfound/insertFrm.do")
	public ModelAndView insertFrm(LostAndFound lostandfound, @RequestParam(name="upFile", required=false) MultipartFile[] upFiles,
								  HttpServletRequest request,
								  ModelAndView mav) {
		logger.debug("lostandfound="+lostandfound);
		logger.debug("fileName1="+upFiles[0].getOriginalFilename());
		logger.debug("size1="+upFiles[0].getSize());
		
		logger.info("upload POST 호출");
		try {		
			//1.파일업로드
			String saveDirectory
				= request.getSession()
						 .getServletContext()
						 .getRealPath("/resources/upload/board");
			logger.info(saveDirectory);
			
			List<Attachment> attachList 
				= new ArrayList<>();
			
			//MultipartFile처리
			for(MultipartFile f : upFiles) {
				if(!f.isEmpty()) {
					//파일명(업로드)
					String originalFileName 
						= f.getOriginalFilename();
					//파일명(서버저장용)
					String renamedFileName
						= Utils.getRenamedFileName(originalFileName);
					logger.debug("renamedFileName="+renamedFileName);
					//실제서버에 파일저장
					try {
						f.transferTo(new File(saveDirectory+"/"+renamedFileName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					logger.info("originalFileName = "+originalFileName);
					logger.info("originalFileName = "+renamedFileName);
					//첨부파일객체 생성. 리스트 추가
					Attachment attach = new Attachment();
					attach.setOriginalFileName(originalFileName);
					attach.setRenamedFileName(renamedFileName);
					attachList.add(attach);
					
				}
			}
	
			//2.업무로직
			int result = lofService.insertBoard(lostandfound, attachList);			
			System.out.println("result ="+result );
			
			//3.뷰단처리
			String loc = "/lostandfound/lnfList.do";
			String msg = "";
			if(result>0)
				msg = "게시물 등록 성공!";
			else
				msg = "게시물 등록 실패!";
			
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			mav.setViewName("common/msg");
		
		} catch(Exception e) {
			logger.error("게시물 등록 에러", e);
			throw new LofException("게시물 등록 에러", e);
		}
		
		return mav;
	}
	
	
	
}
