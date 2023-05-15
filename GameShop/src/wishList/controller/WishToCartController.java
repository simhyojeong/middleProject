package wishList.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import members.member.vo.MemberVO;
import orders.cart.service.CartServiceImpl;
import orders.cart.service.ICartService;
import orders.cart.vo.CartVO;

@WebServlet({ "/wishList/wishToCart.do" })
public class WishToCartController extends HttpServlet {
	public WishToCartController() {
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("loginMember");
		
		String memId = vo.getMemId();
		String gameId = req.getParameter("gameId");
		
		ICartService cartService = CartServiceImpl.getInstance();
		CartVO cvo = new CartVO();
		cvo.setMemId(memId);
		cvo.setGameId(gameId);
		String price = cartService.getPrice(gameId);
		cvo.setCartPrice(price);
		String check = cartService.checkExist(cvo);
		
		int cnt1 = 0;
		int cnt2 = 0;
		String msg = "";
		if (check != null) {
			msg = "위시리스트게임을 장바구니 담기 실패";
		} else {
			cnt1 = cartService.insertCart(cvo);
			cnt2 = cartService.insertCartGame(gameId);
		}

		if (cnt1 > 0 && cnt2 > 0) {
			msg = "위시리스트게임을 장바구니 담기 성공";
		} else {
			msg = "위시리스트게임을 장바구니 담기 실패";
		}

		session.setAttribute("msg", msg);
		String redirectUrl = req.getContextPath() + "/wishList/wishListDetail.do";
		resp.sendRedirect(redirectUrl);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
