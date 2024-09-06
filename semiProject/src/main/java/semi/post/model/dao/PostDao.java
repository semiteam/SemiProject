package semi.post.model.dao;

import java.io.Closeable;
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
import semi.post.model.vo.Post;

public class PostDao {
	
	private Properties prop = new Properties();
	
	public PostDao() {
		try {
			prop.loadFromXML(new FileInputStream(PostDao.class.getResource("/db/sql/post-mapper.xml").getPath()));
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	public ArrayList<Post> PostList(Connection conn, PageInfo pi1){
	    
	    ArrayList<Post> list1 = new ArrayList<Post>();
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    
	    String sql = prop.getProperty("PostList"); // SQL 쿼리 가져오기
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        
	        // 페이징 처리를 위한 시작/끝 행 번호 설정
	        int startRow1 = (pi1.getCurrentPage() - 1) * pi1.getBoardLimit() + 1;
	        int endRow1 = startRow1 + pi1.getBoardLimit() - 1;
	        
	        pstmt.setInt(1, startRow1);
	        pstmt.setInt(2, endRow1);
	        
	        rset = pstmt.executeQuery();
	        while(rset.next()) {
	            // ResultSet에서 데이터를 읽어와서 Post 객체에 추가
	            list1.add(new Post(
	                rset.getInt("post_no"),
	                rset.getString("m_id"),
	                rset.getInt("m_no"),
	                rset.getString("m_nickname"),  // 닉네임 추가
	                rset.getString("post_title"),
	                rset.getString("post_content"),
	                rset.getInt("post_count"),
	                rset.getInt("post_recommend"),
	                rset.getDate("post_date"),
	                rset.getDate("post_modifyed")
	            ));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }

	    return list1;
	}
	
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
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
	
	public int increaseCount(Connection conn, int pno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// 
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Post selectPost(Connection conn, int pno) {
	    Post p = null;
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;

	    String sql = prop.getProperty("selectPost");

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, pno);
	        rset = pstmt.executeQuery();
	        if (rset.next()) {
	            p = new Post(
	                rset.getString("m_id"),        // 작성자 ID
	                rset.getInt("post_no"), 
	                rset.getString("post_title"), 
	                rset.getString("post_content"),
	                rset.getInt("post_count"), 
	                rset.getInt("post_recommend"), 
	                rset.getDate("post_date"), 
	                rset.getDate("post_modifyed"), 
	                rset.getString("m_nickname")  // 닉네임 가져오기
	            );
	            // 디버그 로그 추가
	            System.out.println("작성자 닉네임: " + rset.getString("m_nickname"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }

	    return p;
	}
	
	public int updatePost(Connection conn, String title, String content, int pno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, pno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	    // 게시글 삽입 메서드 (이미지 경로 포함)
	    public int insertPost(Connection conn, int mno, String title, String content) {
	        int result = 0;
	        PreparedStatement pstmt = null;
	        String sql = prop.getProperty("insertPost"); // SQL 쿼리 가져오기

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, mno);           // 회원 번호
	            pstmt.setString(2, title);      // 게시글 제목
	            pstmt.setString(3, content);    // 게시글 내용

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
	    
	
	
	public int deletePost(Connection conn, int pno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deletePost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			 
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	

	public ArrayList<Post> searchPosts(Connection conn, String keyword) {
	    ArrayList<Post> list = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;

	    String sql = prop.getProperty("searchPosts");

	    try {
	        pstmt = conn.prepareStatement(sql);
	      
	        pstmt.setString(1, "%" + keyword + "%");
	        pstmt.setString(2, "%" + keyword + "%");

	        rset = pstmt.executeQuery();

	        while (rset.next()) {
	            Post p = new Post();
	            p.setPostNo(rset.getInt("POST_NO"));  // 기존의 "P_NO"를 "POST_NO"로 수정
	            p.setmNo(rset.getInt("M_NO"));        // 또한 "P_NO"가 아닌 "M_NO"로 수정
	            p.setPostTitle(rset.getString("POST_TITLE"));
	            p.setPostContent(rset.getString("POST_CONTENT"));
	            p.setPostDate(rset.getDate("POST_DATE"));
	            p.setPostCount(rset.getInt("POST_COUNT"));
	            p.setPostRecommend(rset.getInt("POST_RECOMMEND"));
	            p.setmId(rset.getString("M_ID"));

	            list.add(p);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }

	    return list;
	}
	public int increaseRecommend(Connection conn, int postNo) {
	    int result = 0;
	    PreparedStatement pstmt = null;
	    
	    String sql = prop.getProperty("increaseRecommend");

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, postNo);
	        result = pstmt.executeUpdate();
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(pstmt);
	    }
	    
	    return result;

	}
	
	public boolean hasRecommended(Connection conn, int postNo, String userId) {
	    boolean result = false;
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    
	    String sql = prop.getProperty("hasRecommended");
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, postNo);
	        pstmt.setString(2, userId);
	        
	        rset = pstmt.executeQuery();
	        if (rset.next() && rset.getInt(1) > 0) {
	            result = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }
	    
	    return result;
	}
	
	public ArrayList<Post> selectPostList(Connection conn, PageInfo postPi) {
	      ArrayList<Post> list = new ArrayList<Post>();
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("selectPostList");

	      try {
	         pstmt = conn.prepareStatement(sql);
	         int startRow = (postPi.getCurrentPage()-1) * postPi.getBoardLimit() +1;
	         int endRow = startRow + postPi.getBoardLimit() -1;
	         
	         pstmt.setInt(1, startRow);
	         pstmt.setInt(2, endRow);
	         
	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	            list.add(new Post(rset.getInt("POST_NO"),
	                          rset.getString("POST_TITLE"),
	                          rset.getString("POST_CONTENT"),
	                          rset.getString("M_ID"),
	                          rset.getString("M_NAME"),
	                          rset.getInt("POST_RECOMMEND"),
	                          rset.getDate("POST_DATE")));
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
