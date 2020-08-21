package com.spring.chart.vo;

public class ChartVo {

	private String docId;
	private double grdScore;
	private int	   cntGrdScore;
	private String mGender;
	private String ages;
	private String str;
	private String oMsg;
	private double avgGrdScore;
	
	// Getter / Settter
	public String getDocId() {
		return docId;
	}
	public void setDocId(String docId) {
		this.docId = docId;
	}
	public double getGrdScore() {
		return grdScore;
	}
	public void setGrdScore(double grdScore) {
		this.grdScore = grdScore;
	}
	public int getCntGrdScore() {
		return cntGrdScore;
	}
	public void setCntGrdScore(int cntGrdScore) {
		this.cntGrdScore = cntGrdScore;
	}
	public String getmGender() {
		return mGender;
	}
	public void setmGender(String mGender) {
		this.mGender = mGender;
	}
	public String getAges() {
		return ages;
	}
	public void setAges(String ages) {
		this.ages = ages;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	public String getoMsg() {
		return oMsg;
	}
	public void setoMsg(String oMsg) {
		this.oMsg = oMsg;
	}	
	public double getAvgGrdScore() {
		return avgGrdScore;
	}
	public void setAvgGrdScore(double avgGrdScore) {
		this.avgGrdScore = avgGrdScore;
	}
	
	// Constructor
	public ChartVo(){}
	public ChartVo(String docId, double grdScore, int cntGrdScore, String mGender, String ages, String str, String oMsg) {
		super();
		this.docId = docId;
		this.grdScore = grdScore;
		this.cntGrdScore = cntGrdScore;
		this.mGender = mGender;
		this.ages = ages;
		this.str  = str;
		this.oMsg = oMsg;
	}
	
	
	@Override
	public String toString() {
		return "ChartVo [docId=" + docId + ", grdScore=" + grdScore + ", cntGrdScore=" + cntGrdScore + ", mGender="
				+ mGender + ", ages=" + ages + ", str=" + str + ", oMsg=" + oMsg +"]";
	}
	
	
	
	
}
