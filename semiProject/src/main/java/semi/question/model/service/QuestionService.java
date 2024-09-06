package semi.question.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Properties;

import semi.admin.model.dao.AdminDao;
import semi.common.model.vo.PageInfo;
import semi.member.model.vo.Member;
import semi.question.model.dao.QuestionDao;
import semi.question.model.vo.Question;
import semi.question.model.vo.Reply;

public class QuestionService {

	public int selectQuestionCount() {
		Connection conn = getConnection();
		int count = new QuestionDao().selectQuestionCount(conn);
		
		close(conn);
		
		return count;
	}

	public ArrayList<Question> selectQuestion(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Question> list = new QuestionDao().selectQuestion(conn, pi);
	
		
		close(conn);
		
		return list;
	}

	public int insertQuestion(Question q) {
		Connection conn = getConnection();
		
		int result = new QuestionDao().insertQuestion(conn,q);
		
		close(conn);
		
		return result;
	}

	public Question selectQuestion(int qNo) {
		Connection conn =getConnection();
		
		Question q =new QuestionDao().selectQuestion(conn, qNo);
		
		
		close(conn);
		
		return q;
	}

	public int deleteQuestion(int qNo) {
		Connection conn = getConnection();
		
		int result = new QuestionDao().deleteQuestion(conn, qNo);
		
		close(conn);
		
		return result;
	}

	public int insertReply(Reply r) {
		Connection conn = getConnection();
		
		int result = new QuestionDao().insertReply(conn, r);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Reply> selectReplyList(int qNo) {
		Connection conn = getConnection();
		
		ArrayList<Reply>list = new QuestionDao().selectReplyList(conn, qNo);
		
		close(conn);
		
		return list;
	}

	public int updateQuestion(int qNo) {
		Connection conn = getConnection();
		
		int result = new QuestionDao().updateQuestion(conn,qNo);
		
		close(conn);
		
		return result;
	}


}
