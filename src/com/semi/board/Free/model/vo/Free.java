package com.semi.board.Free.model.vo;

import java.sql.Date;

public class Free implements java.io.Serializable{

	private int bno;
	private String bClass;
	private String bTitle;
	private String bContent;
	private Date bDate;
	private int bClicks;
	private String bAttach;
	private int comNo;
	private int comLevel;
	private String recomId;
	private String deptId;
	private int replebno;
	private String writerId;
	private String status;
	private int file01;
	private int file02;
	private int file03;
	
	public Free () {}

	public Free(int bno, String bClass, String bTitle, String bContent, Date bDate, int bclicks, String bAttach,
			int comNo, int comLevel, String recomId, String deptId, int replebno, String writerId, String status,
			int file01, int file02, int file03) {
		super();
		this.bno = bno;
		this.bClass = bClass;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bClicks = bClicks;
		this.bAttach = bAttach;
		this.comNo = comNo;
		this.comLevel = comLevel;
		this.recomId = recomId;
		this.deptId = deptId;
		this.replebno = replebno;
		this.writerId = writerId;
		this.status = status;
		this.file01 = file01;
		this.file02 = file02;
		this.file03 = file03;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getbClass() {
		return bClass;
	}

	public void setbClass(String bClass) {
		this.bClass = bClass;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public int getbClicks() {
		return bClicks;
	}

	public void setbClicks(int bclicks) {
		this.bClicks = bclicks;
	}

	public String getbAttach() {
		return bAttach;
	}

	public void setbAttach(String bAttach) {
		this.bAttach = bAttach;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public int getComLevel() {
		return comLevel;
	}

	public void setComLevel(int comLevel) {
		this.comLevel = comLevel;
	}

	public String getRecomId() {
		return recomId;
	}

	public void setRecomId(String recomId) {
		this.recomId = recomId;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public int getReplebno() {
		return replebno;
	}

	public void setReplebno(int replebno) {
		this.replebno = replebno;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getFile01() {
		return file01;
	}

	public void setFile01(int file01) {
		this.file01 = file01;
	}

	public int getFile02() {
		return file02;
	}

	public void setFile02(int file02) {
		this.file02 = file02;
	}

	public int getFile03() {
		return file03;
	}

	public void setFile03(int file03) {
		this.file03 = file03;
	}

	@Override
	public String toString() {
		return "Free [bno=" + bno + ", bClass=" + bClass + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bDate="
				+ bDate + ", bClicks=" + bClicks + ", bAttach=" + bAttach + ", comNo=" + comNo + ", comLevel="
				+ comLevel + ", recomId=" + recomId + ", deptId=" + deptId + ", replebno=" + replebno + ", writerId="
				+ writerId + ", status=" + status + ", file01=" + file01 + ", file02=" + file02 + ", file03=" + file03
				+ "]";
	}
	
	
}
