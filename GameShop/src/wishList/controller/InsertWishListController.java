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
import wishList.vo.WishListVO;

@WebServlet({ "/wishList/insertWishList.do" })
public class InsertWishListController extends HttpServlet {
	public InsertWishListController() {
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("loginMember");
		String memId = vo.getMemId();
		String gameId = req.getParameter("gameId");
		
		WishListVO wishVO = new WishListVO();
		wishVO.setGameId(gameId);
		wishVO.setMemId(memId);
		
		IWishListService wishService = WishListServiceImpl.getInstance();
		String wishId = wishService.getWishId(wishVO);
		int cnt = 0;
		if (wishId != null) {
			System.out.println("해당 위시아이디가 위시리스트에 이미 존재함");
		} else {
			System.out.println("해당 위시아이디가 위시리스트에 존재하지 않으므로 위시에 추가");
			cnt = wishService.insertWishList(wishVO);
		}

		String msg = "";
		if (cnt > 0) {
			msg = "위시리스트추가성공";
		} else {
			msg = "위시리스트추가실패";
		}

		System.out.println(msg);
		session.setAttribute("msg", msg);
		resp.sendRedirect(req.getContextPath() + "/detailGame.do?&id=" + gameId);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
