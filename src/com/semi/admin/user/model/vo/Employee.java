package com.semi.admin.user.model.vo;

import java.sql.Date;

public class Employee implements java.io.Serializable {

	private int empid;
	private String empName;
	private String empPwd;
	private String approvePwd;
	private String empGender;
	private Date empBirth;
	private String empAddr;
	private String adminAuthority;
	private String whetherOfRetire;
	private int photoId;
	private Date entryDay;
	private Date leaveDay;

	public Employee() {
	}

	public Employee(int empid, String empName, String empPwd, String approvePwd, String empGender, Date empBirth,
			String empAddr, String adminAuthority, String whetherOfRetire, int photoId, Date entryDay, Date leaveDay) {
		super();
		this.empid = empid;
		this.empName = empName;
		this.empPwd = empPwd;
		this.approvePwd = approvePwd;
		this.empGender = empGender;
		this.empBirth = empBirth;
		this.empAddr = empAddr;
		this.adminAuthority = adminAuthority;
		this.whetherOfRetire = whetherOfRetire;
		this.photoId = photoId;
		this.entryDay = entryDay;
		this.leaveDay = leaveDay;
	}

	public int getEmpid() {
		return empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpPwd() {
		return empPwd;
	}

	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}

	public String getApprovePwd() {
		return approvePwd;
	}

	public void setApprovePwd(String approvePwd) {
		this.approvePwd = approvePwd;
	}

	public String getEmpGender() {
		return empGender;
	}

	public void setEmpGender(String empGender) {
		this.empGender = empGender;
	}

	public Date getEmpBirth() {
		return empBirth;
	}

	public void setEmpBirth(Date empBirth) {
		this.empBirth = empBirth;
	}

	public String getEmpAddr() {
		return empAddr;
	}

	public void setEmpAddr(String empAddr) {
		this.empAddr = empAddr;
	}

	public String getAdminAuthority() {
		return adminAuthority;
	}

	public void setAdminAuthority(String adminAuthority) {
		this.adminAuthority = adminAuthority;
	}

	public String getWhetherOfRetire() {
		return whetherOfRetire;
	}

	public void setWhetherOfRetire(String whetherOfRetire) {
		this.whetherOfRetire = whetherOfRetire;
	}

	public int getPhotoId() {
		return photoId;
	}

	public void setPhotoId(int photoId) {
		this.photoId = photoId;
	}

	public Date getEntryDay() {
		return entryDay;
	}

	public void setEntryDay(Date entryDay) {
		this.entryDay = entryDay;
	}

	public Date getLeaveDay() {
		return leaveDay;
	}

	public void setLeaveDay(Date leaveDay) {
		this.leaveDay = leaveDay;
	}

	@Override
	public String toString() {
		return "Employee [empid=" + empid + ", empName=" + empName + ", empPwd=" + empPwd + ", approvePwd=" + approvePwd
				+ ", empGender=" + empGender + ", empBirth=" + empBirth + ", empAddr=" + empAddr + ", adminAuthority="
				+ adminAuthority + ", whetherOfRetire=" + whetherOfRetire + ", photoId=" + photoId + ", entryDay="
				+ entryDay + ", leaveDay=" + leaveDay + "]";
	}

}