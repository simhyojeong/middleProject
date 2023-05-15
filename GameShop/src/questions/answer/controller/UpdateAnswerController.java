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

@WebServlet("/answer/update.do")
public class UpdateAnswerController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String qesId = req.getParameter("qesId");
		IAnswerService ansService = AnswerServiceImpl.getInstance();
		AnswerVO ansv = ansService.getAnswer(qesId);
		req.setAttribute("ansv", ansv);
		req.getRequestDispatcher("/question/adminView.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String qesId = req.getParameter("qesId");
		String ansCont = req.getParameter("ansCont");
		
		IAnswerService ansService = AnswerServiceImpl.getInstance();
		
		AnswerVO ansv = new AnswerVO();
		ansv.setQesId(qesId);
		ansv.setAnsCont(ansCont);
		
		int cnt = ansService.modifyAnswer(ansv);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		
		req.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/adminQuestion/detail.do?qesId=" + ansv.getQesId());
	}
}
