package project.go.pcgogo.manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.go.pcgogo.manager.model.service.ManagerService;
import project.go.pcgogo.user.model.vo.Manager;

@Controller
public class ManagerController {
	
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	ManagerService managerService;
	
	@RequestMapping("/manager/manager.do")
	public String managerMain(HttpServletRequest request, ModelAndView mav) {
		HttpSession session = request.getSession(false);
		logger.info("로그인한 사장님 : " + session.getAttribute("loggedInUser").toString());
				
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
	
	@RequestMapping("manager/managerCommunity.do")
	public String managerCommunity() {
		return "manager/managerCommunity";
	}
	
	@RequestMapping("manager/pcRoomForm_step1.do")
	public ModelAndView pcRoomFormStep1(HttpServletRequest request, ModelAndView mav) {
		HttpSession session = request.getSession(false);
		logger.info("로그인한 사장님 : " + session.getAttribute("loggedInUser").toString());
		
		mav.addObject("loggedInManager", ((Manager) session.getAttribute("loggedInUser")).getManagerId());
		mav.setViewName("manager/pcRoomForm/step1");
		return mav;
	}
	
	@RequestMapping("manager/checkPassword.do")
	public String pcRoomCheckPassword(@RequestParam (value="managerId") String managerId,
											@RequestParam (value="password") String password,
											ModelAndView mav) {
		
		
		Manager manager = managerService.selectOne(managerId);
		
		System.out.println("step1 manager : " + manager);
		
		
		return "";
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
		case 1 : pmRow = 20; pmCol = 30;
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
	
	@RequestMapping("manager/pcRoomForm_end.do")
	public ModelAndView pcRoomFormEnd(@RequestParam (value="pmRow_") int pmRow,
							  @RequestParam (value="pmCol_") int pmCol,
							  @RequestParam (value="pmContent_") String pmContent,
							  ModelAndView mav) {
		
		
		
		mav.setViewName("manager/pcRoomForm/step7");
		return mav;
	}
	
}
