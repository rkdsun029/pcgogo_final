package project.go.pcgogo.manager.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONArray;
import project.go.pcgogo.manager.model.jsoup.Crawling;
import project.go.pcgogo.manager.model.service.ManagerService;
import project.go.pcgogo.manager.model.vo.PcRoom;
import project.go.pcgogo.user.model.vo.Manager;

@Controller
@SessionAttributes(value= "seatMapList")
public class ManagerController {
	
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	ManagerService managerService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
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
	

	
	@RequestMapping("manager/pcRoomForm_step1.do")
	public ModelAndView pcRoomFormStep1(HttpServletRequest request, ModelAndView mav) {
		HttpSession session = request.getSession(false);
		logger.info("로그인한 사장님 : " + session.getAttribute("loggedInUser").toString());
		
		mav.addObject("loggedInManager", ((Manager) session.getAttribute("loggedInUser")).getManagerId());
		mav.setViewName("manager/pcRoomForm/step1");
		return mav;
	}
	
	@RequestMapping("manager/checkPassword.do")
	@ResponseBody
	public Map pcRoomCheckPassword(@RequestParam (value="managerId") String managerId,
									  @RequestParam (value="password") String password,
									  ModelAndView mav) {
		
		Manager manager = managerService.selectOne(managerId);
		Map<String, Object> resultMap = new HashMap<String, Object>();

		if(passwordEncoder.matches(password, manager.getManagerPassword())) resultMap.put("result", true);
		else resultMap.put("result", false);
		
		return resultMap;
	}
	
	@RequestMapping("manager/pcRoomForm_step2.do")
	public String pcRoomFormStep2() {
		return "manager/pcRoomForm/step2";
	}
	
	@RequestMapping("manager/pcRoomForm_step3.do")
	public ModelAndView pcRoomFormStep3(@RequestParam(value="pcRoomName") String pcRoomName,
								  @RequestParam(value="mainAddress") String mainAddress,
								  @RequestParam(value="detailAddress") String detailAddress,
								  HttpSession session,
								  ModelAndView mav) {
		PcRoom pcRoom = new PcRoom();
		pcRoom.setPcRoomName(pcRoomName);
		pcRoom.setPcRoomAddress(mainAddress + " " + detailAddress);
		pcRoom.setPcRoomManagerId(((Manager) session.getAttribute("loggedInUser")).getManagerId());
		
		System.out.println("생성된 피시방 객체 : " + pcRoom);
		
		mav.addObject("pcRoom", pcRoom);
		mav.setViewName("manager/pcRoomForm/step3");
		return mav;
	}
	
	@RequestMapping("manager/pcRoomForm_step4.do")
	public ModelAndView pcRoomFormStep4(@RequestParam (value="floorArr") String floorArr,
										@RequestParam (value="seatsArr") String seatsArr,
										ModelAndView mav) {
		
		mav.addObject("floorArr", floorArr);
		mav.addObject("seatsArr", seatsArr);
		mav.setViewName("manager/pcRoomForm/step4");
		
		
		return mav;
	}
	
	@RequestMapping("manager/pcRoomForm_step5.do")
	public ModelAndView pcRoomFormStep5(@RequestParam (value="floorArr") String floorArr_ts,
										@RequestParam (value="seatsArr") String seatsArr_ts,
									    ModelAndView mav) {
		
		String[] floorArr = floorArr_ts.split(",");
		String[] seatsArr = seatsArr_ts.split(",");
		
		Map<String, Object> seatMap;
		List<Map<String, Object>> seatMapList = new ArrayList<>();
		
		for(int i=0; i<seatsArr.length; i++) {			
			switch(Integer.parseInt(seatsArr[i])) {
			case 1 : seatMap = new HashMap<>();
					 seatMap.put("floorNum", floorArr[i]);
					 seatMap.put("pmRow", 5); seatMap.put("pmCol", 5);
					 seatMapList.add(seatMap);
				break;
			case 2 : seatMap = new HashMap<>();
					 seatMap.put("floorNum", floorArr[i]);
					 seatMap.put("pmRow", 20); seatMap.put("pmCol", 40);
					 seatMapList.add(seatMap);
				break;
			case 3 : seatMap = new HashMap<>();
					 seatMap.put("floorNum", floorArr[i]);
					 seatMap.put("pmRow", 30); seatMap.put("pmCol", 40);
					 seatMapList.add(seatMap);
				break;
			case 4 : seatMap = new HashMap<>();
					 seatMap.put("floorNum", floorArr[i]);
					 seatMap.put("pmRow", 40); seatMap.put("pmCol", 50);
					 seatMapList.add(seatMap);
				break;
			}
		}
		
		mav.addObject("seatMapList", seatMapList);
		
		mav.setViewName("manager/pcRoomForm/step5");
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("manager/pcRoomForm_savePlacement.do")
	@ResponseBody
	public void pcRoomFormSavePlacement(ModelAndView mav, HttpSession session,
										@RequestBody String seatMapList) {
		logger.info(seatMapList);
		List<Map<String, Object>> seatMapList_ = new ArrayList<Map<String, Object>>();
		seatMapList_ = JSONArray.fromObject(seatMapList);
		logger.info("seatMapList_ : " + seatMapList_);
		
		mav.addObject("seatMapList", seatMapList_);
	}
	
	@RequestMapping("manager/pcRoomForm_step6.do")
	public String pcRoomFormStep6() {
		return "manager/pcRoomForm/step6";
	}
	
	@RequestMapping("manager/pcRoomForm_step7.do")
	public String pcRoomFormStep7() {
		return "manager/pcRoomForm/step7";
	}
	
	@RequestMapping("manager/pcRoomForm_end.do")
	public ModelAndView pcRoomFormEnd(@RequestParam (value="pmRow_") int pmRow,
							  @RequestParam (value="pmCol_") int pmCol,
							  @RequestParam (value="pmContent_") String pmContent,
							  ModelAndView mav) {
		
		mav.setViewName("manager/pcRoomForm/step7");
		return mav;
	}
	
	
	//메인 사장님커뮤니티 view단 이동
		@RequestMapping("/manager/managerCommunity.do")
		public ModelAndView hotDeal(ModelAndView mav) {
			
			mav.setViewName("manager/managerCommunity");
			
			return mav;
		}
	
	//ajax 데이터 뿌려주는곳
	 @RequestMapping("manager/managerCommunity123.do") 
	 @ResponseBody
	 public Map<String, Object> managerCommunity() { 
		 
		Map<String, Object> test = new HashMap<>();
		List<Map<String, String>> list = new Crawling().Crawling_hotDeal();
		System.out.println("list = " + list);
		//크롤링한 list값을 우선 실행해서 긁어옴 

//		ArrayList<String> arrayList = new ArrayList<String>();
//		arrayList.addAll(list);
		//arraylist에 긁어온 list값을 집어넣음
		
		
		
		test.put("list" , list);
		return test; 
	 }
	 
	
	
	
	
	
}
