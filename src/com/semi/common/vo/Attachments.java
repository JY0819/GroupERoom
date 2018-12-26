package com.semi.common.vo;

import java.sql.Date;

public class Attachments implements java.io.Serializable {
	
	private int attachNo;
	private String attachPreName;
	private String attachName;
	private String attachPath;
	private Date attachDay;
	private String whetherOfDelete;
	
	public Attachments() {}

	public Attachments(int attachNo, String attachPreName, String attachName, String attachPath, Date attachDay,
			String whetherOfDelete) {
		super();
		this.attachNo = attachNo;
		this.attachPreName = attachPreName;
		this.attachName = attachName;
		this.attachPath = attachPath;
		this.attachDay = attachDay;
		this.whetherOfDelete = whetherOfDelete;
	}

	public int getAttachNo() {
		return attachNo;
	}

	public void setAttachNo(int attachNo) {
		this.attachNo = attachNo;
	}

	public String getAttachPreName() {
		return attachPreName;
	}

	public void setAttachPreName(String attachPreName) {
		this.attachPreName = attachPreName;
	}

	public String getAttachName() {
		return attachName;
	}

	public void setAttachName(String attachName) {
		this.attachName = attachName;
	}

	public String getAttachPath() {
		return attachPath;
	}

	public void setAttachPath(String attachPath) {
		this.attachPath = attachPath;
	}

	public Date getAttachDay() {
		return attachDay;
	}

	public void setAttachDay(Date attachDay) {
		this.attachDay = attachDay;
	}

	public String getWhetherOfDelete() {
		return whetherOfDelete;
	}

	public void setWhetherOfDelete(String whetherOfDelete) {
		this.whetherOfDelete = whetherOfDelete;
	}

	@Override
	public String toString() {
		return "Attachments [attachNo=" + attachNo + ", attachPreName=" + attachPreName + ", attachName=" + attachName
				+ ", attachPath=" + attachPath + ", attachDay=" + attachDay + ", whetherOfDelete=" + whetherOfDelete
				+ "]";
	}
	
	

}
