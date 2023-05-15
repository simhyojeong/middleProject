package wishList.service;

import games.game.vo.DiscountVO;
import games.game.vo.GameVO;
import java.util.List;
import wishList.dao.IWishListDAO;
import wishList.dao.WishListDaoImpl;
import wishList.vo.WishListVO;

public class WishListServiceImpl implements IWishListService {
    private static IWishListService wishService;
    private IWishListDAO wishDAO = WishListDaoImpl.getInstance();

    private WishListServiceImpl() {
    }

    public static IWishListService getInstance() {
        if (wishService == null) {
            wishService = new WishListServiceImpl();
        }

        return wishService;
    }

    public int insertWishList(WishListVO wishVO) {
        return this.wishDAO.insertWishList(wishVO);
    }

    public int deleteWishList(String wishId) {
        return this.wishDAO.deleteWishList(wishId);
    }

    public String checkExist(String wishId) {
        return this.wishDAO.checkExist(wishId);
    }

    public GameVO gameDetail(String gameId) {
        return this.wishDAO.gameDetail(gameId);
    }

    public String getWishId(WishListVO wishVO) {
        return this.wishDAO.getWishId(wishVO);
    }

    public List<WishListVO> getWishList(String memId) {
        return this.wishDAO.getWishList(memId);
    }

    public List<WishListVO> getMemberWishList(String memId) {
        return this.wishDAO.getMemberWishList(memId);
    }

    public DiscountVO discountInWish(String gameId) {
        return this.wishDAO.discountInWish(gameId);
    }
}

