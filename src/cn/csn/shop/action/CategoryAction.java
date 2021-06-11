package cn.csn.shop.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import cn.csn.shop.service.CategoryService;

import com.opensymphony.xwork2.ActionSupport;

@Component("categoryAction")
@Scope("prototype")
public class CategoryAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private CategoryService categoryService;

	@Resource
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
}
