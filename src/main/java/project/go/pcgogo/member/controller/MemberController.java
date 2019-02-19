package project.go.pcgogo.member.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import project.go.pcgogo.common.util.Utils;
import project.go.pcgogo.member.model.service.MemberService;
import project.go.pcgogo.member.model.vo.Manager;


@Controller
public class MemberController {
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/signUp.do")
	public String signUp() {
		return "member/signUp";
	}
	
	@RequestMapping(value="/signUp/{flag}")
	public String register(@PathVariable String flag, @RequestParam("page") int page) {
		return "member/register_"+flag+page;
	}
	
	@RequestMapping(value="/signUpEnd/manager")
	public String insertMember(Manager manager, @RequestParam("address") String[] address,
							   @RequestParam(name="managerCodeImg", required=false) MultipartFile file,
							   HttpServletRequest request) {
		String addr = address[0]+" "+address[1];
		logger.info("암호화 전 : "+manager.getManagerPassword());
		String encPassword = pwdEncoder.encode(manager.getManagerPassword());
		logger.info("암호화 후 : "+encPassword);
		manager.setManagerAddress(addr);
		manager.setManagerPassword(encPassword);
		
		//1. 파일업로드
		String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/register");
		logger.debug(saveDirectory);
		
		//MultipartFile처리
		if(file != null) {
			//파일명(업로드)
			String originalFileName = file.getOriginalFilename();
			//파일명(서버저장용)
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
		
		logger.info(manager);
		int result = memberService.insertManager(manager);
		logger.info(result>0?"등록성공":"등록실패");
		return "member/signUpEnd";
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
}
