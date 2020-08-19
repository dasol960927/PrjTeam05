package com.spring.review.vo;

public class RevVo {
	
	private int revIdx;
	private String mId;
	private String docId;
	private String revTitle;
	private String revConts;
	private double grdScore;
	private String grdConts;
	private int    goodCnt;
	private int    badCnt;
	private String revDate;
	private char   revGubun;
	private int    revLvl;
	private int    parentIdx;
	private int    revNref;
		
	private String oCnt;	
	private int lvl0Idx;
	
	private String symId;
	private char symGubun;
	
	
	// 영화 api 가져오기
	private String filmId;
	private String filmSeq;
	private String filmYear;
	
	
	// 게터 / 세터
	public int getRevIdx() {
		return revIdx;
	}
	public void setRevIdx(int revIdx) {
		this.revIdx = revIdx;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getDocId() {
		return docId;
	}
	public void setDocId(String docId) {
		this.docId = docId;
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
	public int getParentIdx() {
		return parentIdx;
	}
	public void setParentIdx(int parentIdx) {
		this.parentIdx = parentIdx;
	}
	public int getRevNref() {
		return revNref;
	}
	public void setRevNref(int revNref) {
		this.revNref = revNref;
	}	
	
	
	public String getoCnt() {
		return oCnt;
	}
	public void setoCnt(String oCnt) {
		this.oCnt = oCnt;
	}
	
		
	
	public int getLvl0Idx() {
		return lvl0Idx;
	}
	public void setLvl0Idx(int lvl0Idx) {
		this.lvl0Idx = lvl0Idx;
	}
	public String getSymId() {
		return symId;
	}
	public void setSymId(String symId) {
		this.symId = symId;
	}
	public char getSymGubun() {
		return symGubun;
	}
	public void setSymGubun(char symGubun) {
		this.symGubun = symGubun;
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
	public String getFilmYear() {
		return filmYear;
	}
	public void setFilmYear(String filmYear) {
		this.filmYear = filmYear;
	}
	
	
	public RevVo() {}	
	public RevVo(int revIdx, String mId, String docId, String revTitle, String revConts, double grdScore,
			String grdConts, int goodCnt, int badCnt, String revDate, char revGubun, int revLvl, int parentIdx,
			int revNref, String oCnt, int lvl0Idx, String symId, char symGubun, String filmId, String filmSeq, String filmYear) {		
		this.revIdx = revIdx;
		this.mId = mId;
		this.docId = docId;
		this.revTitle = revTitle;
		this.revConts = revConts;
		this.grdScore = grdScore;
		this.grdConts = grdConts;
		this.goodCnt = goodCnt;
		this.badCnt = badCnt;
		this.revDate = revDate;
		this.revGubun = revGubun;
		this.revLvl = revLvl;
		this.parentIdx = parentIdx;
		this.revNref = revNref;
		this.oCnt = oCnt;
		this.lvl0Idx = lvl0Idx;
		this.symId = symId;
		this.symGubun = symGubun;
		this.filmId = filmId;
		this.filmSeq = filmSeq;
		this.filmYear = filmYear;
	}
	
	
	
	
	
	
	@Override
	public String toString() {
		return "RevVo [revIdx=" + revIdx + ", mId=" + mId + ", docId=" + docId + ", revTitle=" + revTitle
				+ ", revConts=" + revConts + ", grdScore=" + grdScore + ", grdConts=" + grdConts + ", goodCnt="
				+ goodCnt + ", badCnt=" + badCnt + ", revDate=" + revDate + ", revGubun=" + revGubun + ", revLvl="
				+ revLvl + ", parentIdx=" + parentIdx + ", revNref=" + revNref + ", oCnt=" + oCnt + ", lvl0Idx="
				+ lvl0Idx + ", symId=" + symId + ", symGubun=" + symGubun + ", filmId=" + filmId + ", filmSeq="
				+ filmSeq + ", filmYear=" + filmYear + "]";
	}
	
}
