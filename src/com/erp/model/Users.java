package com.erp.model;

import org.springframework.web.multipart.MultipartFile;

public class Users{
	private int id;
	private String account;
	private String password;
	private String userName;
	private String toSchoolNumber;
	private String user_type;
	
	private String imgPath;
	private MultipartFile file;  
	
	private String submission_date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getToSchoolNumber() {
		return toSchoolNumber;
	}
	public void setToSchoolNumber(String toSchoolNumber) {
		this.toSchoolNumber = toSchoolNumber;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getSubmission_date() {
		return submission_date;
	}
	public void setSubmission_date(String submission_date) {
		this.submission_date = submission_date;
	}
	
	//后续需要修改
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
}
