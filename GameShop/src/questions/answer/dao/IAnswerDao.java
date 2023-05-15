package questions.answer.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import questions.answer.vo.AnswerVO;

public interface IAnswerDao {
	
	public int insertAnswer(AnswerVO ansv);
	
	public List<AnswerVO> selectAllAnswer();
	
	/**
	 * 회원ID에 해당하는 회원정보를 가져오기 위한 메소드
	 * @param memId 가져올 회원ID
	 * @return MemberVO객체 리턴함.
	 */
	public AnswerVO getAnswer(String qesId);
	
	public int updateAnswer(AnswerVO ansv);
	
	public int deleteAnswer(String qesId);
//	
//	public int countList() throws SQLException;
//	
//	public List<QuestionVO> questionList(Map<String, Object> map) throws SQLException;
}
