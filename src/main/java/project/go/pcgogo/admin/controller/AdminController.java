package project.go.pcgogo.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.go.pcgogo.admin.model.service.AdminService;

@Controller
public class AdminController {
	
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/admin/permissionList.do")
	public ModelAndView goPermissionList(ModelAndView mav, @RequestParam(value="division", defaultValue="manager") String division) {
		Map<String, String> options = new HashMap<>();
		options.put("division", division);
		options.put("permitted", "N");
		List<Object> permissionList = adminService.getPermissionList(options);
		logger.info(permissionList);
		
		mav.addObject("permissionList", permissionList);
		mav.addObject("division", division);
		mav.setViewName("admin/permissionList");
		return mav;
	}
	
	@RequestMapping("/admin/permit/{division}")
	public ModelAndView permit(ModelAndView mav, @RequestParam("target") String target,
								@PathVariable String division) {
		Map<String, String> options = new HashMap();
		options.put("division", division);
		options.put("target", target);
		int result = adminService.permit(options);
		
		String msg = result>0?"승인이 완료되었습니다.":"승인에 실패하였습니다.";
		logger.info(msg);
		
		mav.addObject("msg", msg);
		mav.addObject("loc", "/admin/permissionList.do");
		mav.setViewName("common/msg");
		return mav;
	}
}
