package cn.csn.shop.service;

import java.util.List;

import cn.csn.shop.model.Product;
import cn.csn.shop.utils.PageBean;

public interface ProductService {

	List<Product> findHot();

	List<Product> findNew();

	Product findByPid(Integer pid);

	PageBean findByPageCid(Integer cid, Integer page);

	PageBean findByCsid(Integer csid, Integer page);
	
	PageBean findByPname(String pname, Integer page);

	PageBean<Product> findWithPage(Integer page);

	void save(Product product);

	void delete(Product product);

	void update(Product product);

}
