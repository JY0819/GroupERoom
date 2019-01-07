package com.semi.approval.approve.model.vo;

import java.sql.Date;

public class FinishApproval implements java.io.Serializable{
	private int empid; //사원번호
	private int apprNo; //문서번호
	private String apprWriter; //작성자
	private int docNo; //문서번호
	private String result; //승인결과
	private Date apprDay; //작성날짜
	private Date apprDate; //승인날짜
	public FinishApproval() {}
	
	public FinishApproval(int empid, int apprNo, String apprWriter, int docNo, String result, Date apprDay,
			Date apprDate) {
		super();
		this.empid = empid;
		this.apprNo = apprNo;
		this.apprWriter = apprWriter;
		this.docNo = docNo;
		this.result = result;
		this.apprDay = apprDay;
		this.apprDate = apprDate;
	}
	
	public int getEmpid() {
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
	}
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
	public int getDocNo() {
		return docNo;
	}
	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	public Date getApprDay() {
		return apprDay;
	}
	public void setApprDay(Date apprDay) {
		this.apprDay = apprDay;
	}
	public Date getApprDate() {
		return apprDate;
	}
	public void setApprDate(Date apprDate) {
		this.apprDate = apprDate;
	}
	@Override
	public String toString() {
		return "FinishApproval [empid=" + empid + ", apprNo=" + apprNo + ", apprWriter=" + apprWriter + ", docNo="
				+ docNo + ", result=" + result + ",  apprDay=" + apprDay + ", apprDate="
				+ apprDate + "]";
	}
	
	
	
}
