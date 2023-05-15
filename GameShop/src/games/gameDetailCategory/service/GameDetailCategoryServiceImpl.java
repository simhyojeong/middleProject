package games.gameDetailCategory.service;

import games.gameDetailCategory.dao.GameDetailCategoryDAOImpl;
import games.gameDetailCategory.dao.IGameDetailCategoryDAO;

public class GameDetailCategoryServiceImpl implements IGameDetailCategoryService {
	private IGameDetailCategoryDAO dao = GameDetailCategoryDAOImpl.getInstance();
	private static IGameDetailCategoryService service;

	private GameDetailCategoryServiceImpl() {
	}

	public static IGameDetailCategoryService getInstance() {
		if (service == null) {
			service = new GameDetailCategoryServiceImpl();
		}

		return service;
	}

	public int insertGameDetailCategory(String[] category, String gameId) {
		return this.dao.insertGameDetailCategory(category, gameId);
	}

	public void deleteGameDetailCagetory(String gameId) {
		this.dao.deleteGameDetailCagetory(gameId);
	}
}
