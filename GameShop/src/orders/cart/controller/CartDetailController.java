package orders.cart.controller;

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
import orders.cart.service.CartServiceImpl;
import orders.cart.service.ICartService;
import orders.cart.vo.CartVO;
import orders.service.IOrderService;
import orders.service.OrderServiceImpl;
import wishList.service.IWishListService;
import wishList.service.WishListServiceImpl;
import wishList.vo.WishListVO;

@WebServlet("/cart/cartDetail.do")
public class CartDetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ICartService cartService = CartServiceImpl.getInstance();

		HttpSession session = req.getSession();
		if (session.getAttribute("loginMember") == null) {
			req.setAttribute("msg", "장바구니 조회는 로그인후에 가능합니다.");
			req.getRequestDispatcher("/main.do").forward(req, resp);
			return;
		}

		MemberVO member = (MemberVO) session.getAttribute("loginMember");

		String memId = member.getMemId();

		// 오더에 없는 카트리스트
		List<CartVO> selectCartList = cartService.getSelectCart(memId);
		// 게임 리스트
		List<String> selectGameList = new ArrayList<String>();
		for (CartVO vo : selectCartList) {
			selectGameList.add(cartService.getSelectGame(vo.getCartId()));
		}

		for (CartVO vo : selectCartList) {
			System.out.println("카트리스트:" + vo.getCartId());
		}

		for (String vo : selectGameList) {
			System.out.println("게임리스트:" + vo);
		}

		// 주문완료된거 제외한 사용자의장바구니 (cartPrice와 cartId)
		req.setAttribute("selectCartList", selectCartList);
		// 주문완료된거 제외한 사용자의장바구니에 해당하는 게임들 (gameId)
		req.setAttribute("selectGameList", selectGameList);

		IOrderService orderService = OrderServiceImpl.getInstance();
		List<GameVO> gameInfoList = new ArrayList<GameVO>();
		for (String vo : selectGameList) {
			gameInfoList.add(orderService.getGamesInfo(vo));
		}

		// 한시적무료게임과 그 게임 가격
		IWishListService wishService = WishListServiceImpl.getInstance();
		List<DiscountVO> discountList = new ArrayList<DiscountVO>();
		for (String vo : selectGameList) {
			if (wishService.discountInWish(vo) != null) {
				discountList.add(wishService.discountInWish(vo));
			}
		}
		for (DiscountVO vo : discountList) {
			System.out.println("[리스트] 장바구니에 있는 무료게임 아이디 : " + vo.getGameId());
		}

		req.setAttribute("discountList", discountList);
		req.setAttribute("gameInfoList", gameInfoList);
		req.getRequestDispatcher("/cart/cartDetail.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
