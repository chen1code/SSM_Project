package com.erp.model;

public class Curriculum {
	
	private int id;
	private String school;				//学院
	private String specialty;			//专业
	private String curriculumNumber;	//课程号
	private String curriculumType;		//课程类型
	private String curriculumName;		//课程名称
	private String credit;				//学分
	private String period;				//学时
	private String startSemester;		//开课学期
	private String location;			//开课地点
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getSpecialty() {
		return specialty;
	}
	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}
	public String getCurriculumNumber() {
		return curriculumNumber;
	}
	public void setCurriculumNumber(String curriculumNumber) {
		this.curriculumNumber = curriculumNumber;
	}
	public String getCurriculumType() {
		return curriculumType;
	}
	public void setCurriculumType(String curriculumType) {
		this.curriculumType = curriculumType;
	}
	public String getCurriculumName() {
		return curriculumName;
	}
	public void setCurriculumName(String curriculumName) {
		this.curriculumName = curriculumName;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getStartSemester() {
		return startSemester;
	}
	public void setStartSemester(String startSemester) {
		this.startSemester = startSemester;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
}
