package members.member.service;

import java.util.List;

import members.member.vo.GameCodeVO;

public interface IGameCodeService {
	

	// insert
	// DB작업이 성공하면 1 이상의 값이 반환되고 실패하면 0이 반환된다.
	public int insertCode(GameCodeVO cv); // 5개짜리 넣는걸로 고정
	
	
	// 게임코드가 존재하면 true, 존재하지 않으면 false 리턴함. 
	public boolean checkCode(String gameCode);
	
	
	// 게임코드ID에 해당하는 게임코드정보를 가져오기 위한 메서드
	// GameCodeVO객체 리턴함.
	public GameCodeVO getCode(String codeId);
	
	// gameName에 해당하는 gameId 출력
	// String 리턴
	public String getCodeId(String gameName);
	
	/*
	 * 게임코드정보를 삭제하기 위한 메서드
	 * codeId 삭제할 게임코드ID  
	 * DB작업이 성공하면 1 이상의 값이 반환되고 실패하면 0이 반환된다.
	 */
	public int deleteCode(String gameCode);
	
	
	/*
	 * 여러값 나올 수도 있으니까 List
	 * DB에 존재하는 모든 게임코드정보를 조회하기 위한 메서드
	 * 모든 게임코드정보를 담은 List 객체 
	 */
	public List<GameCodeVO> printAllCode();
	
	// 게임명 전부 출력
	public List<GameCodeVO> printAllgameNames();
	
	
	// 상태 정렬(사용됨 우선)
	public List<GameCodeVO> orderByStatus();
	
	/*
	 * 검색할 데이터에 해당하는 게임코드정보목록을 조회하기 위한 검색 메서드
	 * cv 검색할 데이터를 담은 VO객체
	 * return 검색된 데이터를 담은 List객체
	 */
	public List<GameCodeVO> searchCode(GameCodeVO cv);
	
}
