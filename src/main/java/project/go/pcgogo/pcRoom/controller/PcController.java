package project.go.pcgogo.pcRoom.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import project.go.pcgogo.pcRoom.model.vo.PcRoomDetail;
import project.go.pcgogo.pcRoom.model.vo.PcRoomList;
import project.go.pcgogo.pcRoom.model.vo.PcRoomRsv;
import project.go.pcgogo.pcRoom.model.vo.PcRoomRsvDetail;
import project.go.pcgogo.user.model.vo.Member;

@Controller
public class PcController {

	@Autowired
	PcService pcService;
	
	private Logger logger = LoggerFactory.getLogger(PcController.class);
	
	@RequestMapping("pcRoom/pcRoom.do")
	public String pcRoom() {
		int result = pcService.deleteRsv();
		System.out.println("삭제완료");
		return "pcRoom/pcRoom";
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
    public ModelAndView pcRoomRsv(HttpServletRequest request, 
    							@RequestParam(value="pcRoomNo")String pcRoomNo, ModelAndView mav) {
   		HttpSession session = request.getSession(false);
   		mav.addObject("memberId",((Member)session.getAttribute("loggedInUser")).getMemberId());
   		mav.addObject("cash",((Member)session.getAttribute("loggedInUser")).getMemberCash());
   		
   		//mav.addObject("loggedInManager", ((Manager) session.getAttribute("loggedInUser")).getManagerId());

   		
    	List<PcRoomRsv> a = pcService.pcRoomRsv(pcRoomNo);
    	List<PcRoomRsv> b = pcService.pcRoomProduct(pcRoomNo);
    	System.out.println("AAAA"+a);
    	String view = "";
    	String msg="";
    	String loc="";
    	
    	if(a==null) {
    		msg="실패";
    		loc="common/msg";
    	}else {
    		mav.addObject("rsv",a);
    		mav.addObject("product",b);
    		view="pcRoom/pcRoomRsv";
    	}
    	mav.addObject("loc",loc);
    	mav.addObject("msg",msg);
    	mav.setViewName(view);
    	
    	return mav;
    }
    
    @RequestMapping("/pcRoom/pcRoomRsvGo.do")
    public @ResponseBody ModelAndView pcRoomRsvGo(@RequestParam(value="pmContent") String pmContent, 
    											  @RequestParam(value="sitted") String sitted, 
    											  @RequestParam(value="pcRoomNo") int pcRoomNo,
    											  @RequestParam(value="memberId") String memberId,
    											  ModelAndView mav) {
    	
    	PcRoomRsv rsv = new PcRoomRsv();
    	rsv.setPmContent(pmContent);
    	rsv.setSitted(sitted);
    	rsv.setPmPcRoomNo(pcRoomNo);
    	
    	
    	int result= pcService.pcRoomRsvGo(rsv);
    	
    	
    	
    	
    	return mav;
    	
    }
    @RequestMapping("/pcRoom/pcRoomRsvSet.do")
    public @ResponseBody ModelAndView pcRoomRsvSet(HttpServletRequest request,
    											  @RequestParam(value="sitted")String sitted, 
    											  @RequestParam(value="pcRoomNo")String pcRoomNo,
    											  @RequestParam(value="timeSet") String timeSet,
    											  @RequestParam(value="rsvNo")String rsvNo,
    											  ModelAndView mav) {
    	HttpSession session = request.getSession(false);
    	String memberId = ((Member) (session.getAttribute("loggedInUser"))).getMemberId();
    	Map<String, String> map = new HashMap<>();
        map.put("sitted", sitted);
        map.put("pcRoomNo", pcRoomNo);
        
        int result = pcService.pcRoomRsvSet(map);
        
        Map<String, String> map2 = new HashMap<>();
        System.out.println(rsvNo);
        String[] rsvNoArray;
        rsvNoArray = rsvNo.split(",");
        PcRoomRsvDetail rsv = new PcRoomRsvDetail();
        rsv.setMemberId(memberId);
        rsv.setPcRoomNo(pcRoomNo);
        rsv.setTimeSet(timeSet);
        int result2 =0;
        for(int a=0; a<rsvNoArray.length;a++) {
        	rsv.setSeatNo(rsvNoArray[a]);
        	
        	result2 = pcService.pcRoomRsvDetail(rsv); 
        }
        
        String view = "";
    	String msg="";
    	String loc="";
    	if(result2>0) {
    		msg="예약 성공";
    		view="pcRoom/pcRoomRsvEnd";
    	}else {
    		msg="예약 실패";
    		loc="common/msg";
    	}
    	mav.addObject("loc",loc);
    	mav.addObject("msg",msg);
    	mav.setViewName(view);
       
    	return mav;
    }
    
    @RequestMapping("/pcRoom/pcRoomRsvEnd.do")
    public String pcRoomRsvEnd() {
    	

		return "pcRoom/pcRoomRsvEnd";
    }
    @RequestMapping("/pcRoom/buyCash.do")
    public ModelAndView buyCash(HttpServletRequest request, ModelAndView mav){
		HttpSession session = request.getSession(false);
		mav.addObject("memberId", ((Member) session.getAttribute("loggedInUser")).getMemberId());
		mav.setViewName("pcRoom/buyCash");
    	
    	return mav;
    }

	@RequestMapping("/pcRoom/buyCashEnd.do")
	public ModelAndView buyCashEnd(@RequestParam(value="memberId")String memberId,
									@RequestParam(value="cash")String cash,
									ModelAndView mav) {
    	Map<String, String> map = new HashMap<>();
        map.put("memberId", memberId);
        map.put("cash", cash);
		System.out.println(memberId+cash);
        
		int result = pcService.buyCashEnd(map);
		System.out.println("@@@@@@@@@"+result);
        String view = "";
    	String msg="";
    	String loc="";
    	if(result > 0) {
			msg = "충전되었습니다.";
			String script = "self.close();";
			mav.addObject("script",script);
    		view="/pcRoom/buyCashEnd";
		}
		
		else {
			msg = "코인 충전을 실패했습니다.";
			loc = "/pcRoom/buyCash?memberId=" + memberId;
		}
		
    	
    	mav.addObject("loc",loc);
    	mav.addObject("msg",msg);
    	mav.setViewName(view);
       
    	return mav;
	}
    @RequestMapping("/pcRoom/buyCashEnd1.do")
    public String buyCashEnd() {
    	return "/pcRoom/buyCashEnd";
    }
    
    @RequestMapping("/pcRoom/pcRoomDetail.do")
    public @ResponseBody List<PcRoomDetail> pcRoomDetail() {
    	List<PcRoomDetail> b = pcService.pcRoomDetail();
    	System.out.println("b@controller"+b);
        
    	return b;
    }
    
}
