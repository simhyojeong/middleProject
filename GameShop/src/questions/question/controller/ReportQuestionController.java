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

@WebServlet("/question/report.do")
public class ReportQuestionController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String gameName = req.getParameter("gameName");
		String memName = req.getParameter("memName");
		String memId = req.getParameter("memId");
		String qesTitle = "[신고] " + gameName + "에 대한 신고가 접수되었습니다.";
		String qesCont = memName + "님이 " + "[" + gameName + "]" + "를 신고했습니다.";

		IQuestionService qesService = QuestionServiceImpl.getInstance();

		QuestionVO qv = new QuestionVO();
		qv.setMemId(memId);
		qv.setQesTitle(qesTitle);
		qv.setQesCont(qesCont);

		int cnt = qesService.registQuestion(qv);

		String msg = "";
		if (cnt > 0) {
			msg = "신고가 접수되었습니다.";
		} else {
			msg = "신고가 실패되었습니다. 다시 시도해주십시요";
		}

		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);

		req.setAttribute("msg", msg);

		resp.sendRedirect(req.getContextPath() + "/question/list.do");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
