package members.member.dao;

import java.util.List;

import members.member.vo.GameCodeVO;
import util.MyBatisDAO;

public class GameCodeDAOImpl extends MyBatisDAO implements IGameCodeDAO{

	// 싱글톤
	private static IGameCodeDAO codeDAO;

	private GameCodeDAOImpl() {
	
	}

	public static IGameCodeDAO getInstance() {
		if(codeDAO == null) {
			codeDAO = new GameCodeDAOImpl();
		}
		
		return codeDAO;
	}
	
	
	@Override
	public int insertCode(GameCodeVO cv) {
		return insert("gamecode.insertCode", cv);
	}

	@Override
	public boolean checkCode(String gameCode) {
		
		// default: 존재x
		boolean isExist = false; 
		
		int cnt = selectOne("gamecode.chkGameCode", gameCode);
		
		if (cnt > 0) {
			isExist = true;
		}
		return isExist;
	}

	
	@Override
	public GameCodeVO getCode(String codeId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	@Override
	public String getCodeId(String gameName) {
		return selectOne("gamecode.getGameId", gameName);
	}
	
	@Override
	public int deleteCode(String gameCode) {
		return delete("gamecode.deleteCode", gameCode);
	}

	@Override
	public List<GameCodeVO> printAllCode() {
		List<GameCodeVO> codeList = selectList("gamecode.getAllGameCode");
		return codeList;
	}
	
	@Override
	public List<GameCodeVO> printAllgameNames() {
		List<GameCodeVO> gameNameList = selectList("gamecode.getAllgameNames");
		return gameNameList;
	}

	@Override
	public List<GameCodeVO> orderByStatus() {
		List<GameCodeVO> codeOrderStatus = selectList("gamecode.getListByStatus");
		return codeOrderStatus;
	}
	
	@Override
	public List<GameCodeVO> searchCode(GameCodeVO cv) {
		// TODO Auto-generated method stub
		return null;
	}



	
}

