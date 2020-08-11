package com.spring.member.vo;

public class MemberVo {
	
	//Fields
	private String mId;
	private String mName;
	private String mPass;
	private String mNickName;
	private String mGender;
	private String mBdate;
	private String mPhone;
	private int	   mCash;
	private String outErrCode;
	
	
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
	public String getmNickName() {
		return mNickName;
	}
	public void setmNickName(String mNickName) {
		this.mNickName = mNickName;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	public int getmCash() {
		return mCash;
	}
	public void setmCash(int mCash) {
		this.mCash = mCash;
	}
	public String getOutErrCode() {
		return outErrCode;
	}
	public void setOutErrCode(String outErrCode) {
		this.outErrCode = outErrCode;
	}
	
	@Override
	public String toString() {
		return "MemberVo [mId=" + mId + ", mName=" + mName + ", mPass=" + mPass + ", mGender=" + mGender + ", mBdate="
				+ mBdate + ", mNickName=" + mNickName + ", mPhone=" + mPhone + ", mCash=" + mCash + ", outErrCode=" + outErrCode +"]";
	}
	
	public MemberVo() {}
	
	public MemberVo(String mId, String mName, String mPass, String mGender, String mBdate, String mNickName,
			String mPhone, int mCash, String outErrCode) {
		super();
		this.mId = mId;
		this.mName = mName;
		this.mPass = mPass;
		this.mGender = mGender;
		this.mBdate = mBdate;
		this.mNickName = mNickName;
		this.mPhone = mPhone;
		this.mCash = mCash;
		this.outErrCode = outErrCode;
	}
	
	
	
	
	


	
	
	

}
