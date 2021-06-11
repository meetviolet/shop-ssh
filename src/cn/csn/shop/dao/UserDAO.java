package cn.csn.shop.dao;

import cn.csn.shop.model.User;

public interface UserDAO {

	public User findByUsername(String username);

	public void save(User user);

	public User find(User user);
	
	public void updatePsd(User user);
}
