package games.game.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import games.category.service.CategoryServiceImpl;
import games.category.service.ICategoryService;
import games.category.vo.CategoryDetailVO;
import games.game.service.DiscountServiceImpl;
import games.game.service.GameServiceImpl;
import games.game.service.IDiscountService;
import games.game.service.IGameService;
import games.game.vo.GameSearchVO;
import games.game.vo.GameVO;

@WebServlet("/main.do")
public class MainController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IGameService gameService = GameServiceImpl.getInstance();
		IDiscountService discountService = DiscountServiceImpl.getInstance();

		req.setCharacterEncoding("UTF-8");

		List<GameVO> list = gameService.allGameList();
		List<GameVO> discountList = discountService.allDiscountList();
		
		req.setAttribute("list", list);
		req.setAttribute("discountList", discountList);

		req.getRequestDispatcher("main/main.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
