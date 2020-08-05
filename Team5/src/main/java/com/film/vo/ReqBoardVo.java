package com.film.vo;

public class ReqBoardVo {
	private String reqId;
	private String mId;
	private String email;
	private String reqConts;
	private String reqDate;
	
	public String getReqId() {
		return reqId;
	}
	public void setReqId(String reqId) {
		this.reqId = reqId;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getReqConts() {
		return reqConts;
	}
	public void setReqConts(String reqConts) {
		this.reqConts = reqConts;
	}
	public String getReqDate() {
		return reqDate;
	}
	public void setReqDate(String reqDate) {
		this.reqDate = reqDate;
	}
	
	@Override
	public String toString() {
		return "ReqBoardVo [reqId=" + reqId + ", mId=" + mId + ", email=" + email + ", reqConts=" + reqConts
				+ ", reqDate=" + reqDate + "]";
	}
	
	
	
}
