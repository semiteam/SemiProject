package semi.admin.model.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;

import semi.admin.model.dao.AdminDao;
import semi.admin.model.vo.Admin;
import static semi.common.JDBCTemplate.*;
import semi.member.model.dao.MemberDao;

public class AdminService {

	public Admin loginAdmin(String aId, String aPwd) {
		Connection conn = getConnection();
		
		Admin loginAdmin = new AdminDao().AdminService(conn, aId, aPwd);
		
		close(conn);
		
		return loginAdmin;
	}

	public int newCount() {
		 Connection conn = getConnection();
		 
		 int newCount = new AdminDao().newCount(conn);
		 
		 close(conn);
		 
		return newCount;
	}


	public int manCount() {
		Connection conn = getConnection();
		
		int manCount = new AdminDao().manCount(conn);
		
		close(conn);
		
		
		return manCount;
	}

	public int womanCount() {
		Connection conn = getConnection();
		
		int womanCount = new AdminDao().womanCount(conn);
		
		close(conn);
		
		
		return womanCount;
	}
	
}
