package members.member.controller;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import members.member.service.IMemberService;
import members.member.service.MemberServiceImpl;
import members.member.vo.MemberVO;



@WebServlet("/memberAdminList.do")
public class memberAdminListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// service 개체 얻기
		IMemberService memService = MemberServiceImpl.getInstance();
		
		// 수정
		String memId = req.getParameter("memId"); 
		
		MemberVO mv = new MemberVO();
		mv.setMemId(memId);
		mv.setMemQuit("o");
		
		int cnt = memService.quitMember(mv);

		System.out.println("cnt 값 확인 : " + cnt);
		
		
		
		//--------------------------------- 원래 리스트 ----------------------------------------------------
		
		
		
		// 수정 + 리스트(뷰) 분리 
//				if (cnt >= 1) {
				MemberVO modifiedMv = new MemberVO();
				modifiedMv.setMemId(memId);
				modifiedMv.setMemQuit("x");
				//수정하는 sql문 servcie.dasd
				
				memService.quitMember(modifiedMv);
				
				
//				} else { //여기부터 원래리스트		
		
		
		// service 메소드 호출 - 결과값 받기
		List<MemberVO> memlist = memService.getAllMember();
		
				
		// 결과값 저장
		req.setAttribute("memList", memlist);
		System.out.println(">>>"+memlist.size());
		
		System.out.println("page 번호 >> " + req.getParameter("page"));
		int currentPage = 1; //현재페이지
		currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		
//		IQuestionService questionService = QuestionServiceImpl.getInstance();
		int countList = memService.countList();
		
		// 한 화면에 출력할 페이지 수
		int perPage = 3;
		// 한 페이지에 출력할 글 갯수
		int perList = 10;
		
		// 전체 페이지 수 = 전체 글 갯수/ 페이지 당 글 갯수
		int totalPage = (int) Math.ceil((double) countList / (double) perList);
		
		int start = (currentPage - 1) * perList + 1; // 1
		int end = start + perList - 1;
		if (end > countList)
			end = countList; // 전체 글 갯수를 넘어서는 end값을 조절
		
		int startPage = ((currentPage - 1) / perPage * perPage) + 1;//뒤에 / perPage * perPage이거 왜씀?
		int endPage = startPage + totalPage - 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		
	
		
		
		List<MemberVO> list = memService.memList(map);
		
		
		
		req.setAttribute("list", list);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("cPage", currentPage);
		req.setAttribute("ttPage", totalPage);
		
		req.getRequestDispatcher("/members/memberAdminList.jsp").forward(req, resp); //jsp에 받은 목록을 전달하기
		
		}
		//--------------------------------- 원래 리스트 ----------------------------------------------------
		
		
		
//	}

	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		String memId = req.getParameter("memId");
//		String memQuit = req.getParameter
//		IMemberService memService = MemberServiceImpl.getInstance();
//		MemberVO mv = new MemberVO();
//		mv.setMemId(memId);
//		mv.setMemQuit("x");
//		memService.quitMember(mv);
//		resp.sendRedirect(req.getContextPath() + "/memberAdminList.do");
	}

}
