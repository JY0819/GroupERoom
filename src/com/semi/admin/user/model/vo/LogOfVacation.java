package com.semi.admin.user.model.vo;

import java.sql.Date;

public class LogOfVacation {
	private int rnum;
	private int no;
	private String useReason;
	private Date useStart;
	private Date useEnd;
	private Date useVacAppDay;
	private int empId;
	private String apprEmpId;
	private String type;
	private int days;

	private String empName;
	private String deptName;
	private int remainDay;
	private int empVacCount;

	public LogOfVacation() {
	}

	public LogOfVacation(int rnum, int no, String useReason, Date useStart, Date useEnd, Date useVacAppDay, int empId,
			String apprEmpId, String type, int days, String empName, String deptName, int remainDay, int empVacCount) {
		super();
		this.rnum = rnum;
		this.no = no;
		this.useReason = useReason;
		this.useStart = useStart;
		this.useEnd = useEnd;
		this.useVacAppDay = useVacAppDay;
		this.empId = empId;
		this.apprEmpId = apprEmpId;
		this.type = type;
		this.days = days;
		this.empName = empName;
		this.deptName = deptName;
		this.remainDay = remainDay;
		this.empVacCount = empVacCount;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUseReason() {
		return useReason;
	}

	public void setUseReason(String useReason) {
		this.useReason = useReason;
	}

	public Date getUseStart() {
		return useStart;
	}

	public void setUseStart(Date useStart) {
		this.useStart = useStart;
	}

	public Date getUseEnd() {
		return useEnd;
	}

	public void setUseEnd(Date useEnd) {
		this.useEnd = useEnd;
	}

	public Date getUseVacAppDay() {
		return useVacAppDay;
	}

	public void setUseVacAppDay(Date useVacAppDay) {
		this.useVacAppDay = useVacAppDay;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getApprEmpId() {
		return apprEmpId;
	}

	public void setApprEmpId(String apprEmpId) {
		this.apprEmpId = apprEmpId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getRemainDay() {
		return remainDay;
	}

	public void setRemainDay(int remainDay) {
		this.remainDay = remainDay;
	}

	public int getEmpVacCount() {
		return empVacCount;
	}

	public void setEmpVacCount(int empVacCount) {
		this.empVacCount = empVacCount;
	}

	@Override
	public String toString() {
		return "LogOfVacation [rnum=" + rnum + ", no=" + no + ", useReason=" + useReason + ", useStart=" + useStart
				+ ", useEnd=" + useEnd + ", useVacAppDay=" + useVacAppDay + ", empId=" + empId + ", apprEmpId="
				+ apprEmpId + ", type=" + type + ", days=" + days + ", empName=" + empName + ", deptName=" + deptName
				+ ", remainDay=" + remainDay + ", empVacCount=" + empVacCount + "]";
	}

	
}
