package notice.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import notice.vo.NoticeVO;
import questions.question.vo.QuestionVO;
import util.MyBatisDAO;

public class NoticeDaoImpl extends MyBatisDAO implements INoticeDao {
	
	//dao객체 생성하기 - 싱글톤 방식으로
	private static INoticeDao dao;
	//1. private constructor
	private NoticeDaoImpl() {}
	
	//2. static method
	public static INoticeDao getInstance() {
		if(dao == null) dao = new NoticeDaoImpl();
		return dao;
	}

	@Override
	public int insertNotice(NoticeVO nv) {

		return insert("notice.insertNotice", nv);
	}

	@Override
	public List<NoticeVO> selectAllNotice() {
		
		List<NoticeVO> notList = selectList("notice.selectAllNotice");
		return notList;
	}

	@Override
	public NoticeVO getNotice(String notId) {

		return selectOne("notice.getNotice", notId);
	}

	@Override
	public int updateNotice(NoticeVO nv) {
		
		return update("notice.updateNotice", nv);
	}

	@Override
	public int deleteNotice(String notId) {
		
		return delete("notice.deleteNotice", notId);
	}

	@Override
	public int countList() throws SQLException {
		
		return selectOne("notice.countList");
	}

	@Override
	public List<NoticeVO> noticeList(Map<String, Object> map) throws SQLException {
		
		return selectList("notice.NoticeList", map);
	}

	
}
