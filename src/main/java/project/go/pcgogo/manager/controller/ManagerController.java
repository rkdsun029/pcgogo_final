package project.go.pcgogo.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("manager/managerCommunity.do")
	public String managerCommunity() {
		return "manager/managerCommunity";
	}
	
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
	public String pcRoomFormStep4() {
		return "manager/pcRoomForm/step4";
	}
	
	@RequestMapping("manager/pcRoomForm_step5.do")
	public String pcRoomFormStep5() {
		return "manager/pcRoomForm/step5";
	}
	
	@RequestMapping("manager/pcRoomForm_step6.do")
	public String pcRoomFormStep6() {
		return "manager/pcRoomForm/step6";
	}
	
	@RequestMapping("manager/pcRoomForm_end.do")
	public String pcRoomFormEnd() {
		return "common/msg";
	}
	
}
