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
import notice.vo.NoticeVO;
import questions.question.service.IQuestionService;
import questions.question.service.QuestionServiceImpl;
import questions.question.vo.QuestionVO;

@WebServlet("/notice/update.do")
public class UpdateNoticeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String notId = req.getParameter("notId");
		INoticeService notService = NoticeServiceImpl.getInstance();
		NoticeVO nv =notService.getNotice(notId);
		req.setAttribute("nv", nv);
		req.getRequestDispatcher("/notices/notice/notEdit.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String notId = req.getParameter("notId");
		String notTitle = req.getParameter("notTitle");
		String notCont = req.getParameter("notCont");
		
		INoticeService notService = NoticeServiceImpl.getInstance();
		
		NoticeVO nv = new NoticeVO();
		nv.setNotId(notId);
		nv.setNotTitle(notTitle);
		nv.setNotCont(notCont);
		
		int cnt = notService.modifyNotice(nv);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		
		req.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/notice/detail.do?notId=" + nv.getNotId());
	}
}
