package semi.member.model.vo;

import java.sql.Date;

public class Member {
	private int mNo;
	private String mName;
	private String mId;
	private String mNickname;
	private String mPwd;
	private String mRrn;
	private String mPhone;
	private String mEmail;
	private String mAddress;
	private Date mDate;
	private Date mModify;
	private String mStatus;
	private int mReport;
	private String mGrade;
	private String mProfile;
	
	private String postalCode;
	private String basicAddress;
	private String detailedAddress;
	
	private String loginUser;

	public Member(int mNo, String mName, String mId, String mStatus, int mReport, String mGrade) {
		super();
		this.mNo = mNo;
		this.mName = mName;
		this.mId = mId;
		this.mStatus = mStatus;
		this.mReport = mReport;
		this.mGrade = mGrade;
	}
	
	
	
	
	public Member(String mName, String mId, String mNickname, String mPwd, String mRrn, String mPhone, String mEmail,
			String mAddress, String mProfile, String postalCode, String basicAddress, String detailedAddress) {
		super();
		this.mName = mName;
		this.mId = mId;
		this.mNickname = mNickname;
		this.mPwd = mPwd;
		this.mRrn = mRrn;
		this.mPhone = mPhone;
		this.mEmail = mEmail;
		this.mAddress = mAddress;
		this.mProfile = mProfile;
		this.postalCode = postalCode;
		this.basicAddress = basicAddress;
		this.detailedAddress = detailedAddress;
	}




	public Member(int mNo, String mName, String mId, String mNickname, String mPwd, String mPhone, String mEmail,
			String mAddress, Date mDate, Date mModify, String mStatus, int mReport, String mGrade, String mProfile,
			String postalCode, String basicAddress, String detailedAddress) {
		super();
		this.mNo = mNo;
		this.mName = mName;
		this.mId = mId;
		this.mNickname = mNickname;
		this.mPwd = mPwd;
		this.mPhone = mPhone;
		this.mEmail = mEmail;
		this.mAddress = mAddress;
		this.mDate = mDate;
		this.mModify = mModify;
		this.mStatus = mStatus;
		this.mReport = mReport;
		this.mGrade = mGrade;
		this.mProfile = mProfile;
		this.postalCode = postalCode;
		this.basicAddress = basicAddress;
		this.detailedAddress = detailedAddress;
	}



	public Member(int mNo, String mName, String mId, String mNickname, String mPwd, String mRrn, String mPhone,
			String mEmail, String mAddress, Date mDate, Date mModify, String mStatus, int mReport, String mGrade,
			String mProfile, String postalCode, String basicAddress, String detailedAddress) {
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
		this.postalCode = postalCode;
		this.basicAddress = basicAddress;
		this.detailedAddress = detailedAddress;
	}



	public Member(String mId, String mNickname, String mPwd, String mPhone, String mEmail, String mAddress) {
	    this.mId = mId;
	    this.mNickname = mNickname;
	    this.mPwd = mPwd;
	    this.mPhone = mPhone;
	    this.mEmail = mEmail;
	    this.mAddress = mAddress;
	}

	public Member() {
	}
	
	

	public Member(int mNo, String mName, String mId, String mNickname, String mPwd, String mRrn, String mPhone,
			String mEmail, String mAddress, Date mDate, Date mModify, String mStatus, int mReport, String mGrade,
			String mProfile) {
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
	
	

	public Member(int mNo, String mName, String mId, String mNickname, String mPwd, String mPhone, String mEmail,
			String mAddress, Date mDate, Date mModify, String mStatus, int mReport, String mGrade, String mProfile) {
		super();
		this.mNo = mNo;
		this.mName = mName;
		this.mId = mId;
		this.mNickname = mNickname;
		this.mPwd = mPwd;
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

	public Member(String mName, String mId, String mNickname, String mPwd, String mRrn, String mPhone, String mEmail,
			String mAddress, String mProfile) {
		super();
		this.mName = mName;
		this.mId = mId;
		this.mNickname = mNickname;
		this.mPwd = mPwd;
		this.mRrn = mRrn;
		this.mPhone = mPhone;
		this.mEmail = mEmail;
		this.mAddress = mAddress;
		this.mProfile = mProfile;
	}
	
	
	public Member(String mId, String mNickname, String mPwd, String mPhone, String mEmail) {
		super();
		this.mId = mId;
		this.mNickname = mNickname;
		this.mPwd = mPwd;
		this.mPhone = mPhone;
		this.mEmail = mEmail;
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

	public String getmRrn() {
		return mRrn;
	}

	public void setmRrn(String mRrn) {
		this.mRrn = mRrn;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
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

	public Date getmModify() {
		return mModify;
	}

	public void setmModify(Date mModify) {
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
	
	

	public String getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(String loginUser) {
		this.loginUser = loginUser;
	}
	
	

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getBasicAddress() {
		return basicAddress;
	}

	public void setBasicAddress(String basicAddress) {
		this.basicAddress = basicAddress;
	}

	public String getDetailedAddress() {
		return detailedAddress;
	}

	public void setDetailedAddress(String detailedAddress) {
		this.detailedAddress = detailedAddress;
	}

	@Override
	public String toString() {
		return "Member [mNo=" + mNo + ", mName=" + mName + ", mId=" + mId + ", mNickname=" + mNickname + ", mPwd="
				+ mPwd + ", mRrn=" + mRrn + ", mPhone=" + mPhone + ", mEmail=" + mEmail + ", mAddress=" + mAddress
				+ ", mDate=" + mDate + ", mModify=" + mModify + ", mStatus=" + mStatus + ", mReport=" + mReport
				+ ", mGrade=" + mGrade + ", mProfile=" + mProfile + "]";
	}
}
