package notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.service.INoticeService;
import notice.service.NoticeServiceImpl;
import notice.vo.NoticeVO;
import questions.answer.service.AnswerServiceImpl;
import questions.answer.service.IAnswerService;
import questions.answer.vo.AnswerVO;
import questions.question.service.IQuestionService;
import questions.question.service.QuestionServiceImpl;
import questions.question.vo.QuestionVO;

@WebServlet("/notice/detail.do")
public class DetailNoticeController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String notId = req.getParameter("notId");
		INoticeService notService = NoticeServiceImpl.getInstance();
		NoticeVO nv = notService.getNotice(notId);
		req.setAttribute("nv", nv);
		
		req.getRequestDispatcher("/notices/notice/notView.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
