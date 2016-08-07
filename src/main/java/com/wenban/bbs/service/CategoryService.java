package com.wenban.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wenban.bbs.model.Category;
import com.wenban.bbs.dao.CategoryDAO;

@Service
public class CategoryService {
	@Autowired
	private CategoryDAO firstdao;
	@Autowired
	private CategoryDAO seconddao;
	@Autowired
	private CategoryDAO childcategorydao;

	public List<Category> getCategorylist() {
		List<Category> category = firstdao.selectCategoryList();
		for (int i = 0; i < category.size(); i++) {
			category.get(i).setSubCateName(seconddao.selectsubname(category.get(i).getId()));
		}
		return category;
	}

	public List<Category> getChildCategorylist(Integer parentId) {
		return childcategorydao.selectsubname(parentId);
	}

}