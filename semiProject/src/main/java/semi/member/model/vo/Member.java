package semi.member.model.vo;

import java.sql.Date;

public class Member {
	
		private int mNo;
		private String mName; 
		private String mId;
		private String mNickname;
		private String mPwd;
		private int mRrn;
		private int mPhone;
		private String mEmail;
		private String mAddress; 
		private Date mDate;
		private String mModify;
		private String mStatus;
		private int mReport;
		private String mGrade;
		private String mProfile;
		
public Member() {}

public Member(int mNo, String mName, String mId, String mNickname, String mPwd, int mRrn, int mPhone, String mEmail,
		String mAddress, Date mDate, String mModify, String mStatus, int mReport, String mGrade, String mProfile) {
	super();
	this.mNo = mNo;
	this.mName = mName;
	this.mId = mId;
	this.mNickname = mNickname;
	this.mPwd = mPwd;
	this.mRrn = mRrn;
	this.mPhone = mPhone;
	this.mEmail = mEmail;
	this.mAddress = mAddress;
	this.mDate = mDate;
	this.mModify = mModify;
	this.mStatus = mStatus;
	this.mReport = mReport;
	this.mGrade = mGrade;
	this.mProfile = mProfile;
}

public int getmNo() {
	return mNo;
}

public void setmNo(int mNo) {
	this.mNo = mNo;
}

public String getmName() {
	return mName;
}

public void setmName(String mName) {
	this.mName = mName;
}

public String getmId() {
	return mId;
}

public void setmId(String mId) {
	this.mId = mId;
}

public String getmNickname() {
	return mNickname;
}

public void setmNickname(String mNickname) {
	this.mNickname = mNickname;
}

public String getmPwd() {
	return mPwd;
}

public void setmPwd(String mPwd) {
	this.mPwd = mPwd;
}

public int getmRrn() {
	return mRrn;
}

public void setmRrn(int mRrn) {
	this.mRrn = mRrn;
}

public int getmPhone() {
	return mPhone;
}

public void setmPhone(int mPhone) {
	this.mPhone = mPhone;
}

public String getmEmail() {
	return mEmail;
}

public void setmEmail(String mEmail) {
	this.mEmail = mEmail;
}

public String getmAddress() {
	return mAddress;
}

public void setmAddress(String mAddress) {
	this.mAddress = mAddress;
}

public Date getmDate() {
	return mDate;
}

public void setmDate(Date mDate) {
	this.mDate = mDate;
}

public String getmModify() {
	return mModify;
}

public void setmModify(String mModify) {
	this.mModify = mModify;
}

public String getmStatus() {
	return mStatus;
}

public void setmStatus(String mStatus) {
	this.mStatus = mStatus;
}

public int getmReport() {
	return mReport;
}

public void setmReport(int mReport) {
	this.mReport = mReport;
}

public String getmGrade() {
	return mGrade;
}

public void setmGrade(String mGrade) {
	this.mGrade = mGrade;
}

public String getmProfile() {
	return mProfile;
}

public void setmProfile(String mProfile) {
	this.mProfile = mProfile;
}

@Override
public String toString() {
	return "Member [mNo=" + mNo + ", mName=" + mName + ", mId=" + mId + ", mNickname=" + mNickname + ", mPwd=" + mPwd
			+ ", mRrn=" + mRrn + ", mPhone=" + mPhone + ", mEmail=" + mEmail + ", mAddress=" + mAddress + ", mDate="
			+ mDate + ", mModify=" + mModify + ", mStatus=" + mStatus + ", mReport=" + mReport + ", mGrade=" + mGrade
			+ ", mProfile=" + mProfile + "]";
}



}
