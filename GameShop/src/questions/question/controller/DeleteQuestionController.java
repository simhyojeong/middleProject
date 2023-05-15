package questions.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import questions.answer.service.AnswerServiceImpl;
import questions.answer.service.IAnswerService;
import questions.question.service.IQuestionService;
import questions.question.service.QuestionServiceImpl;

@WebServlet("/question/delete.do")
public class DeleteQuestionController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String qesId = req.getParameter("qesId");
		IQuestionService qesService = QuestionServiceImpl.getInstance();
		IAnswerService ansService = AnswerServiceImpl.getInstance();
		
		ansService.removeAnswer(qesId);
		int cnt = qesService.removeQuestion(qesId);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		
		req.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/question/list.do");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
