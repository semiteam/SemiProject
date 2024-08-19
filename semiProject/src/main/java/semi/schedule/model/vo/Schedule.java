package semi.schedule.model.vo;

import java.sql.Date;

public class Schedule {
	private int sNo;
	private String sTitle;
	private String sPlace;
	private Date sSdate;
	private Date sEdate;
	private String sDescription;
	private int rangeNo;
	private int bgiNo;
	private Date sCdate;
	private String sStatus;
	
	public Schedule() {}

	public Schedule(int sNo, String sTitle, String sPlace, Date sSdate, Date sEdate, String sDescription, int rangeNo,
			int bgiNo, Date sCdate, String sStatus) {
		super();
		this.sNo = sNo;
		this.sTitle = sTitle;
		this.sPlace = sPlace;
		this.sSdate = sSdate;
		this.sEdate = sEdate;
		this.sDescription = sDescription;
		this.rangeNo = rangeNo;
		this.bgiNo = bgiNo;
		this.sCdate = sCdate;
		this.sStatus = sStatus;
	}

	public Schedule(String sTitle, String sPlace, Date sSdate, Date sEdate, String sDescription, int rangeNo,
			int bgiNo) {
		super();
		this.sTitle = sTitle;
		this.sPlace = sPlace;
		this.sSdate = sSdate;
		this.sEdate = sEdate;
		this.sDescription = sDescription;
		this.rangeNo = rangeNo;
		this.bgiNo = bgiNo;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getsTitle() {
		return sTitle;
	}

	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}

	public String getsPlace() {
		return sPlace;
	}

	public void setsPlace(String sPlace) {
		this.sPlace = sPlace;
	}

	public Date getsSdate() {
		return sSdate;
	}

	public void setsSdate(Date sSdate) {
		this.sSdate = sSdate;
	}

	public Date getsEdate() {
		return sEdate;
	}

	public void setsEdate(Date sEdate) {
		this.sEdate = sEdate;
	}

	public String getsDescription() {
		return sDescription;
	}

	public void setsDescription(String sDescription) {
		this.sDescription = sDescription;
	}

	public int getRangeNo() {
		return rangeNo;
	}

	public void setRangeNo(int rangeNo) {
		this.rangeNo = rangeNo;
	}

	public int getBgiNo() {
		return bgiNo;
	}

	public void setBgiNo(int bgiNo) {
		this.bgiNo = bgiNo;
	}

	public Date getsCdate() {
		return sCdate;
	}

	public void setsCdate(Date sCdate) {
		this.sCdate = sCdate;
	}

	public String getsStatus() {
		return sStatus;
	}

	public void setsStatus(String sStatus) {
		this.sStatus = sStatus;
	}

	@Override
	public String toString() {
		return "Schedule [sNo=" + sNo + ", sTitle=" + sTitle + ", sPlace=" + sPlace + ", sSdate=" + sSdate + ", sEdate="
				+ sEdate + ", sDescription=" + sDescription + ", rangeNo=" + rangeNo + ", bgiNo=" + bgiNo + ", sCdate="
				+ sCdate + ", sStatus=" + sStatus + "]";
	}
}
