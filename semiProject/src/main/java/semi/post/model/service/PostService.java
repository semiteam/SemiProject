package semi.post.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import static semi.common.JDBCTemplate.*;
import semi.common.model.vo.PageInfo;
import semi.post.model.dao.PostDao;
import semi.post.model.vo.Post;

public class PostService {
	
	

	public int selectPostCount() {
		
		Connection conn = getConnection();
		
		int postList = new PostDao().selectPostCount(conn);
		
		close(conn);
		
		return postList;
		
	}

	public ArrayList<Post> selectPostList(PageInfo postPi) {
		Connection conn = getConnection();
		
		ArrayList<Post> list = new PostDao().selectPostList(conn,postPi);
		
		close(conn);
		
		return list;
	}

	public int deletePost(int postNo) {
		Connection conn = getConnection();
		
		int result = new PostDao().deletePost(conn, postNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
			close(conn);
		
			return result;
	}

	

}
