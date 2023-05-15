package questions.answer.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import questions.answer.vo.AnswerVO;
import questions.question.vo.QuestionVO;
import util.MyBatisDAO;

public class AnswerDaoImpl extends MyBatisDAO implements IAnswerDao {
	
	//dao객체 생성하기 - 싱글톤 방식으로
	private static IAnswerDao dao;
	//1. private constructor
	private AnswerDaoImpl() {}
	
	//2. static method
	public static IAnswerDao getInstance() {
		if(dao == null) dao = new AnswerDaoImpl();
		return dao;
	}

	@Override
	public int insertAnswer(AnswerVO ansv) {

		return insert("answer.insertAnswer", ansv);
	}

	@Override
	public List<AnswerVO> selectAllAnswer() {
		
		List<AnswerVO> ansList = selectList("answer.selectAllAnswer");
		return ansList;
	}

	@Override
	public AnswerVO getAnswer(String qesId) {

		return selectOne("answer.getAnswer", qesId);
	}

	@Override
	public int updateAnswer(AnswerVO ansv) {
		
		return update("answer.updateAnswer", ansv);
	}

	@Override
	public int deleteAnswer(String qesId) {
		
		return delete("answer.deleteAnswer", qesId);
	}
//
//	@Override
//	public int countList() throws SQLException {
//		
//		return selectOne("question.countList");
//	}
//
//	@Override
//	public List<QuestionVO> questionList(Map<String, Object> map) throws SQLException {
//		
//		return selectList("question.questionList", map);
//	}

}
