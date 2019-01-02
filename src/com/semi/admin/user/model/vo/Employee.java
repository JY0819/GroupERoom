package com.semi.admin.user.model.vo;

import java.sql.Date;

public class Employee implements java.io.Serializable {
	// emp
	private int empid;
	private String empName;
	private String empPwd;
	private String approvePwd;
	private String empGender;
	private Date empBirth;
	private String empAddr;
	private String empPhone;
	private int empVacCount;
	private String adminAuthority;
	private String whetherOfRetire;
	private int photoId;
	private Date entryDay;
	private Date leaveDay;
	
	// dept
	private String deptId;
	private String deptName;

	// position
	
	private String positionId;
	private String positionName;
	
	
	public Employee() {
	}



	public Employee(int empid, String empName, String empPwd, String approvePwd, String empGender, Date empBirth,
			String empAddr, String empPhone, int empVacCount, String adminAuthority, String whetherOfRetire,
			int photoId, Date entryDay, Date leaveDay, String deptId, String deptName, String positionId,
			String positionName) {
		super();
		this.empid = empid;
		this.empName = empName;
		this.empPwd = empPwd;
		this.approvePwd = approvePwd;
		this.empGender = empGender;
		this.empBirth = empBirth;
		this.empAddr = empAddr;
		this.empPhone = empPhone;
		this.empVacCount = empVacCount;
		this.adminAuthority = adminAuthority;
		this.whetherOfRetire = whetherOfRetire;
		this.photoId = photoId;
		this.entryDay = entryDay;
		this.leaveDay = leaveDay;
		this.deptId = deptId;
		this.deptName = deptName;
		this.positionId = positionId;
		this.positionName = positionName;
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


	public String getEmpPhone() {
		return empPhone;
	}


	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}


	public int getEmpVacCount() {
		return empVacCount;
	}


	public void setEmpVacCount(int empVacCount) {
		this.empVacCount = empVacCount;
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


	public String getPositionId() {
		return positionId;
	}


	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}


	public String getPositionName() {
		return positionName;
	}


	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}



	@Override
	public String toString() {
		return "Employee [empid=" + empid + ", empName=" + empName + ", empPwd=" + empPwd + ", approvePwd=" + approvePwd
				+ ", empGender=" + empGender + ", empBirth=" + empBirth + ", empAddr=" + empAddr + ", empPhone="
				+ empPhone + ", empVacCount=" + empVacCount + ", adminAuthority=" + adminAuthority
				+ ", whetherOfRetire=" + whetherOfRetire + ", photoId=" + photoId + ", entryDay=" + entryDay
				+ ", leaveDay=" + leaveDay + ", deptId=" + deptId + ", deptName=" + deptName + ", positionId="
				+ positionId + ", positionName=" + positionName + "]";
	}

}
