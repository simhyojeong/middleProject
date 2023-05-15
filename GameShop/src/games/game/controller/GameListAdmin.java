package games.game.controller;

import games.category.service.CategoryServiceImpl;
import games.category.service.ICategoryService;
import games.category.vo.CategoryDetailVO;
import games.game.service.DiscountServiceImpl;
import games.game.service.GameServiceImpl;
import games.game.service.IDiscountService;
import games.game.service.IGameService;
import games.game.vo.GameVO;
import games.gameDetailCategory.service.GameDetailCategoryServiceImpl;
import games.gameDetailCategory.service.IGameDetailCategoryService;
import games.publisher.service.IPublisherService;
import games.publisher.service.PublisherServiceImpl;
import games.publisher.vo.PublishVO;
import games.publisher.vo.PublisherVO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
@WebServlet({ "/GameListAdmin.do" })
public class GameListAdmin extends HttpServlet {
	public GameListAdmin() {
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		IGameService gameService = GameServiceImpl.getInstance();
		IDiscountService discountService = DiscountServiceImpl.getInstance();
		ICategoryService cateService = CategoryServiceImpl.getInstance();
		IPublisherService pubService = PublisherServiceImpl.getInstance();
		List<GameVO> gameList = gameService.allGameList();
		List<GameVO> discountList = discountService.allDiscountList();
		List<CategoryDetailVO> cateList = cateService.allCategoryList();
		List<PublisherVO> pubList = pubService.allPubList();
		req.setAttribute("cateList", cateList);
		req.setAttribute("pubList", pubList);
		req.setAttribute("gameList", gameList);
		req.setAttribute("discountList", discountList);
		req.getRequestDispatcher("/games/gamesListAdmin.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		IGameService gameService = GameServiceImpl.getInstance();
		IPublisherService pubService = PublisherServiceImpl.getInstance();
		IGameDetailCategoryService cateService = GameDetailCategoryServiceImpl.getInstance();
		String gameName = req.getParameter("title");
		String gamePrice = req.getParameter("price");
		String gameDate = req.getParameter("date");
		String gameDev = req.getParameter("developer");
		String ageGrade = req.getParameter("age");
		
		String gameId = gameService.nextGameId();
		List<String> gameImg = gameService.saveGameImg(req);
		
		// 게임 추가
		GameVO vo = new GameVO();
		vo.setGameName(gameName);
		vo.setGamePrice(gamePrice);
		vo.setGameDate(gameDate);
		vo.setGameDev(gameDev);
		vo.setGameImg((String) gameImg.get(0));
		vo.setGameVideo((String) gameImg.get(1));
		vo.setAgeGrade(ageGrade);
		gameService.insertGame(vo);
		
		// 퍼블리셔 추가
		String pubName = req.getParameter("publisher");
		String isPubId = pubService.isPubId(pubName);
		PublishVO pv = new PublishVO();
		pv.setGameId(gameId);
		
		// 이미 존재하는 퍼블리셔일 경우 해당 퍼블리셔를 추가하지않고 가져오기
		if (isPubId == null) {
			pubService.insertPublisher(pubName);
			String pubId = pubService.nextPubId();
			pv.setPubId(pubId);
		} else {
			pv.setPubId(isPubId);
		}

		// 퍼블리쉬 테이블 내용 추가
		pubService.insertPublish(pv);
		
		// 장르 추가
		String[] jenre = req.getParameterValues("jenre");
		cateService.insertGameDetailCategory(jenre, gameId);
		String[] functions = req.getParameterValues("function");
		cateService.insertGameDetailCategory(functions, gameId);
		String[] platform = req.getParameterValues("platform");
		cateService.insertGameDetailCategory(platform, gameId);
		resp.sendRedirect(req.getContextPath() + "/GameListAdmin.do");
	}
}
