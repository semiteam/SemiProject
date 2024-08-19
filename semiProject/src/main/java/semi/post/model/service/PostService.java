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
		
		System.out.println(pi);
		System.out.println(list);
		close(conn);
		return list;
		
		
	}
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new PostDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}

	
}
