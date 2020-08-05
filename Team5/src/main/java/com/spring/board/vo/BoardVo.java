package com.spring.board.vo;

public class BoardVo {
	private String bId;
	private String mId;
	private String bName;
	private String bConts;
	private String bDate;
	private int bCnt;
	private String bGubun;
	
	public String getbId() {
		return bId;
	}
	public void setbId(String bId) {
		this.bId = bId;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getbConts() {
		return bConts;
	}
	public void setbConts(String bConts) {
		this.bConts = bConts;
	}
	public String getbDate() {
		return bDate;
	}
	public void setbDate(String bDate) {
		this.bDate = bDate;
	}
	public int getbCnt() {
		return bCnt;
	}
	public void setbCnt(int bCnt) {
		this.bCnt = bCnt;
	}
	public String getbGubun() {
		return bGubun;
	}
	public void setbGubun(String bGubun) {
		this.bGubun = bGubun;
	}
	
	@Override
	public String toString() {
		return "BoardVo [bId=" + bId + ", mId=" + mId + ", bName=" + bName + ", bConts=" + bConts + ", bDate=" + bDate
				+ ", bCnt=" + bCnt + ", bGubun=" + bGubun + "]";
	}
	
	
}
