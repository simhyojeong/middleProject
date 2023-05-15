package questions.answer.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import questions.answer.dao.AnswerDaoImpl;
import questions.answer.dao.IAnswerDao;
import questions.answer.vo.AnswerVO;

public class AnswerServiceImpl  implements IAnswerService {

	private static IAnswerService service;
	private IAnswerDao dao;
	//1
	private AnswerServiceImpl() {
		dao = AnswerDaoImpl.getInstance();
	}
	//2
	public static IAnswerService getInstance() {
		if(service == null) service = new AnswerServiceImpl();
		return service;
	}
	@Override
	public int registAnswer(AnswerVO ansv) {
		
		return dao.insertAnswer(ansv);
	}
	@Override
	public List<AnswerVO> listAllAnswer() {
		
		return dao.selectAllAnswer();
	}
	@Override
	public AnswerVO getAnswer(String qesId) {
		
		return dao.getAnswer(qesId);
	}
	@Override
	public int modifyAnswer(AnswerVO ansv) {
		
		return dao.updateAnswer(ansv);
	}
	@Override
	public int removeAnswer(String qesId) {
		
		return dao.deleteAnswer(qesId);
	}
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
//	public List<QuestionVO> questionList(Map<String, Object> map) {
//		List<QuestionVO> list = null;
//		try {
//			list = dao.questionList(map);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
	

}
