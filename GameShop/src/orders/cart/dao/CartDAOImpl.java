package orders.cart.dao;

import java.util.List;
import orders.cart.vo.CartVO;
import util.MyBatisDAO;

public class CartDAOImpl extends MyBatisDAO implements ICartDAO {
    private static ICartDAO dao;

    public CartDAOImpl() {
    }

    public static ICartDAO getInstance() {
        if (dao == null) {
            dao = new CartDAOImpl();
        }

        return dao;
    }

    public int insertCart(CartVO vo) {
        return insert("cart.insertCart", vo);
    }

    public int insertCartGame(String gameId) {
        return insert("cart.insertCartGame", gameId);
    }

    public int deleteCart(String cartId) {
        return delete("cart.deleteCart", cartId);
    }

    public int deleteCartGame(String cartId) {
        return delete("cart.deleteCartGame", cartId);
    }

    public String checkExist(CartVO vo) {
        return selectOne("cart.checkExist", vo);
    }

    public String getPrice(String gameId) {
        return selectOne("cart.getPrice", gameId);
    }

    public String getSelectGame(String cartId) {
        return selectOne("cart.getSelectGame", cartId);
    }

    public List<CartVO> getCartList(String memId) {
        List<CartVO> cart = selectList("cart.getCartList", memId);
        return cart;
    }

    public List<CartVO> getSelectCart(String memId) {
        List<CartVO> cart = selectList("cart.getSelectCart", memId);
        return cart;
    }

    public List<String> orderList() {
        List<String> cart = selectList("cart.orderList");
        return cart;
    }
}
