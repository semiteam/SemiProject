package semi.schedule.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCTemplate.*;

import semi.detailSchedule.model.dao.DetailScheduleDao;
import semi.detailSchedule.model.vo.DetailSchedule;
import semi.schedule.model.dao.ScheduleDao;
import semi.schedule.model.vo.Schedule;

public class ScheduleService {

	public int insertSchedule(Schedule sd) {
		Connection conn = getConnection();
		
		int result = new ScheduleDao().insertSchedule(conn, sd);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Schedule> selectSchedule(int mno) {
		Connection conn = getConnection();
		
		ArrayList<Schedule> list = new ScheduleDao().selectSchedule(conn, mno);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Schedule> selectDays(int mno, int sno) {
		Connection conn = getConnection();
		
		ArrayList<Schedule> days = new ScheduleDao().selectDays(conn, mno, sno);
		
		close(conn);
		
		return days;
	}
}
