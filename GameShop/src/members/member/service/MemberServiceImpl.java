package members.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import members.member.dao.IMemberDAO;
import members.member.dao.MemberDAOImpl;
import members.member.vo.GameCodeVO;
import members.member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	
	private static IMemberService memService;
	
	private IMemberDAO memDAO;

	private MemberServiceImpl() {
		memDAO = MemberDAOImpl.getInstance();
	}

	public static IMemberService getInstance() {
		if (memService == null) {
			memService = new MemberServiceImpl();
		}
		return memService;
	}
	
	@Override
	public int insertMember(MemberVO mv) {
		return memDAO.insertMember(mv);
	}

	@Override
	public String checkMemId(String memId) {
		return memDAO.checkMemId(memId);
	}

	@Override
	public String checkMemPw(String memId) {
		return memDAO.checkMemPw(memId);
	}

	@Override
	public int updateMember(MemberVO mv) {
		return memDAO.updateMember(mv);
	}

	@Override
	public int updatePw(MemberVO mv) {
		return memDAO.updatePw(mv);
	}

	@Override
	public String searchId(MemberVO mv) {
		return memDAO.searchId(mv);
	}
	
	@Override
	public String searchPw(MemberVO mv) {
		return memDAO.searchPw(mv);
	}

	@Override
	public List<MemberVO> getAllMember() {
		return memDAO.getAllMember();
	}

	@Override
	public List<String> getAllMemberId() {
		return memDAO.getAllMemberId();
	}

	@Override
	public MemberVO getMember(String memId) {
		return memDAO.getMember(memId);
	}

	@Override
	public int quitMember(MemberVO mv) {
		return memDAO.quitMember(mv);
	}

	@Override
	public int authMember(String memId) {
		return memDAO.authMember(memId);
	}

	@Override
	public MemberVO loginMember(MemberVO loginMember) {
		return memDAO.loginMember(loginMember);
	}

	@Override
	public String searchGameCode(String code) {
		return memDAO.searchGameCode(code);
	}

	@Override
	public int insertCodeOrder(GameCodeVO code) {
		return memDAO.insertCodeOrder(code);
	}
	
	@Override
	public int removeMember(String memId) {
		return memDAO.deleteMember(memId);
	}

	@Override
	public int countList() {
		int countList = 0;
		try {
			countList = memDAO.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countList;
	}

	@Override
	public List<MemberVO> memList(Map<String, Object> map) {
		List<MemberVO> list = null;
		try {
			list = memDAO.memList(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String searchCodeUse(String code) {
		return memDAO.searchCodeUse(code);
	}

	

}



