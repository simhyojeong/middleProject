package questions.question.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import questions.question.dao.IQuestionDao;
import questions.question.dao.QuestionDaoImpl;
import questions.question.vo.QuestionVO;

public class QuestionServiceImpl  implements IQuestionService {

	private static IQuestionService service;
	private IQuestionDao dao;
	//1
	private QuestionServiceImpl() {
		dao = QuestionDaoImpl.getInstance();
	}
	//2
	public static IQuestionService getInstance() {
		if(service == null) service = new QuestionServiceImpl();
		return service;
	}
	@Override
	public int registQuestion(QuestionVO qv) {
		
		return dao.insertQuestion(qv);
	}
	@Override
	public List<QuestionVO> listAllQuestion() {
		
		return dao.selectAllQuestion();
	}
	@Override
	public QuestionVO getQuestion(String qesId) {
		
		return dao.getQuestion(qesId);
	}
	@Override
	public int modifyQuestion(QuestionVO qv) {
		
		return dao.updateQuestion(qv);
	}
	@Override
	public int removeQuestion(String qesId) {
		
		return dao.deleteQuestion(qesId);
	}
	@Override
	public int countList() {
		int countList = 0;
		try {
			countList = dao.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countList;
	}
	@Override
	public List<QuestionVO> questionList(Map<String, Object> map) {
		List<QuestionVO> list = null;
		try {
			list = dao.questionList(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
//	@Override
//	public String loginChk(Map<String, Object> map) {
//
//		//dao가 넘겨주는 자료를 받아서 controller로 넘겨줘야 함..
//		String memId = "";
//		try {
//			memId = dao.loginChk(map);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return memId;
//	}
//	@Override
//	public int countList() {
//		int countList = 0;
//		try {
//			countList = dao.countList();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return countList;
//	}
//	@Override
//	public List<QuestionVO> QuestionList(Map<String, Object> map2) {
//		List<QuestionVO> list = null;
//		try {
//			list = dao.questionList(map2);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
	

}
