package com.spring.film.vo;

public class MemberVo {
	
	//Fields
	private String mId;
	private String mName;
	private String mPass;
	private String mGender;
	private String mBdate;
	private int	   mCash;
	
	// Getter/Setter
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmPass() {
		return mPass;
	}
	public void setmPass(String mPass) {
		this.mPass = mPass;
	}
	public String getmGender() {
		return mGender;
	}
	public void setmGender(String mGender) {
		this.mGender = mGender;
	}
	public String getmBdate() {
		return mBdate;
	}
	public void setmBdate(String mBdate) {
		this.mBdate = mBdate;
	}
	public int getmCash() {
		return mCash;
	}
	public void setmCash(int mCash) {
		this.mCash = mCash;
	}

	
	// toString
	@Override
	public String toString() {
		return "MemberVo [mId=" + mId + ", mName=" + mName + ", mPass=" + mPass + ", mGender=" + mGender + ", mBdate="
				+ mBdate + ", mCash=" + mCash + "]";
	}
}
