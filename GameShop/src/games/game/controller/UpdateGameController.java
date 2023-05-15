package games.game.controller;

import games.game.service.GameServiceImpl;
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
@WebServlet({ "/GameUpdateAdmin.do" })
public class UpdateGameController extends HttpServlet {
	public UpdateGameController() {
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		IGameService gameService = GameServiceImpl.getInstance();
		IPublisherService pubService = PublisherServiceImpl.getInstance();
		IGameDetailCategoryService catService = GameDetailCategoryServiceImpl.getInstance();
		String gameId = req.getParameter("updateGameId");
		String gameName = req.getParameter("title");
		String gamePrice = req.getParameter("price");
		String gameDate = req.getParameter("date");
		String gameDev = req.getParameter("developer");
		String ageGrade = req.getParameter("age");
		List<String> gameImg = gameService.saveGameImg(req);
		
		// 게임 수정
		GameVO vo = new GameVO();
		vo.setGameId(gameId);
		vo.setGameName(gameName);
		vo.setGamePrice(gamePrice);
		vo.setGameDate(gameDate);
		vo.setGameDev(gameDev);
		vo.setGameImg((String) gameImg.get(0));
		vo.setGameVideo((String) gameImg.get(1));
		vo.setAgeGrade(ageGrade);
		gameService.updateGame(vo);
		
		// 퍼블리셔 수정
		String pubName = req.getParameter("publisher");
		System.out.println("퍼블리셔 : " + pubName);
		String isPubId = pubService.isPubId(pubName);
		if (isPubId != null) {
			List<PublisherVO> pubList = pubService.allPubList();

			for (int i = 0; i < pubList.size(); ++i) {
				if (((PublisherVO) pubList.get(i)).getPubName().equals(pubName)) {
					// 선택한 퍼블리셔가 있으면 업데이트를 함
					PublisherVO publisherVO = new PublisherVO();
					publisherVO.setPubId(((PublisherVO) pubList.get(i)).getPubId());
					publisherVO.setPubName(pubName);
					pubService.updatePublisher(publisherVO);
					PublishVO pubVO = new PublishVO();
					pubVO.setPubId(((PublisherVO) pubList.get(i)).getPubId());
					pubVO.setGameId(gameId);
					pubService.updatePublish(pubVO);
					break;
				}
			}
		} else {
			// 입력한 퍼블리셔가 없을 경우 추가
			pubService.insertPublisher(pubName);
			pubService.isPubId(pubName);
			PublishVO pubVO = new PublishVO();
			pubVO.setGameId(gameId);
		}

		// 해당 게임이 들어있는 카테고리 삭제
		catService.deleteGameDetailCagetory(gameId);
		// 장르 추가
		String[] jenre = req.getParameterValues("jenre");
		catService.insertGameDetailCategory(jenre, gameId);
		String[] functions = req.getParameterValues("function");
		catService.insertGameDetailCategory(functions, gameId);
		String[] platform = req.getParameterValues("platform");
		catService.insertGameDetailCategory(platform, gameId);
		resp.sendRedirect(req.getContextPath() + "/InsertGame.do");
	}
}
