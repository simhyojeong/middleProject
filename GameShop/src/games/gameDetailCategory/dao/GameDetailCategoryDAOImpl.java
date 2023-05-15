package games.gameDetailCategory.dao;

import games.gameDetailCategory.vo.GameDetailCategoryVO;
import util.MyBatisDAO;

public class GameDetailCategoryDAOImpl extends MyBatisDAO implements IGameDetailCategoryDAO {
    private static IGameDetailCategoryDAO dao;

    public GameDetailCategoryDAOImpl() {
    }

    public static IGameDetailCategoryDAO getInstance() {
        if (dao == null) {
            dao = new GameDetailCategoryDAOImpl();
        }

        return dao;
    }

    public int insertGameDetailCategory(String[] category, String gameId) {
        int cnt = 0;
        GameDetailCategoryVO vo = new GameDetailCategoryVO();

        for(int i = 0; i < category.length; ++i) {
            vo.setDetailId(category[i]);
            vo.setGameId(gameId);
            this.update("gamedetailcategory.insertGameDetailCategory", vo);
        }

        return cnt;
    }

    public void deleteGameDetailCagetory(String gameId) {
        this.delete("gamedetailcategory.deleteGameDetailCagetory", gameId);
    }
}

