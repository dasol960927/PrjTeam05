package com.spring.naverfilm.vo;

public class NaverFilmVo {
	private String keyword;
	
	private String title;
	private String image;
	private String pubDate;
	private String director;
	private String actor;
	private String userRating;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getUserRating() {
		return userRating;
	}
	public void setUserRating(String userRating) {
		this.userRating = userRating;
	}
	
	@Override
	public String toString() {
		return "NaverFilmVo [title=" + title + ", image=" + image + ", pubDate=" + pubDate + ", director=" + director
				+ ", actor=" + actor + ", userRating=" + userRating + "]";
	}
}
