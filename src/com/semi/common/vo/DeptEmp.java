package com.semi.common.vo;

public class DeptEmp {
	
	private String deptId;
	private String deptName;
	private int empId;
	private String empName;
	private String positionId;
	private String positionName;
	
	public DeptEmp() {}

	public DeptEmp(String deptId, String deptName, int empId, String empName, String positionId, String positionName) {
		super();
		this.deptId = deptId;
		this.deptName = deptName;
		this.empId = empId;
		this.empName = empName;
		this.positionId = positionId;
		this.positionName = positionName;
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
		return "DeptEmp [deptId=" + deptId + ", deptName=" + deptName + ", empId=" + empId + ", empName=" + empName
				+ ", positionId=" + positionId + ", positionName=" + positionName + "]";
	}
	
	

}
