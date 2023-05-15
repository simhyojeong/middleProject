package games.game.service;

import games.game.dao.GameDAOImpl;
import games.game.dao.IGameDAO;
import games.game.vo.DiscountVO;
import games.game.vo.GameDetailVO;
import games.game.vo.GameSearchVO;
import games.game.vo.GameVO;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import members.member.vo.GameCodeVO;

public class GameServiceImpl implements IGameService {
	private static final String UPLOAD_DIR = "D:/A_TeachingMaterial/04_MiddelProject/file";
	private static IGameService service;
	private IGameDAO dao = GameDAOImpl.getInstance();

	private GameServiceImpl() {
	}

	public static IGameService getInstance() {
		if (service == null) {
			service = new GameServiceImpl();
		}

		return service;
	}

	public List<GameVO> allGameList() {
		return this.dao.allGameList();
	}

	public List<GameVO> getGameList(GameSearchVO vo) {
		return this.dao.getGameList(vo);
	}

	public List<GameVO> getGameInfo(String name) {
		return this.dao.getGameInfo(name);
	}

	public List<GameDetailVO> getDetailGameInfo(String id) {
		return this.dao.getDetailGameInfo(id);
	}

	public List<String> getCodeOrderGame(String memId) {
		return this.dao.getCodeOrderGame(memId);
	}

	public List<String> saveGameImg(HttpServletRequest req) {
		// File.separator : OS마다 파일 경로 구분자가 다르기 때문에 구분자를 OS에 맞춰서 변경해줌
		String uploadPath = UPLOAD_DIR;

		File uploadDir = new File(uploadPath);

		if (!uploadDir.exists()) { // 업로드 경로가 존재하지 않으면...
			uploadDir.mkdir();
		}
		String saveFileName = ""; // 저장 파일 이름(따로 만들어서 지정)
		String saveFilePath = ""; // 저장 파일 경로
		List<String> gamepath = new ArrayList<String>();
		File storeFile = null; // 저장파일 객체
		try {
			String fileName = "";
			int i = 0;
			boolean isFirstFile = true; // 첫번째 파일 여부 체크용

			for (Part part : req.getParts()) {
				fileName = getFileName(part); // 파일명 추출
				// 파일임(파일이면 파일명이 있기 때문에) -> null이면 폼필드이거나 첨부를 하지않은것임
				if (fileName != null && !fileName.equals("")) {

					do {
						// UUID : 범용 고유 식별자(각 개체를 고유하게 식별 가능한 값)
						// => 기간제나 임시 유저의 Key값을 줄 때 사용하거나,
						// 파일등을 업로드 할 때 어떤파일을 올렷나 식별이 가능하도록 key값 줄 때 사용
						saveFileName = UUID.randomUUID().toString().replace("-", "");
						System.out.println("저장 파일명 : " + saveFileName);
						saveFilePath = uploadPath + File.separator + saveFileName;
						System.out.println("저장 파일경로 : " + saveFilePath);
						storeFile = new File(saveFilePath);
					} while (storeFile.exists());
					gamepath.add(saveFileName);
					// 해당 파일 경로로 저장(업로드 파일)
					part.write(saveFilePath);
					// 임시로 저장 업로드 파일 삭제
					part.delete();

					System.out.println("파일명 : " + fileName + "업로드 완료");

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// atchFileId가 들어 있음(sequence로 생성한)
		return gamepath;
	}

	private String getFileName(Part part) {
		for (String content : part.getHeader("Content-Disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf("=") + 1).trim().replace("\"", "");
			}
		}
		return null; // filename이 없는 경우 ... (폼필드)
	}

	public String nextGameId() {
		return this.dao.nextGameId();
	}

	public String isDiscountId(String gameId) {
		return this.dao.isDiscountId(gameId);
	}

	public String nextDiscountId() {
		return this.dao.nextDiscountId();
	}

	public int insertDiscount(DiscountVO vo) {
		return this.dao.insertDiscount(vo);
	}

	public int insertGame(GameVO vo) {
		return this.dao.insertGame(vo);
	}

	public int updateGame(GameVO vo) {
		return this.dao.updateGame(vo);
	}

	public void deleteGame(String gameId) {
		this.dao.deleteGame(gameId);
	}

	public void updateGameCode(GameCodeVO codeVO) {
		this.dao.updateGameCode(codeVO);
	}
}
