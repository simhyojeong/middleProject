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

@WebServlet("/Game.do")
public class GameController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IGameService gameService = GameServiceImpl.getInstance();
		ICategoryService cateService = CategoryServiceImpl.getInstance();
		IDiscountService discountService = DiscountServiceImpl.getInstance();

		req.setCharacterEncoding("UTF-8");
		String dId = req.getParameter("detailId");
		String dId1 = req.getParameter("detailId1");
		String dId2 = req.getParameter("detailId2");
		String gameName = req.getParameter("gameName");
		String gamePrice = req.getParameter("gamePrice");
		String detailName = req.getParameter("detailName");
		String detailName1 = req.getParameter("detailName1");
		String detailName2 = req.getParameter("detailName2");

		List<GameVO> list;
		List<GameVO> discountList;
		List<GameVO> allList;
		List<GameVO> allDiscountList;
		// 화면이 켜질때 모든 게임 출력할 때
		if (dId == null && gameName == null && gamePrice == null && detailName == null) {
			list = gameService.allGameList();
			discountList = discountService.allDiscountList();
			req.setAttribute("list", list);
			req.setAttribute("discountList", discountList);
		}
		// 해당 게임의 장르로 검색을 할때 + 가격으로 검색(클릭시) + 키워드 검색시
		else if (gameName == null) {
			GameSearchVO vo = new GameSearchVO();
			vo.setDetailId1(dId);
			vo.setDetailId2(dId1);
			vo.setDetailId3(dId2);
			vo.setGamePrice(gamePrice);
			vo.setDetailName1(detailName);
			vo.setDetailName2(detailName1);
			vo.setDetailName3(detailName2);
			list = gameService.getGameList(vo);

			// 가격 장르 선택시 무료이면 무료게임 전체다 출력

			discountList = discountService.allDiscountList();
			req.setAttribute("discountList", discountList);

			allList = gameService.allGameList();
			allDiscountList = discountService.allDiscountList();
			req.setAttribute("list", list);
			req.setAttribute("allList", allList);
			req.setAttribute("allDiscountList", allDiscountList);
		}

		// 해당 게임의 이름으로 검색할 때
		else if (dId == null && gameName != null) {
			list = gameService.getGameInfo(gameName);
			discountList = discountService.getDiscountInfo(gameName);
			allList = gameService.allGameList();
			allDiscountList = discountService.allDiscountList();
			req.setAttribute("list", list);
			req.setAttribute("discountList", discountList);
			req.setAttribute("allList", allList);
			req.setAttribute("allDiscountList", allDiscountList);
		}
		List<CategoryDetailVO> category = cateService.allCategoryList();

		req.setAttribute("category", category);
		req.getRequestDispatcher("games/allGame.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
