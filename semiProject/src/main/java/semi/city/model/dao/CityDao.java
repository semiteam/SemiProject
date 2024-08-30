package semi.city.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semi.city.model.vo.City;

import static semi.common.JDBCTemplate.*;

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

	public ArrayList<City> selectCity(Connection conn, String value) {
		ArrayList<City> list = new ArrayList<City>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, value);
			pstmt.setString(2, value);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new City(
								  rset.getString("CITY_NAME"),
								  rset.getString("CITY_COUNTRY")
						         )
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int insertCity(Connection conn, String cityName, String countryName) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cityName);
			pstmt.setString(2, countryName);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
