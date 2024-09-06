package semi.post.model.service;



import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semi.common.model.vo.PageInfo;
import semi.member.model.dao.MemberDao;
import semi.member.model.vo.Member;
import semi.post.model.dao.PostDao;
import semi.post.model.vo.Post;

public class PostService {
	
	public ArrayList<Post> PostList(PageInfo pi1) {
		Connection conn = getConnection();
		
	    ArrayList<Post> list1 = new PostDao().PostList(conn,pi1);
		
		close(conn);
		
		return list1;
	}
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new PostDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	public int increaseCount(int pno) {
		Connection conn = getConnection();
		
		int result = new PostDao().increaseCount(conn, pno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
				
	}
	
	public Post selectPost(int mno) {
		Connection conn = getConnection();
		
		Post p = new PostDao().selectPost(conn,mno);
	
		close(conn);
		
		return p;
		
	}

	public int updatePost(String title, String content,int pno) {
		Connection conn = getConnection();
		
		int result =  new PostDao().updatePost(conn,title,content,pno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int insertPost(int mno, String title, String content) {
	    Connection conn = getConnection();

	    int result = new PostDao().insertPost(conn, mno, title, content);

        if (result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }

        close(conn);
        return result;
    }
	
	public int deletePost(int postNo) {
		Connection conn = getConnection();
		
		int result = new PostDao().deletePost(conn,postNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	 public ArrayList<Post> searchPosts(String keyword) {
	        Connection conn = getConnection();

	        ArrayList<Post> searchResults = new PostDao().searchPosts(conn, keyword);

	        close(conn);

	        return searchResults;
	    }
	public int increaseRecommend(int postNo) {
	    Connection conn = getConnection();
	    int result = new PostDao().increaseRecommend(conn, postNo);

	    if (result > 0) {
	        commit(conn);
	    } else {
	        rollback(conn);
	    }

	    close(conn);
	    return result;
	}
	
	public boolean hasRecommended(int pno, String userId) {
	    Connection conn = getConnection();
	    
	    
	    boolean result = new PostDao().hasRecommended(conn, pno, userId);
	    
	    close(conn);
	    return result;
	}
	
	public ArrayList<Post> selectPostList(PageInfo postPi) {
		Connection conn = getConnection();
		
		ArrayList<Post> list = new PostDao().selectPostList(conn,postPi);
		
		close(conn);
		
		return list;
	}
}
