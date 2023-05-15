package questions.answer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import questions.answer.service.AnswerServiceImpl;
import questions.answer.service.IAnswerService;
import questions.answer.vo.AnswerVO;
import questions.question.service.IQuestionService;
import questions.question.service.QuestionServiceImpl;
import questions.question.vo.QuestionVO;

@WebServlet("/answer/delete.do")
public class DeleteAnswerController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String qesId = req.getParameter("qesId");
		IAnswerService ansService = AnswerServiceImpl.getInstance();
		
		QuestionVO qv = new QuestionVO();
		qv.setQesId(qesId);
		
		int cnt = ansService.removeAnswer(qesId);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		
		req.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/adminQuestion/detail.do?qesId=" + qv.getQesId());
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
