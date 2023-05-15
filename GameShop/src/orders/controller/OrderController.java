package orders.controller;

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
import orders.vo.OrderVO;
import wishList.service.IWishListService;
import wishList.service.WishListServiceImpl;

@WebServlet("/orderController.do")
public class OrderController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<String> gamesIdList = new ArrayList<String>();
		List<GameVO> gameInfoList = new ArrayList<GameVO>();
		List<String> cartIdList = new ArrayList<String>();
		IOrderService orderSerice = OrderServiceImpl.getInstance();
		String msg = "";
		System.out.println("상세페이지에서 주문하기 눌러 주문창 진입");
		if (req.getParameterMap().containsKey("gameId")) {
			// 1 상세페이지에서 구매할때
			String gameId = req.getParameter("gameId");
			HttpSession session = req.getSession();
			MemberVO member = (MemberVO) session.getAttribute("loginMember");
			String memId = member.getMemId();

			// 사용자의 구매완료 cart를 구해 gameId를 찾고, URL의 gameId를 비교해야됨
			List<String> orderedGameIdList = orderSerice.getOrderedGameId(memId);
			boolean check = orderedGameIdList.contains(gameId);

			if (check == true) {
				// 1-1 이미 구매한 게임인경우
				msg = "이미 구매한 게임입니다";

				session.setAttribute("msg", msg);

				resp.sendRedirect(req.getContextPath() + "/detailGame.do?id=" + gameId);

			} else {
				// 1-2 구매하지 않은 게임
				// 장바구니 테이블에 넣어주고 주문페이지로 넘어간다

				// 장바구니에 있는 내용을 가져오기
				ICartService cartService = CartServiceImpl.getInstance();
				List<CartVO> cartList = cartService.getCartList(memId);
				List<String> cartIdList2 = new ArrayList<String>();
				// 장바구니에 있는 내 게임중 id만 모아서 리스트 만듦
				for (CartVO cart : cartList) {
					cartIdList2.add(cart.getGameId());
				}
				// 리스트에 gameId 존재하면 넘어가고 없으면 테이블에 추가
				boolean isInCartChk = cartIdList2.contains(gameId);

				if (isInCartChk == true) {
					// 1-2-1 장바구니에 이미 그 게임이 존재하면 카트추가없이 넘어간다
					String totalPrice = cartService.getPrice(gameId);
					gamesIdList.add(gameId);
					// gameInfoList = orderSerice.getGamesInfo(gamesIdList);

					IWishListService wishService = WishListServiceImpl.getInstance();
					List<DiscountVO> discountList = new ArrayList<DiscountVO>();
					if (wishService.discountInWish(gameId) != null) {
						discountList.add(wishService.discountInWish(gameId));
					}
					req.setAttribute("discountList", discountList);

					if (discountList.isEmpty() == false) {
						totalPrice = "0";
					}

					req.setAttribute("totalPrice", totalPrice);
					// 사려는 게임의 정보담은거
					gameInfoList.add(orderSerice.getGamesInfo(gameId));
					req.setAttribute("gameInfoList", gameInfoList);
					// 사려는 게임의 카트번호
					OrderVO order = new OrderVO(gameId, memId);
					cartIdList.add(orderSerice.getCartId(order));

					req.setAttribute("cartIdList", cartIdList);
					req.getRequestDispatcher("/orders/orderDetail.jsp").forward(req, resp);

				} else {
					// 1-2-2 장바구니에도 존재하지 앟으면 카트테이블 추가
					CartVO vo = new CartVO();
					vo.setMemId(memId);
					vo.setGameId(gameId);
					String price = cartService.getPrice(gameId);
					vo.setCartPrice(price);
					int cnt1 = cartService.insertCart(vo);
					int cnt2 = cartService.insertCartGame(gameId);
					if (cnt1 > 0 && cnt2 > 0) {
						IWishListService wishService = WishListServiceImpl.getInstance();
						List<DiscountVO> discountList = new ArrayList<DiscountVO>();
						if (wishService.discountInWish(gameId) != null) {
							discountList.add(wishService.discountInWish(gameId));
						}
						req.setAttribute("discountList", discountList);

						// 주문페이지로 넘어가기 - 총가격과 게임인포리스트가 필요하다
						String totalPrice = cartService.getPrice(gameId);

						// 한시적무료에 해당하면 가격 0으로 세팅해야함
						if (discountList.isEmpty() == false) {
							totalPrice = "0";
						}

						// gameInfoList = orderSerice.getGamesInfo(gamesIdList);
						req.setAttribute("totalPrice", totalPrice);

						gameInfoList.add(orderSerice.getGamesInfo(gameId));
						req.setAttribute("gameInfoList", gameInfoList);

						// 사려는 게임의 카트번호
						OrderVO order = new OrderVO(gameId, memId);
						cartIdList.add(orderSerice.getCartId(order));

						req.setAttribute("cartIdList", cartIdList);
						req.getRequestDispatcher("/orders/orderDetail.jsp").forward(req, resp);

					} else {
						String redirectUrl = req.getContextPath() + "/detailGame.do?id=" + gameId;
						resp.sendRedirect(redirectUrl);
					}
				}

			}

		} else {
			System.out.println("memId만 존재한다");
			// 2 장바구니에서 온 요청

			System.out.println("장바구니에서 온 요청");
			HttpSession session = req.getSession();
			MemberVO member = (MemberVO) session.getAttribute("loginMember");
			String memId = member.getMemId();

			ICartService cartService = CartServiceImpl.getInstance();

			// 결제완료 제외한 카트리스트(cartPrice와 cartId 넘김)
			List<CartVO> selectCartList = cartService.getSelectCart(memId);

			// gameId 알기위해 위 리스트 VO에 들어있는 cartId로 정보확인 (gameId 넘김)
			List<String> selectGameList = new ArrayList<String>();
			for (CartVO vo : selectCartList) {
				selectGameList.add(cartService.getSelectGame(vo.getCartId()));
			}
			// gameId를 이용하여 게임정보 가져오기
			for (String gameId : selectGameList) {
				gameInfoList.add(orderSerice.getGamesInfo(gameId));
			}
			String totalPrice = req.getParameter("totalPrice");

			// cartId만 들어있는 리스트
			for (CartVO vo : selectCartList) {
				cartIdList.add(vo.getCartId());
			}

			// api로 넘겨줄 내용들
			req.setAttribute("totalPrice", totalPrice);

			// 한시적무료게임과 그 게임 가격
			IWishListService wishService = WishListServiceImpl.getInstance();
			List<DiscountVO> discountList = new ArrayList<DiscountVO>();
			for (String vo : selectGameList) {
				if (wishService.discountInWish(vo) != null) {
					discountList.add(wishService.discountInWish(vo));
				}
			}
			req.setAttribute("discountList", discountList);

			// 사려는 게임의 기타정보
			req.setAttribute("gameInfoList", gameInfoList);
			// 사려는 게임의 카트번호
			req.setAttribute("cartIdList", cartIdList);

			req.getRequestDispatcher("/orders/orderDetail.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
