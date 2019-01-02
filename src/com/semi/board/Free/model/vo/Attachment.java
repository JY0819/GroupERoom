package com.semi.board.Free.model.vo;

import java.sql.Date;

public class Attachment {
	
	private int ano;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String whetherofDelete;
	
	public Attachment() {}

	public Attachment(int ano, String originName, String changeName, String filePath, Date uploadDate,
			String whetherofDelete) {
		super();
		this.ano = ano;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.whetherofDelete = whetherofDelete;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getWhetherofDelete() {
		return whetherofDelete;
	}

	public void setWhetherofDelete(String whetherofDelete) {
		this.whetherofDelete = whetherofDelete;
	}

	@Override
	public String toString() {
		return "Attachment [ano=" + ano + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", uploadDate=" + uploadDate + ", whetherofDelete=" + whetherofDelete + "]";
	}
	
	
	
}
