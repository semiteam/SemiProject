package semi.city.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class CityDao {
	private Properties prop = new Properties();
	
	public CityDao() {
		String filePath = CityDao.class.getResource("/db/sql/city-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
