package com.spring.review.vo;

public class RevVo {
	
	private String mId;
	private String filmId;
	private String revTitle;
	private String revConts;
	private double grdScore;
	private String grdConts;
	private int goodCnt;
	private int badCnt;
	private String revDate;
	private char revGubun;
	private int revLvl;
	private int revNref;
	
	
	
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getFilmId() {
		return filmId;
	}
	public void setFilmId(String filmId) {
		this.filmId = filmId;
	}
	public String getRevTitle() {
		return revTitle;
	}
	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
	}
	public String getRevConts() {
		return revConts;
	}
	public void setRevConts(String revConts) {
		this.revConts = revConts;
	}
	public double getGrdScore() {
		return grdScore;
	}
	public void setGrdScore(double grdScore) {
		this.grdScore = grdScore;
	}
	public String getGrdConts() {
		return grdConts;
	}
	public void setGrdConts(String grdConts) {
		this.grdConts = grdConts;
	}
	public int getGoodCnt() {
		return goodCnt;
	}
	public void setGoodCnt(int goodCnt) {
		this.goodCnt = goodCnt;
	}
	public int getBadCnt() {
		return badCnt;
	}
	public void setBadCnt(int badCnt) {
		this.badCnt = badCnt;
	}
	public String getRevDate() {
		return revDate;
	}
	public void setRevDate(String revDate) {
		this.revDate = revDate;
	}
	public char getRevGubun() {
		return revGubun;
	}
	public void setRevGubun(char revGubun) {
		this.revGubun = revGubun;
	}
	public int getRevLvl() {
		return revLvl;
	}
	public void setRevLvl(int revLvl) {
		this.revLvl = revLvl;
	}
	public int getRevNref() {
		return revNref;
	}
	public void setRevNref(int revNref) {
		this.revNref = revNref;
	}
	
	
	
	@Override
	public String toString() {
		return "RevVo [mId=" + mId + ", filmId=" + filmId + ", revTitle=" + revTitle + ", revConts=" + revConts
				+ ", grdScore=" + grdScore + ", grdConts=" + grdConts + ", goodCnt=" + goodCnt + ", badCnt=" + badCnt
				+ ", revDate=" + revDate + ", revGubun=" + revGubun + ", revLvl=" + revLvl + ", revNref=" + revNref
				+ "]";
	}
	
	
	

}
