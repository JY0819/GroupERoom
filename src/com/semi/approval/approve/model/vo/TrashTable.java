package com.semi.approval.approve.model.vo;

import java.sql.Date;

public class TrashTable implements java.io.Serializable{
	private int empid;
	private Date apprDay;
	private int docnum;
	private int apprnum;
	private String result;
	
	
	public TrashTable() {}


	public TrashTable(int empid, Date apprDay, int docnum, int apprnum, String result) {
		super();
		this.empid = empid;
		this.apprDay = apprDay;
		this.docnum = docnum;
		this.apprnum = apprnum;
		this.result = result;
	}


	public int getEmpid() {
		return empid;
	}


	public void setEmpid(int empid) {
		this.empid = empid;
	}


	public Date getApprDay() {
		return apprDay;
	}


	public void setApprDay(Date apprDay) {
		this.apprDay = apprDay;
	}


	public int getDocnum() {
		return docnum;
	}


	public void setDocnum(int docnum) {
		this.docnum = docnum;
	}


	public int getApprnum() {
		return apprnum;
	}


	public void setApprnum(int apprnum) {
		this.apprnum = apprnum;
	}


	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}


	@Override
	public String toString() {
		return "TrashTable [empid=" + empid + ", apprDay=" + apprDay + ", docnum=" + docnum + ", apprnum=" + apprnum
				+ ", result=" + result + "]";
	}


	
	
}
