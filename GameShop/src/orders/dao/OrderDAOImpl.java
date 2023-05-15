package orders.dao;

import games.game.vo.GameVO;

import java.util.ArrayList;
import java.util.List;
import members.member.vo.MemberVO;
import orders.vo.OrderVO;
import util.MyBatisDAO;

public class OrderDAOImpl extends MyBatisDAO implements IOrderDAO {
    private static IOrderDAO dao;

    public OrderDAOImpl() {
    }

    public static IOrderDAO getInstance() {
        if (dao == null) {
            dao = new OrderDAOImpl();
        }

        return dao;
    }

    
	public List<OrderVO> getBillList(String orderId) {
        List<OrderVO> order = selectList("orders.getBillList", orderId);
        return order;
	}
    
    public List<OrderVO> getOrderList(String memId) {
        List<OrderVO> order = selectList("orders.getOrderList", memId);
        return order;
    }

    public List<String> getOrderedGameId(String memId) {
    	List<String> order = new ArrayList<String>();
        order = selectList("orders.getOrderedGameId", memId);
        return order;
    }

    public List<GameVO> getGamesOfMyCart(String memId) {
        List<GameVO> order = selectList("orders.getGamesOfMyCart", memId);
        return order;
    }

    public GameVO getGamesInfo(String gameId) {
        return selectOne("orders.getGamesInfo", gameId);
    }

    public String getCartId(OrderVO vo) {
        return selectOne("orders.getCartId", vo);
    }

    public String orderExist(String cartId) {
        return selectOne("orders.orderExist", cartId);
    }

    public void insertOrder(String cartId) {
        insert("orders.insertOrder", cartId);
    }

    public MemberVO getMemInfo(String memId) {
        return selectOne("orders.getMemInfo", memId);
    }





}
