package project.go.pcgogo.manager.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.go.pcgogo.manager.model.jsoup.Crawling;

@Controller
public class ManagerController {
	
	@RequestMapping("/manager/manager.do")
	public String managerMain() {
		return "manager/managerMain";
	}
	
	@RequestMapping("/manager/pcRoomView_manager.do")
	public String pcRoomView_manager() {
		return "manager/pcRoomView_manager";
	}
	
	@RequestMapping("/manager/placement.do")
	public String placement() {
		return "manager/placement";
	}
	
	@RequestMapping("/manager/priceList.do")
	public String priceList() {
		return "manager/priceList";
	}
	
	@RequestMapping("/manager/reservationList.do")
	public String reservationList() {
		return "manager/reservationList";
	}
	
	@RequestMapping("/manager/insertPcRoom.do")
	public String insertPcRoom() {
		return "manager/insertPcRoom";
	}
	
	/*
	 * @RequestMapping("manager/managerCommunity.do") public String
	 * managerCommunity() { return "manager/managerCommunity"; }
	 */
	
	@RequestMapping("manager/pcRoomForm_step1.do")
	public String pcRoomFormStep1() {
		return "manager/pcRoomForm/step1";
	}
	
	@RequestMapping("manager/pcRoomForm_step2.do")
	public String pcRoomFormStep2() {
		return "manager/pcRoomForm/step2";
	}
	
	@RequestMapping("manager/pcRoomForm_step3.do")
	public String pcRoomFormStep3() {
		return "manager/pcRoomForm/step3";
	}
	
	@RequestMapping("manager/pcRoomForm_step4.do")
	public ModelAndView pcRoomFormStep4(@RequestParam (value="option") String temp_option, ModelAndView mav) {
		int option = Integer.parseInt(temp_option);
		mav.addObject("option", option);
		mav.setViewName("manager/pcRoomForm/step4");
		
		
		return mav;
	}
	
	@RequestMapping("manager/pcRoomForm_step5.do")
	public ModelAndView pcRoomFormStep5(@RequestParam (value="option") int option, ModelAndView mav) {
		int pmRow = 0;
		int pmCol = 0;
		
		switch(option) {
		case 1 : pmRow = 5; pmCol = 5;
			break;
		case 2 : pmRow = 20; pmCol = 40;
			break;
		case 3 : pmRow = 30; pmCol = 40;
			break;
		case 4 : pmRow = 40; pmCol = 50;
			break;
		}
		
		mav.addObject("pmRow", pmRow);
		mav.addObject("pmCol", pmCol);
		mav.setViewName("manager/pcRoomForm/step5");
		return mav;
	}
	
	@RequestMapping("manager/pcRoomForm_step6.do")
	public ModelAndView pcRoomFormStep6(@RequestParam (value="pmRow_") int pmRow,
								  @RequestParam (value="pmCol_") int pmCol,
								  @RequestParam (value="pmContent_") String pmContent,
								  ModelAndView mav) {
		
		mav.addObject("pmRow", pmRow);
		mav.addObject("pmCol", pmCol);
		mav.addObject("pmContent", pmContent);
		mav.setViewName("manager/pcRoomForm/step6");
		return mav;
	}
	
	@RequestMapping("manager/pcRoomForm_step7.do")
	public String pcRoomFormStep7() {
		return "manager/pcRoomForm/step7";
	}
	
	@RequestMapping("manager/pcRoomForm_end.do")
	public String pcRoomFormEnd() {
		return "common/msg";
	}
	
	@RequestMapping("/manager/managerCommunity.do")
	public ModelAndView hotDeal(ModelAndView mav) {
		
		List<String> result = new Crawling().Crawling2();
		 
		mav.addObject("result", result);
		mav.setViewName("manager/managerCommunity");
		
		
		return mav;
	}
}
