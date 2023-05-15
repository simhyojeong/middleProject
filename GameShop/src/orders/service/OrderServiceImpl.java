package orders.service;

import games.game.vo.GameVO;
import java.util.List;
import members.member.vo.MemberVO;
import orders.dao.IOrderDAO;
import orders.dao.OrderDAOImpl;
import orders.vo.OrderVO;

public class OrderServiceImpl implements IOrderService {
	private static IOrderService service;
	private IOrderDAO dao = OrderDAOImpl.getInstance();

	private OrderServiceImpl() {
	}

	public static IOrderService getInstance() {
		if (service == null) {
			service = new OrderServiceImpl();
		}
		return service;
	}
	
	public List<OrderVO> getBillList(String orderId) {
		return dao.getBillList(orderId);
	}
	
	public List<OrderVO> getOrderList(String memId) {
		return dao.getOrderList(memId);
	}

	public List<String> getOrderedGameId(String memId) {
		return dao.getOrderedGameId(memId);
	}

	public List<GameVO> getGamesOfMyCart(String memId) {
		return dao.getGamesOfMyCart(memId);
	}

	public GameVO getGamesInfo(String gameId) {
		return dao.getGamesInfo(gameId);
	}

	public String getCartId(OrderVO vo) {
		return dao.getCartId(vo);
	}

	public String orderExist(String cartId) {
		return dao.orderExist(cartId);
	}

	public void insertOrder(String cartId) {
		dao.insertOrder(cartId);
	}

	public MemberVO getMemInfo(String memId) {
		return dao.getMemInfo(memId);
	}


}
