package com.semi.admin.base.model.vo;

public class Department {
	private String deptId;
	private String deptName;
	private String deptAct;
	private String deptNote;
	
	public Department(){}

	public Department(String deptId, String deptName, String deptAct, String deptNote) {
		super();
		this.deptId = deptId;
		this.deptName = deptName;
		this.deptAct = deptAct;
		this.deptNote = deptNote;
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

	public String getDeptAct() {
		return deptAct;
	}

	public void setDeptAct(String deptAct) {
		this.deptAct = deptAct;
	}

	public String getDeptNote() {
		return deptNote;
	}

	public void setDeptNote(String deptNote) {
		this.deptNote = deptNote;
	}

	@Override
	public String toString() {
		return "Department [deptId=" + deptId + ", deptName=" + deptName + ", deptAct=" + deptAct + ", deptNote="
				+ deptNote + "]";
	}


	
}
