package com.spring.likelist.vo;

public class LikeVo {
	
	private String likeId;
	private String mId;
	private String docId;
	private String filmName;
	private String filmActor;
	private String filmDirector;
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
	public String getFilmName() {
		return filmName;
	}
	public void setFilmName(String filmName) {
		this.filmName = filmName;
	}
	public String getFilmActor() {
		return filmActor;
	}
	public void setFilmActor(String filmActor) {
		this.filmActor = filmActor;
	}
	public String getFilmDirector() {
		return filmDirector;
	}
	public void setFilmDirector(String filmDirector) {
		this.filmDirector = filmDirector;
	}
	public int getFilmPrice() {
		return filmPrice;
	}
	public void setFilmPrice(int filmPrice) {
		this.filmPrice = filmPrice;
	}
	
	@Override
	public String toString() {
		return "LikeVo [likeId=" + likeId + ", mId=" + mId + ", docId=" + docId + ", filmName=" + filmName
				+ ", filmActor=" + filmActor + ", filmDirector=" + filmDirector + ", filmPrice=" + filmPrice + "]";
	}
	
	

	
}
