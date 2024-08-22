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
				list.add(new DetailSchedule(rset.getInt("D_NO"),
											rset.getString("D_PLACE"),
											rset.getString("D_STIME"),
											rset.getString("D_ETIME"),
											rset.getString("D_ELSE"),
											rset.getDate("D_DATE")
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
	
	public int insertDetailSchedule() {
		// TO_DATE('2024-08-01 10:00', 'YYYY-MM-DD HH24:MI')
		// TO_DATE('2024-08-01', 'YYYY-MM-DD')
		int result = 0;
		
		return result;
	}
}
