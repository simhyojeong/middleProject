package members.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import members.member.vo.MemberVO;
import members.review.service.IReviewService;
import members.review.service.ReviewServiceImple;
import members.review.vo.MyReviewVO;

@WebServlet("/members/InsertMyReview.do")
public class InsertMyReviewController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
//		String gameId = req.getParameter("id");
		
		// 서비스 객체 생성
//		IReviewService revService = ReviewServiceImple.getInstance();

		// 세션열고 아이디값 받아오기
//		HttpSession session = req.getSession();
//		MemberVO mv = (MemberVO) session.getAttribute("loginMember");


//		req.getRequestDispatcher("/games/detailGame.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 리뷰정보 가져오기
//		String revId = req.getParameter("revId");
//		String gameId = req.getParameter("id");
		HttpSession session = req.getSession();
		String gameId = (String) session.getAttribute("gameId");
//		System.out.println(gameId);
		
//		String memId = req.getParameter("loginMember");
		MemberVO mv = (MemberVO) session.getAttribute("loginMember");
		String memId = mv.getMemId();
		
		String revTitle = req.getParameter("revTitle");
		String revCont = req.getParameter("revCont");
//		String revDate = req.getParameter("revDate");
		String revGrade = req.getParameter("revGrade");
		
		IReviewService revService = ReviewServiceImple.getInstance();

		// 리뷰정보 수정
		MyReviewVO myrv = new MyReviewVO();
//		myrv.setRevId(revId);
		myrv.setGameId(gameId);
		myrv.setMemId(memId);
		myrv.setRevTitle(revTitle);
		myrv.setRevCont(revCont);
//		myrv.setRevDate(revDate);
		
//		myrv.setRevGrade(revGrade);
		myrv.setRevGrade(Integer.parseInt(revGrade));
		
		// 리뷰정보 등록
		revService.insertReview(myrv);
					
		resp.sendRedirect(req.getContextPath() + "/detailGame.do?id=" + gameId);
	}
}
