package com.semi.approval.approve.model.vo;

public class TrashTable implements java.io.Serializable{
	private String writer;
	private String manager;
	private int docnum;
	private int apprnum;
	private String result;
	
	
	public TrashTable() {}


	public TrashTable(String writer, String manager, int docnum, int apprnum, String result) {
		super();
		this.writer = writer;
		this.manager = manager;
		this.docnum = docnum;
		this.apprnum = apprnum;
		this.result = result;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getManager() {
		return manager;
	}


	public void setManager(String manager) {
		this.manager = manager;
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
		return "TrashTable [writer=" + writer + ", manager=" + manager + ", docnum=" + docnum + ", apprnum=" + apprnum
				+ ", result=" + result + "]";
	}
	
	
	
}
