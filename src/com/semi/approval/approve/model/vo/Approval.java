package com.semi.approval.approve.model.vo;

import java.sql.Date;

public class Approval implements java.io.Serializable{
	
	/**
	 * 
	 */
	
	private int apprNo; //결재번호
	private String apprWriter; //작성자
	private String deptId; //부서ID
	private Date apprDay; //작성날짜
	private String apprYn; //결재여부
	private String apprKeep; //보관여부
	private String apprCan; //휴지통
	private String whetherOfDelete; //삭제여부
	
	public Approval() {}
	public int getApprNo() {
		return apprNo;
	}
	public void setApprNo(int apprNo) {
		this.apprNo = apprNo;
	}
	public String getApprWriter() {
		return apprWriter;
	}
	public void setApprWriter(String apprWriter) {
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
	public String getApprYn() {
		return apprYn;
	}
	public void setApprYn(String apprYn) {
		this.apprYn = apprYn;
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
	public Approval(int apprNo, String apprWriter, String deptId, Date apprDay, String apprYn, String apprKeep,
			String apprCan, String whetherOfDelete) {
		super();
		this.apprNo = apprNo;
		this.apprWriter = apprWriter;
		this.deptId = deptId;
		this.apprDay = apprDay;
		this.apprYn = apprYn;
		this.apprKeep = apprKeep;
		this.apprCan = apprCan;
		this.whetherOfDelete = whetherOfDelete;
	}
	@Override
	public String toString() {
		return "Approval [apprNo=" + apprNo + ", apprWriter=" + apprWriter + ", deptId=" + deptId + ", apprDay="
				+ apprDay + ", apprYn=" + apprYn + ", apprKeep=" + apprKeep + ", apprCan=" + apprCan
				+ ", whetherOfDelete=" + whetherOfDelete + "]";
	}
	
	
	
		
	
}
