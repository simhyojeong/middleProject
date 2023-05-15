package faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import faq.service.FaqServiceImpl;
import faq.service.IFaqService;
import faq.vo.FaqVO;

@WebServlet("/faq/AdminFaq.do")
public class AdminFaqController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// faq 수정시 faqId 가져오기
		String faqId = req.getParameter("faqId");
		
		// 서비스 객체 생성
		IFaqService faqService = FaqServiceImpl.getInstance();

		// 쿼리담기 - 전체 리뷰 목록 
		List<FaqVO> faqList = faqService.listAllFaq();
		
		
		//FaqVO fv = faqService.getFAQ(faqId);

		// view에서 사용할 데이터 저장
		//req.setAttribute("fv", fv);
		req.setAttribute("faqList", faqList);
		
		

		// view 페이지로 전달
		req.getRequestDispatcher("/notices/faq/adminFaq.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		

		String faqId = req.getParameter("faqId");
		String faqTitle = req.getParameter("faqTitle");
		String faqCont = req.getParameter("faqCont");

		IFaqService faqService = FaqServiceImpl.getInstance();
		//////////////////////////////////////////////////
		FaqVO fv = new FaqVO();
		fv.setFaqCont(faqCont);
		fv.setFaqId(faqId);
		fv.setFaqTitle(faqTitle);
		
		
		faqService.updateFaq(fv);
		
		
		List<FaqVO> faqList = faqService.listAllFaq();
		

		resp.sendRedirect(req.getContextPath() + "/faq/AdminFaq.do");
		
		
	}
	
}
