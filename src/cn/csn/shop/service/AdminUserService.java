package cn.csn.shop.service;

import cn.csn.shop.model.AdminUser;

public interface AdminUserService {

	AdminUser find(AdminUser adminUser);
	
	void updatePsd(AdminUser adminUser);
}
