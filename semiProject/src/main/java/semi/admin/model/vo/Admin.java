package semi.admin.model.vo;

public class Admin {
	private int aNo;
	private String aId;
	private String aPwd;
	private String aNickname;
	private String aStatus;
	
	public Admin() {}

	public Admin(int aNo, String aId, String aPwd, String aNickname, String aStatus) {
		super();
		this.aNo = aNo;
		this.aId = aId;
		this.aPwd = aPwd;
		this.aNickname = aNickname;
		this.aStatus = aStatus;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public String getaPwd() {
		return aPwd;
	}

	public void setaPwd(String aPwd) {
		this.aPwd = aPwd;
	}

	public String getaNickname() {
		return aNickname;
	}

	public void setaNickname(String aNickname) {
		this.aNickname = aNickname;
	}

	public String getaStatus() {
		return aStatus;
	}

	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}

	@Override
	public String toString() {
		return "Admin [aNo=" + aNo + ", aId=" + aId + ", aPwd=" + aPwd + ", aNickname=" + aNickname + ", aStatus="
				+ aStatus + "]";
	}
}
