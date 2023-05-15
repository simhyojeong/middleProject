package members.member.service;

import java.util.List;

import members.member.dao.GameCodeDAOImpl;
import members.member.dao.IGameCodeDAO;
import members.member.vo.GameCodeVO;
import sun.security.jca.GetInstance;

public class GameCodeServiceImpl implements IGameCodeService {
	
	private static IGameCodeService codeService;
	
	private IGameCodeDAO codeDAO;
	
	private GameCodeServiceImpl() {
		codeDAO = GameCodeDAOImpl.getInstance();
	}
	
	public static IGameCodeService getInstance() {
		if(codeService == null) {
			codeService = new GameCodeServiceImpl();
		}
		return codeService;
	}
	
	
	
	
	@Override
	public int insertCode(GameCodeVO cv) {
		return codeDAO.insertCode(cv);
	}

	
	@Override
	public boolean checkCode(String gameCode) {
		return codeDAO.checkCode(gameCode);
	}

	
	@Override
	public GameCodeVO getCode(String codeId) {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public String getCodeId(String gameName) {
		return codeDAO.getCodeId(gameName);
	}

	
	@Override
	public int deleteCode(String gameCode) {
		return codeDAO.deleteCode(gameCode);
	}

	@Override
	public List<GameCodeVO> printAllCode() {
		return codeDAO.printAllCode();
	}

	@Override
	public List<GameCodeVO> printAllgameNames() {
		return codeDAO.printAllgameNames();
	}
	
	@Override
	public List<GameCodeVO> orderByStatus() {
		return codeDAO.orderByStatus();
	}
	
	@Override
	public List<GameCodeVO> searchCode(GameCodeVO cv) {
		// TODO Auto-generated method stub
		return null;
	}




}
