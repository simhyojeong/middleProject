package games.game.dao;

import games.game.vo.DiscountVO;
import games.game.vo.GameDetailVO;
import games.game.vo.GameSearchVO;
import games.game.vo.GameVO;
import java.util.List;
import members.member.vo.GameCodeVO;
import util.MyBatisDAO;

public class GameDAOImpl extends MyBatisDAO implements IGameDAO {
    private static IGameDAO dao;

    public GameDAOImpl() {
    }

    public static IGameDAO getInstance() {
        if (dao == null) {
            dao = new GameDAOImpl();
        }

        return dao;
    }

    public List<GameVO> allGameList() {
        List<GameVO> game = this.selectList("game.allGameList");
        return game;
    }

    public List<GameVO> getGameList(GameSearchVO vo) {
        List<GameVO> game = this.selectList("game.getGameList", vo);
        return game;
    }

    public List<GameVO> getGameInfo(String name) {
        List<GameVO> game = this.selectList("game.getGameInfo", name);
        return game;
    }

    public List<GameDetailVO> getDetailGameInfo(String id) {
        List<GameDetailVO> game = this.selectList("game.getDetailGameInfo", id);
        return game;
    }

    public List<String> getCodeOrderGame(String memId) {
        List<String> game = this.selectList("game.getCodeOrderGame", memId);
        return game;
    }

    public int insertDiscount(DiscountVO vo) {
        return this.insert("game.insertDiscount", vo);
    }

    public String isDiscountId(String gameId) {
        return selectOne("game.isDiscountId", gameId);
    }

    public String nextDiscountId() {
        return selectOne("game.nextDiscountId");
    }

    public String nextGameId() {
        return selectOne("game.nextGameId");
    }

    public int insertGame(GameVO vo) {
        return insert("game.insertGame", vo);
    }

    public int updateGame(GameVO vo) {
        return update("game.updateGame", vo);
    }

    public void deleteGame(String gameId) {
        delete("game.deleteGame", gameId);
    }

    public void updateGameCode(GameCodeVO codeVO) {
        update("game.updateGameCode", codeVO);
    }
}
