package com.spring.chart.vo;

public class ChartVo {

	private String docId;
	private double grdScore;
	private int	   cntGrdScore;
	private String mGender;
	private String ages;
	
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
	
	
	// Constructor
	public ChartVo(){}
	public ChartVo(String docId, double grdScore, int cntGrdScore, String mGender, String ages) {
		super();
		this.docId = docId;
		this.grdScore = grdScore;
		this.cntGrdScore = cntGrdScore;
		this.mGender = mGender;
		this.ages = ages;
	}
	
	
	@Override
	public String toString() {
		return "ChartVo [docId=" + docId + ", grdScore=" + grdScore + ", cntGrdScore=" + cntGrdScore + ", mGender="
				+ mGender + ", ages=" + ages + "]";
	}
	
	
	
	
}
