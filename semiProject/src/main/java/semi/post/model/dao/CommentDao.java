package semi.post.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import semi.post.model.vo.Comment;
import static semi.common.JDBCTemplate.*;

public class CommentDao {

    // 댓글 삽입 메서드
    public int insertComment(Connection conn, int postId, String content) {
        int result = 0;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO COMMENTS (POST_ID, CONTENT, COMMENT_DATE) VALUES (?, ?, SYSDATE)";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postId);
            pstmt.setString(2, content);

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;
    }

    // 특정 게시물의 모든 댓글 조회 메서드
    public ArrayList<Comment> getCommentsByPostId(Connection conn, int postId) {
        ArrayList<Comment> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = "SELECT * FROM COMMENTS WHERE POST_ID = ? ORDER BY COMMENT_DATE ASC";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postId);

            rset = pstmt.executeQuery();
            while (rset.next()) {
                Comment comment = new Comment();
                comment.setCommentId(rset.getInt("COMMENT_ID"));
                comment.setPostId(rset.getInt("POST_ID"));
                comment.setContent(rset.getString("CONTENT"));
                comment.setDate(rset.getDate("COMMENT_DATE"));

                list.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }

        return list;
    }

    // 댓글 삭제 메서드
    public int deleteComment(Connection conn, int commentId) {
        int result = 0;
        PreparedStatement pstmt = null;
        String sql = "DELETE FROM COMMENTS WHERE COMMENT_ID = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, commentId);

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;
    }
}