package cn.csn.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import cn.csn.shop.dao.CategorySecondDAO;
import cn.csn.shop.model.CategorySecond;
import cn.csn.shop.service.CategorySecondService;
import cn.csn.shop.model.Product;
import cn.csn.shop.utils.PageBean;

@Component("categorySecondService")
@Transactional
public class CategorySecondServiceImpl implements CategorySecondService {
	private CategorySecondDAO categoryDAO;

	@Resource(name = "categorySecondDAO")
	public void setCategoryDAO(CategorySecondDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	public PageBean<CategorySecond> findAllByPage(Integer page) {
		PageBean pageBean = new PageBean();
		pageBean.setPage(page);
		int pagesize = 10;
		pageBean.setPagesize(pagesize);
		int total = categoryDAO.findCount();
		pageBean.setTotal(total);
		int pageCount = 0;
		if (total / pagesize == 0) {
			pageCount = total / pagesize;
		} else {
			pageCount = total / pagesize + 1;
		}
		pageBean.setPageCount(pageCount);
		int begin = (page - 1) * pagesize;
		List<CategorySecond> list = categoryDAO.findAllWithPage(begin, pagesize);
		pageBean.setProList(list);
		return pageBean;
	}

	public void save(CategorySecond categorySecond) {
		categoryDAO.save(categorySecond);
	}

	public CategorySecond findByCsid(Integer csid) {
		return categoryDAO.findByCsid(csid);
	}

	public void delete(CategorySecond categorySecond) {
		categoryDAO.delete(categorySecond);

	}

	public void update(CategorySecond categorySecond) {
		categoryDAO.update(categorySecond);
	}

	public List<CategorySecond> findAll() {
		return categoryDAO.findAll();
	}

}
