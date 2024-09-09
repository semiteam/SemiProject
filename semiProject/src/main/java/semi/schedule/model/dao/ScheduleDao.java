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
			pstmt.setString(8, sd.getsStatus());
			pstmt.setInt(9, sd.getMno());
			pstmt.setInt(10, sd.getHowlong());
			
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

	public int deleteSchedule(Connection conn, int mno, int sno) {
		int reulst = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteSchedule");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, sno);
			pstmt.setInt(2, mno);
			
			reulst = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return reulst;
	}

	public int updateSchedule(Connection conn, Schedule sd) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateSchedule");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, sd.getsTitle());
			pstmt.setDate(2, sd.getsSdate());
			pstmt.setDate(3, sd.getsEdate());
			pstmt.setInt(4, sd.getHowlong());
			pstmt.setInt(5, sd.getMno());
			pstmt.setInt(6, sd.getsNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int autoUpdateStatus(Connection conn, String status, int sno, int mno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("autoUpdateStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, mno);
			pstmt.setInt(3, sno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Schedule> selectAllSchedule(Connection conn) {
		ArrayList<Schedule> list = new ArrayList<Schedule>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllSchedule");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Schedule(rset.getInt("SD_NO"),
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
									  rset.getString("M_ID")
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

	public ArrayList<Schedule> selectMemberPlan(Connection conn, String search) {
		ArrayList<Schedule> list = new ArrayList<Schedule>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberPlan");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Schedule(rset.getInt("SD_NO"),
									  rset.getString("SD_TITLE"),
									  rset.getString("SD_PLACE"),
									  rset.getString("SD_SDATE"),
									  rset.getString("SD_EDATE"),
									  rset.getString("SD_DESCRIPTION"),
									  rset.getInt("RANGE_NO"),
									  rset.getInt("BGI_NO"),
									  rset.getDate("SD_CDATE"),
									  rset.getString("SD_STATUS"),
									  rset.getInt("M_NO"),
									  rset.getInt("SD_HOWLONG"),
									  rset.getString("M_ID")
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
}
