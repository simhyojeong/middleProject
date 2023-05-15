package questions.question.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import questions.question.vo.QuestionVO;

public interface IQuestionDao {
	
//	//로그인 id-pw 검증
//	public String loginChk(Map<String, Object> map) throws SQLException;
//	
//	//전체 글 갯수 조회하기
//	public int countList() throws SQLException;
//	
//	//게시글 목록 조회
//	public List<QuestionVO> questionList(Map<String, Object> map2) throws SQLException;

	public int insertQuestion(QuestionVO qv);
	
	public List<QuestionVO> selectAllQuestion();
	
	/**
	 * 회원ID에 해당하는 회원정보를 가져오기 위한 메소드
	 * @param memId 가져올 회원ID
	 * @return MemberVO객체 리턴함.
	 */
	public QuestionVO getQuestion(String qesId);
	
	public int updateQuestion(QuestionVO qv);
	
	public int deleteQuestion(String qesId);
	
	public int countList() throws SQLException;
	
	public List<QuestionVO> questionList(Map<String, Object> map) throws SQLException;
}
