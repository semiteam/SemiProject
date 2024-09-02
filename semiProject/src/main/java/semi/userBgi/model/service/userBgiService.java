package semi.userBgi.model.service;

import java.sql.Connection;

import static semi.common.JDBCTemplate.*;

import semi.userBgi.model.dao.userBgiDao;
import semi.userBgi.model.vo.UserBgi;

public class userBgiService {

	public int insertUserBgi(UserBgi ub) {
		Connection conn = getConnection();
		
		int result = new userBgiDao().insertUserBgi(conn, ub);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public UserBgi selectUserBgiNo(UserBgi ub) {
		Connection conn = getConnection();
		
		UserBgi result = new userBgiDao().selectUserBgiNo(conn, ub);
		
		close(conn);
		
		return result;
	}
	
}
