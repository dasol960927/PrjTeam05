package com.spring.deposit.vo;

public class DpsVo {

	private String dId;
	private String mId;
	private String dGrpId;
	private String dComId;
	private int dPay;
	private String dDate;
	
	private String dComVal;
	
	private String outDate;
	
	
	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getdGrpId() {
		return dGrpId;
	}
	public void setdGrpId(String dGrpId) {
		this.dGrpId = dGrpId;
	}
	public String getdComId() {
		return dComId;
	}
	public void setdComId(String dComId) {
		this.dComId = dComId;
	}
	public int getdPay() {
		return dPay;
	}
	public void setdPay(int dPay) {
		this.dPay = dPay;
	}
	public String getdDate() {
		return dDate;
	}
	public void setdDate(String dDate) {
		this.dDate = dDate;
	}
	
	public String getdComVal() {
		return dComVal;
	}
	public void setdComVal(String dComVal) {
		this.dComVal = dComVal;
	}	
	public String getOutDate() {
		return outDate;
	}
	public void setOutDate(String outDate) {
		this.outDate = outDate;
	}
	
	
	@Override
	public String toString() {
		return "DpsVo [dId=" + dId + ", mId=" + mId + ", dGrpId=" + dGrpId + ", dComId=" + dComId + ", dPay=" + dPay
				+ ", dDate=" + dDate + ", dComVal=" + dComVal + ", outDate=" + outDate + "]";
	}
	
//	@Override
//public String toString() {
//		return "DpsVo [dId=" + dId + ", mId=" + mId + ", dGrpId=" + dGrpId + ", dComId=" + dComId + ", dPay=" + dPay
//				+ ", dDate=" + dDate + ", dComVal=" + dComVal + "]";
//	}
	
	
	
	
	
	
}
