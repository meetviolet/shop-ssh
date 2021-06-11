package cn.csn.shop.dao;

import java.util.List;

import cn.csn.shop.model.Category;

public interface CategoryDAO {

	List<Category> findAll();

	void save(Category category);

	Category findByCid(Integer cid);

	void delete(Category category);

	void update(Category category);

}
