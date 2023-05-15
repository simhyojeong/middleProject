package members.review.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import members.review.dao.IReviewDAO;
import members.review.dao.ReviewDAOImple;
import members.review.vo.MyReviewVO;
import members.review.vo.ReviewVO;

public class ReviewServiceImple implements IReviewService {
	private static IReviewService revService;
	private IReviewDAO revDAO = ReviewDAOImple.getInstance();

	private ReviewServiceImple() {
	}

	public static IReviewService getInstance() {
		if (revService == null) {
			revService = new ReviewServiceImple();
		}

		return revService;
	}

	@Override
	public int insertReview(MyReviewVO myrv) {
		return revDAO.insertReview(myrv);
	}

	@Override
	public int deleteReview(String revId) {
		return revDAO.deleteReview(revId);
	}

	@Override
	public int updateReview(MyReviewVO myrv) {
		return revDAO.updateReview(myrv);
	}

	@Override
	public List<MyReviewVO> getMemberReview(String memId) {
		return revDAO.getMemberReview(memId);
	}

	@Override
	public List<MyReviewVO> getReviewList() {
		return revDAO.getReviewList();
	}

	@Override
	public List<MyReviewVO> getReviewDetailList(String id) {
		return revDAO.getReviewDetailList(id);
	}

//	@Override
//	public ReviewVO getReview(String revId) {
//		return revDAO.getReview(revId);
//	}
	@Override
	public MyReviewVO getReview(String revId) {
		return revDAO.getReview(revId);
	}

	@Override
	public int delete(String revId) {
		return revDAO.delete(revId);
	}

	@Override
	public int countReviewList(String memId) {
		return revDAO.countReviewList(memId);
	}
	
	@Override
	public int searchCountReviewList(MyReviewVO vo) {
		return revDAO.searchCountReviewList(vo);
	}

	@Override
	public List<MyReviewVO> reviewList(Map<String, Object> map) {
		List<MyReviewVO> list = null;
		try {
			list = revDAO.reviewList(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MyReviewVO> getAdminReview() {
		return revDAO.getAdminReview();
	}

	@Override
	public int countAdReviewList() {
		return revDAO.countAdReviewList();
	}

	public int searchCountAdReviewList(MyReviewVO vo) {
		return revDAO.searchCountAdReviewList(vo);
	}

	@Override
	public List<MyReviewVO> adReviewList(Map<String, Object> map) {
		List<MyReviewVO> list = null;
		try {
			list = revDAO.adReviewList(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MyReviewVO> searchReviewList(MyReviewVO vo) {
		return revDAO.searchReviewList(vo);
	}

	@Override
	public int adminReviewDelete(String revId) {
		return revDAO.adminReviewDelete(revId);
	}

}
