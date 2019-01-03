package com.semi.admin.user.model.vo;

import java.sql.Date;

public class LogPosition {
	private String positionId;
	private int empId;
	private Date changeDay;
	
	public LogPosition() {}

	public LogPosition(String positionId, int empId, Date changeDay) {
		super();
		this.positionId = positionId;
		this.empId = empId;
		this.changeDay = changeDay;
	}

	public String getPositionId() {
		return positionId;
	}

	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public Date getChangeDay() {
		return changeDay;
	}

	public void setChangeDay(Date changeDay) {
		this.changeDay = changeDay;
	}

	@Override
	public String toString() {
		return "LogPosition [positionId=" + positionId + ", empId=" + empId + ", changeDay=" + changeDay + "]";
	}
	
	
}
