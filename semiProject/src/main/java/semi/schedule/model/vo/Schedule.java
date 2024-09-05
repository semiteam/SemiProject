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
	private int mno;
	private int howlong;
	private String bbgiPath;
	private String ubgiPath;

	public Schedule() {
	}
	
	public Schedule(String sTitle, String sPlace, Date sSdate, Date sEdate, String sDescription, int rangeNo, int bgiNo,
			String sStatus, int mno, int howlong) {
		super();
		this.sTitle = sTitle;
		this.sPlace = sPlace;
		this.sSdate = sSdate;
		this.sEdate = sEdate;
		this.sDescription = sDescription;
		this.rangeNo = rangeNo;
		this.bgiNo = bgiNo;
		this.sStatus = sStatus;
		this.mno = mno;
		this.howlong = howlong;
	}

	public Schedule(String sTitle, String sPlace, Date sSdate, Date sEdate, String sDescription, int rangeNo, int bgiNo,
			int mno, int howlong) {
		super();
		this.sTitle = sTitle;
		this.sPlace = sPlace;
		this.sSdate = sSdate;
		this.sEdate = sEdate;
		this.sDescription = sDescription;
		this.rangeNo = rangeNo;
		this.bgiNo = bgiNo;
		this.mno = mno;
		this.howlong = howlong;
	}

	public Schedule(int sNo, String sTitle, Date sSdate, Date sEdate, int mno, int howlong) {
		super();
		this.sNo = sNo;
		this.sTitle = sTitle;
		this.sSdate = sSdate;
		this.sEdate = sEdate;
		this.mno = mno;
		this.howlong = howlong;
	}

	public Schedule(int sNo, String sTitle, String sPlace, Date sSdate, Date sEdate, String sDescription, int rangeNo,
			int bgiNo, Date sCdate, String sStatus, int mno, int howlong, String bbgiPath, String ubgiPath) {
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
		this.mno = mno;
		this.howlong = howlong;
		this.bbgiPath = bbgiPath;
		this.ubgiPath = ubgiPath;
	}

	public Schedule(Date sSdate, Date sEdate) {
		super();
		this.sSdate = sSdate;
		this.sEdate = sEdate;
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

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getHowlong() {
		return howlong;
	}

	public void setHowlong(int howlong) {
		this.howlong = howlong;
	}

	public String getBbgiPath() {
		return bbgiPath;
	}

	public void setBbgiPath(String bbgiPath) {
		this.bbgiPath = bbgiPath;
	}

	public String getUbgiPath() {
		return ubgiPath;
	}

	public void setUbgiPath(String ubgiPath) {
		this.ubgiPath = ubgiPath;
	}

	@Override
	public String toString() {
		return "Schedule [sNo=" + sNo + ", sTitle=" + sTitle + ", sPlace=" + sPlace + ", sSdate=" + sSdate + ", sEdate="
				+ sEdate + ", sDescription=" + sDescription + ", rangeNo=" + rangeNo + ", bgiNo=" + bgiNo + ", sCdate="
				+ sCdate + ", sStatus=" + sStatus + ", mno=" + mno + ", howlong=" + howlong + ", bbgiPath=" + bbgiPath
				+ ", ubgiPath=" + ubgiPath + "]";
	}
}
