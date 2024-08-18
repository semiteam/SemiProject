package semi.post.model.vo;

import java.sql.Date;

public class Post {
	 private int postNo;
	 private int mNO;
	 private String postTitle;
	 private String postContent;
	 private int postCount;
	 private int postRecommend;
	 private Date postDate; 
	 private Date postModifyed;
	 private String status;
	 
	 public Post() {}

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

	@Override
	public String toString() {
		return "Post [postNo=" + postNo + ", mNO=" + mNO + ", postTitle=" + postTitle + ", postContent=" + postContent
				+ ", postCount=" + postCount + ", postRecommend=" + postRecommend + ", postDate=" + postDate
				+ ", postModifyed=" + postModifyed + ", status=" + status + "]";
	}
	 
	 
}
