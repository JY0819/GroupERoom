package com.semi.schedule.model.vo;

import java.sql.Date;

public class Schedule implements java.io.Serializable{
	
	private int calendarNo;
	private int calendarClass;
	private String calendarContents;
	private Date calendarDate;
	private String scheduleDate;
	private int empId;
	private String empName;
	private String deptId;
	private String deptName;
	private String companyName;
	private String whetherOfDelete;
	
	public Schedule() {}

	public Schedule(int calendarNo, int calendarClass, String calendarContents, Date calendarDate, String scheduleDate,
			int empId, String empName, String deptId, String deptName, String companyName, String whetherOfDelete) {
		super();
		this.calendarNo = calendarNo;
		this.calendarClass = calendarClass;
		this.calendarContents = calendarContents;
		this.calendarDate = calendarDate;
		this.scheduleDate = scheduleDate;
		this.empId = empId;
		this.empName = empName;
		this.deptId = deptId;
		this.deptName = deptName;
		this.companyName = companyName;
		this.whetherOfDelete = whetherOfDelete;
	}

	public int getCalendarNo() {
		return calendarNo;
	}



	public void setCalendarNo(int calendarNo) {
		this.calendarNo = calendarNo;
	}



	public int getCalendarClass() {
		return calendarClass;
	}



	public void setCalendarClass(int calendarClass) {
		this.calendarClass = calendarClass;
	}



	public String getCalendarContents() {
		return calendarContents;
	}



	public void setCalendarContents(String calendarContents) {
		this.calendarContents = calendarContents;
	}



	public Date getCalendarDate() {
		return calendarDate;
	}



	public void setCalendarDate(Date calendarDate) {
		this.calendarDate = calendarDate;
	}



	public String getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(String scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	public int getEmpId() {
		return empId;
	}



	public void setEmpId(int empId) {
		this.empId = empId;
	}



	public String getEmpName() {
		return empName;
	}



	public void setEmpName(String empName) {
		this.empName = empName;
	}



	public String getDeptId() {
		return deptId;
	}



	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}



	public String getDeptName() {
		return deptName;
	}



	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}



	public String getCompanyName() {
		return companyName;
	}



	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}



	public String getWhetherOfDelete() {
		return whetherOfDelete;
	}



	public void setWhetherOfDelete(String whetherOfDelete) {
		this.whetherOfDelete = whetherOfDelete;
	}

	@Override
	public String toString() {
		return "Schedule [calendarNo=" + calendarNo + ", calendarClass=" + calendarClass + ", calendarContents="
				+ calendarContents + ", calendarDate=" + calendarDate + ", scheduleDate=" + scheduleDate + ", empId="
				+ empId + ", empName=" + empName + ", deptId=" + deptId + ", deptName=" + deptName + ", companyName="
				+ companyName + ", whetherOfDelete=" + whetherOfDelete + "]";
	}




	
	
}
