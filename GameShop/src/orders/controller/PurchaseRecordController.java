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

@WebServlet("/order/purchaseRecord.do")
public class PurchaseRecordController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 서비스객체
		IOrderService orderService = OrderServiceImpl.getInstance();
		
		// 세션 열기
		HttpSession session = req.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		
		// 2. 회원목록 정보 조회
		List<OrderVO> orderList = orderService.getOrderList(loginMember.getMemId());
		
		// 3. 뷰에서 사용할 데이터 저장
		req.setAttribute("orderList", orderList);
		
		// 4. 뷰 페이지로 전달
		
		req.getRequestDispatcher("/orders/purchase.jsp").forward(req, resp);
	
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

}
