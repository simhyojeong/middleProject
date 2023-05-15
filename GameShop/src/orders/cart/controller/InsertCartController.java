package orders.cart.controller;

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

@WebServlet("/cart/insertCart.do")
public class InsertCartController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		String memId = member.getMemId();
		String gameId = req.getParameter("gameId");
		
		CartVO vo = new CartVO();
		vo.setMemId(memId);
		vo.setGameId(gameId);
		
		ICartService cartService = CartServiceImpl.getInstance();
		String price = cartService.getPrice(gameId);
		vo.setCartPrice(price);
		String check = cartService.checkExist(vo);
		int cnt1 = 0;
		int cnt2 = 0;
		if (check != null) {
			System.out.println("장바구니에 이미 존재함");
		} else {
			cnt1 = cartService.insertCart(vo);
			cnt2 = cartService.insertCartGame(gameId);
		}

		String msg = "";
		if (cnt1 > 0 && cnt2 > 0) {
			msg = "장바구니 담기 성공";
		} else {
			msg = "장바구니 담기 실패";
		}

		session.setAttribute("msg", msg);
		resp.sendRedirect(req.getContextPath() + "/detailGame.do?id=" + gameId);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
