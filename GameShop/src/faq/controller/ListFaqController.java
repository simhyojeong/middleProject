package faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faq.service.FaqServiceImpl;
import faq.service.IFaqService;
import faq.vo.FaqVO;

@WebServlet("/faq/listFaq.do")
public class ListFaqController extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 서비스 객체 생성
		IFaqService faqService = FaqServiceImpl.getInstance();

		// 전체 리뷰 목록 조회
		List<FaqVO> faqList = faqService.listAllFaq();

		// view에서 사용할 데이터 저장
		req.setAttribute("faqList", faqList);

		// view 페이지로 전달
		 req.getRequestDispatcher("/notices/faq/listFaq.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		
	}
}
