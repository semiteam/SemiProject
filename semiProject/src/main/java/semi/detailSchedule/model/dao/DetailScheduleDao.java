package semi.detailSchedule.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static semi.common.JDBCTemplate.*;
import semi.detailSchedule.model.vo.DetailSchedule;

public class DetailScheduleDao {
	private Properties prop = new Properties();
	
	public DetailScheduleDao() {
		String filePath = DetailScheduleDao.class.getResource("/db/sql/detailSchdule-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<DetailSchedule> selectDetailSchedule(Connection conn, int mno, int sno) {
		ArrayList<DetailSchedule> list = new ArrayList<DetailSchedule>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDetailSchedule");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			pstmt.setInt(2, sno);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				if (rset.getString("D_ELSE") != null) {
					list.add(new DetailSchedule(rset.getInt("D_NO"),
												rset.getString("D_PLACE"),
												rset.getString("D_STIME"),
												rset.getString("D_ETIME"),
												rset.getString("D_ELSE"),
												rset.getDate("D_DATE")
												)
							);
				} else {
					list.add(new DetailSchedule(rset.getInt("D_NO"),
												rset.getString("D_PLACE"),
												rset.getString("D_STIME"),
												rset.getString("D_ETIME"),
												"",
												rset.getDate("D_DATE")
												)
							);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int insertDetail(Connection conn, DetailSchedule ds) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ds.getdPlace());
			pstmt.setTimestamp(2, ds.getdStimeT());
			pstmt.setTimestamp(3, ds.getdEtimeT());
			pstmt.setString(4, ds.getdElse());
			pstmt.setDate(5, ds.getdDate());
			pstmt.setInt(6, ds.getmNo());
			pstmt.setInt(7, ds.getSdNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteDetail(Connection conn, int mno, int dno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dno);
			pstmt.setInt(2, mno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateDetail(Connection conn, DetailSchedule ds) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ds.getdPlace());
			pstmt.setTimestamp(2, ds.getdStimeT());
			pstmt.setTimestamp(3, ds.getdEtimeT());
			pstmt.setString(4, ds.getdElse());
			pstmt.setInt(5, ds.getmNo());
			pstmt.setInt(6, ds.getdNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return result;
	}
}
