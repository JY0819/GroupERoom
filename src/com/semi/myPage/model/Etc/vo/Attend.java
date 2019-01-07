package com.semi.myPage.model.Etc.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attend implements Serializable{
	private int rnum;
	private int empId;
	private String empName;
	private Date attendance;
	private Date getOff;
	private String attendanceT;
	private String getOffT;
	public Attend () {
		
	}
	
	public Attend(int rnum, int empId, String empName, Date attendance, Date getOff, String attendanceT,
			String getOffT) {
		super();
		this.rnum = rnum;
		this.empId = empId;
		this.empName = empName;
		this.attendance = attendance;
		this.getOff = getOff;
		this.attendanceT = attendanceT;
		this.getOffT = getOffT;
	}
	
	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public Date getAttendance() {
		return attendance;
	}

	public void setAttendance(Date attendance) {
		this.attendance = attendance;
	}

	public Date getGetOff() {
		return getOff;
	}

	public void setGetOff(Date getOff) {
		this.getOff = getOff;
	}
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}
	
	public String getAttendanceT() {
		return attendanceT;
	}

	public void setAttendanceT(String attendanceT) {
		this.attendanceT = attendanceT;
	}

	public String getGetOffT() {
		return getOffT;
	}

	public void setGetOffT(String getOffT) {
		this.getOffT = getOffT;
	}

	@Override
	public String toString() {
		return "Attend [rnum=" + rnum + ", empId=" + empId + ", empName=" + empName + ", attendance=" + attendance
				+ ", getOff=" + getOff + ", attendanceT=" + attendanceT + ", getOffT=" + getOffT + "]";
	}

	
}
