package com.semi.memo.model.vo;

public class Memo {

	private int memoNo;
	private String memoContents;
	private int empId;
	private String imgPath;
	public Memo() {}

	public Memo(int memoNo, String memoContents, int empId, String imgPath) {
		super();
		this.memoNo = memoNo;
		this.memoContents = memoContents;
		this.empId = empId;
		this.imgPath=imgPath;
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

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	@Override
	public String toString() {
		return "Memo [memoNo=" + memoNo + ", memoContents=" + memoContents + ", empId=" + empId + ", imgPath=" + imgPath
				+ "]";
	}

	
	
	
}
