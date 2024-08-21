package semi.detailSchedule.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;

import semi.detailSchedule.model.vo.DetailSchedule;

public class DetailScheduleDao {
	private Properties prop = new Properties();
	
	public DetailScheduleDao() {
		String filePath = DetailScheduleDao.class.getResource("/db/sql/schedule-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<DetailSchedule> selectDetailSchedule() {
		
	}
	
	public int insertDetailSchedule() {
		// TO_DATE('2024-08-01 10:00', 'YYYY-MM-DD HH24:MI')
		// TO_DATE('2024-08-01', 'YYYY-MM-DD')
	}

}
