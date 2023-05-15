package questions.question.service;

import java.util.List;
import java.util.Map;

import questions.question.vo.QuestionVO;

public interface IQuestionService {
	
	//접근제한자 반환타입 메소드명(매개변수)
	
//	//로그인 id-pw 검증
//	public String loginChk(Map<String, Object> map);
//
//	//전체 글 갯수 조회하기
//	public int countList();
//
//	//게시글 목록 조회
//	public List<QuestionVO> QuestionList(Map<String, Object> map2);
	
	public int registQuestion(QuestionVO qv);
	
	public List<QuestionVO> listAllQuestion();
	
	/**
	 * 회원ID에 해당하는 회원정보를 가져오기 위한 메소드
	 * @param memId 가져올 회원ID
	 * @return MemberVO객체 리턴함.
	 */
	public QuestionVO getQuestion(String qesId);
	
	public int modifyQuestion(QuestionVO qv);
	
	public int removeQuestion(String qesId);
	
	public int countList();
	
	public List<QuestionVO> questionList(Map<String, Object> map);
}
