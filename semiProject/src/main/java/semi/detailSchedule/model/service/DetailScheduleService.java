package semi.detailSchedule.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCTemplate.*;
import semi.detailSchedule.model.dao.DetailScheduleDao;
import semi.detailSchedule.model.vo.DetailSchedule;

public class DetailScheduleService {

	public ArrayList<DetailSchedule> selectDetailSchedule(int mno, int sno) {
		Connection conn = getConnection();
		
		ArrayList<DetailSchedule> list = new DetailScheduleDao().selectDetailSchedule(conn, mno, sno);
		
		close(conn);
		
		return list;
	}

	public int insertDetail(DetailSchedule ds) {
		Connection conn = getConnection();
		
		int result = new DetailScheduleDao().insertDetail(conn, ds);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteDetail(int mno, int dno) {
		Connection conn = getConnection();
		
		int result = new DetailScheduleDao().deleteDetail(conn, mno, dno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
