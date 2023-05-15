package games.game.dao;

import games.game.vo.GameSearchVO;
import games.game.vo.GameVO;
import java.util.List;

public interface IDiscountDAO {
    List<GameVO> allDiscountList();

    List<GameVO> allDiscountList(GameSearchVO var1);

    List<GameVO> getDiscountInfo(String var1);
}
