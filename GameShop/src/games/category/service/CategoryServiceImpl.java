package games.category.service;

import games.category.dao.CategoryDAOImpl;
import games.category.dao.ICategoryDAO;
import games.category.vo.CategoryDetailVO;
import games.category.vo.CategoryVO;
import java.util.List;

public class CategoryServiceImpl implements ICategoryService {
    private static ICategoryService catService;
    private ICategoryDAO catDAO = CategoryDAOImpl.getInstance();

    private CategoryServiceImpl() {
    }

    public static ICategoryService getInstance() {
        if (catService == null) {
            catService = new CategoryServiceImpl();
        }

        return catService;
    }

    public List<CategoryDetailVO> allCategoryList() {
        return this.catDAO.allCategoryList();
    }

    public void insertCategory(CategoryVO vo) {
        this.catDAO.insertCategory(vo);
    }

    public String getDetailId() {
        return this.catDAO.getDetailId();
    }

    public void deleteCategory(String detailId) {
        this.catDAO.deleteCategory(detailId);
    }
}
