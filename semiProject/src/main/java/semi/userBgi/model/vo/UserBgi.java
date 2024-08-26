package semi.userBgi.model.vo;

public class UserBgi {
	private int uBgiNo;
	private String uBgiOname;
	private String uBgiRname;
	private String uBgiPath;

	public UserBgi() {
	}

	public UserBgi(int uBgiNo, String uBgiOname, String uBgiRname, String uBgiPath) {
		super();
		this.uBgiNo = uBgiNo;
		this.uBgiOname = uBgiOname;
		this.uBgiRname = uBgiRname;
		this.uBgiPath = uBgiPath;
	}

	public UserBgi(String uBgiOname, String uBgiRname, String uBgiPath) {
		super();
		this.uBgiOname = uBgiOname;
		this.uBgiRname = uBgiRname;
		this.uBgiPath = uBgiPath;
	}

	public int getuBgiNo() {
		return uBgiNo;
	}

	public void setuBgiNo(int uBgiNo) {
		this.uBgiNo = uBgiNo;
	}

	public String getuBgiOname() {
		return uBgiOname;
	}

	public void setuBgiOname(String uBgiOname) {
		this.uBgiOname = uBgiOname;
	}

	public String getuBgiRname() {
		return uBgiRname;
	}

	public void setuBgiRname(String uBgiRname) {
		this.uBgiRname = uBgiRname;
	}

	public String getuBgiPath() {
		return uBgiPath;
	}

	public void setuBgiPath(String uBgiPath) {
		this.uBgiPath = uBgiPath;
	}

	@Override
	public String toString() {
		return "UserBgi [uBgiNo=" + uBgiNo + ", uBgiOname=" + uBgiOname + ", uBgiRname=" + uBgiRname + ", uBgiPath="
				+ uBgiPath + "]";
	}
}
