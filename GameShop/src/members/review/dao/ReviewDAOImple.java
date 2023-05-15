package members.review.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import members.review.vo.MyReviewVO;
import members.review.vo.ReviewVO;
import util.MyBatisDAO;

public class ReviewDAOImple extends MyBatisDAO implements IReviewDAO {
	private static IReviewDAO revDAO;

	public ReviewDAOImple() {
	}

	public static IReviewDAO getInstance() {
		if (revDAO == null) {
			revDAO = new ReviewDAOImple();
		}

		return revDAO;
	}

	@Override
	public int insertReview(MyReviewVO myrv) {
		return insert("review.insertReview", myrv);
	}

	@Override
	public int deleteReview(String revId) {
		return delete("review.deleteReview", revId);
	}

	@Override
	public int updateReview(MyReviewVO myrv) {
		return update("review.updateReview", myrv);
	}

	@Override
	public List<MyReviewVO> getMemberReview(String memId) {
		List<MyReviewVO> myrevList = selectList("review.getMemberReview", memId);
		return myrevList;
	}

	@Override
	public List<MyReviewVO> getReviewList() {
		List<MyReviewVO> myrevList = selectList("review.getReviewList");
		return myrevList;
	}

	@Override
	public List<MyReviewVO> getReviewDetailList(String id) {
		List<MyReviewVO> revList = selectList("review.getReviewDetailList", id);
		return revList;
	}

//	@Override
//	public ReviewVO getReview(String revId) {
//		
//		return selectOne("review.getReview");
//	}
	@Override
	public MyReviewVO getReview(String revId) {
		
		return selectOne("review.getReview", revId);
	}

	@Override
	public int delete(String revId) {
		return delete("review.delete");
	}

	@Override
	public int countReviewList(String memId) {
		return selectOne("review.countReviewList", memId);
	}
	
	//회원 리뷰 검색 카운트
	@Override
	public int searchCountReviewList(MyReviewVO vo) {
		return selectOne("review.searchCountReviewList", vo);
	}

	@Override
	public List<MyReviewVO> reviewList(Map<String, Object> map) throws SQLException {
		return selectList("review.reviewList", map);
	}

	@Override
	public List<MyReviewVO> getAdminReview() {
		List<MyReviewVO> adrevList = selectList("review.getAdminReview");
		return adrevList;
	}

	@Override
	public int countAdReviewList() {
		return selectOne("review.countAdReviewList");
	}
	
	//관리자 리뷰 검색 카운트
	@Override
	public int searchCountAdReviewList(MyReviewVO vo) {
		return selectOne("review.searchCountAdReviewList", vo);
	}

	@Override
	public List<MyReviewVO> adReviewList(Map<String, Object> map) throws SQLException {
		return selectList("review.adReviewList", map);
	}

	@Override
	public List<MyReviewVO> searchReviewList(MyReviewVO vo) {
		List<MyReviewVO> adrevList = selectList("review.searchReviewList", vo);
		return adrevList;
	}

	@Override
	public int adminReviewDelete(String revId) {
		return delete("review.adminReviewDelete", revId);
	}


}
