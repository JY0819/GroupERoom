package com.semi.approval.approve.model.vo;

public class ApprLine implements java.io.Serializable{
	private int apprEmpId;
	private int apprOrder;
	private int apprNo;
	
	public ApprLine() {}
	

	public ApprLine(int apprEmpId, int apprOrder, int apprNo) {
		super();
		this.apprEmpId = apprEmpId;
		this.apprOrder = apprOrder;
		this.apprNo = apprNo;
	}


	public int getApprEmpId() {
		return apprEmpId;
	}

	public void setApprEmpId(int apprEmpId) {
		this.apprEmpId = apprEmpId;
	}

	public int getApprOrder() {
		return apprOrder;
	}

	public void setApprOrder(int apprOrder) {
		this.apprOrder = apprOrder;
	}

	public int getApprNo() {
		return apprNo;
	}

	public void setApprNo(int apprNo) {
		this.apprNo = apprNo;
	}


	@Override
	public String toString() {
		return "ApprLine [apprEmpId=" + apprEmpId + ", apprOrder=" + apprOrder + ", apprNo=" + apprNo + "]";
	}
	
	
}
