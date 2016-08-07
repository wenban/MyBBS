package com.wenban.bbs.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wenban.bbs.dao.UserDAO;
import com.wenban.bbs.model.User;

@Service
public class UserService {
	@Autowired
	private UserDAO adddao;
	@Autowired
	private UserDAO logindao;

	public void insertIntoUser(User user) {
		adddao.insertIntoUser(user);
	}
	public User selectlogin(User user) {
		return logindao.selectlogin(user);
	}
}
