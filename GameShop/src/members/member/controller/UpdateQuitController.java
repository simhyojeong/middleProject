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
import questions.question.service.IQuestionService;
import questions.question.service.QuestionServiceImpl;
import questions.question.vo.QuestionVO;

@WebServlet("/updateQuitController.do")
public class UpdateQuitController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 파라미터 정보 가져오기

		IMemberService memService = MemberServiceImpl.getInstance();

		String memId = req.getParameter("memId"); 
		
		
		MemberVO mv = new MemberVO();
		mv.setMemId(memId);
		mv.setMemQuit("x");

		int cnt = memService.quitMember(mv);

		System.out.println("cnt: " + cnt);

		req.setAttribute("res", cnt);

		//req.getRequestDispatcher("members/result.jsp").forward(req, resp); // cnt를 들고가야 하기때문에 getRequestDispatcher
	    resp.sendRedirect(req.getContextPath() + "/memberAdminList.do");
	}
}
