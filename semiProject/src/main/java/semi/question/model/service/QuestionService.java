package semi.question.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semi.common.model.vo.PageInfo;
import semi.question.model.dao.QuestionDao;
import semi.question.model.vo.Question;

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

}
