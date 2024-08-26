package semi.reply.model.dao;

import static semi.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class ReplyDao {
	
	private Properties prop = new Properties();
	
	public ReplyDao() {
		String filePath = ReplyDao.class.getResource("/db/sql/reply-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
