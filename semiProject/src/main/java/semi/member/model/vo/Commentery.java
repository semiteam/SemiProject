package semi.member.model.vo;

import java.sql.Date;

public class Commentery {
	
		private int cNo;
		private int mNo;
		private String cContent;
		private Date cDate;
		private String cType;
		private String Cstatus;
		
		public Commentery() {}

		public Commentery(int cNo, int mNo, String cContent, Date cDate, String cType, String cstatus) {
			super();
			this.cNo = cNo;
			this.mNo = mNo;
			this.cContent = cContent;
			this.cDate = cDate;
			this.cType = cType;
			Cstatus = cstatus;
		}

		public int getcNo() {
			return cNo;
		}

		public void setcNo(int cNo) {
			this.cNo = cNo;
		}

		public int getmNo() {
			return mNo;
		}

		public void setmNo(int mNo) {
			this.mNo = mNo;
		}

		public String getcContent() {
			return cContent;
		}

		public void setcContent(String cContent) {
			this.cContent = cContent;
		}

		public Date getcDate() {
			return cDate;
		}

		public void setcDate(Date cDate) {
			this.cDate = cDate;
		}

		public String getcType() {
			return cType;
		}

		public void setcType(String cType) {
			this.cType = cType;
		}

		public String getCstatus() {
			return Cstatus;
		}

		public void setCstatus(String cstatus) {
			Cstatus = cstatus;
		}
		
		
		

}
