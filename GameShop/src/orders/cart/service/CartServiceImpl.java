package orders.cart.service;

import java.util.List;
import orders.cart.dao.CartDAOImpl;
import orders.cart.dao.ICartDAO;
import orders.cart.vo.CartVO;

public class CartServiceImpl implements ICartService {
    private static ICartService service;
    private ICartDAO dao = CartDAOImpl.getInstance();

    private CartServiceImpl() {
    }

    public static ICartService getInstance() {
        if (service == null) {
            service = new CartServiceImpl();
        }

        return service;
    }

    public int insertCart(CartVO vo) {
        return dao.insertCart(vo);
    }

    public int insertCartGame(String gameId) {
        return dao.insertCartGame(gameId);
    }

    public int deleteCart(String cartId) {
        return dao.deleteCart(cartId);
    }

    public int deleteCartGame(String cartId) {
        return dao.deleteCartGame(cartId);
    }

    public String checkExist(CartVO vo) {
        return dao.checkExist(vo);
    }

    public String getPrice(String gameId) {
        return dao.getPrice(gameId);
    }

    public String getSelectGame(String cartId) {
        return dao.getSelectGame(cartId);
    }

    public List<CartVO> getCartList(String memId) {
        return this.dao.getCartList(memId);
    }

    public List<CartVO> getSelectCart(String memId) {
        return dao.getSelectCart(memId);
    }

    public List<String> orderList() {
        return dao.orderList();
    }
}
