package project.go.pcgogo.manager.controller;

import java.sql.Date;
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
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONArray;
import project.go.pcgogo.manager.model.jsoup.Crawling;
import project.go.pcgogo.manager.model.service.ManagerService;
import project.go.pcgogo.manager.model.vo.PcRoom;
import project.go.pcgogo.manager.model.vo.Placement;
import project.go.pcgogo.manager.model.vo.PriceList;
import project.go.pcgogo.user.model.vo.Manager;

@Controller
public class ManagerController {
	
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	ManagerService managerService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("manager/manager.do")
	public String managerMain(HttpServletRequest request, ModelAndView mav) {
		HttpSession session = request.getSession(false);
		logger.info("로그인한 사장님 : " + session.getAttribute("loggedInUser").toString());
				
		return "manager/managerMain";
	}
	
	@RequestMapping("manager/getPcRoomList.do")
	@ResponseBody
	public PcRoom getPcRooms(HttpSession session, @RequestParam(value="pcRoomNo", defaultValue="0") int pcRoomNo) {
		Manager manager = (Manager) session.getAttribute("loggedInUser");
		
		List<PcRoom> pList = managerService.getPcRoomList(manager.getManagerId());
		if(pList.isEmpty()) {
			return null;
		}
			
		session.setAttribute("pcRoomList", pList);
		session.setAttribute("selectedPcRoom", pList.get(0));
		if(pcRoomNo != 0) {
			for(PcRoom pc : pList) {
				if(pc.getPcRoomNo() == pcRoomNo) {
					return pc;
				}
			}
		}
		
		logger.info("pList : " + pList);
		logger.info("selectedPcRoom : " + pList.get(0));
		return pList.get(0);
	}
	
	@RequestMapping("manager/convertPcRoom.do")
	public ModelAndView convertPcRoom(ModelAndView mav, HttpSession session) {
		mav.addObject("pcRoomList", session.getAttribute("pcRoomList"));
		mav.setViewName("manager/convertPcRoom");
		return mav;
	}
	
	@RequestMapping("manager/convertPcRoomEnd.do")
	public ModelAndView convertPcRoomEnd(ModelAndView mav, HttpSession session, @RequestParam("pcRoomNo") int pcRoomNo) {
		List<PcRoom> pList = (List<PcRoom>) session.getAttribute("pcRoomList");
		mav.addObject("pcRoomList", session.getAttribute("pcRoomList"));
		
		for(PcRoom pc : pList) {
			if(pc.getPcRoomNo() == pcRoomNo) {
				session.removeAttribute("selectedPcRoom");
				session.setAttribute("selectedPcRoom", pc);
			}
		}
		mav.addObject("popup", "self.close();");
		mav.setViewName("common/msg");
		return mav;
	}
	
	@RequestMapping("manager/pcRoomView_manager.do")
	public String selectedPcRoomView_manager(PcRoom pcRoom, HttpSession session) {
		return "manager/pcRoomView_manager";
	}
	
	@RequestMapping("manager/placement.do")
	public ModelAndView selectedPlacement(PcRoom pcRoom, HttpSession session, ModelAndView mav) {
		pcRoom = (PcRoom) session.getAttribute("selectedPcRoom");
		List<Placement> pList = managerService.getPlacementList(pcRoom.getPcRoomNo());
		logger.info("이 피시방 번호 배치도 리스트 : " + pList);
		
		session.setAttribute("selectedPlacementList", pList);
		mav.setViewName("manager/placement");
		return mav;
	}
	
	@RequestMapping("manager/readPlacement.do")
	public ModelAndView readPlacement(ModelAndView mav, HttpSession session) {
		List<Placement> pList = (List<Placement>) session.getAttribute("selectedPlacementList");
		mav.addObject("selectedPcRoom", (PcRoom) session.getAttribute("selectedPcRoom"));
		mav.addObject("selectedPlacementList", pList);
		mav.setViewName("manager/readPlacement");
		return mav;
	}
	
