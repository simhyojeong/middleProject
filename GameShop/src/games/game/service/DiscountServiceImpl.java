package games.game.service;

import games.game.dao.DiscountDAOImpl;
import games.game.dao.IDiscountDAO;
import games.game.vo.GameSearchVO;
import games.game.vo.GameVO;
import java.util.List;

public class DiscountServiceImpl implements IDiscountService {
    private static IDiscountService service;
    private IDiscountDAO dao = DiscountDAOImpl.getInstance();

    private DiscountServiceImpl() {
    }

    public static IDiscountService getInstance() {
        if (service == null) {
            service = new DiscountServiceImpl();
        }

        return service;
    }

    public List<GameVO> allDiscountList() {
        return this.dao.allDiscountList();
    }

    public List<GameVO> allDiscountList(GameSearchVO vo) {
        return this.dao.allDiscountList(vo);
    }

    public List<GameVO> getDiscountInfo(String name) {
        return this.dao.getDiscountInfo(name);
    }
}
