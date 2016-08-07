package com.wenban.bbs.model;

public class User {
private Integer id;
private String name;
private String loginId;
private String loginPasswd;
private String confirmloginPasswd;

public String getConfirmloginPasswd() {
	return confirmloginPasswd;
}
public void setConfirmloginPasswd(String confirmloginPasswd) {
	this.confirmloginPasswd = confirmloginPasswd;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getLoginId() {
	return loginId;
}
public void setLoginId(String loginId) {
	this.loginId = loginId;
}
public String getLoginPasswd() {
	return loginPasswd;
}
public void setLoginPasswd(String loginPasswd) {
	this.loginPasswd = loginPasswd;
}
}
