package com.semi.approval.document.vo;

public class SumEmpInfo implements java.io.Serializable{
	//주소록 객체
	private String deptName;
	private int empNo;
	private String empName;
	
	public SumEmpInfo() {
		
	}

	public SumEmpInfo(String deptName, int empNo, String empName) {
		super();
		this.deptName = deptName;
		this.empNo = empNo;
		this.empName = empName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	@Override
	public String toString() {
		return "SumEmpInfo [deptName=" + deptName + ", empNo=" + empNo + ", empName=" + empName + "]";
	}
	
	
}
