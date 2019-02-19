package project.go.pcgogo.lostandfound.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.go.pcgogo.lostandfound.model.service.LofService;
import project.go.pcgogo.lostandfound.model.vo.LostAndFound;


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
		//1.게시글리스트(페이징적용)
		List<Map<String, String>> list = lofService.selectlnfList(cPage, numPerPage);
		logger.debug("list"+list);
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
	public List<LostAndFound> selectlnfListType(@PathVariable("no") int no){
		logger.debug("no = "+no);
		List<LostAndFound> list = lofService.selectlnfListType(no);

		System.out.println("list"+list);
		/**/
		logger.debug("list"+list);
		return list;
	}
	
	
	
}
