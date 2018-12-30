package com.semi.approval.document.vo;

import java.sql.Date;

public class MyDocument implements java.io.Serializable{
	private int num;
	private String writer;
	private String deptName;
	private int docNum;
	private String opinion;
	private Date writeDay;
	private String result;
	
	public MyDocument() {
		
	}

	public MyDocument(int num, String writer, String deptName, int docNum, String opinion, Date writeDay,
			String result) {
		super();
		this.num = num;
		this.writer = writer;
		this.deptName = deptName;
		this.docNum = docNum;
		this.opinion = opinion;
		this.writeDay = writeDay;
		this.result = result;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getDocNum() {
		return docNum;
	}

	public void setDocNum(int docNum) {
		this.docNum = docNum;
	}

	public String getOpinion() {
		return opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	public Date getWriteDay() {
		return writeDay;
	}

	public void setWriteDay(Date writeDay) {
		this.writeDay = writeDay;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "MyDocument [num=" + num + ", writer=" + writer + ", deptName=" + deptName + ", docNum=" + docNum
				+ ", opinion=" + opinion + ", writeDay=" + writeDay + ", result=" + result + "]";
	}
	
	
}
