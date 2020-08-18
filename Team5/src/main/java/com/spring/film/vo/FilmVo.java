package com.spring.film.vo;

public class FilmVo {
	private String docId;
	private String filmId;
	private String filmSeq;
	private String filmYear;
	private int filmPrice;
	
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
	public String getFilmYear() {
		return filmYear;
	}
	public void setFilmYear(String filmYear) {
		this.filmYear = filmYear;
	}
	public int getFilmPrice() {
		return filmPrice;
	}
	public void setFilmPrice(int filmPrice) {
		this.filmPrice = filmPrice;
	}
	
	@Override
	public String toString() {
		return "FilmVo [docId=" + docId + ", filmId=" + filmId + ", filmSeq=" + filmSeq + ", filmYear=" + filmYear
				+ ", filmPrice=" + filmPrice + "]";
	}
	

	
	
	
}
