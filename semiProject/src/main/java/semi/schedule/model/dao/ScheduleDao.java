package semi.schedule.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class ScheduleDao {
	
	private Properties prop = new Properties();
	
	public ScheduleDao() {
		String filePath = ScheduleDao.class.getResource("/db/sql/schedule-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
