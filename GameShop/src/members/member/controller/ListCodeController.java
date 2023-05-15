package members.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import members.member.service.GameCodeServiceImpl;
import members.member.service.IGameCodeService;
import members.member.vo.GameCodeVO;

@WebServlet("/ListCode.do")
public class ListCodeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// A.삭제요청시 게임코드 가져오기
		String gameCode = req.getParameter("gameCode");
		
		
		// 1. 서비스객체 생성하기
		IGameCodeService codeService = GameCodeServiceImpl.getInstance();

		// 2. 쿼리 담기
		List<GameCodeVO> codeList = codeService.printAllCode();
		List<GameCodeVO> gameNameList = codeService.printAllgameNames();
		List<GameCodeVO> codeOrderStatus = codeService.orderByStatus(); // sort(사용여부)
		
		// B. 삭제 쿼리 실행
		int getCnt = codeService.deleteCode(gameCode);
		
		System.out.println("java메세지 숫자 확인 >> " + getCnt);
		
		String getMsg ="";
		if (getCnt > 0) {
			getMsg = "성공";
		}  else {
			getMsg = "실패";
		}		
		

		
		// 리스트출력 확인용
//		System.out.println("게임이름  사이즈 >> " + gameNameList.size());
		
		// 3. 뷰에서 사용할 데이터 저장
		req.setAttribute("codeList", codeList);
		req.setAttribute("gameNameList", gameNameList);
		req.setAttribute("codeOrderStatus", codeOrderStatus);
		
		if (gameCode == null) {
			
			// 4. 뷰 페이지로 전달
			req.getRequestDispatcher("/members/listCode.jsp").forward(req, resp); // list.jsp에게 보내는 내용
		} else {
			
			// C. 삭제 후 재요청 + 삭제성공 메세지 전달
			
			// 삭제성공시 세션에 메세지 저장
//			System.out.println("java메세지 확인 >> " + getMsg);
					
			HttpSession session = req.getSession();
			session.setAttribute("getMsg", getMsg);
			// 삭제 후 재요청
			System.out.println("삭제시도 게임코드 확인>> " + gameCode);
			resp.sendRedirect(req.getContextPath() + "/ListCode.do");
	  }
		

		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
				// 한글 인코딩
				req.setCharacterEncoding("UTF-8");
		
				// 요청 파라미터 정보
				String gameName = req.getParameter("gameName");
				String gameCode = req.getParameter("gameCode");
				String codeUse = req.getParameter("codeUse");
				
				// 서비스 객체 생성하기
				IGameCodeService codeService = GameCodeServiceImpl.getInstance();
				
				// 입력된 gameName -> gameId찾기
				// 게임ID= 게임Name찾는거 String 
				// String gameId = codeService.웅애웅앵(gameName) ->id찾는 쿼리를 써놓는걸 쓰는거지 
				String gameId = codeService.getCodeId(gameName);
				System.out.println("받아온 게임 id 확인 ㅠㅠ >> " + gameId);
				System.out.println("받아온 게임 Name 확인 ㅠㅠ >> " + gameName);
				
				// 코드정보 등록하기
				GameCodeVO cv = new GameCodeVO();
				cv.setGameId(gameId);
//				cv.setGameName(gameName); // 게임ID 불러오는란
//				cv.setGameId(gameId);
				cv.setGameCode(gameCode);
				cv.setCodeUse(codeUse);
				
				System.out.println("getGameId>>" + cv.getGameId());
				System.out.println("getGameCode>>" + cv.getGameCode());
				System.out.println("getCodeUse>>" + cv.getCodeUse());
				
				int cnt = codeService.insertCode(cv);
				
				String msg="";
				if (cnt > 0) {
					msg ="성공";
				} else {
					msg ="실패";
				}
				
				HttpSession session = req.getSession();
				session.setAttribute("msg", msg);
				
				
				resp.sendRedirect(req.getContextPath() + "/ListCode.do");
				
			}

}
