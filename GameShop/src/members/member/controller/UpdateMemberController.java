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

@WebServlet("/members/updateMember.do")
public class UpdateMemberController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		String memId = req.getParameter("memId");
//
//		
		IMemberService memService = MemberServiceImpl.getInstance();
//
//		MemberVO mv = new MemberVO();
//				
//		MemberVO mv = memService.getMember(memId);
//
//		System.out.println(mv.getMemId());
//		req.setAttribute("mv", mv);

		req.getRequestDispatcher("/members/updateMember.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		// 파라미터 정보 가져오기
		String memPw = req.getParameter("memPw");
	
		String memPh = req.getParameter("memPh");
		String memMail = req.getParameter("memMail");
		String memBirth = req.getParameter("memBirth");

//		System.out.println("받는거 memID" + memId);
//		System.out.println("받는거 memPW" + memPw);

		IMemberService memService = MemberServiceImpl.getInstance();
		String memId = ((MemberVO) session.getAttribute("loginMember")).getMemId();
		String memName = ((MemberVO) session.getAttribute("loginMember")).getMemName();

		MemberVO mv = new MemberVO();
		mv.setMemId(memId);
		mv.setMemPw(memPw);
		mv.setMemName(memName);
		mv.setMemPh(memPh);
		mv.setMemMail(memMail);

		mv.setMemBirth(memBirth);
		mv.setMemQuit("x");
		mv.setMemAuth("x");

		int cnt = memService.updateMember(mv);

		System.out.println("cnt: " + cnt);

		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}

		session.setAttribute("msg", msg);

		req.setAttribute("msg", msg);
		resp.sendRedirect(req.getContextPath() + "/members/updateMember.do");
	}
}
