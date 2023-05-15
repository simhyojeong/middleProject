package members.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import members.member.service.IMemberService;
import members.member.service.MemberServiceImpl;
import members.member.vo.MemberVO;

@WebServlet("/members/login.do")
public class LoginMemberController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/members/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IMemberService memService = MemberServiceImpl.getInstance();
		HttpSession session = req.getSession();

		String mem_id = req.getParameter("login_id");
		String mem_pw = req.getParameter("login_pw");

		//관리자라면..
		if (mem_id.equals("admin") && mem_pw.equals("1234")) {
			session.setAttribute("loginAdmin", mem_id);
			session.setMaxInactiveInterval(10000);
			resp.sendRedirect(req.getContextPath() + "/main.do");

		} else {
			//회원이라면..
			MemberVO loginMember = new MemberVO(mem_id, mem_pw);
			MemberVO member = memService.loginMember(loginMember);

			if (member != null) {
				session.setAttribute("loginMember", member);
				session.setMaxInactiveInterval(10000);
				resp.sendRedirect(req.getContextPath() + "/main.do");

			} else {
				session.setAttribute("msg", "실패!!");
				resp.sendRedirect(req.getContextPath() + "/members/logout.do");
			}
		}
	}
}
