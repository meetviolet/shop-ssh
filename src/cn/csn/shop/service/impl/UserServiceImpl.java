package cn.csn.shop.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import cn.csn.shop.dao.UserDAO;
import cn.csn.shop.model.User;
import cn.csn.shop.service.UserService;

@Component("userService")
@Transactional
public class UserServiceImpl implements UserService {
	private UserDAO userDAO;

	public UserDAO getUserDAO() {
		return userDAO;
	}

	@Resource
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public User findByUsername(String username) {
		return userDAO.findByUsername(username);
	}

	public void add(User user) {
		userDAO.save(user);
	}

	public User find(User user) {
		return userDAO.find(user);
	}

	@Override
	public void updatePsd(User user) {
		userDAO.updatePsd(user);
	}

}
