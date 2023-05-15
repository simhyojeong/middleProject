package orders.controller;

import java.io.IOException;
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
import orders.vo.OrderVO;

@WebServlet("/order/bill.do")
public class BillController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// purchase.jsp - cartId 가져오기
		String orderId = req.getParameter("orderId");
		System.out.println("orderId 들어옴 확인>>>" + orderId);
		
		// 1. 서비스객체
		IOrderService orderService = OrderServiceImpl.getInstance();
		
		// 세션 열기
//		HttpSession session = req.getSession();
//		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		
		// 2. 회원목록 정보 조회
		List<OrderVO> orderList = orderService.getBillList(orderId);
		String chk1 = orderList.get(0).getOrderId();
		
		System.out.println("List 불러옴 >>" + chk1);
		int size = orderList.size();
		System.out.println("orderList사이즈>>" + size);
		
//		List<OrderVO> orderList = orderService.getOrderList(loginMember.getMemId());

		// 3. 뷰에서 사용할 데이터 저장
		req.setAttribute("orderList", orderList);
//		req.setAttribute("cartId", cartId);
		
		
		// 4. 뷰 페이지로 전달
		
		req.getRequestDispatcher("/orders/bill.jsp").forward(req, resp);
	
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

}
