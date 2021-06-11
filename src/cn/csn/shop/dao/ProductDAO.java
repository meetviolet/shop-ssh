package cn.csn.shop.dao;

import java.util.List;

import cn.csn.shop.model.Product;
import cn.csn.shop.utils.PageBean;

public interface ProductDAO {

	List<Product> findHot();

	List<Product> findNew();

	Product findByPid(Integer pid);

	int findByCid(Integer cid);

	List<Product> findByPageCid(Integer cid, int begin, int pagesize);

	int findByCsid(Integer csid);

	List<Product> findByPageCsid(Integer csid, int begin, int pagesize);
	
	int findByPname(String pname);
	
	List<Product> findByPagePname(String pname, int begin, int pagesize);

	int findCount();

	List<Product> findWithPage(int begin, int pagesize);

	void save(Product product);

	void delete(Product product);

	void update(Product product);

}
