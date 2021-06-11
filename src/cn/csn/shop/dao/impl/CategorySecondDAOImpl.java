package cn.csn.shop.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Component;

import cn.csn.shop.dao.CategorySecondDAO;
import cn.csn.shop.model.CategorySecond;
import cn.csn.shop.service.CategorySecondService;
import cn.csn.shop.model.Product;
import cn.csn.shop.utils.PageHibernateCallback;

@Component("categorySecondDAO")
public class CategorySecondDAOImpl implements CategorySecondDAO {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public int findCount() {
		String hql = "select count(*) from CategorySecond";
		List<Long> list = (List<Long>) this.hibernateTemplate.find(hql);
		if(list != null && list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<CategorySecond> findAllWithPage(int begin, int pagesize) {
		String hql = "from CategorySecond order by csid desc";
		List<CategorySecond> list = this.hibernateTemplate.execute(new PageHibernateCallback(hql,null,begin,pagesize));
		if(list != null && list.size()>0){
			return list;
		}
		return null;
	}

	public void save(CategorySecond categorySecond) {
		this.hibernateTemplate.save(categorySecond);
	}

	public CategorySecond findByCsid(Integer csid) {
		return this.hibernateTemplate.get(CategorySecond.class, csid);
	}

	public void delete(CategorySecond categorySecond) {
		this.hibernateTemplate.clear();
		this.hibernateTemplate.delete(categorySecond);
	}

	public void update(CategorySecond categorySecond) {
		this.hibernateTemplate.update(categorySecond);
	}

	public List<CategorySecond> findAll() {
		return (List<CategorySecond>) this.hibernateTemplate.find("from CategorySecond");
	}

}
