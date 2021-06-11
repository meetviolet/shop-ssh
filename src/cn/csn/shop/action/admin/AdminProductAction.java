package cn.csn.shop.action.admin;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import cn.csn.shop.model.CategorySecond;
import cn.csn.shop.service.CategorySecondService;
import cn.csn.shop.model.Product;
import cn.csn.shop.service.ProductService;
import cn.csn.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("adminProductAction")
@Scope("prototype")
public class AdminProductAction extends ActionSupport implements ModelDriven<Product> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Product product = new Product();
	private Integer page;
	private ProductService productService;
	private CategorySecondService secondService;
	private File upload;
	private String uploadFileName;
	private String uploadContextType;

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setUploadContextType(String uploadContextType) {
		this.uploadContextType = uploadContextType;
	}

	@Resource(name = "categorySecondService")
	public void setSecondService(CategorySecondService secondService) {
		this.secondService = secondService;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	@Resource
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public Product getModel() {
		return product;
	}

	public String findAll() {
		PageBean<Product> pageBean = productService.findWithPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}

	public String addPage() {
		List<CategorySecond> csList = secondService.findAll();
		ActionContext.getContext().getValueStack().set("csList", csList);
		return "addPage";
	}

	public String save() throws IOException {
		product.setPdate(new Date());
		if (upload != null) {
			String realPath = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/products");
			//判断路径是否存在,不存在创建
            File dir = new File(realPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
			String uuid = UUID.randomUUID().toString();
			String fileName = uuid + uploadFileName.substring(uploadFileName.lastIndexOf("."));
			File diskFile = new File(realPath + "//" + fileName);
			System.out.println(realPath +" "+ upload +" "+ diskFile);
			FileUtils.copyFile(upload, diskFile);

			product.setImage("products/" + fileName);
		}

		productService.save(product);
		return "saveProduct";
	}

	public String delete() {
		product = productService.findByPid(product.getPid());
		String path = product.getImage();
		if (path != null) {
			String realPath = ServletActionContext.getServletContext().getRealPath("/" + path);
			File file = new File(realPath);
			file.delete();
		}
		productService.delete(product);
		return "deleteProduct";
	}

	public String edit() {
		product = productService.findByPid(product.getPid());
		List<CategorySecond> csList = secondService.findAll();
		ActionContext.getContext().getValueStack().set("csList", csList);
		return "editSuccess";
	}

	public String update() throws IOException {
		product.setPdate(new Date());
		if (upload != null) {
			String realPath = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/products");
			//判断路径是否存在,不存在创建
            File dir = new File(realPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
			String uuid = UUID.randomUUID().toString();
			String fileName = uuid + uploadFileName.substring(uploadFileName.lastIndexOf("."));
			File diskFile = new File(realPath + "//" + fileName);
			FileUtils.copyFile(upload, diskFile);

			product.setImage("products/" + uploadFileName);
		} else {
			Product tempProduct = productService.findByPid(product.getPid());
			product.setImage(tempProduct.getImage());
		}
		
		productService.update(product);
		return "updateSuccess";
	}

}
