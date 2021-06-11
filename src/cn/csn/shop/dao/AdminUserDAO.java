package cn.csn.shop.dao;

import cn.csn.shop.model.AdminUser;

public interface AdminUserDAO {

	AdminUser find(AdminUser adminUser);
	
	void modifyPsd(AdminUser adminUser);

}
