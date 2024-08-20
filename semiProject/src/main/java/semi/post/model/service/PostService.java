package semi.post.model.service;



import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semi.common.model.vo.PageInfo;
import semi.post.model.dao.PostDao;
import semi.post.model.vo.Post;

public class PostService {
	
	public ArrayList<Post> PostList(PageInfo pi) {
		Connection conn = getConnection();
		
	    ArrayList<Post> list = new PostDao().PostList(conn,pi);
		
		close(conn);
		
		return list;
	}
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new PostDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	public int increaseCount(int postNo) {
		Connection conn = getConnection();
		
		int result = new PostDao().increaseCount(conn, postNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
				
	}
	
	public Post selectPost(int postNo) {
		Connection conn = getConnection();
		
		Post p = new PostDao().selectPost(conn,postNo);
		close(conn);
		return p;
		
	}

	
}
