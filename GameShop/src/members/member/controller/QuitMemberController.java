package members.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet("/quitMemberController.do")
public class QuitMemberController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		// 파라미터 정보 가져오기
		
		IMemberService memService = MemberServiceImpl.getInstance();
		
		
		String memId = req.getParameter("memId"); //getParameter 안에는 무조건 ""
//		String memQuit = req.getParameter("memQuit");
		
		
		MemberVO mv = new MemberVO();
		mv.setMemId(memId);
		mv.setMemQuit("o");
		
		int cnt = memService.quitMember(mv);

		System.out.println("cnt: " + cnt);

		req.setAttribute("res", cnt);

//		req.getRequestDispatcher("/members/login.do").forward(req, resp); //cnt를 들고가야 하기때문에 getRequestDispatcher
		resp.sendRedirect(req.getContextPath() + "/members/login.do");
		
//		PrintWriter out = resp.getWriter();
//		out.print(cnt);
//		
	}
}
