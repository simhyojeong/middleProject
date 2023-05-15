package members.member.controller;

import java.io.IOException;
import java.time.LocalDate;
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

@WebServlet("/members/join.do")
public class InsertMemberController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/members/join.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IMemberService memService = MemberServiceImpl.getInstance();

		req.setCharacterEncoding("UTF-8");

		String memId = req.getParameter("mem_id");
		String memPw = req.getParameter("mem_pw");
		String memMail = req.getParameter("mem_mail");
		String memName = req.getParameter("mem_name");
		String memPh = req.getParameter("mem_ph");
		String memBirth = req.getParameter("mem_birth");

		MemberVO member = new MemberVO();
		member.setMemId(memId);
		member.setMemPw(memPw);
		member.setMemMail(memMail);
		member.setMemName(memName);
		member.setMemPh(memPh);
		member.setMemBirth(memBirth);

		memService.insertMember(member);

		HttpSession sessionMsg = req.getSession();
		sessionMsg.setAttribute("msg", "이메일을 확인하여 계정 인증을 완료해주세요");

		// req.getRequestDispatcher("/members/login.jsp").forward(req, resp);
		resp.sendRedirect(req.getContextPath() + "/members/login.do");
	}
}