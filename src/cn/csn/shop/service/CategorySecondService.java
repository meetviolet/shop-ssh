package cn.csn.shop.service;

import java.util.List;

import cn.csn.shop.model.CategorySecond;
import cn.csn.shop.utils.PageBean;

public interface CategorySecondService {

	PageBean<CategorySecond> findAllByPage(Integer page);

	void save(CategorySecond categorySecond);

	CategorySecond findByCsid(Integer csid);

	void delete(CategorySecond categorySecond);

	void update(CategorySecond categorySecond);

	List<CategorySecond> findAll();

}
