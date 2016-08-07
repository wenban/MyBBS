package com.wenban.bbs.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.wenban.bbs.model.Category;

@Repository
public interface CategoryDAO {
	public List<Category> selectCategoryList();
	public List<Category> selectsubname(Integer parentId);
}
