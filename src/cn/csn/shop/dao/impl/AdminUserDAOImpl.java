package cn.csn.shop.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Component;

import cn.csn.shop.dao.AdminUserDAO;
import cn.csn.shop.model.AdminUser;

@Component("AdminUserDAO")
public class AdminUserDAOImpl implements AdminUserDAO {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public AdminUser find(AdminUser adminUser) {
		
	
		String hql = "from AdminUser where username=? and password=?";
		List<AdminUser> list = (List<AdminUser>) this.hibernateTemplate.find(hql, adminUser.getUsername(),
				adminUser.getPassword());
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void modifyPsd(AdminUser adminUser) {
		this.hibernateTemplate.saveOrUpdate(adminUser);
	}

}
