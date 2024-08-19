package semi.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static semi.common.JDBCTemplate.*;

import semi.common.model.vo.PageInfo;
import semi.member.model.vo.Member;


public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, String mId, String mPwd) {
		Member m = null;
		
		PreparedStatement pstmt = null;
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
			pstmt.setString(2, m.getmPwd());
			pstmt.setString(3, m.getmPhone());
			pstmt.setString(4, m.getmEmail());
			pstmt.setString(5, m.getmId());
			
			result = pstmt.executeUpdate();
			
			System.out.println("결과 : " + result);
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println(m.getmNickname());
		System.out.println(m.getmPwd());
		System.out.println(m.getmPhone());
		System.out.println(m.getmEmail());
		System.out.println(m.getmId());
		return result;
	}
	
	
		
		
	public ArrayList<Member> selectMemberList(Connection conn) {
		ArrayList<Member> list = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    
	    String sql = prop.getProperty("selectMemberList");
	    
	    try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				 Member m = new Member(rset.getInt("M_NO"),
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
				 list.add(m);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int selectMemberCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Member> selectList(Connection conn, PageInfo pi) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("M_NO"),
									rset.getString("M_NAME"),
									rset.getString("M_ID"),
									rset.getString("M_STATUS"),
									rset.getInt("M_REPORT"),
									rset.getString("M_GRADE")));

			}
			
		} catch (SQLException e) {
		
			e.printStackTrace();

		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	
	}

	public Member selectMember(Connection conn, String getmId) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		try {
			pstmt = conn.prepareStatement(sql);
			
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
			 
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
}
