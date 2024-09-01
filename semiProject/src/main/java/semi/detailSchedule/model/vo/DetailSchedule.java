package semi.detailSchedule.model.vo;

import java.sql.Timestamp;
import java.sql.Date;

public class DetailSchedule {
	private int dNo;
	private String dPlace;
	private String dStime;
	private String dEtime;
	private Timestamp dStimeT;
	private Timestamp dEtimeT;
	private String dElse;
	private Date dDate;
	private int mNo;
	private int sdNo;
	
	public DetailSchedule() {}
	
	public DetailSchedule(int dNo, String dPlace, Timestamp dStimeT, Timestamp dEtimeT, String dElse, int mNo) {
		super();
		this.dNo = dNo;
		this.dPlace = dPlace;
		this.dStimeT = dStimeT;
		this.dEtimeT = dEtimeT;
		this.dElse = dElse;
		this.mNo = mNo;
	}

	public DetailSchedule(int dNo, String dPlace, String dStime, String dEtime, Timestamp dStimeT, Timestamp dEtimeT,
			String dElse, Date dDate, int mNo, int sdNo) {
		super();
		this.dNo = dNo;
		this.dPlace = dPlace;
		this.dStime = dStime;
		this.dEtime = dEtime;
		this.dStimeT = dStimeT;
		this.dEtimeT = dEtimeT;
		this.dElse = dElse;
		this.dDate = dDate;
		this.mNo = mNo;
		this.sdNo = sdNo;
	}

	public DetailSchedule(int dNo, String dPlace, String dStime, String dEtime, String dElse, Date dDate, int mNo,
			int sdNo) {
		super();
		this.dNo = dNo;
		this.dPlace = dPlace;
		this.dStime = dStime;
		this.dEtime = dEtime;
		this.dElse = dElse;
		this.dDate = dDate;
		this.mNo = mNo;
		this.sdNo = sdNo;
	}

	public DetailSchedule(int dNo, String dPlace, String dStime, String dEtime, String dElse, Date dDate) {
		super();
		this.dNo = dNo;
		this.dPlace = dPlace;
		this.dStime = dStime;
		this.dEtime = dEtime;
		this.dElse = dElse;
		this.dDate = dDate;
	}

	public DetailSchedule(String dPlace, Timestamp dStimeT, Timestamp dEtimeT, String dElse, Date dDate, int mNo,
			int sdNo) {
		super();
		this.dPlace = dPlace;
		this.dStimeT = dStimeT;
		this.dEtimeT = dEtimeT;
		this.dElse = dElse;
		this.dDate = dDate;
		this.mNo = mNo;
		this.sdNo = sdNo;
	}

	public int getdNo() {
		return dNo;
	}

	public void setdNo(int dNo) {
		this.dNo = dNo;
	}

	public String getdPlace() {
		return dPlace;
	}

	public void setdPlace(String dPlace) {
		this.dPlace = dPlace;
	}

	public String getdStime() {
		return dStime;
	}

	public void setdStime(String dStime) {
		this.dStime = dStime;
	}

	public String getdEtime() {
		return dEtime;
	}

	public void setdEtime(String dEtime) {
		this.dEtime = dEtime;
	}

	public Timestamp getdStimeT() {
		return dStimeT;
	}

	public void setdStimeT(Timestamp dStimeT) {
		this.dStimeT = dStimeT;
	}

	public Timestamp getdEtimeT() {
		return dEtimeT;
	}

	public void setdEtimeT(Timestamp dEtimeT) {
		this.dEtimeT = dEtimeT;
	}

	public String getdElse() {
		return dElse;
	}

	public void setdElse(String dElse) {
		this.dElse = dElse;
	}

	public Date getdDate() {
		return dDate;
	}

	public void setdDate(Date dDate) {
		this.dDate = dDate;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getSdNo() {
		return sdNo;
	}

	public void setSdNo(int sdNo) {
		this.sdNo = sdNo;
	}

	@Override
	public String toString() {
		return "DetailSchedule [dNo=" + dNo + ", dPlace=" + dPlace + ", dStime=" + dStime + ", dEtime=" + dEtime
				+ ", dStimeT=" + dStimeT + ", dEtimeT=" + dEtimeT + ", dElse=" + dElse + ", dDate=" + dDate + ", mNo="
				+ mNo + ", sdNo=" + sdNo + "]";
	}
	
	
}
