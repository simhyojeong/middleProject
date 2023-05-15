package questions.question.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import questions.question.vo.QuestionVO;
import util.MyBatisDAO;

public class QuestionDaoImpl extends MyBatisDAO implements IQuestionDao {
	
	//dao객체 생성하기 - 싱글톤 방식으로
	private static IQuestionDao dao;
	//1. private constructor
	private QuestionDaoImpl() {}
	
	//2. static method
	public static IQuestionDao getInstance() {
		if(dao == null) dao = new QuestionDaoImpl();
		return dao;
	}

	@Override
	public int insertQuestion(QuestionVO qv) {

		return insert("question.insertQuestion", qv);
	}

	@Override
	public List<QuestionVO> selectAllQuestion() {
		
		List<QuestionVO> qesList = selectList("question.selectAllQuestion");
		return qesList;
	}

	@Override
	public QuestionVO getQuestion(String qesId) {

		return selectOne("question.getQuestion", qesId);
	}

	@Override
	public int updateQuestion(QuestionVO qv) {
		
		return update("question.updateQuestion", qv);
	}

	@Override
	public int deleteQuestion(String qesId) {
		
		return delete("question.deleteQuestion", qesId);
	}

	@Override
	public int countList() throws SQLException {
		
		return selectOne("question.countList");
	}

	@Override
	public List<QuestionVO> questionList(Map<String, Object> map) throws SQLException {
		
		return selectList("question.questionList", map);
	}

//	@Override
//	public String loginChk(Map<String, Object> map) throws SQLException {
//		
//		return selectOne("member.loginChk",map);
//	}
//
//	@Override
//	public int countList() throws SQLException {
//		return selectOne("question.countList");
//	}
//
//	@Override
//	public List<QuestionVO> questionList(Map<String, Object> map2) throws SQLException {
//
//		return selectList("question.questionList", map2);
//	}
	
}
