package project.go.pcgogo.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import project.go.pcgogo.admin.model.vo.Admin;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false);
		if(session == null) {
			return false;
		}else {
			Object o = session.getAttribute("loggedInUser");
			System.out.println(o);
			if(!(o instanceof Admin)) {
				request.setAttribute("msg", "비정상 접근입니다.");
				request.setAttribute("loc", "/");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
				return false;
			}
		}
		return super.preHandle(request, response, handler);
	}
}
