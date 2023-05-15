package orders.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orders.service.IOrderService;
import orders.service.OrderServiceImpl;

@WebServlet("/order/SuccessOrderController.do")
public class SuccessOrderController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("[결제 성공페이지]");

		String[] cartIdList = req.getParameterValues("cartIdPara");

		IOrderService service = OrderServiceImpl.getInstance();
		for (String cartId : cartIdList) {
			service.insertOrder(cartId);
		}

		String redirectUrl = req.getContextPath() + "/main.do";
		resp.sendRedirect(redirectUrl);

	}

}
