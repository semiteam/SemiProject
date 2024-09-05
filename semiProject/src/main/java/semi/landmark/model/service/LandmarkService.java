package semi.landmark.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCTemplate.*;
import semi.landmark.model.dao.LandmarkDao;
import semi.landmark.model.vo.Landmark;

public class LandmarkService {

	public ArrayList<Landmark> selectLandmark(String value) {
		Connection conn = getConnection();
		
		ArrayList<Landmark> list = new LandmarkDao().selectLandmark(conn, value);
		
		close(conn);
		
		return list;
	}

	public int insertLandmark(String landmarkCity, String landmarkName, String landmarkAddress) {
		Connection conn = getConnection();
		
		int result = new LandmarkDao().insertLandmark(conn, landmarkName, landmarkCity, landmarkAddress);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
