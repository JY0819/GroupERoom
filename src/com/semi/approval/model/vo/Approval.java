package com.semi.approval.model.vo;

import java.sql.Date;

public class Approval implements java.io.Serializable{
	
	private int apprNo;
	private int apprWriter;
	private String deptId;
	private Date apprDay;
	private String apprYN;
	private String apprKeep;
	private String apprCan;
	private String whetherOfDelete;
	
	

	public Approval() {
		
	}
	
	public Approval(int apprNo, int apprWriter, String deptId, Date apprDay, String apprYN, String apprKeep,
			String apprCan, String whetherOfDelete) {
		super();
		this.apprNo = apprNo;
		this.apprWriter = apprWriter;
		this.deptId = deptId;
		this.apprDay = apprDay;
		this.apprYN = apprYN;
		this.apprKeep = apprKeep;
		this.apprCan = apprCan;
		this.whetherOfDelete = whetherOfDelete;
	}
	
	public int getApprNo() {
		return apprNo;
	}

	public void setApprNo(int apprNo) {
		this.apprNo = apprNo;
	}

	public int getApprWriter() {
		return apprWriter;
	}

	public void setApprWriter(int apprWriter) {
		this.apprWriter = apprWriter;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public Date getApprDay() {
		return apprDay;
	}

	public void setApprDay(Date apprDay) {
		this.apprDay = apprDay;
	}

	public String getApprYN() {
		return apprYN;
	}

	public void setApprYN(String apprYN) {
		this.apprYN = apprYN;
	}

	public String getApprKeep() {
		return apprKeep;
	}

	public void setApprKeep(String apprKeep) {
		this.apprKeep = apprKeep;
	}

	public String getApprCan() {
		return apprCan;
	}

	public void setApprCan(String apprCan) {
		this.apprCan = apprCan;
	}

	public String getWhetherOfDelete() {
		return whetherOfDelete;
	}

	public void setWhetherOfDelete(String whetherOfDelete) {
		this.whetherOfDelete = whetherOfDelete;
	}
	
	@Override
	public String toString() {
		return "Approval [apprNo=" + apprNo + ", apprWriter=" + apprWriter + ", deptId=" + deptId + ", apprDay="
				+ apprDay + ", apprYN=" + apprYN + ", apprKeep=" + apprKeep + ", apprCan=" + apprCan
				+ ", whetherOfDelete=" + whetherOfDelete + "]";
	}
	
	
}
	

