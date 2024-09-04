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
							   rset.getString("M_RRN"),
							   rset.getString("M_PHONE"),
							   rset.getString("M_EMAIL"),
							   rset.getString("M_ADDRESS"),
							   rset.getDate("M_DATE"),
							   rset.getDate("M_MODIFY"),
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

	public int insertMember(Connection conn, Member m) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getmName());
			pstmt.setString(2, m.getmId());
			pstmt.setString(3, m.getmNickname());
			pstmt.setString(4, m.getmPwd());
			pstmt.setString(5, m.getmRrn());
			pstmt.setString(6, m.getmPhone());
			pstmt.setString(7, m.getmEmail());
			pstmt.setString(8, m.getmAddress());
			pstmt.setString(9, m.getmProfile());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
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
								   rset.getString("M_NICKNAME"),
								   rset.getString("M_PWD"),
								   rset.getString("M_RRN"),
								   rset.getString("M_PHONE"),
								   rset.getString("M_EMAIL"),
								   rset.getString("M_ADDRESS"),
								   rset.getDate("M_DATE"),
								   rset.getDate("M_MODIFY"),
								   rset.getString("M_STATUS"),
								   rset.getInt("M_REPORT"),
								   rset.getString("M_GRADE"),
								   rset.getString("M_PROFILE"))
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
				m = new Member(rset.getInt("M_NO"),
						   rset.getString("M_NAME"),
						   rset.getString("M_ID"),
						   rset.getString("M_NICKNAME"),
						   rset.getString("M_PWD"),
						   rset.getString("M_RRN"),
						   rset.getString("M_PHONE"),
						   rset.getString("M_EMAIL"),
						   rset.getString("M_ADDRESS"),
						   rset.getDate("M_DATE"),
						   rset.getDate("M_MODIFY"),
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

	public int blockMember(Connection conn, int mNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("blockMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mNo);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	
	
	
    
	
	public Member kakaoLoginMember(Connection conn, String userId) {
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("kakaoLoginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("M_NO"),
						   rset.getString("M_NAME"),
						   rset.getString("M_ID"),
						   rset.getString("M_NICKNAME"),
						   rset.getString("M_PWD"),
						   rset.getString("M_RRN"),
						   rset.getString("M_PHONE"),
						   rset.getString("M_EMAIL"),
						   rset.getString("M_ADDRESS"),
						   rset.getDate("M_DATE"),
						   rset.getDate("M_MODIFY"),
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
	
	public int insertKakaoMember(Connection conn, Member m) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getmName());
			pstmt.setString(2, m.getmId());
			pstmt.setString(3, m.getmNickname());
			pstmt.setString(4, m.getmPwd());
			pstmt.setString(5, m.getmRrn());
			pstmt.setString(6, m.getmPhone());
			pstmt.setString(7, m.getmEmail());
			pstmt.setString(8, m.getmAddress());
			pstmt.setString(9, m.getmProfile());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int idCheck(Connection conn, String checkId) {
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	public Member idFindSearch(Connection conn, String name, String email) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idFindSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				
				m.setmNo(rset.getInt("m_no"));
				m.setmId(rset.getString("m_id"));
				
				
			}
			
		} catch (SQLException e) {
			 
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	/*public String pwdFindSearch(Connection conn, String email) {
		String findPwd = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("pwdFindSearch");
	}*/
	
	public int checkId(Connection conn, String mId) {
	    int count = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    
	    String sql = prop.getProperty("checkId"); 

	    try {
	        pstmt = conn.prepareStatement(sql); 
	        pstmt.setString(1, mId); 
	       
	        rset = pstmt.executeQuery();
	        
	        if (rset.next()) {
	            count = rset.getInt("count");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }
	   
	    return count;
	    
	}
	
	public int updateMember(Connection conn, Member member) {
	    int result = 0;
	    PreparedStatement pstmt = null;

	    String sql = prop.getProperty("updateMember"); 

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, member.getmNickname()); 
	        pstmt.setString(2, member.getmPwd());      
	        pstmt.setString(3, member.getmPhone());    
	        pstmt.setString(4, member.getmEmail());    
	        pstmt.setString(5, member.getmId());       

	        result = pstmt.executeUpdate();  

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(pstmt);  
	    }

	    return result;  
	}
	
	public int checkNickname(Connection conn, String nickname) {
	    int count = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;

	    String sql = prop.getProperty("checkNickname"); 

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, nickname);

	        rset = pstmt.executeQuery();

	        if (rset.next()) {
	            count = rset.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }

	    return count;
	}
}
