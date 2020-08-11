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
	
	
	// Fields2 : 추가개인정보( 찜갯수, 구매기록, 충전기록 )
	private int cntl;	// 찜
	private int cntp;	// 구매
	private int cntd;	// 충전	
	
	
	
	
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
	public int getCntl() {
		return cntl;
	}
	public void setCntl(int cntl) {
		this.cntl = cntl;
	}
	public int getCntp() {
		return cntp;
	}
	public void setCntp(int cntp) {
		this.cntp = cntp;
	}
	public int getCntd() {
		return cntd;
	}
	public void setCntd(int cntd) {
		this.cntd = cntd;	
	}
	
	

	
	public MemberVo() {}
	public MemberVo(String mId, String mName, String mPass, String mNickName, String mGender, String mBdate,
			String mPhone, int mCash, String outErrCode, int cntl, int cntp, int cntd) {
		super();
		this.mId = mId;
		this.mName = mName;
		this.mPass = mPass;
		this.mNickName = mNickName;
		this.mGender = mGender;
		this.mBdate = mBdate;
		this.mPhone = mPhone;
		this.mCash = mCash;
		this.outErrCode = outErrCode;
		this.cntl = cntl;
		this.cntp = cntp;
		this.cntd = cntd;
	}
	
	@Override
	public String toString() {
		return "MemberVo [mId=" + mId + ", mName=" + mName + ", mPass=" + mPass + ", mNickName=" + mNickName
				+ ", mGender=" + mGender + ", mBdate=" + mBdate + ", mPhone=" + mPhone + ", mCash=" + mCash
				+ ", outErrCode=" + outErrCode + ", cntl=" + cntl + ", cntp=" + cntp + ", cntd=" + cntd + "]";
	}
 
	
	
	

}
