package com.semi.myPage.model.Msg.vo;

import java.sql.Date;

public class Msg implements java.io.Serializable {
	private int rnum;
	private int msgNo;
	private String msgContents;
	private Date msgSendD;
	private Date msgReceiveD;
	private String msgSender;
	private String msgReceiver;
	private int msgSenderID;
	private int msgReceiverID;
	
	public Msg() {
		
	}

	public Msg(int rnum, int msgNo, String msgContents, Date msgSendD, Date msgReceiveD, String msgSender,
			String msgReceiver, int msgSenderID, int msgReceiverID) {
		super();
		this.rnum = rnum;
		this.msgNo = msgNo;
		this.msgContents = msgContents;
		this.msgSendD = msgSendD;
		this.msgReceiveD = msgReceiveD;
		this.msgSender = msgSender;
		this.msgReceiver = msgReceiver;
		this.msgSenderID = msgSenderID;
		this.msgReceiverID = msgReceiverID;
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
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getMsgSenderID() {
		return msgSenderID;
	}

	public void setMsgSenderID(int msgSenderID) {
		this.msgSenderID = msgSenderID;
	}

	public int getMsgReceiverID() {
		return msgReceiverID;
	}

	public void setMsgReceiverID(int msgReceiverID) {
		this.msgReceiverID = msgReceiverID;
	}

	@Override
	public String toString() {
		return "Msg [rnum=" + rnum + ", msgNo=" + msgNo + ", msgContents=" + msgContents + ", msgSendD=" + msgSendD
				+ ", msgReceiveD=" + msgReceiveD + ", msgSender=" + msgSender + ", msgReceiver=" + msgReceiver
				+ ", msgSenderID=" + msgSenderID + ", msgReceiverID=" + msgReceiverID + "]";
	}

	
}
