package com.spring.likelist.vo;

public class LlistVo {
	
	private String likeId;
	private String mId;
	private String filmId;
	
	
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
	public String getFilmId() {
		return filmId;
	}
	public void setFilmId(String filmId) {
		this.filmId = filmId;
	}
	
	
	@Override
	public String toString() {
		return "LlistVo [likeId=" + likeId + ", mId=" + mId + ", filmId=" + filmId + "]";
	}
	
	
	
	
}
