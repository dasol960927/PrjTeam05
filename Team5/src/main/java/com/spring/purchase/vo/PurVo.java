package com.spring.purchase.vo;

public class PurVo {

	
	private String pId;
	private String mId;	
	private String pDate;
	private String docId;
	//private String filmName;
	private String filmId;
	private String filmSeq;
	private String comVal;
	
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

	public String getDocId() {
		return docId;
	}

	public void setDocId(String docId) {
		this.docId = docId;
	}

	public String getFilmId() {
		return filmId;
	}

	public void setFilmId(String filmId) {
		this.filmId = filmId;
	}

	public String getFilmSeq() {
		return filmSeq;
	}

	public void setFilmSeq(String filmSeq) {
		this.filmSeq = filmSeq;
	}

	public String getComVal() {
		return comVal;
	}

	public void setComVal(String comVal) {
		this.comVal = comVal;
	}

	public String getoErrMsg() {
		return oErrMsg;
	}

	public void setoErrMsg(String oErrMsg) {
		this.oErrMsg = oErrMsg;
	}

	
	
	@Override
	public String toString() {
		return "PurVo [pId=" + pId + ", mId=" + mId + ", pDate=" + pDate + ", docId=" + docId + ", filmId=" + filmId
				+ ", filmSeq=" + filmSeq + ", comVal=" + comVal + ", oErrMsg=" + oErrMsg + "]";
	}
	



	
	
}
