package notice.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import notice.dao.INoticeDao;
import notice.dao.NoticeDaoImpl;
import notice.vo.NoticeVO;
import questions.question.dao.IQuestionDao;
import questions.question.dao.QuestionDaoImpl;
import questions.question.vo.QuestionVO;

public class NoticeServiceImpl  implements INoticeService {

	private static INoticeService service;
	private INoticeDao dao;
	//1
	private NoticeServiceImpl() {
		dao = NoticeDaoImpl.getInstance();
	}
	//2
	public static INoticeService getInstance() {
		if(service == null) service = new NoticeServiceImpl();
		return service;
	}
	@Override
	public int registNotice(NoticeVO nv) {
		
		return dao.insertNotice(nv);
	}
	@Override
	public List<NoticeVO> listAllNotice() {
		
		return dao.selectAllNotice();
	}
	@Override
	public NoticeVO getNotice(String notId) {
		
		return dao.getNotice(notId);
	}
	@Override
	public int modifyNotice(NoticeVO nv) {
		
		return dao.updateNotice(nv);
	}
	@Override
	public int removeNotice(String notId) {
		
		return dao.deleteNotice(notId);
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
	public List<NoticeVO> noticeList(Map<String, Object> map) {
		List<NoticeVO> list = null;
		try {
			list = dao.noticeList(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	

}
