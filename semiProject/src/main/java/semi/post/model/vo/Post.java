package semi.post.model.vo;

import java.sql.Date;

public class Post {
	
	 private int postNo;
	 private String mId;
	 private int mNO;
	 private String postTitle;
	 private String postContent;
	 private int postCount;
	 private int postRecommend;
	 private Date postDate; 
	 private Date postModifyed;
	 private String status;
	 private String mName;
	 private int qNo;
	 
	 private String mNickName;
	 private int mNo;
	 
	 public Post() {}

	 
	




	public Post(int postNo, int qNo, String mId, String postTitle) {
		super();
		this.postNo = postNo;
		this.mId = mId;
		this.postTitle = postTitle;
		this.qNo = qNo;
	}







	public Post(int postNo, String mId,String postTitle) {
		super();
		this.postNo = postNo;
		this.mId = mId;
		this.postTitle = postTitle;
	}




	public Post(int postNo, int mNO, String postTitle, String postContent, int postCount, int postRecommend,
			Date postDate, Date postModifyed, String status) {
		super();
		this.postNo = postNo;
		this.mNO = mNO;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postCount = postCount;
		this.postRecommend = postRecommend;
		this.postDate = postDate;
		this.postModifyed = postModifyed;
		this.status = status;
	}
	
	

	public Post(String mId, int postNo, String postTitle, String postContent, int postCount, int postRecommend,
			Date postDate, Date postModifyed, String mNickName) {
		super();
		this.mId = mId;
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postCount = postCount;
		this.postRecommend = postRecommend;
		this.postDate = postDate;
		this.postModifyed = postModifyed;
		this.mNickName = mNickName;
	}

	public Post(int mNO, String postTitle, String postContent, int postCount, int postRecommend, Date postDate,
			Date postModifyed) {
		super();
		this.mNO = mNO;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postCount = postCount;
		this.postRecommend = postRecommend;
		this.postDate = postDate;
		this.postModifyed = postModifyed;
	}
	

	public Post(int postNo, int mNO, String postTitle, String postContent, int postCount, int postRecommend,
			Date postDate) {
		super();
		this.postNo = postNo;
		this.mNO = mNO;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postCount = postCount;
		this.postRecommend = postRecommend;
		this.postDate = postDate;
	}

	
	
	public Post(String mId, String postTitle, String postContent, int postCount, int postRecommend, Date postDate,
			Date postModifyed) {
		super();
		this.mId = mId;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postCount = postCount;
		this.postRecommend = postRecommend;
		this.postDate = postDate;
		this.postModifyed = postModifyed;
	}
	
	

	public Post(int postNo, String mId, String postTitle, String postContent, int postCount, int postRecommend,
			Date postDate, Date postModifyed) {
		super();
		this.postNo = postNo;
		this.mId = mId;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postCount = postCount;
		this.postRecommend = postRecommend;
		this.postDate = postDate;
		this.postModifyed = postModifyed;
	}
	
	

	public Post(int postNo, String mId, int mNO, String postTitle, String postContent, int postCount, int postRecommend,
			Date postDate, Date postModifyed) {
		super();
		this.postNo = postNo;
		this.mId = mId;
		this.mNO = mNO;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postCount = postCount;
		this.postRecommend = postRecommend;
		this.postDate = postDate;
		this.postModifyed = postModifyed;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getmNO() {
		return mNO;
	}

	public void setmNO(int mNO) {
		this.mNO = mNO;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public int getPostCount() {
		return postCount;
	}

	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}

	public int getPostRecommend() {
		return postRecommend;
	}

	public void setPostRecommend(int postRecommend) {
		this.postRecommend = postRecommend;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public Date getPostModifyed() {
		return postModifyed;
	}

	public void setPostModifyed(Date postModifyed) {
		this.postModifyed = postModifyed;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	


	public String getmNickName() {
		return mNickName;
	}

	public void setmNickName(String mNickName) {
		this.mNickName = mNickName;
	}
	
	

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	@Override
	public String toString() {
		return "Post [mId=" + mId + ", postNo=" + postNo + ", mNO=" + mNO + ", postTitle=" + postTitle
				+ ", postContent=" + postContent + ", postCount=" + postCount + ", postRecommend=" + postRecommend
				+ ", postDate=" + postDate + ", postModifyed=" + postModifyed + ", status=" + status + ", mNickName="
				+ mNickName + "]";
	}

	
	

	public Post(int postNo, String postTitel, String postContent, String mId, String mName, int postRecommend, Date postDate) {
		super();
		this.postNo = postNo;
		this.postTitle = postTitel;
		this.postContent = postContent;
		this.postRecommend = postRecommend;
		this.postDate = postDate;
		this.mId = mId;
		this.setmName(mName);
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

	

	
}
