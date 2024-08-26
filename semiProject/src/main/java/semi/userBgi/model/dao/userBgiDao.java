package semi.userBgi.model.dao;

import static semi.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import semi.userBgi.model.vo.UserBgi;

public class userBgiDao {
	private Properties prop = new Properties();
	
	public userBgiDao() {
		String filePath = userBgiDao.class.getResource("/db/sql/userBgi-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertUserBgi(Connection conn, UserBgi ub) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertUserBgi");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ub.getuBgiOname());
			pstmt.setString(2, ub.getuBgiRname());
			pstmt.setString(3, ub.getuBgiPath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public UserBgi selectUserBgiNo(Connection conn, UserBgi ub) {
		UserBgi result = new UserBgi();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectUserBgiNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ub.getuBgiOname());
			pstmt.setString(2, ub.getuBgiRname());
			pstmt.setString(3, ub.getuBgiPath());
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result.setuBgiNo(rset.getInt("UBGI_NO"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
}
