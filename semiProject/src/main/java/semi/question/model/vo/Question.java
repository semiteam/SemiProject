package semi.question.model.vo;

import java.sql.Date;

public class Question {
	
	private int qNo;
	private int mNo;
	private String qTitle;
	private String qContent;
	private Date qDate;
	private String qStatus;
	private String qAnswer;
	private int qPwd;
	private String mName;
	
	
	
	public Question() {}
	
	
	

	public Question(int qNo, int mNo, String qTitle, String qContent, Date qDate, String qStatus, String qAnswer,
			int qPwd, String mName) {
		super();
		this.qNo = qNo;
		this.mNo = mNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.qStatus = qStatus;
		this.qAnswer = qAnswer;
		this.qPwd = qPwd;
		this.mName = mName;
	}




	public Question(int qNo, String mName,String qTitle, String qContent, Date qDate, String qStatus, String qAnswer, int qPwd
			) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.qStatus = qStatus;
		this.qAnswer = qAnswer;
		this.qPwd = qPwd;
		this.mName = mName;
	}


	public String getmName() {
		return mName;
	}



	public void setmName(String mName) {
		this.mName = mName;
	}


	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getQtitle() {
		return qTitle;
	}

	public void setQtitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public Date getqDate() {
		return qDate;
	}

	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}

	public String getqStatus() {
		return qStatus;
	}

	public void setqStatus(String qStatus) {
		this.qStatus = qStatus;
	}

	public String getqAnswer() {
		return qAnswer;
	}

	public void setqAnswer(String qAnswer) {
		this.qAnswer = qAnswer;
	}

	public int getqPwd() {
		return qPwd;
	}

	public void setqPwd(int qPwd) {
		this.qPwd = qPwd;
	}

	@Override
	public String toString() {
		return "Question [qNo=" + qNo + ", mNo=" + mNo + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qDate="
				+ qDate + ", qStatus=" + qStatus + ", qAnswer=" + qAnswer + ", qPwd=" + qPwd + "]";
	}
	
	
}
