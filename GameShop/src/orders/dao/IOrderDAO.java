package orders.dao;

import games.game.vo.GameVO;
import java.util.List;
import members.member.vo.MemberVO;
import orders.vo.OrderVO;

public interface IOrderDAO {
	
	
    List<OrderVO> getBillList(String var1);
    
    List<OrderVO> getOrderList(String var1);

    List<String> getOrderedGameId(String var1);

    List<GameVO> getGamesOfMyCart(String var1);

    GameVO getGamesInfo(String var1);

    String getCartId(OrderVO var1);

    String orderExist(String var1);

    void insertOrder(String var1);

    MemberVO getMemInfo(String var1);
}
