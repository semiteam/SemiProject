package semi.schedule.model.dao;

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
import semi.schedule.model.vo.Schedule;

public class ScheduleDao {
	
	private Properties prop = new Properties();
	
	public ScheduleDao() {
		String filePath = ScheduleDao.class.getResource("/db/sql/schedule-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertSchedule(Connection conn, Schedule sd) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertSchedule");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, sd.getsTitle());
			pstmt.setString(2, sd.getsPlace());
			pstmt.setDate(3, sd.getsSdate());
			pstmt.setDate(4, sd.getsEdate());
			pstmt.setString(5, sd.getsDescription());
			pstmt.setInt(6, sd.getRangeNo());
			pstmt.setInt(7, sd.getBgiNo());
			pstmt.setInt(8, sd.getMno());
			pstmt.setInt(9, sd.getHowlong());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Schedule> selectSchedule(Connection conn, int mno) {
		ArrayList<Schedule> list = new ArrayList<Schedule>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSchedule");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new Schedule(
									  rset.getInt("SD_NO"),
									  rset.getString("SD_TITLE"),
									  rset.getString("SD_PLACE"),
									  rset.getDate("SD_SDATE"),
									  rset.getDate("SD_EDATE"),
									  rset.getString("SD_DESCRIPTION"),
									  rset.getInt("RANGE_NO"),
									  rset.getInt("BGI_NO"),
									  rset.getDate("SD_CDATE"),
									  rset.getString("SD_STATUS"),
									  rset.getInt("M_NO"),
									  rset.getInt("SD_HOWLONG"),
									  rset.getString("BBGI_PATH"),
									  rset.getString("UBGI_PATH")
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
	
	public ArrayList<Schedule> selectDays(Connection conn, int mno, int sno) {
		ArrayList<Schedule> days = new ArrayList<Schedule>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDays");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			pstmt.setInt(2, sno);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				days.add(new Schedule(rset.getDate("SD_SDATE"),
									  rset.getDate("SD_EDATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return days;
	}
}
