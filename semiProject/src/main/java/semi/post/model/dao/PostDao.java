package semi.post.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semi.common.model.vo.PageInfo;
import semi.post.model.vo.Post;

import static semi.common.JDBCTemplate.*;

public class PostDao {
	
	private Properties prop = new Properties();
	
	public PostDao() {
		String filePath = PostDao.class.getResource("/db/sql/post-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int selectPostCount(Connection conn) {
		int postList = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPostCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				postList = rset.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return postList;
	}

	public ArrayList<Post> selectPostList(Connection conn, PageInfo postPi) {
		ArrayList<Post> list = new ArrayList<Post>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPostList");

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (postPi.getCurrentPage()-1) * postPi.getBoardLimit() +1;
			int endRow = startRow + postPi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Post(rset.getInt("POST_NO"),
								  rset.getString("POST_TITLE"),
								  rset.getString("POST_CONTENT"),
								  rset.getString("M_ID"),
								  rset.getString("M_NAME"),
								  rset.getInt("POST_RECOMMEND"),
								  rset.getDate("POST_DATE")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	
		return list;
	}

	public int deletePost(Connection conn, int postNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql  =prop.getProperty("deletePost");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, postNo);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			
			
		return result;
	}

}
