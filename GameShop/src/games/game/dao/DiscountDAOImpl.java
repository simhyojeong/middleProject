package games.game.dao;

import games.game.vo.GameSearchVO;
import games.game.vo.GameVO;
import java.util.List;
import util.MyBatisDAO;

public class DiscountDAOImpl extends MyBatisDAO implements IDiscountDAO {
    private static IDiscountDAO dao;

    public DiscountDAOImpl() {
    }

    public static IDiscountDAO getInstance() {
        if (dao == null) {
            dao = new DiscountDAOImpl();
        }

        return dao;
    }

    public List<GameVO> allDiscountList() {
        List<GameVO> game = this.selectList("discount.allDiscountList");
        return game;
    }

    public List<GameVO> allDiscountList(GameSearchVO vo) {
        List<GameVO> game = this.selectList("discount.allDiscountList", vo);
        return game;
    }

    public List<GameVO> getDiscountInfo(String name) {
        List<GameVO> game = this.selectList("discount.getDiscountInfo", name);
        return game;
    }
}
