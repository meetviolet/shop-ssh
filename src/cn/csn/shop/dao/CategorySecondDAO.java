package cn.csn.shop.dao;

import java.util.List;

import cn.csn.shop.model.CategorySecond;

public interface CategorySecondDAO {

	int findCount();

	List<CategorySecond> findAllWithPage(int begin, int pagesize);

	void save(CategorySecond categorySecond);

	CategorySecond findByCsid(Integer csid);

	void delete(CategorySecond categorySecond);

	void update(CategorySecond categorySecond);

	List<CategorySecond> findAll();

}
