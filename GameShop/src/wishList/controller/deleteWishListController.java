package wishList.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import members.member.vo.MemberVO;
import wishList.service.IWishListService;
import wishList.service.WishListServiceImpl;

@WebServlet({ "/wishList/deleteWishList.do" })
public class deleteWishListController extends HttpServlet {
	public deleteWishListController() {
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		String memId = member.getMemId();

		String wishId = req.getParameter("wishId");
		IWishListService wishService = WishListServiceImpl.getInstance();
		
		int cnt = wishService.deleteWishList(wishId);
		String msg = "";
		if (cnt > 0) {
			msg = "위시삭제성공";
		} else {
			msg = "위시삭제실패";
		}

		session.setAttribute("msg", msg);
		resp.sendRedirect(req.getContextPath() + "wishListDetail.do");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
