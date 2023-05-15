package wishList.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import games.game.vo.DiscountVO;
import games.game.vo.GameVO;
import members.member.vo.MemberVO;
import wishList.service.IWishListService;
import wishList.service.WishListServiceImpl;
import wishList.vo.WishListVO;

@WebServlet("/wishList/wishListDetail.do")
public class detailWishListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		if (session.getAttribute("loginMember") == null) {
			req.setAttribute("msg", "위시리스트는 로그인 후에 확인이 가능합니다");
			req.getRequestDispatcher("/main.do").forward(req, resp);
			return;
		}

		// 위시리스트엔 구매 완료된 게임은 띄우면 X
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		String memId = member.getMemId();
		IWishListService wishService = WishListServiceImpl.getInstance();

		// 구매완료된 게임 제외한 위시리스트
		List<WishListVO> wishLists = wishService.getWishList(memId);
		System.out.println(wishLists.size());
		for (WishListVO vo : wishLists) {
			System.out.println("위시게임아이디 확인 :" + vo.getGameId());
			System.out.println("위시아이디 확인 :" + vo.getWishId());
		}

		List<GameVO> gameDetailList = new ArrayList<GameVO>();
		// 선별한 게임 아이디에 대한 게임정보
		for (WishListVO vo : wishLists) {
			gameDetailList.add((GameVO) wishService.gameDetail(vo.getGameId()));
		}

		// 한시적 무료
		List<DiscountVO> discountList = new ArrayList<DiscountVO>();
		for (WishListVO vo : wishLists) {
			if (wishService.discountInWish(vo.getGameId()) != null) {
				discountList.add(wishService.discountInWish(vo.getGameId()));
			}
		}
		for (DiscountVO vo : discountList) {
			System.out.println("위시리스트에 있는 무료게임 아이디 : " + vo.getGameId());
		}

		req.setAttribute("wishLists", wishLists);
		req.setAttribute("gameDetailList", gameDetailList);
		req.setAttribute("discountList", discountList);
		req.getRequestDispatcher("/wishList/detail.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
