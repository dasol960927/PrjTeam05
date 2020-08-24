package com.spring.likelist.vo;

public class LikeVo {
	
	private String likeId;
	private String mId;
	private String docId;
	private String genre;
	private String likeChk;
	private int filmPrice;
	
	public String getLikeId() {
		return likeId;
	}
	public void setLikeId(String likeId) {
		this.likeId = likeId;
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
	public String getLikeChk() {
		return likeChk;
	}
	public void setLikeChk(String likeChk) {
		this.likeChk = likeChk;
	}
	public int getFilmPrice() {
		return filmPrice;
	}
	public void setFilmPrice(int filmPrice) {
		this.filmPrice = filmPrice;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	@Override
	public String toString() {
		return "LikeVo [likeId=" + likeId + ", mId=" + mId + ", docId=" + docId + ", genre=" + genre + ", likeChk="
				+ likeChk + ", filmPrice=" + filmPrice + "]";
	}
}
