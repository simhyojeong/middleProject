package wishList.dao;

import games.game.vo.DiscountVO;
import games.game.vo.GameVO;
import java.util.List;
import util.MyBatisDAO;
import wishList.vo.WishListVO;

public class WishListDaoImpl extends MyBatisDAO implements IWishListDAO {
    private static IWishListDAO wishDAO;

    public WishListDaoImpl() {
    }

    public static IWishListDAO getInstance() {
        if (wishDAO == null) {
            wishDAO = new WishListDaoImpl();
        }

        return wishDAO;
    }

    public int insertWishList(WishListVO wishVO) {
        return this.insert("wishList.insertWishList", wishVO);
    }

    public int deleteWishList(String wishId) {
        return this.delete("wishList.deleteWishList", wishId);
    }

    public String checkExist(String wishId) {
        return (String)this.selectOne("wishList.checkExist", wishId);
    }

    public GameVO gameDetail(String gameId) {
        return (GameVO)this.selectOne("wishList.gameDetail", gameId);
    }

    public String getWishId(WishListVO wishVO) {
        return (String)this.selectOne("wishList.getWishId", wishVO);
    }

    public List<WishListVO> getWishList(String memId) {
        List<WishListVO> wishList = this.selectList("wishList.getWishList", memId);
        return wishList;
    }

    public List<WishListVO> getMemberWishList(String memId) {
        List<WishListVO> wishList = this.selectList("wishList.getMemberWishList", memId);
        return wishList;
    }

    public DiscountVO discountInWish(String gameId) {
        return (DiscountVO)this.selectOne("wishList.discountInWish", gameId);
    }
}
