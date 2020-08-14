package com.spring.purchase.vo;

public class PurVo {

	
	private String pId;
	private String mId;	
	private String pDate;
	private String docId;
	private String filmName;
	private int filmPrice;
	
	private String oErrMsg;
	
	
	
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public String getdocId() {
		return docId;
	}
	public void setdocId(String docId) {
		this.docId = docId;
	}
	public String getFilmName() {
		return filmName;
	}
	public void setFilmName(String filmName) {
		this.filmName = filmName;
	}
	public int getFilmPrice() {
		return filmPrice;
	}
	public void setFilmPrice(int filmPrice) {
		this.filmPrice = filmPrice;
	}	
	public String getoErrMsg() {
		return oErrMsg;
	}
	public void setoErrMsg(String oErrMsg) {
		this.oErrMsg = oErrMsg;
	}
	
	
	
	@Override
	public String toString() {
		return "PurVo [pId=" + pId + ", mId=" + mId + ", pDate=" + pDate + ", docId=" + docId + ", filmName="
				+ filmName + ", filmPrice=" + filmPrice + ", oErrMsg=" + oErrMsg + "]";
	}
	
	
	
	
	
	
	
}
