package com.semi.approval.approve.model.vo;

import java.sql.Date;

public class FinishApproval implements java.io.Serializable{
	
	private int apprNo; //문서번호
	private String apprWriter; //작성자
	private int docNo; //문서번호
	private String result; //승인결과
	private String opinion; //의견
	private Date apprDay; //작성날짜
	private Date apprDate; //승인날짜
	public FinishApproval() {}
	public FinishApproval(int apprNo, String apprWriter, int docNo, String result, String opinion, Date apprDay,
			Date apprDate) {
		super();
		this.apprNo = apprNo;
		this.apprWriter = apprWriter;
		this.docNo = docNo;
		this.result = result;
		this.opinion = opinion;
		this.apprDay = apprDay;
		this.apprDate = apprDate;
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
	public String getOpinion() {
		return opinion;
	}
	public void setOpinion(String opinion) {
		this.opinion = opinion;
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
		return "FinishApproval [apprNo=" + apprNo + ", apprWriter=" + apprWriter + ", docNo=" + docNo + ", result="
				+ result + ", opinion=" + opinion + ", apprDay=" + apprDay + ", apprDate=" + apprDate + "]";
	}
	
	
}
