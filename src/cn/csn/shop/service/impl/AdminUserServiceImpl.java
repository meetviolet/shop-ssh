package cn.csn.shop.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import cn.csn.shop.dao.AdminUserDAO;
import cn.csn.shop.model.AdminUser;
import cn.csn.shop.service.AdminUserService;

@Component("adminUserService")
@Transactional
public class AdminUserServiceImpl implements AdminUserService {
	private AdminUserDAO adminUserDAO;

	public AdminUserDAO getAdminUserDAO() {
		return adminUserDAO;
	}
	
	@Resource
	public void setAdminUserDAO(AdminUserDAO adminUserDAO) {
		this.adminUserDAO = adminUserDAO;
	}

	public AdminUser find(AdminUser adminUser) {
		return adminUserDAO.find(adminUser);
	}

	@Override
	public void updatePsd(AdminUser adminUser) {
		adminUserDAO.modifyPsd(adminUser);
	}

}
