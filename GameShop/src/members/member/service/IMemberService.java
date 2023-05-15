package members.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import members.member.vo.GameCodeVO;
import members.member.vo.MemberVO;

public interface IMemberService {

	// 회원 정보를 저장하는 메서드
	public int insertMember(MemberVO member);

	// 회원 아이디를 받아 중복하는 아이디가 있는지 검사하는 메서드
	public String checkMemId(String memId);

	// 회원 아이디와 패스워드를 받아 패스워드를 반환하는 메서드
	public String checkMemPw(String memId);

	// 회원 정보를 수정하는 메서드
	public int updateMember(MemberVO member);

	// 회원 비밀번호를 수정하는 메서드
	public int updatePw(MemberVO member);

	// 아이디 찾기
	public String searchId(MemberVO mv);

	// 비밀번호 찾기
	public String searchPw(MemberVO mv);

	// 모든 회원 정보를 출력하는 메서드
	public List<MemberVO> getAllMember();

	// 전체 회원의 아이디를 조회하는 메서드
	public List<String> getAllMemberId();

	// 회원ID에 해당하는 회원정보를 가져오기 위한 메소드
	public MemberVO getMember(String memid);

	// 회원 아이디를 받아 해당 회원의 탈퇴여부를 바꾸는 메서드
	public int quitMember(MemberVO mv);

	// 메일 인증시 인증 칼럼을 변경하는 메서드
	public int authMember(String memId);

	// 회원 로그인
	public MemberVO loginMember(MemberVO loginMember);

	// 코드를 받아 게임에 해당 코드가 있는지 검사하는 메소드
	public String searchGameCode(String code);

	// 코드를 받아 사용유무를 검사하는 메소드
	public String searchCodeUse(String code);

	// 코드와 멤버 아이디를 받아 코드 주문을 완료하는 메소드
	public int insertCodeOrder(GameCodeVO code);

	// 회원정보를 삭제 하기 위한 메소드
	public int removeMember(String memId);

	public int countList();

	public List<MemberVO> memList(Map<String, Object> map);



}
