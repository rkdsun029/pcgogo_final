package project.go.pcgogo.pcRoom.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.go.pcgogo.pcRoom.model.service.PcService;
import project.go.pcgogo.pcRoom.model.vo.pcRoom;

@Controller
public class PcController {

	@Autowired
	PcService pcService;
	
	private Logger logger = LoggerFactory.getLogger(PcController.class);
	
	@RequestMapping("pcRoom/pcRoom.do")
	public String pcRoom() {
		return "pcRoom/pcRoom";
	}
	@RequestMapping("pcRoom/pcListAdd.do")
	public String pcListAdd() {
		return "pcRoom/pcListAdd";
	}
	
	@RequestMapping("pcRoom/pcList.do")
	public @ResponseBody List<pcRoom> pcList(@RequestParam(value="pcRoom")String pcRoom){
		System.out.println("controller"+pcRoom);
		
		List<pcRoom> pc = pcService.pcList(pcRoom);
		
		System.out.println(pc);
		return pc;
	}
}
