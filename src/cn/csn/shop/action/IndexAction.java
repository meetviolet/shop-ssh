package cn.csn.shop.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import cn.csn.shop.model.Category;
import cn.csn.shop.service.CategoryService;
import cn.csn.shop.model.Product;
import cn.csn.shop.service.ProductService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("indexAction")//用注解控制 ，就是把indexAction这个类交给spring管理
@Scope("prototype")//当请求时，都创建一个新action
public class IndexAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private CategoryService categoryService;
	private ProductService productService;

	@Resource
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@Resource
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public String execute() {
		List<Category> cList = categoryService.findAll();
		ActionContext.getContext().getSession().put("cList", cList);
		List<Product> hList = productService.findHot();
		ActionContext.getContext().getValueStack().set("hList", hList);
		List<Product> nList = productService.findNew();
		ActionContext.getContext().getValueStack().set("nList", nList);
		return "index";
	}
}
