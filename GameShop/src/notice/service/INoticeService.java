package notice.service;

import java.util.List;
import java.util.Map;

import notice.vo.NoticeVO;
import questions.question.vo.QuestionVO;

public interface INoticeService {
	
	public int registNotice(NoticeVO nv);
	
	public List<NoticeVO> listAllNotice();
	
	/**
	 * 회원ID에 해당하는 회원정보를 가져오기 위한 메소드
	 * @param memId 가져올 회원ID
	 * @return MemberVO객체 리턴함.
	 */
	public NoticeVO getNotice(String notId);
	
	public int modifyNotice(NoticeVO nv);
	
	public int removeNotice(String notId);
	
	public int countList();
	
	public List<NoticeVO> noticeList(Map<String, Object> map);
}
