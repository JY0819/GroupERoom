package com.semi.approval.document.vo;

import java.sql.Date;

public class Document implements java.io.Serializable{
	//문서 객체
	private int manageEmpId;
	private int manageDocNo;
	private int attachNo;
	private String manageTitle;
	private String manageContents;
	private Date manageDay;
	private String manageClass;
	private Date vacApprStart;
	private String vacApprReason;
	private int manageNo;
	private Date vacApprEnd;
	
	public Document() {
		
	}

	public Document(int manageEmpId, int manageDocNo, int attachNo, String manageTitle, String manageContents,
			Date manageDay, String manageClass, Date vacApprStart, String vacApprReason, int manageNo,
			Date vacApprEnd) {
		super();
		this.manageEmpId = manageEmpId;
		this.manageDocNo = manageDocNo;
		this.attachNo = attachNo;
		this.manageTitle = manageTitle;
		this.manageContents = manageContents;
		this.manageDay = manageDay;
		this.manageClass = manageClass;
		this.vacApprStart = vacApprStart;
		this.vacApprReason = vacApprReason;
		this.manageNo = manageNo;
		this.vacApprEnd = vacApprEnd;
	}

	public int getManageEmpId() {
		return manageEmpId;
	}

	public void setManageEmpId(int manageEmpId) {
		this.manageEmpId = manageEmpId;
	}

	public int getManageDocNo() {
		return manageDocNo;
	}

	public void setManageDocNo(int manageDocNo) {
		this.manageDocNo = manageDocNo;
	}

	public int getAttachNo() {
		return attachNo;
	}

	public void setAttachNo(int attachNo) {
		this.attachNo = attachNo;
	}

	public String getManageTitle() {
		return manageTitle;
	}

	public void setManageTitle(String manageTitle) {
		this.manageTitle = manageTitle;
	}

	public String getManageContents() {
		return manageContents;
	}

	public void setManageContents(String manageContents) {
		this.manageContents = manageContents;
	}

	public Date getManageDay() {
		return manageDay;
	}

	public void setManageDay(Date manageDay) {
		this.manageDay = manageDay;
	}

	public String getManageClass() {
		return manageClass;
	}

	public void setManageClass(String manageClass) {
		this.manageClass = manageClass;
	}

	public Date getVacApprStart() {
		return vacApprStart;
	}

	public void setVacApprStart(Date vacApprStart) {
		this.vacApprStart = vacApprStart;
	}

	public String getVacApprReason() {
		return vacApprReason;
	}

	public void setVacApprReason(String vacApprReason) {
		this.vacApprReason = vacApprReason;
	}

	public int getManageNo() {
		return manageNo;
	}

	public void setManageNo(int manageNo) {
		this.manageNo = manageNo;
	}

	public Date getVacApprEnd() {
		return vacApprEnd;
	}

	public void setVacApprEnd(Date vacApprEnd) {
		this.vacApprEnd = vacApprEnd;
	}

	@Override
	public String toString() {
		return "Document [manageEmpId=" + manageEmpId + ", manageDocNo=" + manageDocNo + ", attachNo=" + attachNo
				+ ", manageTitle=" + manageTitle + ", manageContents=" + manageContents + ", manageDay=" + manageDay
				+ ", manageClass=" + manageClass + ", vacApprStart=" + vacApprStart + ", vacApprReason=" + vacApprReason
				+ ", manageNo=" + manageNo + ", vacApprEnd=" + vacApprEnd + "]";
	}

}
