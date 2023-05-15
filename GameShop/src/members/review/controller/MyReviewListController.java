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

import members.member.vo.MemberVO;
import members.review.service.IReviewService;
import members.review.service.ReviewServiceImple;
import members.review.vo.MyReviewVO;

@WebServlet("/members/MyReview.do")
public class MyReviewListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IReviewService revService = ReviewServiceImple.getInstance();
		//세션열기
		HttpSession session = req.getSession();
		MemberVO mv = (MemberVO) session.getAttribute("loginMember");
		
//		List<MyReviewVO> myrevList = revService.getMemberReview(mv.getMemId());  searchReviewList가 if문을 제외하고 getMemberReview와 같은 기능을 하니까
//		req.setAttribute("myrevList", myrevList);
//		System.out.println(myrevList.size());
		
		// 검색 기능 - 게임이름 받아오기
		String gameName = req.getParameter("gameName");
		
		// 정보 받아와서 vo에 저장
		MyReviewVO vo = new MyReviewVO();
		vo.setGameName(gameName);
		vo.setMemId(mv.getMemId());
		
		// 리스트에서 검색후 리스트에 저장
		List<MyReviewVO> searchReview = revService.searchReviewList(vo);
		req.setAttribute("searchReview", searchReview);  //받아온 값 보내주기
		System.out.println("searchReview:" +  searchReview.size());
		
		//페이징 넘버
		System.out.println("page 번호 >> " + req.getParameter("page"));
		int currentPage = 1; //현재페이지 초기화
		//currentPage에 page값이 null이면 1, null이 아니면 page 값 반환
		currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		
		if(gameName != null) {
			int ScountList = revService.searchCountReviewList(vo);
			
			// 한 화면에 출력할 페이지 수
			int perPage = 5;
			// 한 페이지에 출력할 글 갯수
			int perList = 3;
			
			// 전체 페이지 수 = 전체 글 갯수/페이지 당 글 갯수
			int totalPage = (int) Math.ceil((double) ScountList / (double) perList);
			
			int start = (currentPage - 1) * perList + 1; // 1
			int end = start + perList - 1;
			if (end > ScountList)
				end = ScountList; // 전체 글 갯수를 넘어서는 end값을 조절
			
			int startPage = ((currentPage - 1) / perPage * perPage) + 1;//뒤에 / perPage * perPage이거 왜씀?
			int endPage = startPage + totalPage - 1;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memId", mv.getMemId());
			map.put("gameName", gameName);
			map.put("start",start);
			map.put("end",end);
			
			
			List<MyReviewVO> list = revService.reviewList(map);
			
			req.setAttribute("list", list);
			req.setAttribute("sPage", startPage);
			req.setAttribute("ePage", endPage);
			req.setAttribute("cPage", currentPage);
			req.setAttribute("ttPage", totalPage);
			
			System.out.println("list: " + list);
		}else {
			int countList = revService.countReviewList(mv.getMemId());
			
			// 한 화면에 출력할 페이지 수
			int perPage = 5;
			// 한 페이지에 출력할 글 갯수
			int perList = 3;
			
			// 전체 페이지 수 = 전체 글 갯수/페이지 당 글 갯수
			int totalPage = (int) Math.ceil((double) countList / (double) perList);
			
			int start = (currentPage - 1) * perList + 1; // 1
			int end = start + perList - 1;
			if (end > countList)
				end = countList; // 전체 글 갯수를 넘어서는 end값을 조절
			
			int startPage = ((currentPage - 1) / perPage * perPage) + 1;//뒤에 / perPage * perPage이거 왜씀?
			int endPage = startPage + totalPage - 1;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memId", mv.getMemId());
			map.put("gameName", gameName);
			map.put("start",start);
			map.put("end",end);
			
			
			List<MyReviewVO> list = revService.reviewList(map);
			
			req.setAttribute("list", list);
			req.setAttribute("sPage", startPage);
			req.setAttribute("ePage", endPage);
			req.setAttribute("cPage", currentPage);
			req.setAttribute("ttPage", totalPage);
		}
		
		req.getRequestDispatcher("/members/myReview.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		
	}
	
	
	
	
}
