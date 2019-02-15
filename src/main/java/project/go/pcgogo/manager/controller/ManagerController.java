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
	
	@RequestMapping("manager/pcRoomForm.do")
	public String pcRoomForm() {
		return "manager/pcRoomForm";
	}
	
	@RequestMapping("manager/managerCommunity.do")
	public String managerCommunity() {
		return "manager/managerCommunity";
	}
}
