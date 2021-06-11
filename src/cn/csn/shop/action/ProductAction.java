package cn.csn.shop.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.json.annotations.JSON;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import cn.csn.shop.model.Product;
import cn.csn.shop.service.ProductService;
import cn.csn.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("productAction")
@Scope("prototype")
public class ProductAction extends ActionSupport implements ModelDriven<Product> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Product product = new Product();
	private ProductService productService;

	private Integer cid;
	private Integer csid;
	private Integer pid;
	private Integer page;
	private Map<String, Object> jsonResult;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getCsid() {
		return csid;
	}

	public void setCsid(Integer csid) {
		this.csid = csid;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	@Resource
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@JSON(serialize=false)
	public Product getModel() {
		return product;
	}

	public String findByPid() {
		product = productService.findByPid(product.getPid());
		return "productInfo";
	}
	
	public String findById() {
		product = productService.findByPid(product.getPid());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product", product);
		jsonResult = map;
		return "findProductById";
	}

	public String findByPageCid() {
		PageBean pageBean = productService.findByPageCid(cid, page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "allProduct";
	}

	public String findByCsid() {
		PageBean pageBean = productService.findByCsid(csid, page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "categorysecondProduct";
	}
	
	public String findByPname() throws UnsupportedEncodingException {
		String pname = URLDecoder.decode(product.getPname(),"UTF-8");
		PageBean pageBean = productService.findByPname(pname, page);
		ActionContext.getContext().getValueStack().set("searchName", pname);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "allProduct";
	}

	public Map<String, Object> getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(Map<String, Object> jsonResult) {
		this.jsonResult = jsonResult;
	}

}
