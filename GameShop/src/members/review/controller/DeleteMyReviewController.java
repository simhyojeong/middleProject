package members.review.controller;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/members/MyReviewDelete.do")
public class DeleteMyReviewController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 삭제할 리뷰ID 가져오기
		String revId = req.getParameter("revId");
		
		
		IReviewService revService = ReviewServiceImple.getInstance();
		revService.deleteReview(revId);
		
		
		
		HttpSession session = req.getSession();
		MemberVO mv = (MemberVO) session.getAttribute("loginMember");		
		
		
		
		resp.sendRedirect(req.getContextPath() + "/members/MyReview.do");
		
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
}
