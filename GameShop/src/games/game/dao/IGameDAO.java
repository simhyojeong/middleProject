package games.game.dao;

import games.game.vo.DiscountVO;
import games.game.vo.GameDetailVO;
import games.game.vo.GameSearchVO;
import games.game.vo.GameVO;
import java.util.List;
import members.member.vo.GameCodeVO;

public interface IGameDAO {
	List<GameVO> allGameList();

	List<GameVO> getGameList(GameSearchVO var1);

	List<GameVO> getGameInfo(String var1);

	List<GameDetailVO> getDetailGameInfo(String var1);

	List<String> getCodeOrderGame(String var1);

	int insertGame(GameVO var1);

	int updateGame(GameVO var1);

	int insertDiscount(DiscountVO var1);

	String isDiscountId(String var1);

	String nextDiscountId();

	String nextGameId();

	void deleteGame(String var1);

	void updateGameCode(GameCodeVO var1);
}
