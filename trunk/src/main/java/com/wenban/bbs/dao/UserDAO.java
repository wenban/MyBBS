package com.wenban.bbs.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.wenban.bbs.model.User;

@Repository
public interface UserDAO {
	public Integer insertIntoUser(User user);

	public User selectlogin(User user);
}
