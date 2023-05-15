package games.category.dao;

import games.category.vo.CategoryDetailVO;
import games.category.vo.CategoryVO;
import java.util.List;
import util.MyBatisDAO;

public class CategoryDAOImpl extends MyBatisDAO implements ICategoryDAO {
	private static ICategoryDAO catDAO;

	public CategoryDAOImpl() {
	}

	public static ICategoryDAO getInstance() {
		if (catDAO == null) {
			catDAO = new CategoryDAOImpl();
		}

		return catDAO;
	}

	public List<CategoryDetailVO> allCategoryList() {
		List<CategoryDetailVO> list = this.selectList("category.allCategoryList");
		return list;
	}

	public void insertCategory(CategoryVO vo) {
		this.insert("category.insertCategory", vo);
	}

	public String getDetailId() {
		return (String) this.selectOne("category.getDetailId");
	}

	public void deleteCategory(String detailId) {
		this.delete("category.deleteCategory", detailId);
	}
}
