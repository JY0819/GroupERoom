package com.semi.myPage.model.Msg.vo;

import java.sql.Date;

public class Msg implements java.io.Serializable {
	private int msgNo;
	private String msgContents;
	private Date msgSendD;
	private Date msgReceiveD;
	private String msgSender;
	private String msgReceiver;
	
	public Msg() {
		
	}

	public Msg(int msgNo, String msgContents, Date msgSendD, Date msgReceiveD, String msgSender, String msgReceiver) {
		super();
		this.msgNo = msgNo;
		this.msgContents = msgContents;
		this.msgSendD = msgSendD;
		this.msgReceiveD = msgReceiveD;
		this.msgSender = msgSender;
		this.msgReceiver = msgReceiver;
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public String getMsgContents() {
		return msgContents;
	}

	public void setMsgContents(String msgContents) {
		this.msgContents = msgContents;
	}

	public Date getMsgSendD() {
		return msgSendD;
	}

	public void setMsgSendD(Date msgSendD) {
		this.msgSendD = msgSendD;
	}

	public Date getMsgReceiveD() {
		return msgReceiveD;
	}

	public void setMsgReceiveD(Date msgReceiveD) {
		this.msgReceiveD = msgReceiveD;
	}

	public String getMsgSender() {
		return msgSender;
	}

	public void setMsgSender(String msgSender) {
		this.msgSender = msgSender;
	}

	public String getMsgReceiver() {
		return msgReceiver;
	}

	public void setMsgReceiver(String msgReceiver) {
		this.msgReceiver = msgReceiver;
	}

	@Override
	public String toString() {
		return "Msg [msgNo=" + msgNo + ", msgContents=" + msgContents + ", msgSendD=" + msgSendD + ", msgReceiveD="
				+ msgReceiveD + ", msgSender=" + msgSender + ", msgReceiver=" + msgReceiver + "]";
	}

	
}
