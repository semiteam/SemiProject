package semi.admin.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semi.admin.model.vo.Admin;
import semi.member.model.vo.Member;
import semi.post.model.vo.Post;
import semi.question.model.vo.Question;

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

	public int newCount(Connection conn) {
		int newCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("newCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				newCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return newCount;
	}

	public int manCount(Connection conn) {
		int manCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("manCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				manCount = rset.getInt("Count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return manCount;
	}

	public int womanCount(Connection conn) {
		int womanCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("womanCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				womanCount = rset.getInt("Count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return womanCount;
	}

	public int under10sCount(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("under10sCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count  = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	public int age20sCount(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("age20sCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count  = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	public int age30sCount(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("age30sCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count  = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	public int over40sCount(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("over40sCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count  = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	public int qusetionCount(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("qusetionCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
		}finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

	public ArrayList<Member> findMember(Connection conn, String value) {
		ArrayList<Member> list = new ArrayList<Member>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findMember");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,value);
			pstmt.setString(2,value);
			
			rset =pstmt.executeQuery();
			
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
									rset.getString("M_PROFILE")));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Post> findPost(Connection conn, String value) {
		ArrayList<Post>list = new ArrayList<Post>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("findPost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,value);
			pstmt.setString(2,value);
			pstmt.setString(3,value);
			pstmt.setString(4,value);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Post(rset.getInt("NO"),
								  rset.getString("M_ID"),
								  rset.getString("TITLE")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Question> findQuestion(Connection conn, String value) {
		
		ArrayList<Question> list = new ArrayList<Question>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("findQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,value);
			pstmt.setString(2,value);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Question(rset.getInt("Q_NO"),
									  rset.getString("M_ID"),
									  rset.getString("Q_TITLE")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
}
