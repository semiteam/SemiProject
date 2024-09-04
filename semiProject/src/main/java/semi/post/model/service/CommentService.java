package semi.post.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import semi.post.model.dao.CommentDao;
import semi.post.model.vo.Comment;
import static semi.common.JDBCTemplate.*;

public class CommentService {

    // 댓글 저장 메서드
    public Comment saveComment(int postId, String content) {
        Connection conn = getConnection();
        
        // CommentDao를 통해 댓글 저장
        int result = new CommentDao().insertComment(conn, postId, content);
        Comment newComment = null;

        if (result > 0) {
            commit(conn);
            newComment = new Comment();
            newComment.setPostId(postId);
            newComment.setContent(content);
            // 생성된 댓글 정보를 반환
        } else {
            rollback(conn);
        }

        close(conn);
        return newComment;
    }

    // 특정 게시물의 모든 댓글을 조회하는 메서드
    public ArrayList<Comment> getCommentsByPostId(int postId) {
        Connection conn = getConnection();
        ArrayList<Comment> commentList = new CommentDao().getCommentsByPostId(conn, postId);
        close(conn);
        return commentList;
    }

    // 댓글 삭제 메서드
    public int deleteComment(int commentId) {
        Connection conn = getConnection();
        int result = new CommentDao().deleteComment(conn, commentId);

        if (result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }

        close(conn);
        return result;
    }
}