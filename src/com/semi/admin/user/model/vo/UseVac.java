package com.semi.admin.user.model.vo;

import java.sql.Date;

public class UseVac {
	private String useReason;
	private Date useStart;
	private Date useEnd;
	private Date useVacAppDay;
	private int empId;
	private int apprEmpId;

	private String empName;
	private String totalDay;
	private String deptName;
	
	public UseVac() {}

	public UseVac(String useReason, Date useStart, Date useEnd, Date useVacAppDay, int empId, int apprEmpId,
			String empName, String totalDay, String deptName) {
		super();
		this.useReason = useReason;
		this.useStart = useStart;
		this.useEnd = useEnd;
		this.useVacAppDay = useVacAppDay;
		this.empId = empId;
		this.apprEmpId = apprEmpId;
		this.empName = empName;
		this.totalDay = totalDay;
		this.deptName = deptName;
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

	public int getApprEmpId() {
		return apprEmpId;
	}

	public void setApprEmpId(int apprEmpId) {
		this.apprEmpId = apprEmpId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getTotalDay() {
		return totalDay;
	}

	public void setTotalDay(String totalDay) {
		this.totalDay = totalDay;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Override
	public String toString() {
		return "UseVac [useReason=" + useReason + ", useStart=" + useStart + ", useEnd=" + useEnd + ", useVacAppDay="
				+ useVacAppDay + ", empId=" + empId + ", apprEmpId=" + apprEmpId + ", empName=" + empName + ", totalDay="
				+ totalDay + ", deptName=" + deptName + "]";
	}

	
}
