package com.semi.myPage.model.Etc.vo;

import java.sql.Date;

public class LogOfVacation {
	private int no;
	private String useReason;
	private Date useStart;
	private Date useEnd;
	private Date useVacAppDay;
	private String empId;
	private String apprEmpId;
	private String type;
	private int days;
	
	public LogOfVacation() {}
	
	public LogOfVacation(int no, String useReason, Date useStart, Date useEnd, Date useVacAppDay, String empId,
			String apprEmpId, String type, int days) {
		super();
		this.no = no;
		this.useReason = useReason;
		this.useStart = useStart;
		this.useEnd = useEnd;
		this.useVacAppDay = useVacAppDay;
		this.empId = empId;
		this.apprEmpId = apprEmpId;
		this.type = type;
		this.days = days;
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

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
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

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	@Override
	public String toString() {
		return "LogOfVacation [no=" + no + ", useReason=" + useReason + ", useStart=" + useStart + ", useEnd=" + useEnd
				+ ", useVacAppDay=" + useVacAppDay + ", empId=" + empId + ", apprEmpId=" + apprEmpId + ", type=" + type
				+ ", days=" + days + "]";
	}
	
	
}
