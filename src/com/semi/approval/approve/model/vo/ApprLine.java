package com.semi.approval.approve.model.vo;

public class ApprLine implements java.io.Serializable{
	private int apprEmpId;
	private String apprName;
	private int apprOrder;
	private int apprNo;
	private int docNo;
	private boolean check;
	private String approval;
	
	public ApprLine() {}

	public ApprLine(int apprEmpId, String apprName, int apprOrder, int apprNo, int docNo, boolean check,
			String approval) {
		super();
		this.apprEmpId = apprEmpId;
		this.apprName = apprName;
		this.apprOrder = apprOrder;
		this.apprNo = apprNo;
		this.docNo = docNo;
		this.check = check;
		this.approval = approval;
	}

	public int getApprEmpId() {
		return apprEmpId;
	}

	public void setApprEmpId(int apprEmpId) {
		this.apprEmpId = apprEmpId;
	}

	public String getApprName() {
		return apprName;
	}

	public void setApprName(String apprName) {
		this.apprName = apprName;
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

	public int getDocNo() {
		return docNo;
	}

	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}

	public boolean isCheck() {
		return check;
	}

	public void setCheck(boolean check) {
		this.check = check;
	}

	public String getApproval() {
		return approval;
	}

	public void setApproval(String approval) {
		this.approval = approval;
	}

	@Override
	public String toString() {
		return "ApprLine [apprEmpId=" + apprEmpId + ", apprName=" + apprName + ", apprOrder=" + apprOrder + ", apprNo="
				+ apprNo + ", docNo=" + docNo + ", check=" + check + ", approval=" + approval + "]";
	}
	
}
