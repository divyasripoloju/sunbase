package com.jsp_employee;

public class Employee {
	private int id;
	private String name;
	private String email;
	private int working_days;
    private int absent_days;
    private int Total_sales;
    private String position;
    private String imageFilePath;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getWorkingDays() {
		return working_days;
	}
	public void setWorkingDays(int workingDays) {
		this.working_days = workingDays;
	}
	public int getAbsentDays() {
		return absent_days;
	}
	public void setAbsentDays(int absentDays) {
		this.absent_days = absentDays;
	}
	
	public int getTotal_sales() {
		return Total_sales;
	}
	public void setTotal_sales(int total_sales) {
		Total_sales = total_sales;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getImageFilePath() {
		return imageFilePath;
	}
	public void setImageFilePath(String imageFilePath) {
		this.imageFilePath = imageFilePath;
	}
	
}
