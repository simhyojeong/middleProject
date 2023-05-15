package orders.cart.service;

import java.util.List;
import orders.cart.vo.CartVO;

public interface ICartService {
	int insertCart(CartVO var1);

	int insertCartGame(String var1);

	int deleteCart(String var1);

	int deleteCartGame(String var1);

	String checkExist(CartVO var1);

	String getPrice(String var1);

	String getSelectGame(String var1);

	List<CartVO> getCartList(String var1);

	List<CartVO> getSelectCart(String var1);

	List<String> orderList();
}
