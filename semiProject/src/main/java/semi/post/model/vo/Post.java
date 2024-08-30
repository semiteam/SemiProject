package semi.post.model.vo;

import java.sql.Date;

public class Post {
	private int postNo;
	private int mNo;
	private String postTitel;
	private String postContent;
	private int postCount;
	private int postRecommend;
	private Date postDate;
	private Date postModifyed;
	private String postStatus;
	private String mId;
	private String mName;
	
	public Post() {}

	public Post(int postNo, int mNo, String postTitel, String postContent, int postCount, int postRecommend,
			Date postDate, Date postModifyed, String postStatus) {
		super();
		this.postNo = postNo;
		this.mNo = mNo;
		this.postTitel = postTitel;
		this.postContent = postContent;
		this.postCount = postCount;
		this.postRecommend = postRecommend;
		this.postDate = postDate;
		this.postModifyed = postModifyed;
		this.postStatus = postStatus;
	}
	
	
	

	public Post(int postNo, String postTitel, String postContent, String mId, String mName, int postRecommend, Date postDate) {
		super();
		this.postNo = postNo;
		this.postTitel = postTitel;
		this.postContent = postContent;
		this.postRecommend = postRecommend;
		this.postDate = postDate;
		this.mId = mId;
		this.mName = mName;
	}

	

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getPostTitel() {
		return postTitel;
	}

	public void setPostTitel(String postTitel) {
		this.postTitel = postTitel;
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

	public String getPostStatus() {
		return postStatus;
	}

	public void setPostStatus(String postStatus) {
		this.postStatus = postStatus;
	}
	
	

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	@Override
	public String toString() {
		return "Post [postNo=" + postNo + ", mNo=" + mNo + ", postTitel=" + postTitel + ", postContent=" + postContent
				+ ", postCount=" + postCount + ", postRecommend=" + postRecommend + ", postDate=" + postDate
				+ ", postModifyed=" + postModifyed + ", postStatus=" + postStatus + "]";
	}
	
	
}
