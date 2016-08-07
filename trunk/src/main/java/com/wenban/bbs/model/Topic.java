package com.wenban.bbs.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Topic {

	private Long id;

	private String name;

	private String descs;

	private String userName;
	
	private String cateName;

	private String imagDir;

	private String summary;

	private Date createTime;

	private Date updateTime;

	private Long categoryId;

	private Long childCateid;

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public Long getChildCateid() {
		return childCateid;
	}

	public void setChildCateid(Long childCateid) {
		this.childCateid = childCateid;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getImagDir() {
		return imagDir;
	}

	public void setImagDir(String imagDir) {
		this.imagDir = imagDir;
	}

	public String getDescs() {
		return descs;
	}

	public void setDescs(String descs) {
		this.descs = descs;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCreateTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY.MM.dd hh:mm");
		String newtime = sdf.format(createTime);
		return newtime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(long i) {
		this.categoryId = i;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
