package games.game.controller;

import games.game.service.GameServiceImpl;
import games.game.service.IGameService;
import games.gameDetailCategory.service.GameDetailCategoryServiceImpl;
import games.gameDetailCategory.service.IGameDetailCategoryService;
import games.publisher.service.IPublisherService;
import games.publisher.service.PublisherServiceImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GameDeleteAdmin.do")
public class GameDeleteAdmin extends HttpServlet {
	public GameDeleteAdmin() {
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String gameId = req.getParameter("gameId");
		IGameService gameService = GameServiceImpl.getInstance();
		IPublisherService pubService = PublisherServiceImpl.getInstance();
		IGameDetailCategoryService catService = GameDetailCategoryServiceImpl.getInstance();
		catService.deleteGameDetailCagetory(gameId);
		pubService.deletePublish(gameId);
		gameService.deleteGame(gameId);
		resp.sendRedirect(req.getContextPath() + "/GameListAdmin.do");
	}
}
