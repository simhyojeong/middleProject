package members.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import members.member.service.IMemberService;
import members.member.service.MemberServiceImpl;
import members.member.vo.MemberVO;

@WebServlet("/members/searchId.do")
public class SearchIdController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/members/searchMemId.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IMemberService memberService = MemberServiceImpl.getInstance();
		HttpSession session = req.getSession();
		
		String memName = req.getParameter("memName");
		String memPh = req.getParameter("memPh");
		MemberVO mv = new MemberVO();

		mv.setMemName(memName);
		mv.setMemPh(memPh);

		String memId = memberService.searchId(mv);

		// 해당 이름과 핸드폰번호를 가진 회원이 존재하는지 확인
		if (memId != null) {
			session.setAttribute("msg", memName + "회원님의 아이디는 " + memId + "입니다.");
		} else {
			session.setAttribute("msg", "해당 정보의 회원이 존재하지 않습니다.");
		}

		resp.sendRedirect(req.getContextPath() + "/members/searchId.do");
	}

}
