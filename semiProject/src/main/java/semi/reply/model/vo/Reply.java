package semi.reply.model.vo;

import java.sql.Date;

public class Reply {
	private int rNo;
	private int aNo;
	private int qNo;
	private String rContent;
	private Date rDate;
	private String rStatus;
	 
	public Reply() {}
	 
	public Reply(int rNo, int aNo, int qNo, String rContent, Date rDate, String rStatus) {
		super();
		this.rNo = rNo;
		this.aNo = aNo;
		this.qNo = qNo;
		this.rContent = rContent;
		this.rDate = rDate;
		this.rStatus = rStatus;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	@Override
	public String toString() {
		return "Reply [rNo=" + rNo + ", aNo=" + aNo + ", qNo=" + qNo + ", rContent=" + rContent + ", rDate=" + rDate
				+ ", rStatus=" + rStatus + "]";
	}
	
	
	 
	 
	 

}
