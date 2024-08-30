package semi.landmark.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semi.landmark.model.vo.Landmark;

import static semi.common.JDBCTemplate.*;

public class LandmarkDao {
	private Properties prop = new Properties();
	
	public LandmarkDao() {
		String filePath = LandmarkDao.class.getResource("/db/sql/landmark-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Landmark> selectLandmark(Connection conn, String value) {
		ArrayList<Landmark> list = new ArrayList<Landmark>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLandmark");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, value);
			pstmt.setString(2, value);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new Landmark(
									  rset.getString("LANDMARK_NAME"),
									  rset.getString("LANDMARK_CITY")
									 )
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int insertLandmark(Connection conn, String landmarkName, String landmarkCity) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertLandmark");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, landmarkName);
			pstmt.setString(2, landmarkCity);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
