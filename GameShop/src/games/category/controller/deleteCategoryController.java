package games.category.controller;

import games.category.service.CategoryServiceImpl;
import games.category.service.ICategoryService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteCate.do")
public class deleteCategoryController extends HttpServlet {
	public deleteCategoryController() {
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ICategoryService cateService = CategoryServiceImpl.getInstance();

		String detailId = req.getParameter("detailId");

		cateService.deleteCategory(detailId);

		resp.sendRedirect(req.getContextPath() + "/GameListAdmin.do");
	}
}
