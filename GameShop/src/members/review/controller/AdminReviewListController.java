package members.review.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import members.review.service.IReviewService;
import members.review.service.ReviewServiceImple;
import members.review.vo.MyReviewVO;

@WebServlet("/AdminReview.do")
public class AdminReviewListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		IReviewService revService = ReviewServiceImple.getInstance();
	
		
		//List<MyReviewVO> revList = revService.getAdminReview();
		//req.setAttribute("revList", revList);
		//System.out.println(revList.size());

		// 검색 기능 - 게임이름, 회원이름 받아오기
		String memName = req.getParameter("memName");
		String gameName = req.getParameter("gameName");

		
		// 정보 받아와서 vo에 저장
		MyReviewVO vo = new MyReviewVO();
		vo.setMemName(memName);
		vo.setGameName(gameName);
		
		// 리스트에서 검색 후 리스트에 저장
		List<MyReviewVO> searchReview = revService.getAdminReview();
		req.setAttribute("searchReview", searchReview);
		System.out.println("searchReview : " + searchReview.size());
		
		
		//페이징 처리
		System.out.println("page 번호 >> " + req.getParameter("page"));
		int currentPage = 1; //현재페이지
		currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		
		if(memName != null) {
			int ScountList = revService.searchCountAdReviewList(vo);

			// 한 화면에 출력할 페이지 수
			int perPage = 5;
			// 한 페이지에 출력할 글 갯수
			int perList = 5;
			
			// 전체 페이지 수 = 전체 글 갯수/ 페이지 당 글 갯수
			int totalPage = (int) Math.ceil((double) ScountList / (double) perList);
			
			int start = (currentPage - 1) * perList + 1; // 1
			int end = start + perList - 1;
			if (end > ScountList)
				end = ScountList; // 전체 글 갯수를 넘어서는 end값을 조절
			
			int startPage = ((currentPage - 1) / perPage * perPage) + 1;//뒤에 / perPage * perPage이거 왜씀?
			int endPage = startPage + totalPage - 1;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memName", memName);
			map.put("gameName", gameName);
			map.put("start",start);
			map.put("end",end);
			
			List<MyReviewVO> list = revService.adReviewList(map);
			System.out.println("listSize : " + list.size());
			
			req.setAttribute("list", list);
			req.setAttribute("sPage", startPage);
			req.setAttribute("ePage", endPage);
			req.setAttribute("cPage", currentPage);
			req.setAttribute("ttPage", totalPage);
			
		}else {
			int countList = revService.countAdReviewList();
			
			// 한 화면에 출력할 페이지 수
			int perPage = 5;
			// 한 페이지에 출력할 글 갯수
			int perList = 5;
			
			// 전체 페이지 수 = 전체 글 갯수/ 페이지 당 글 갯수
			int totalPage = (int) Math.ceil((double) countList / (double) perList);
			
			int start = (currentPage - 1) * perList + 1; // 1
			int end = start + perList - 1;
			if (end > countList)
				end = countList; // 전체 글 갯수를 넘어서는 end값을 조절
			
			int startPage = ((currentPage - 1) / perPage * perPage) + 1;//뒤에 / perPage * perPage이거 왜씀?
			int endPage = startPage + totalPage - 1;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memName", memName);
			map.put("gameName", gameName);
			map.put("start",start);
			map.put("end",end);
			
			List<MyReviewVO> list = revService.adReviewList(map);
			System.out.println("listSize : " + list.size());
			
			req.setAttribute("list", list);
			req.setAttribute("sPage", startPage);
			req.setAttribute("ePage", endPage);
			req.setAttribute("cPage", currentPage);
			req.setAttribute("ttPage", totalPage);
		}
		
		
		
		
		req.getRequestDispatcher("/members/adminReview.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		
	}
	
	
	
	
}