	@RequestMapping("manager/updatePlacement.do")
	public ModelAndView updatePlacement(ModelAndView mav, HttpSession session) {
		List<Placement> pList = (List<Placement>) session.getAttribute("selectedPlacementList");
		mav.addObject("selectedPcRoom", (PcRoom) session.getAttribute("selectedPcRoom"));
		mav.addObject("selectedPlacementList", pList);
		mav.setViewName("manager/updatePlacement");
		return mav;
	}
	
	@RequestMapping("manager/priceList.do")
	public ModelAndView selectedPriceList(PcRoom pcRoom, HttpSession session, ModelAndView mav) {
		pcRoom = (PcRoom) session.getAttribute("selectedPcRoom");
		
		PriceList pl = null;
		
		try {
			pl = managerService.getPriceList(pcRoom.getPcRoomNo());
			logger.info("thispl : " + pl);			
		}
		catch(NullPointerException e) {
			pl = new PriceList();
			pl.setPlPcRoomNo(pcRoom.getPcRoomNo());
			pl.setPl1000(60);
			pl.setPl2000(120);
			pl.setPl3000(180);
			pl.setPl5000(300);
			pl.setPl10000(600);
			pl.setPl20000(1200);
			pl.setPl30000(1800);
			pl.setPl50000(3000);		
		}
		
		mav.addObject("selectedPriceList", pl);
		mav.setViewName("manager/priceList");
		return mav;
	}
	
	@RequestMapping("manager/insertOrUpdatePrice.do")
	public ModelAndView insertOrUpdatePrice(@RequestParam(value="pcRoomNo") int pcRoomNo,
											@RequestParam(value="priceArr") String priceArr,
											ModelAndView mav) {
		
		String[] tempArr = priceArr.split(",");
		PriceList newPriceList = new PriceList();
		
		newPriceList.setPl1000(Integer.parseInt(tempArr[0]));
		newPriceList.setPl2000(Integer.parseInt(tempArr[1]));
		newPriceList.setPl3000(Integer.parseInt(tempArr[2]));
		newPriceList.setPl5000(Integer.parseInt(tempArr[3]));
		newPriceList.setPl10000(Integer.parseInt(tempArr[4]));
		newPriceList.setPl20000(Integer.parseInt(tempArr[5]));
		newPriceList.setPl30000(Integer.parseInt(tempArr[6]));
		newPriceList.setPl50000(Integer.parseInt(tempArr[7]));
		newPriceList.setPlPcRoomNo(pcRoomNo);
		
		logger.info("입력된 가격표 : " + newPriceList);
		
		PriceList pl = managerService.getPriceList(pcRoomNo);
		logger.info("호출된 가격표 : " + pl);
		
		int result = 0;
		
		if(pl == null) result = managerService.insertPriceList(newPriceList);
		else result = managerService.updatePriceList(newPriceList);
		
		if(result != 1) {
			mav.addObject("msg", "가격표 등록 중 오류가 발생하였습니다.");
			mav.addObject("loc", "/manager/priceList.do");
			mav.setViewName("common/msg");
		}
		else {
			mav.addObject("msg", "가격표가 변경되었습니다.");
			mav.addObject("loc", "/manager/priceList.do");
			mav.setViewName("common/msg");
		}
		return mav;
	}
	
	@RequestMapping("manager/deletePrice.do")
	public ModelAndView deletePrice(@RequestParam(value="pcRoomNo") int pcRoomNo,
									ModelAndView mav) throws Exception {
		PriceList pl = managerService.getPriceList(pcRoomNo);
		logger.info("호출된 가격표 : " + pl);
		
		if(pl == null) {
			mav.addObject("msg", "초기화가 완료되었습니다.");
			mav.addObject("loc", "/manager/priceList.do");
			mav.setViewName("common/msg");
		}
		else {
			int result = managerService.deletePriceList(pcRoomNo);
			if(result == 1) {
				mav.addObject("msg", "초기화가 완료되었습니다.");
				mav.addObject("loc", "/manager/priceList.do");
				mav.setViewName("common/msg");
			}
			else throw new Exception("삭제 과정에서 문제가 발생하였습니다.");
		}
		return mav;
	}
	
