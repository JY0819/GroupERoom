package com.semi.admin.user.model.vo;

import java.sql.Date;

public class LogDepartment {
	private int empId;
	private String deptId;
	private Date ChangeDay;
	
	public LogDepartment() {
		
	}

	public LogDepartment(int empId, String deptId, Date changeDay) {
		super();
		this.empId = empId;
		this.deptId = deptId;
		ChangeDay = changeDay;
	}

	public int getempId() {
		return empId;
	}

	public void setempId(int empId) {
		this.empId = empId;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public Date getChangeDay() {
		return ChangeDay;
	}

	public void setChangeDay(Date changeDay) {
		ChangeDay = changeDay;
	}

	@Override
	public String toString() {
		return "LogDepartment [empId=" + empId + ", deptId=" + deptId + ", ChangeDay=" + ChangeDay + "]";
	}
	
	
}
