package com.wenban.bbs.model;

import java.util.List;

public class Category {
	private Integer id;
	private String cateName;
	private List<Category> subCateName;


	public List<Category> getSubCateName() {
		return subCateName;
	}

	public void setSubCateName(List<Category> subCateName) {
		this.subCateName = subCateName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
}
