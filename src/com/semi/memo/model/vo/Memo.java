package com.semi.memo.model.vo;

public class Memo {

	private int memoNo;
	private String memoContents;
	private int empId;
	
	public Memo() {}

	public Memo(int memoNo, String memoContents, int empId) {
		super();
		this.memoNo = memoNo;
		this.memoContents = memoContents;
		this.empId = empId;
	}

	public int getMemoNo() {
		return memoNo;
	}

	public void setMemoNo(int memoNo) {
		this.memoNo = memoNo;
	}

	public String getMemoContents() {
		return memoContents;
	}

	public void setMemoContents(String memoContents) {
		this.memoContents = memoContents;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	@Override
	public String toString() {
		return "Memo [memoNo=" + memoNo + ", memoContents=" + memoContents + ", empId=" + empId + "]";
	}
	
	
}
