package com.spring.likelist.vo;

public class LikeVo {
	
	private String likeId;
	private String mId;
	private String docId;
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
	public int getFilmPrice() {
		return filmPrice;
	}
	public void setFilmPrice(int filmPrice) {
		this.filmPrice = filmPrice;
	}
	
	public LikeVo() {}
	public LikeVo(String likeId, String mId, String docId, int filmPrice) {
		super();
		this.likeId = likeId;
		this.mId = mId;
		this.docId = docId;
		this.filmPrice = filmPrice;
	}
	
	@Override
	public String toString() {
		return "LikeVo [likeId=" + likeId + ", mId=" + mId + ", docId=" + docId + ", filmPrice=" + filmPrice + "]";
	}
	
	
	
	

	
}
