package semi.post.model.dao;

import java.io.Closeable;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static semi.common.JDBCTemplate.*;
import semi.common.model.vo.PageInfo;
import semi.post.model.vo.Post;

public class PostDao {
	
	private Properties prop = new Properties();
	
	public PostDao() {
		try {
			prop.loadFromXML(new FileInputStream(PostDao.class.getResource("/db/sql/post-mapper.xml").getPath()));
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	public ArrayList<Post> PostList(Connection conn , PageInfo pi){
		
		ArrayList<Post> list = new ArrayList<Post>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; 
			int endRow = startRow + pi.getBoardLimit() -1 ;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Post(rset.getInt("post_no"),
						          rset.getInt("m_id"),
						          rset.getString("post_title"),
						          rset.getString("post_content"),
						          rset.getInt("post_count"),
						          rset.getInt("post_recommend"),
						          rset.getDate("post_date")));
			}
			
			System.out.println(pi);
			System.out.println(list);
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println(pi);
		System.out.println(list);
		return list;
	}
	
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	
	}
}
