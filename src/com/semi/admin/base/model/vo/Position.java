package com.semi.admin.base.model.vo;

public class Position {
	private String positionId;
	private String positionName;
	private int positionNo;
	private String positionAct;
	private String positionNote;
	
	public Position() {}

	public Position(String positionId, String positionName, int positionNo, String positionAct, String positionNote) {
		super();
		this.positionId = positionId;
		this.positionName = positionName;
		this.positionNo = positionNo;
		this.positionAct = positionAct;
		this.positionNote = positionNote;
	}

	public String getPositionId() {
		return positionId;
	}

	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public int getPositionNo() {
		return positionNo;
	}

	public void setPositionNo(int positionNo) {
		this.positionNo = positionNo;
	}

	public String getPositionAct() {
		return positionAct;
	}

	public void setPositionAct(String positionAct) {
		this.positionAct = positionAct;
	}

	public String getPositionNote() {
		return positionNote;
	}

	public void setPositionNote(String positionNote) {
		this.positionNote = positionNote;
	}

	@Override
	public String toString() {
		return "Position [positionId=" + positionId + ", positionName=" + positionName + ", positionNo=" + positionNo
				+ ", positionAct=" + positionAct + ", positionNote=" + positionNote + "]";
	}
	
}
