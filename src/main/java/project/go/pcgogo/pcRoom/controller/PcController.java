package project.go.pcgogo.pcRoom.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.go.pcgogo.pcRoom.model.service.PcService;
import project.go.pcgogo.pcRoom.model.vo.NowPcStatus;
import project.go.pcgogo.pcRoom.model.vo.PcRoom;
import project.go.pcgogo.pcRoom.model.vo.PcRoomList;
import project.go.pcgogo.pcRoom.model.vo.PcRoomRsv;

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
	public @ResponseBody List<PcRoom> pcList(@RequestParam(value="pcRoom")String pcRoom){
		System.out.println("controller"+pcRoom);
		
		List<PcRoom> pc = pcService.pcList(pcRoom);
		
		System.out.println(pc);
		return pc;
	}
    @RequestMapping("/pcRoom/pcRoomList.do")
    public List<PcRoomList> pcRoomList(@RequestParam(value="pcRoomName")String place_name){
    	System.out.println("controller"+place_name);
    	return pcService.pcRoomList(place_name);
    	
    }
    @RequestMapping("/pcRoom/nowPcStatus.do")
    public @ResponseBody List<NowPcStatus> nowPcStatus(@RequestParam(value="pcRoomName")String pcRoomName) {
    	
    	List<NowPcStatus> a =  pcService.nowPcStatus(pcRoomName);
    	if(a.isEmpty()){
    		return null;
    	}
    	return a;
    }
    
    @RequestMapping("/pcRoom/pcRoomRsv.do")
    public ModelAndView pcRoomRsv(@RequestParam(value="pcRoomNo")String pcRoomNo, ModelAndView mav) {
    	List<PcRoomRsv> a = pcService.pcRoomRsv(pcRoomNo);
    	String view = "";
    	String msg="";
    	String loc="";
    	
    	if(a==null) {
    		msg="실패";
    		loc="common/msg";
    	}else {
    		mav.addObject("rsv",a);
    		view="pcRoom/pcRoomRsv";
    	}
    	mav.addObject("loc",loc);
    	mav.addObject("msg",msg);
    	mav.setViewName(view);
    	
    	return mav;
    }
    
    
}
