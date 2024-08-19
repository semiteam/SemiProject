package semi.schedule.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import static semi.common.JDBCTemplate.*;
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
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
