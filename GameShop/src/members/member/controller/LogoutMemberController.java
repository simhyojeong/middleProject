package members.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/members/logout.do")
public class LogoutMemberController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		if(session.getAttribute("loginMember") != null) {
			session.setMaxInactiveInterval(0);
			session.removeAttribute("loginMember");
		}else if (session.getAttribute("loginAdmin") != null) {
			session.setMaxInactiveInterval(0);
			session.removeAttribute("loginAdmin");
		}
		
		resp.sendRedirect(req.getContextPath() + "/main.do");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
