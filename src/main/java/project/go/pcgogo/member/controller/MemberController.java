package project.go.pcgogo.member.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;
import project.go.pcgogo.member.model.vo.Manager;


@Controller
public class MemberController {
	
	Logger logger = Logger.getLogger(getClass());
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	@RequestMapping(value="/signUp.do")
	public String goSignUp() {
		return "member/signUp";
	}
	
	@RequestMapping(value="/signUp/first")
	public String goRegisterFirst(HttpServletRequest req){
		String type = req.getParameter("type");
		req.setAttribute("type", type);
		return "member/register_first";
	}
	
	@RequestMapping(value="/signUp/{flag}")
	public String goRegisterMain(@PathVariable String flag) {
		return "member/register_"+flag;
	}
	
	@RequestMapping(value="/signUpEnd/{flag}")
	public String insertMember(@PathVariable String flag, Manager manager, @RequestParam("address") String[] address) {
		String addr = address[0]+" "+address[1];
		logger.info("암호화 전 : "+manager.getManagerPassword());
		String encPassword = pwdEncoder.encode(manager.getManagerPassword());
		logger.info("암호화 후 : "+encPassword);
		manager.setManagerAddress(addr);
		manager.setManagerPassword(encPassword);
		logger.info(manager);
		return "member/signUpEnd";
	}
	
	@RequestMapping(value="/signUp/getToken")
	@ResponseBody
	public String getToken() {
		final String CLIENT_ID = "l7xx04817220b5ef49729c30ee3561503312";
		final String CLIENT_SECRET = "da27e06064234aeb957289bc3c148c6c";
		final String SCOPE = "oob";
		final String GRANT_TYPE = "client_credentials";
		final String URL = "https://testapi.open-platform.or.kr/oauth/2.0/token";
		JSONObject obj = new JSONObject();
		obj.put("client_id", CLIENT_ID);
		obj.put("client_secret", CLIENT_SECRET);
		obj.put("scope", SCOPE);
		obj.put("grant_type", GRANT_TYPE);
		System.out.println(obj.toString());
		try {
			URL url = new URL("https://testapi.open-platform.or.kr/oauth/2.0/token");
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-type", "application/json; charset=UTF-8");
			con.setRequestProperty("data", obj.toString());
			System.out.println(con.getHeaderField("access_token"));
			int code = con.getResponseCode();
			System.out.println(code);
			for (Map.Entry<String, List<String>> header : con.getHeaderFields().entrySet()) {
				for (String value : header.getValue()) {
					System.out.println(header.getKey() + " : " + value);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}


		
		return "";
	}
}
