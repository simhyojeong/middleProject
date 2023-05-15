package games.category.service;

import games.category.vo.CategoryDetailVO;
import games.category.vo.CategoryVO;
import java.util.List;

public interface ICategoryService {
    List<CategoryDetailVO> allCategoryList();

    void insertCategory(CategoryVO var1);

    String getDetailId();

    void deleteCategory(String var1);
}
