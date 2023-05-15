package questions.answer.service;

import java.util.List;
import java.util.Map;

import questions.answer.vo.AnswerVO;
import questions.question.vo.QuestionVO;

public interface IAnswerService {
	
	public int registAnswer(AnswerVO ansv);
	
	public List<AnswerVO> listAllAnswer();
	
	/**
	 * 회원ID에 해당하는 회원정보를 가져오기 위한 메소드
	 * @param memId 가져올 회원ID
	 * @return MemberVO객체 리턴함.
	 */
	public AnswerVO getAnswer(String qesId);
	
	public int modifyAnswer(AnswerVO ansv);
//	
	public int removeAnswer(String qesId);
//	
//	public int countList();
//	
//	public List<QuestionVO> questionList(Map<String, Object> map);
}
