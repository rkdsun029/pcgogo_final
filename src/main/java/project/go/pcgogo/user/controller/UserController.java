package project.go.pcgogo.user.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import project.go.pcgogo.common.util.Utils;
import project.go.pcgogo.user.model.service.UserService;
import project.go.pcgogo.user.model.vo.Manager;
import project.go.pcgogo.user.model.vo.Member;


@Controller
@SessionAttributes(value = {"loggedInUser"})
public class UserController {
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	UserService userService;

	@RequestMapping(value="/login.do")
	public ModelAndView goLogin(@CookieValue(value="saveId", defaultValue="") String userId, ModelAndView mav) {
		if(!"".equals(userId)) {
			mav.addObject("savedId", userId);
		}
		mav.setViewName("user/login");
		return mav;
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(SessionStatus status) {
		if(!status.isComplete()) status.setComplete();
		return "redirect:/";
	}
	
	@RequestMapping(value="/login/{target}")
	public String goLoginCallback(@PathVariable String target) {
		return "user/loginTo_"+target;
	}
	
	@RequestMapping(value="/signUp.do")
	public String goSignUp() {
		return "user/signUp";
	}
	
	@RequestMapping(value="/signUp/first")
	public String goRegisterFirst(HttpServletRequest req){
		String type = req.getParameter("type");
		req.setAttribute("type", type);
		return "user/register_first";
	}
	
	@RequestMapping(value="/signUp/{flag}")
	public String goRegisterMain(@PathVariable String flag) {
		return "user/register_"+flag;
	}
	
	@RequestMapping(value="/signUpEnd/manager")
	public String insertManager(Manager manager, @RequestParam("address") String[] address,
							   @RequestParam(name="managerCodeImg", required=false) MultipartFile file,
							   HttpServletRequest request) {
		String addr = address[0]+" "+address[1];
		manager.setManagerAddress(addr);
		
		//1. 파일업로드
		String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/register");
		logger.debug(saveDirectory);
		
		//MultipartFile처리
		if(file != null) {
			//파일명(업로드)
			String originalFileName = file.getOriginalFilename();
			//파일명(서버저장용)
			if(!"".equals(originalFileName)) {
				String renamedFileName = Utils.getRenamedFileName(originalFileName);
				logger.debug("renamedFileNam="+renamedFileName);
				//실제서버에 파일저장
				try {
					file.transferTo(new File(saveDirectory+"/"+renamedFileName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				manager.setManagerCodeImgOriginal(originalFileName);
				manager.setManagerCodeImgRenamed(renamedFileName);
			}
		}
		
		logger.info(manager);
		int result = userService.insertManager(manager);
		request.setAttribute("result", result);
		request.setAttribute("flag", "manager");
		logger.info(result>0?"등록성공":"등록실패");
		return "user/signUpEnd";
	}
	
	@RequestMapping("/signUpEnd/member")
	public String insertMember(Member m, HttpServletRequest request) {
		logger.info(m.toString());
		m.setIsSocial(null);
		int result = userService.insertMember(m);
		request.setAttribute("result", result);
		request.setAttribute("flag", "member");
		return "user/signUpEnd";
	}
	
	@RequestMapping(value="/signUp/getToken")
	@ResponseBody
	public String getToken() {
		final String CLIENT_ID = "l7xx04817220b5ef49729c30ee3561503312";
		final String CLIENT_SECRET = "da27e06064234aeb957289bc3c148c6c";
		final String SCOPE = "oob";
		final String GRANT_TYPE = "client_credentials";
		String requestUrl = "https://testapi.open-platform.or.kr/oauth/2.0/token?";
			   requestUrl += "client_id="+CLIENT_ID;
			   requestUrl += "&client_secret="+CLIENT_SECRET;
			   requestUrl += "&scope="+SCOPE;
			   requestUrl += "&grant_type="+GRANT_TYPE;

		String result = "";
		BufferedReader br = null;
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-type", "application/json; charset=UTF-8");
			
			br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String line;
			while((line=br.readLine())!=null) {result += line;}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {try {br.close();} catch (IOException e) {e.printStackTrace();}}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/signUp/realName", produces="application/json; charset=UTF-8")
	public String realName(@RequestParam("data") String data, @RequestParam("token") String token){
		logger.info(data);
		String result = "";
		BufferedReader br = null;
		OutputStream os = null;
		try {
			URL url = new URL("https://testapi.open-platform.or.kr/inquiry/real_name");
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setRequestProperty("Content-type", "application/json; charset=UTF-8");
			con.setRequestProperty("Authorization", "Bearer "+token);
			os = con.getOutputStream();
			os.write(data.getBytes());
			br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String line;
			while((line=br.readLine())!=null) {result += line;}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {try{os.close(); br.close();}catch(IOException e) {e.printStackTrace();}}
		
		logger.info(result);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/signUp/sendToken")
	public Map<String, Object> sendToken(@RequestParam("phone") String phone) {
		final String KEY = "NCSECO19STV9WOMR";
		final String SECRET = "PGBCM9FUATHCVUH5VHY2G3CSZHCXKVRM";
		final String FROM = "01051940502";
		int token = (int)Math.floor((Math.random()*100000)+1);
		String text = "PCGOGO 회원가입 인증번호는 \n"
					+ "["+token+"]입니다. \n"
					+ "타인에게 노출되지 않게 주의바랍니다.";
		
		Message msg = new Message(KEY, SECRET);
		
		HashMap<String, String> settings = new HashMap<>();
		settings.put("to", phone);
		settings.put("from", FROM);
		settings.put("type", "SMS");
		settings.put("text", text);
		settings.put("app_version", "pcgogo");
		
		Map<String, Object> resultMap;
		try {
			JSONObject result = (JSONObject)msg.send(settings);
			resultMap = new HashMap<>();
			resultMap.put("result", result.get("error_count"));
			resultMap.put("token", String.valueOf(token));
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
			resultMap = null;
		}
		return resultMap;
	}
	
	@RequestMapping("/signUp/checkDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkDuplicate(@RequestParam("userId") String userId){
		int cnt = userService.checkDuplicate(userId);
		logger.info(cnt);
		boolean isUsable = cnt==0?true:false;
		Map<String, Object> result = new HashMap<>();
		result.put("isUsable", isUsable);
		return result;
	}
	
	@RequestMapping(value="/loginReq.do")
	public ModelAndView loginReq(@RequestParam("userId") String userId,
								 @RequestParam("userPwd") String userPwd,
								 @RequestParam(value="saveId", defaultValue="N") String isSave,
								 HttpServletResponse res,
								 ModelAndView mav){
		String view ="common/msg";
		String msg = "";
		String loc = "/login.do";
		Object obj = userService.selectOneMember(userId);
		
		if("Y".equals(isSave)) {
			Cookie cook = new Cookie("saveId", userId);
			cook.setMaxAge(60 * 60 * 24);
			cook.setPath("/");
			res.addCookie(cook);
		}else {
			Cookie cook = new Cookie("saveId", null);
			cook.setMaxAge(0);
			cook.setPath("/");
			res.addCookie(cook);
		}
		
		if(obj==null) {
			obj = userService.selectOneManager(userId);
			if(obj==null) {
				msg = "존재하지 않는 아이디입니다.";
			}
			else{
				Manager m = (Manager)obj;
				if(pwdEncoder.matches(userPwd, m.getManagerPassword())) {
					mav.addObject("loggedInUser", m);
//					session.setAttribute("loggedInUser", m);
					view = "redirect:/";
				}
				else {
					logger.info(userPwd);
					logger.info(m.getManagerPassword());
					msg = "비밀번호가 일치하지 않습니다";
				}
			}
		}else {
			Member m = (Member)obj;
			if(pwdEncoder.matches(userPwd, m.getMemberPassword())) { 
				mav.addObject("loggedInUser", m);
				m.setIsSocial(null);
//				session.setAttribute("loggedInUser", m);
				view = "redirect:/";
			}
			else {
				msg = "비밀번호가 일치하지 않습니다";
			}
		}
		mav.setViewName(view);
		mav.addObject("msg", msg);
		mav.addObject("loc", loc);
		return mav;
	}
	
	@RequestMapping(value="/login/socialLoginEnd/{social}")
	@ResponseBody
	public void socialLoginEnd(@RequestParam("userId") String userId,
							   @PathVariable String social,
							   HttpServletRequest req) {
		Member m = new Member();
		if(userId.indexOf("@")>-1) {
			m.setMemberEmail(userId);
			userId = userId.substring(0, userId.lastIndexOf("@"));
			m.setMemberId(userId);
		}else {
			m.setMemberId(userId);
		}
		m.setIsSocial(social);
		req.getSession(true).setAttribute("loggedInUser", m);
		logger.info(m);
	}
	
	@RequestMapping(value="/login/kakao/getUserInfo")
	@ResponseBody
	public String getUserInfo(@RequestParam("access_token") String access_token) {
		String requestUrl = "https://kapi.kakao.com/v2/user/me";

		String result = "";
		BufferedReader br = null;
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			con.setRequestProperty("Authorization", "Bearer "+access_token);
			
			br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String line;
			while((line=br.readLine())!=null) {result += line;}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {try {br.close();} catch (IOException e) {e.printStackTrace();}}
		
		return result;
	}
}
