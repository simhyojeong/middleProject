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

import members.member.vo.MemberVO;
import orders.service.IOrderService;
import orders.service.OrderServiceImpl;

@WebServlet("/order/kakaoPayController.do")
public class KakaoPayController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("카카오페이 doGet()");
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		String memId = member.getMemId();

		int totalPrice = Integer.parseInt(req.getParameter("totalPrice"));

		String[] cartIdParas = req.getParameterValues("cartIdPara");

		for (String elem : cartIdParas) {
			System.out.println("cartIdParas: " + elem);
		}

		// name, email, phone, totalPrice를 넘겨줘야한다.
		// memId를 이용해서 name, email, phone 찾아주기
		IOrderService service = OrderServiceImpl.getInstance();
		MemberVO vo = service.getMemInfo(memId);
		String name = vo.getMemName();
		String email = vo.getMemMail();
		String phone = vo.getMemPh();
		System.out.println(name);

		req.setAttribute("cartIdParas", cartIdParas);
		req.setAttribute("name", name);
		req.setAttribute("email", email);
		req.setAttribute("phone", phone);
		req.setAttribute("totalPrice", totalPrice);
		req.getRequestDispatcher("/orders/kakaoApi.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
