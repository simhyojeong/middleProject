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

@WebServlet("/cart/deleteCart.do")
public class DeleteCartController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberVO mv = (MemberVO) session.getAttribute("loginMember");
		String memId = mv.getMemId();
		String gameId = req.getParameter("gameId");

		CartVO vo = new CartVO();
		vo.setGameId(gameId);
		vo.setMemId(memId);

		ICartService cartService = CartServiceImpl.getInstance();
		String cartId = cartService.checkExist(vo);

		int cnt1 = 0;
		int cnt2 = 0;
		if(cartId != null) {
			cnt1 = cartService.deleteCartGame(cartId);
			cnt2 = cartService.deleteCart(cartId);			
		}else {
			System.out.println("테이블에 해당 게임이 존재하지 않음");
		}
		
		String msg = "";
		if (cnt1 > 0 && cnt2 > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}

		session.setAttribute("msg", msg);
		resp.sendRedirect(req.getContextPath() + "/cart/cartDetail.do");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
