package members.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import games.game.vo.GameVO;
import members.member.vo.MemberVO;
import members.review.service.IReviewService;
import members.review.service.ReviewServiceImple;
import members.review.vo.MyReviewVO;

@WebServlet("/members/MyReviewUpdate.do")
public class UpdateMyReviewController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 수정할 리뷰ID 가져오기
		String revId = req.getParameter("revId");
		
		// 서비스 객체 생성
		IReviewService revService = ReviewServiceImple.getInstance();
		// 세션열고 아이디값 받아오기
		
//		HttpSession session = req.getSession();
//		MemberVO mv = (MemberVO) session.getAttribute("loginMember");
		
		MyReviewVO rv = revService.getReview(revId);
		req.setAttribute("rv", rv);

		req.getRequestDispatcher("/members/UpdateMyReview.jsp").forward(req, resp);
	

	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		
		// 리뷰정보 가져오기
		String revId = req.getParameter("revId");
		String gameId = req.getParameter("gameId");
		String gameName = req.getParameter("gameName");
		String gameImg = req.getParameter("gameImg");
		String memId = req.getParameter("memId");
		String revTitle = req.getParameter("revTitle");
		String revCont = req.getParameter("revCont");
		String revDate = req.getParameter("revDate");
		String revGrade = req.getParameter("revGrade");
		
		
		

		IReviewService revService = ReviewServiceImple.getInstance();

		// 리뷰정보 수정
		MyReviewVO rv = new MyReviewVO();
		rv.setRevId(revId);
		rv.setGameId(gameId);
		rv.setMemId(memId);
		rv.setRevTitle(revTitle);
		rv.setRevCont(revCont);
		rv.setRevDate(revDate);
		rv.setRevGrade(Integer.parseInt(revGrade));
		
		// 수정
		int cnt = revService.updateReview(rv);
		
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		session.setAttribute("msg", msg);
		
		req.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/members/MyReview.do");

	}

}
