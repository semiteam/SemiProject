package semi.city.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import semi.city.model.dao.CityDao;
import semi.city.model.vo.City;
import static semi.common.JDBCTemplate.*;

public class CityService {

	public ArrayList<City> selectCity(String value) {
		Connection conn = getConnection();
		
		ArrayList<City> list = new CityDao().selectCity(conn, value);
		
		close(conn);
		
		return list;
	}
	
}
