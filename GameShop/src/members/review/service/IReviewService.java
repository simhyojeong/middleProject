package members.review.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import members.review.vo.MyReviewVO;
import members.review.vo.ReviewVO;

public interface IReviewService {
	// 회원-리뷰 등록
	public int insertReview(MyReviewVO myrv);

	// 회원-리뷰 삭제
	public int deleteReview(String revId);

	// 회원-리뷰 수정
	public int updateReview(MyReviewVO myrv);

	// 회원-리뷰 리스트
	public List<MyReviewVO> getMemberReview(String memId);

	// 회원-리뷰검색
	public List<MyReviewVO> searchReviewList(MyReviewVO vo);

	// 리뷰ID 하나 받아오기
//	public ReviewVO getReview(String revId);
	public MyReviewVO getReview(String revId);

	// 관리자-리뷰 리스트
	public List<MyReviewVO> getAdminReview();

	// 관리자 -리뷰 삭제
	public int adminReviewDelete(String revId);

	public List<MyReviewVO> getReviewList();

	public List<MyReviewVO> getReviewDetailList(String id);

	public int delete(String revId);

	// 페이징 넘버처리하는 메소드
	public int countReviewList(String memId);
	
	public int searchCountReviewList(MyReviewVO vo);

	public List<MyReviewVO> reviewList(Map<String, Object> map);

	// 관리자 리뷰 - 페이징 넘버처리
	public int countAdReviewList();

	public int searchCountAdReviewList(MyReviewVO vo);

	public List<MyReviewVO> adReviewList(Map<String, Object> map);
}
