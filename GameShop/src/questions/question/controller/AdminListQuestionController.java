package questions.question.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import questions.answer.service.AnswerServiceImpl;
import questions.answer.service.IAnswerService;
import questions.answer.vo.AnswerVO;
import questions.question.service.IQuestionService;
import questions.question.service.QuestionServiceImpl;
import questions.question.vo.QuestionVO;

@WebServlet(value = "/adminQuestion/list.do")
public class AdminListQuestionController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IQuestionService qesService = QuestionServiceImpl.getInstance();
		List<QuestionVO> qesList = qesService.listAllQuestion();
		req.setAttribute("qesList", qesList);
		
		IAnswerService ansService = AnswerServiceImpl.getInstance();
		List<AnswerVO> ansList = ansService.listAllAnswer();
		req.setAttribute("ansList", ansList);
		
		System.out.println("page 번호 >> " + req.getParameter("page"));
		int currentPage = 1; //현재페이지
		currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		
//		IQuestionService questionService = QuestionServiceImpl.getInstance();
		int countList = qesService.countList();
		
		// 한 화면에 출력할 페이지 수
		int perPage = 5;
		// 한 페이지에 출력할 글 갯수
		int perList = 15;
		
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
		
		List<QuestionVO> list = qesService.questionList(map);
		
		req.setAttribute("list", list);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("cPage", currentPage);
		req.setAttribute("ttPage", totalPage);
		
		
		req.getRequestDispatcher("/question/adminList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);
	}
}
