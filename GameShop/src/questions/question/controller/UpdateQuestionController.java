package questions.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import questions.question.service.IQuestionService;
import questions.question.service.QuestionServiceImpl;
import questions.question.vo.QuestionVO;

@WebServlet("/question/update.do")
public class UpdateQuestionController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String qesId = req.getParameter("qesId");
		IQuestionService qesService = QuestionServiceImpl.getInstance();
		QuestionVO qv =qesService.getQuestion(qesId);
		req.setAttribute("qv", qv);
		req.getRequestDispatcher("/question/edit.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String qesId = req.getParameter("qesId");
		String memId = req.getParameter("memId");
		String qesTitle = req.getParameter("qesTitle");
		String qesCont = req.getParameter("qesCont");
		
		IQuestionService qesService = QuestionServiceImpl.getInstance();
		
		QuestionVO qv = new QuestionVO();
		qv.setQesId(qesId);
		qv.setMemId(memId);
		qv.setQesTitle(qesTitle);
		qv.setQesCont(qesCont);
		
		int cnt = qesService.modifyQuestion(qv);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		
		req.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/question/detail.do?qesId=" + qv.getQesId());
	}
}
