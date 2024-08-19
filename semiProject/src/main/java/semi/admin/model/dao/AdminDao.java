package semi.admin.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import semi.admin.model.vo.Admin;

import static semi.common.JDBCTemplate.*;

public class AdminDao {
	private Properties prop = new Properties();
	
	public AdminDao() {
		String filePath = AdminDao.class.getResource("/db/sql/admin-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Admin AdminService(Connection conn, String aId, String aPwd) {
		Admin loginAdmin = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, aId);
			pstmt.setString(2, aPwd);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				loginAdmin = new Admin(rset.getInt("admin_no"),
									   rset.getString("admin_id"),
									   rset.getString("admin_pwd"),
									   rset.getString("admin_nickname"),
									   rset.getString("admin_status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginAdmin;
	}
}
