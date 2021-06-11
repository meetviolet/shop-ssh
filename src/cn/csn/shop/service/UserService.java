package cn.csn.shop.service;

import cn.csn.shop.model.User;

public interface UserService {

	public User findByUsername(String username);

	public void add(User user);

	public User find(User user);
	
	public void updatePsd(User user);
}
