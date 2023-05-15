package members.member.controller;

import games.game.service.GameServiceImpl;
import games.game.service.IGameService;
import games.game.vo.GameVO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import members.member.service.IMemberService;
import members.member.service.MemberServiceImpl;
import members.member.vo.GameCodeVO;
import members.member.vo.MemberVO;
import orders.cart.service.CartServiceImpl;
import orders.cart.service.ICartService;
import orders.cart.vo.CartVO;
import orders.service.IOrderService;
import orders.service.OrderServiceImpl;
import wishList.service.IWishListService;
import wishList.service.WishListServiceImpl;
import wishList.vo.WishListVO;

@WebServlet("/members/registerCode.do")
public class RegisterCodeController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/members/registerCode.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("loginMember");
		String memId = vo.getMemId();

		IMemberService memService = MemberServiceImpl.getInstance();
		IGameService gameService = GameServiceImpl.getInstance();
		IWishListService wishService = WishListServiceImpl.getInstance();
		ICartService cartService = CartServiceImpl.getInstance();
		IOrderService orderService = OrderServiceImpl.getInstance();

		String codeStr = req.getParameter("code");
		// 존재하는 코드인가 확인
		String gameId = null;
		gameId = memService.searchGameCode(codeStr);
		if (gameId != null) {
			String codeUse = memService.searchCodeUse(codeStr);
			if (codeUse.equals("o")) {
				session.setAttribute("msg", "codeUse");
				resp.sendRedirect(req.getContextPath() + "/members/registerCode.do");
			} else {
				// 이미 결제된 게임인가 확인
				List<String> gameList = gameService.getCodeOrderGame(memId);
				boolean isGame = false;
				if (gameList.size() > 0) {
					for (int i = 0; i < gameList.size(); ++i) {
						if (gameList.get(i).equals(gameId)) {
							isGame = true;
							break;
						}
					}
				}
				if (isGame) {
					session.setAttribute("msg", "existGame");
					resp.sendRedirect(req.getContextPath() + "/members/registerCode.do");
				} else {
					
					WishListVO wishVO = new WishListVO();
					wishVO.setGameId(gameId);
					wishVO.setMemId(memId);
					String wishId = wishService.getWishId(wishVO);
					if (wishId != null) {
						System.out.println("위시리스트에 이미 존재함");
					} else {
						wishService.insertWishList(wishVO);
					}

					CartVO cartVO = new CartVO();
					cartVO.setGameId(gameId);
					cartVO.setMemId(vo.getMemId());
					cartVO.setCartPrice("0");
					cartService.insertCart(cartVO);
					cartService.insertCartGame(gameId);
					String check = cartService.checkExist(cartVO);
					if (check != null) {
						System.out.println("장바구니에 이미 존재함");
					} else {
						cartService.insertCart(cartVO);
						cartService.insertCartGame(gameId);
					}
					
					List<CartVO> cartList = cartService.getCartList(memId);
					for (int i = 0; i < cartList.size(); i++) {
						if (cartList.get(i).getGameId().equals(gameId)) {
							// 주문테이블 추가
							orderService.insertOrder(cartList.get(i).getCartId());
							break;
						}
					}

					GameCodeVO codeVO = new GameCodeVO();
					codeVO.setGameCode(codeStr);
					codeVO.setGameId(gameId);
					gameService.updateGameCode(codeVO);
					
					List<GameVO> gameAllList = new ArrayList<GameVO>();
					gameAllList = gameService.allGameList();
					for (int i = 0; i < gameAllList.size(); ++i) {
						if (gameAllList.get(i).getGameId().equals(gameId)) {
							session.setAttribute("gameCodeId", gameAllList.get(i).getGameId());
							session.setAttribute("gameCodeImg", gameAllList.get(i).getGameImg());
							break;
						}
					}
					
					session.setAttribute("msg", "ok");
					resp.sendRedirect(req.getContextPath() + "/members/registerCode.do");
				}
			}
		} else {
			session.setAttribute("msg", "noGameCode");
			resp.sendRedirect(req.getContextPath() + "/members/registerCode.do");
		}

	}

}
