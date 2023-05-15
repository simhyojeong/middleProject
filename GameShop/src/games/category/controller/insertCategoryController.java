package games.category.controller;

import games.category.service.CategoryServiceImpl;
import games.category.service.ICategoryService;
import games.category.vo.CategoryVO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/insertCate.do")
public class insertCategoryController extends HttpServlet {
	public insertCategoryController() {
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String detailName = req.getParameter("detailName");
		String cateId = req.getParameter("cateId");

		ICategoryService cateService = CategoryServiceImpl.getInstance();

		String detailId = cateService.getDetailId();
		CategoryVO vo = new CategoryVO();

		vo.setDetailId(detailId);
		vo.setCateId(cateId);
		vo.setDetailName(detailName);
		cateService.insertCategory(vo);
		resp.sendRedirect(req.getContextPath() + "/GameListAdmin.do");
	}
}
