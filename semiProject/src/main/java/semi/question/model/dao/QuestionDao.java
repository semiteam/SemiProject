package semi.question.model.dao;

import static semi.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semi.common.model.vo.PageInfo;
import semi.member.model.vo.Member;
import semi.question.model.vo.Question;
import semi.question.model.vo.Reply;

public class QuestionDao {
	
	private Properties prop = new Properties();
	
	public QuestionDao() {
		String filePath = QuestionDao.class.getResource("/db/sql/question-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int selectQuestionCount(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQuestionCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

	public ArrayList<Question> selectQuestion(Connection conn, PageInfo pi) {
		ArrayList<Question> list = new ArrayList<Question>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQuestionList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Question(rset.getInt("Q_NO"),
									  rset.getString("M_ID"),
									  rset.getString("Q_TITLE"),
									  rset.getString("Q_CONTENT"),
									  rset.getDate("Q_DATE"),
									  rset.getString("Q_STATUS"),
									  rset.getString("Q_ANSWER"),
									  rset.getInt("Q_PWD")));
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

	public int insertQuestion(Connection conn, Question q) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("insertQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,q.getmNo());
			pstmt.setString(2, q.getQtitle());
			pstmt.setString(3, q.getqContent());
			pstmt.setInt(4, q.getqPwd());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public Question selectQuestion(Connection conn, int qNo) {
		Question q = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		
		String sql = prop.getProperty("selectQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new Question(rset.getInt("Q_NO"),
								 rset.getInt("M_NO"),
								 rset.getString("Q_TITLE"),
								 rset.getString("Q_CONTENT"),
								 rset.getDate("Q_DATE"),
								 rset.getString("Q_STATUS"),
								 rset.getString("Q_ANSWER"),
								 rset.getInt("Q_PWD"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
	
		
		
		return q;
	
	
}

	public int deleteQuestion(Connection conn, int qNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql =prop.getProperty("deleteQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertReply(Connection conn, Reply r) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReply");
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getqNo());
			pstmt.setString(2, r.getrContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Reply> selectReplyList(Connection conn, int qNo) {
		ArrayList<Reply>list = new ArrayList<Reply>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("R_NO"),
								   rset.getString("R_CONTENT"),
								   rset.getString("ADMIN_ID")));
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

	public int updateQuestion(Connection conn, int qNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("updateQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qNo);
			
			result = pstmt.executeUpdate();		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
