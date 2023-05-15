package games.game.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import games.game.service.DiscountServiceImpl;
import games.game.service.GameServiceImpl;
import games.game.service.IDiscountService;
import games.game.service.IGameService;
import games.game.vo.GameDetailVO;
import games.game.vo.GameVO;
import members.member.vo.MemberVO;
import members.review.service.IReviewService;
import members.review.service.ReviewServiceImple;
import members.review.vo.MyReviewVO;
import members.review.vo.ReviewVO;
import orders.cart.service.CartServiceImpl;
import orders.cart.service.ICartService;
import orders.cart.vo.CartVO;
import orders.service.IOrderService;
import orders.service.OrderServiceImpl;
import wishList.service.IWishListService;
import wishList.service.WishListServiceImpl;
import wishList.vo.WishListVO;

@WebServlet("/detailGame.do")
public class GameDetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IGameService service = GameServiceImpl.getInstance();
		IDiscountService discountService = DiscountServiceImpl.getInstance();
		ICartService cartService = CartServiceImpl.getInstance();
		IReviewService reviewService = ReviewServiceImple.getInstance();
		IWishListService wishService = WishListServiceImpl.getInstance();

		req.setCharacterEncoding("UTF-8");
		String id = req.getParameter("id");
		HttpSession session = req.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("loginMember");
		if (vo == null) {
			System.out.println("비회원");
			resp.sendRedirect(req.getContextPath() + "/members/login.do");
		} else {

			List<GameDetailVO> detailList = service.getDetailGameInfo(id);
			List<GameVO> discountList = discountService.getDiscountInfo(id);

			req.setAttribute("detailList", detailList);
			req.setAttribute("discountList", discountList);

			List<MyReviewVO> reviewList = reviewService.getReviewDetailList(id);
			req.setAttribute("reviewList", reviewList);
			if (vo != null) {
				List<CartVO> cartList = cartService.getCartList(vo.getMemId());
				req.setAttribute("cartList", cartList);
				List<WishListVO> wishList = wishService.getMemberWishList(vo.getMemId());
				req.setAttribute("wishList", wishList);
			}

			IOrderService orderSerice = OrderServiceImpl.getInstance();
			List<String> orderedGameIdList = new ArrayList<String>();
			if (vo != null) {
				if (orderSerice.getOrderedGameId(vo.getMemId()) != null) {
					orderedGameIdList = orderSerice.getOrderedGameId(vo.getMemId());
				}
			}

			if (orderedGameIdList.isEmpty()) {
				System.out.println("구매한 기록 없음");
			} else {
				System.out.println("구매한 기록 있음");
			}
			req.setAttribute("orderedGameIdList", orderedGameIdList);

			req.getRequestDispatcher("games/detailGame.jsp").forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
