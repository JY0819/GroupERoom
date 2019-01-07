package com.semi.common.vo;

import java.io.Serializable;

public class Alarm implements Serializable{
	private int alarmNo;
	private String alarmCheck;
	private String alarmClass;
	private int empId;
	private int calendarNo;
	private int boardNo;
	private int apprNo;
	private String alarmContents;
	
	public Alarm () {}

	public Alarm(int alarmNo, String alarmCheck, String alarmClass, int empId, int calendarNo, int boardNo, int apprNo,
			String alarmContents) {
		super();
		this.alarmNo = alarmNo;
		this.alarmCheck = alarmCheck;
		this.alarmClass = alarmClass;
		this.empId = empId;
		this.calendarNo = calendarNo;
		this.boardNo = boardNo;
		this.apprNo = apprNo;
		this.alarmContents = alarmContents;
	}

	public int getAlarmNo() {
		return alarmNo;
	}

	public void setAlarmNo(int alarmNo) {
		this.alarmNo = alarmNo;
	}

	public String getAlarmCheck() {
		return alarmCheck;
	}

	public void setAlarmCheck(String alarmCheck) {
		this.alarmCheck = alarmCheck;
	}

	public String getAlarmClass() {
		return alarmClass;
	}

	public void setAlarmClass(String alarmClass) {
		this.alarmClass = alarmClass;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public int getCalendarNo() {
		return calendarNo;
	}

	public void setCalendarNo(int calendarNo) {
		this.calendarNo = calendarNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getApprNo() {
		return apprNo;
	}

	public void setApprNo(int apprNo) {
		this.apprNo = apprNo;
	}

	public String getAlarmContents() {
		return alarmContents;
	}

	public void setAlarmContents(String alarmContents) {
		this.alarmContents = alarmContents;
	}

	@Override
	public String toString() {
		return "Alarm [alarmNo=" + alarmNo + ", alarmCheck=" + alarmCheck + ", alarmClass=" + alarmClass + ", empId="
				+ empId + ", calendarNo=" + calendarNo + ", boardNo=" + boardNo + ", apprNo=" + apprNo
				+ ", alarmContents=" + alarmContents + "]";
	}
	
	
}
