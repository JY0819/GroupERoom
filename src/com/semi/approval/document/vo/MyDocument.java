package com.semi.approval.document.vo;

import java.sql.Date;

public class MyDocument implements java.io.Serializable{
	private int num;
	private int writerNum;
	private String writer;
	private String deptName;
	private int docNum;
	private String title;
	private Date writeDay;
	
	public MyDocument() {
		
	}

	public MyDocument(int num, int writerNum, String writer, String deptName, int docNum, String title, Date writeDay) {
		super();
		this.num = num;
		this.writerNum = writerNum;
		this.writer = writer;
		this.deptName = deptName;
		this.docNum = docNum;
		this.title = title;
		this.writeDay = writeDay;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getWriterNum() {
		return writerNum;
	}

	public void setWriterNum(int writerNum) {
		this.writerNum = writerNum;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getWriteDay() {
		return writeDay;
	}

	public void setWriteDay(Date writeDay) {
		this.writeDay = writeDay;
	}

	@Override
	public String toString() {
		return "MyDocument [num=" + num + ", writerNum=" + writerNum + ", writer=" + writer + ", deptName=" + deptName
				+ ", docNum=" + docNum + ", title=" + title + ", writeDay=" + writeDay + "]";
	}
	
}
