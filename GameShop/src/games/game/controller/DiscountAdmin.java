package games.game.controller;

import games.game.service.DiscountServiceImpl;
import games.game.service.GameServiceImpl;
import games.game.service.IDiscountService;
import games.game.service.IGameService;
import games.game.vo.DiscountVO;
import games.game.vo.GameVO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DiscountAdmin.do")
public class DiscountAdmin extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		IGameService gameService = GameServiceImpl.getInstance();
		IDiscountService discountService = DiscountServiceImpl.getInstance();
		List<GameVO> list = gameService.allGameList();
		List<GameVO> discountList = discountService.allDiscountList();
		req.setAttribute("list", list);
		req.setAttribute("discountList", discountList);
		System.out.println("게임:" + list.size() + "할인:" + discountList.size());

		req.getRequestDispatcher("/games/discountAdmin.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		IGameService gameService = GameServiceImpl.getInstance();
		String gameId = req.getParameter("gameId");
		String discountStart = req.getParameter("disStart");
		String discountEnd = req.getParameter("disEnd");
		int cnt = 0;
		String isDiscountId = gameService.isDiscountId(gameId);
		if (isDiscountId == null) {
			DiscountVO vo = new DiscountVO();
			vo.setGameId(gameId);
			vo.setDisStart(discountStart);
			vo.setDisEnd(discountEnd);
			cnt = gameService.insertDiscount(vo);
		}

		if (cnt > 0) {
			req.setAttribute("msg", "성공");
		} else {
			req.setAttribute("msg", "실패");
		}

		resp.sendRedirect(req.getContextPath() + "/GameListAdmin.do");
	}
}
