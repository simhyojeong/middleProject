package members.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import members.member.vo.GameCodeVO;
import members.member.vo.MemberVO;
import util.MyBatisDAO;

public class MemberDAOImpl extends MyBatisDAO implements IMemberDAO {
	
	private static IMemberDAO memDAO;

	public static IMemberDAO getInstance() {
		if (memDAO == null) {
			memDAO = new MemberDAOImpl();
		}
		return memDAO;
	}

	@Override
	public int insertMember(MemberVO mv) {
		return insert("member.insertMember", mv);
	}

	@Override
	public String checkMemId(String memId) {
		return selectOne("member.checkMemId", memId);
	}
	
	@Override
	public String checkMemPw(String memId) {
		return selectOne("member.checkMemPw", memId);
	}

	@Override
	public int updateMember(MemberVO mv) {
		return update("member.updateMember", mv);
	}
	
	@Override
	public int updatePw(MemberVO mv) {
		return update("member.updatePw", mv);
	}

	@Override
	public String searchId(MemberVO mv) {
		return selectOne("member.searchId", mv);
	}

	@Override
	public String searchPw(MemberVO mv) {
		return selectOne("member.searchPw", mv);
	}

	@Override
	public List<MemberVO> getAllMember() {
		List<MemberVO> memList = selectList("member.getAllMember");
		
		return memList;
	}
	
	@Override
	public List<String> getAllMemberId() {
		List<String> memList = selectList("member.getAllMemberId");

		return memList;
	}
	
	@Override
	public MemberVO getMember(String memId) {
		return selectOne("member.getMember", memId);
	}

	@Override
	public int quitMember(MemberVO mv){
		int result = 0;
		
		result = update("member.quitMember", mv);
		
		return result;
	}

	@Override
	public int authMember(String memId) {
		return update("member.authMember", memId);
	}

	@Override
	public MemberVO loginMember(MemberVO loginMember) {
		return selectOne("member.loginMember", loginMember);
	}

	@Override
	public String searchGameCode(String code) {
		return selectOne("member.searchGameCode", code);
	}

	@Override
	public int insertCodeOrder(GameCodeVO code) {
		return selectOne("member.insertCodeOrder", code);
	}


	@Override
	   public int deleteMember(String memId) {
	      
	      return delete("member.deleteMember" ,memId);
	   }

	@Override
	public List<MemberVO> searchAllMember(MemberVO mv) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countList() throws SQLException {
		return selectOne("member.countList");
	}

	@Override
	public List<MemberVO> memList(Map<String, Object> map) throws SQLException {
		return selectList("member.memList", map);
	}

	@Override
	public String searchCodeUse(String code) {
		return selectOne("member.searchCodeUse", code);
	}
	
}
