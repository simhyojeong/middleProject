package orders.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import members.member.vo.MemberVO;
import orders.service.IOrderService;
import orders.service.OrderServiceImpl;
import orders.vo.OrderVO;

@MultipartConfig(fileSizeThreshold = 1048576000, maxFileSize = 1048576000L, maxRequestSize = 1048576000L)
@WebServlet({ "/listOrder.do" })
public class ListOrderController extends HttpServlet {
	public ListOrderController() {
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IOrderService orderService = OrderServiceImpl.getInstance();

		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		List<OrderVO> orderList = orderService.getOrderList(member.getMemId());

		req.setAttribute("orderList", orderList);
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.getRequestDispatcher("/main/accountOrder.jsp").forward(req, resp);

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
