package com.semi.approval.approve.model.vo;

import java.sql.Date;

public class DetailDoc implements java.io.Serializable{
	private int manageclass; //분류(휴가계획서,업무계획서,재직증명서)
	private String attachPath; //파일경로
	private String attachName; //변경된 파일 이름
	private int managedocno; //문서번호
	private int manageempid; //사원번호
	private Date vacStart;//휴가시작일
	private Date varEnd;//휴가종료일
	private String vacReason;//사유
	private String title;//제목
	private Date manageDay;//작성일
	private Date entryDay; //입사일
	private String contents;//내용
	private int attachno;//파일번호
	
	public DetailDoc() {}

	public DetailDoc(int manageclass, String attachPath, String attachName, int managedocno, int manageempid,
			Date vacStart, Date varEnd, String vacReason, String title, Date manageDay, Date entryDay, String contents,
			int attachno) {
		super();
		this.manageclass = manageclass;
		this.attachPath = attachPath;
		this.attachName = attachName;
		this.managedocno = managedocno;
		this.manageempid = manageempid;
		this.vacStart = vacStart;
		this.varEnd = varEnd;
		this.vacReason = vacReason;
		this.title = title;
		this.manageDay = manageDay;
		this.entryDay = entryDay;
		this.contents = contents;
		this.attachno = attachno;
	}

	public int getManageclass() {
		return manageclass;
	}

	public void setManageclass(int manageclass) {
		this.manageclass = manageclass;
	}

	public String getAttachPath() {
		return attachPath;
	}

	public void setAttachPath(String attachPath) {
		this.attachPath = attachPath;
	}

	public String getAttachName() {
		return attachName;
	}

	public void setAttachName(String attachName) {
		this.attachName = attachName;
	}

	public int getManagedocno() {
		return managedocno;
	}

	public void setManagedocno(int managedocno) {
		this.managedocno = managedocno;
	}

	public int getManageempid() {
		return manageempid;
	}

	public void setManageempid(int manageempid) {
		this.manageempid = manageempid;
	}

	public Date getVacStart() {
		return vacStart;
	}

	public void setVacStart(Date vacStart) {
		this.vacStart = vacStart;
	}

	public Date getVarEnd() {
		return varEnd;
	}

	public void setVarEnd(Date varEnd) {
		this.varEnd = varEnd;
	}

	public String getVacReason() {
		return vacReason;
	}

	public void setVacReason(String vacReason) {
		this.vacReason = vacReason;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getManageDay() {
		return manageDay;
	}

	public void setManageDay(Date manageDay) {
		this.manageDay = manageDay;
	}

	public Date getEntryDay() {
		return entryDay;
	}

	public void setEntryDay(Date entryDay) {
		this.entryDay = entryDay;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getAttachno() {
		return attachno;
	}

	public void setAttachno(int attachno) {
		this.attachno = attachno;
	}

	@Override
	public String toString() {
		return "DetailDoc [manageclass=" + manageclass + ", attachPath=" + attachPath + ", attachName=" + attachName
				+ ", managedocno=" + managedocno + ", manageempid=" + manageempid + ", vacStart=" + vacStart
				+ ", varEnd=" + varEnd + ", vacReason=" + vacReason + ", title=" + title + ", manageDay=" + manageDay
				+ ", entryDay=" + entryDay + ", contents=" + contents + ", attachno=" + attachno + "]";
	}
	
	
	
}
