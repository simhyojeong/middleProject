package notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import notice.service.INoticeService;
import notice.service.NoticeServiceImpl;
import questions.answer.service.AnswerServiceImpl;
import questions.answer.service.IAnswerService;
import questions.question.service.IQuestionService;
import questions.question.service.QuestionServiceImpl;

@WebServlet("/notice/delete.do")
public class DeleteNoticeController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String notId = req.getParameter("notId");
		INoticeService notService = NoticeServiceImpl.getInstance();
		
		int cnt = notService.removeNotice(notId);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		
		req.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/notice/list.do");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
