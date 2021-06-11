package cn.csn.shop.action.admin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import cn.csn.shop.model.Category;
import cn.csn.shop.service.CategoryService;
import cn.csn.shop.model.CategorySecond;
import cn.csn.shop.service.CategorySecondService;
import cn.csn.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("adminSecondAction")
@Scope("prototype")
public class AdminCategorySecondAction extends ActionSupport implements ModelDriven<CategorySecond> {
	private CategorySecond categorySecond = new CategorySecond();
	private CategorySecondService categorySecondService;
	private CategoryService categoryService;

	@Resource(name = "categoryService")
	public void setSecondService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	private Integer page;

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPage() {
		return page;
	}

	@Resource(name = "categorySecondService")
	public void setCategoryService(CategorySecondService categoryService) {
		this.categorySecondService = categoryService;
	}

	public CategorySecond getModel() {
		return categorySecond;
	}

	public String findAll() {
		PageBean<CategorySecond> pageBean = categorySecondService.findAllByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);

		List<Category> cList = categoryService.findAll();
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "findAll";
	}

	public String store() {
		categorySecondService.save(categorySecond);
		return "store";
	}

	public String delete() {
		categorySecond = categorySecondService.findByCsid(categorySecond.getCsid());
		categorySecondService.delete(categorySecond);
		return "deleteSuccess";
	}

	public String edit() {
		categorySecond = categorySecondService.findByCsid(categorySecond.getCsid());
		List<Category> cList = categoryService.findAll();
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "editSuccess";
	}

	public String update() {
		categorySecondService.update(categorySecond);
		return "updateSuccess";
	}

}