	@RequestMapping("manager/reservationList.do")
	public String selectedReservationList(PcRoom pcRoom, HttpSession session) {
		//이거도 pc방 번호로 검색
		return "manager/reservationList";
	}
	
	@RequestMapping("manager/insertPcRoom.do")
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
		
		session.setAttribute("pcRoom", pcRoom);
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
	public void pcRoomFormSavePlacement(HttpSession session, @RequestBody String seatMapList_) {
		logger.info(seatMapList_);
		List<Map<String, Object>> seatMapList = new ArrayList<Map<String, Object>>();
		seatMapList = JSONArray.fromObject(seatMapList_);
		logger.info("seatMapList : " + seatMapList);
		session.removeAttribute("seatMapList");
		session.setAttribute("seatMapList", seatMapList);
	}
	
	@RequestMapping("manager/pcRoomForm_step6.do")
	public String pcRoomFormStep6(HttpSession session) {
		
		List<Map<String, Object>> seatMapList = (List<Map<String, Object>>) session.getAttribute("seatMapList");
		logger.info("step6에서 " + seatMapList);
		return "manager/pcRoomForm/step6";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("manager/pcRoomForm_step7.do")
	@ResponseBody
	public void pcRoomFormStep7(HttpSession session, @RequestBody String seatMapList_) {
		logger.info(seatMapList_);
		List<Map<String, Object>> seatMapList = new ArrayList<Map<String, Object>>();
		seatMapList = JSONArray.fromObject(seatMapList_);
		logger.info("완성 : seatMapList : " + seatMapList);
		session.removeAttribute("seatMapList");
		session.setAttribute("seatMapList", seatMapList);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("manager/pcRoomForm_end.do")
	public ModelAndView pcRoomFormEnd(HttpSession session, ModelAndView mav) throws Exception {
		logger.info("db직전 : " + session.getAttribute("pcRoom"));
		logger.info("db직전 : " + session.getAttribute("seatMapList"));
		
		PcRoom pcRoom = (PcRoom) session.getAttribute("pcRoom");
		List<Map<String, Object>> seatMapList = (List<Map<String, Object>>) session.getAttribute("seatMapList");
		
		logger.info(pcRoom);
		logger.info(seatMapList);
		
		//1. pcRoom객체에서 해당 아이디의 피시방들을 불러와서 없는 거만 등록되게
		
		List<Placement> pList = new ArrayList<>();
		for(int i=0; i<seatMapList.size(); i++) {
			Map<String, Object> m = seatMapList.get(i);
			
			Placement p = new Placement();
			p.setPmFloor((String)m.get("floorNum_"));
			p.setPmRow((Integer) m.get("pmRow_"));
			p.setPmCol((Integer) m.get("pmCol_"));
			p.setPmSeats(Integer.parseInt((String) m.get("seatCount_")));
			p.setPmContent((String) m.get("pmContent_"));
			
			pList.add(p);
		}
		
		int resultCount = pList.size();
		int temp = 0;
		
		int firstResult = managerService.insertPcRoom(pcRoom);
		
		if(firstResult != 0) {
			for(int j=0; j<resultCount; j++) {
				temp = managerService.insertPlacement(pList.get(j));
				
				if(temp == 0) throw new Exception("층 정보 등록 오류입니다.");
				else temp = 0;
			}
		}
		else throw new Exception("기본정보 등록 오류입니다.");
		
		logger.info("placement 배열 : " + pList);

		mav.setViewName("manager/pcRoomForm/step7");
		return mav;
	}
	
	///////////////////////////////////////////////////////////////////////////////
		   
	//메인 사장님커뮤니티 view단 이동
	@RequestMapping("/manager/managerCommunity.do")
	public ModelAndView hotDeal(ModelAndView mav) {
		logger.debug("메모페이지 요청");
		logger.debug(managerService.getClass().toString());
		
		List<Map<String,String>> memoList = managerService.selectMemoList();
		mav.addObject("memoList",memoList);
		
		mav.setViewName("manager/managerCommunity");
		
		return mav;
	}
	
	//ajax 데이터 뿌려주는곳
	@RequestMapping("manager/managerCommunityHotDeal.do") 
	@ResponseBody
	public Map<String, Object> managerCommunity_hotDeal() { 
	
		Map<String, Object> test = new HashMap<>();
		List<Map<String, String>> list = new Crawling().Crawling_hotDeal();
		System.out.println("list = " + list);
		
		test.put("list" , list);
		return test; 
	}
	
	@RequestMapping("manager/managerCommunityBigNews.do") 
	@ResponseBody
	public Map<String, Object> managerCommunity_bignews() { 
		
		Map<String, Object> test = new HashMap<>();
		List<Map<String, String>> list = new Crawling().Crawling_bigNews();
		List<Map<String, String>> listGameNews = new Crawling().Crawling_gameNews();
		System.out.println("list = " + list);
		System.out.println("listGameNews = " + listGameNews);
		
		test.put("list" , list);
		test.put("listGameNews" , listGameNews);
		return test; 
	}
	
	@RequestMapping("/manager/insertMemo.do")
	public String insertMemo(@RequestParam String memo, @RequestParam String password){
		logger.debug("메모 저장");
		Map<String, String> map = new HashMap<String, String>();
		map.put("memo", memo);
		map.put("password", password);
		managerService.insertMemo(map);
		
		return "redirect:/manager/managerCommunity.do";
	}
	
	@RequestMapping("/manager/deleteMemo.do")
	public String deleteMemo(@RequestParam String no, 
	@RequestParam String password){
		logger.debug("메모 삭제");
		Map<String, String> map = new HashMap<>();
		map.put("no", no);
		map.put("password", password);
		managerService.deleteMemo(map);
		
		return "redirect:/manager/managerCommunity.do";
	}
	
	@RequestMapping("/index")
	@ResponseBody
	public Map<String, Object> index_ranking() { 		
		Map<String, Object> test = new HashMap<>();
		List<Map<String, String>> listOnline = new Crawling().Crawling_marketShareOnlineGame();
		List<Map<String, String>> listWeb = new Crawling().Crawling_marketShareWebGame();
		System.out.println("listOnline = " + listOnline);
		System.out.println("listWeb = " + listWeb);
		test.put("listOnline" , listOnline);
		test.put("listWeb" , listWeb);
		return test; 
	}
	
	@RequestMapping("/manager/getChartData")
	@ResponseBody
	public List<Date> getChartData(@RequestParam("pcRoomNo") int pcRoomNo){
		List<Date> chartData = managerService.getChartData(pcRoomNo);
		logger.info(chartData);
		return chartData;
	}
	
	@RequestMapping("/manager/update")
	public ModelAndView updatePcRoomInfo(PcRoom pr, ModelAndView mav, HttpSession session) {
		logger.info(pr);
		int result = managerService.updatePcRoomInfo(pr);
		if(result>0) {
			session.removeAttribute("selectedPcRoom");
			session.setAttribute("selectedPcRoom", managerService.getPcRoom(pr.getPcRoomNo()));
		}
		String msg = result>0?"수정이 완료되었습니다.":"수정 실패하였습니다. 다시 시도해주세요.";
		String loc = "/manager/pcRoomView_manager.do";
		mav.addObject("msg", msg);
		mav.addObject("loc", loc);
		mav.setViewName("common/msg");
		return mav;
	}
}
