package semi.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static semi.common.JDBCTemplate.*;
import semi.member.model.vo.Member;


public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, String mId, String mPwd) {
		PreparedStatement pstmt = null;
		Member m = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, mPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("M_NO"),
							   rset.getString("M_NAME"),
							   rset.getString("M_ID"),
							   rset.getString("M_NICKNAME"),
							   rset.getString("M_PWD"),
							   rset.getInt("M_RRN"),
							   rset.getString("M_PHONE"),
							   rset.getString("M_EMAIL"),
							   rset.getString("M_ADDRESS"),
							   rset.getDate("M_DATE"),
							   rset.getString("M_MODIFY"),
							   rset.getString("M_STATUS"),
							   rset.getInt("M_REPORT"),
							   rset.getString("M_GRADE"),
							   rset.getString("M_PROFILE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
	public int updateMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getmNickname());
			pstmt.setString(2, m.getmPhone());
			pstmt.setString(3, m.getmEmail());
			pstmt.setString(4, m.getmId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Member selectMember(Connection conn, String mId) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("m_no"),
						       rset.getString("m_name"),
						       rset.getString("m_id"),
						       rset.getString("m_nickname"),
						       rset.getString("m_pwd"),
						       rset.getInt("m_rrn"),
						       rset.getString("m_phone"),
						       rset.getString("m_email"),
						       rset.getString("m_address"),
						       rset.getDate("m_date"),
						       rset.getString("m_modify"),
						       rset.getString("m_status"),
						       rset.getInt("m_report"),
						       rset.getString("m_grade"),
						       rset.getString("m_profile"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
}
