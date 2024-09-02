package semi.admin.model.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Properties;

import semi.admin.model.dao.AdminDao;
import semi.admin.model.vo.Admin;
import static semi.common.JDBCTemplate.*;
import semi.member.model.dao.MemberDao;
import semi.member.model.vo.Member;

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

	public int under10sCount() {
		Connection conn = getConnection();
		
		int count = new AdminDao().under10sCount(conn);
		
		close(conn);
		
		return count;
	}

	public int age20sCount() {
		Connection conn = getConnection();
		int count = new AdminDao().age20sCount(conn);
		
		close(conn);
		
		return count;
	}

	public int age30sCount() {
		Connection conn = getConnection();
		
		int count = new AdminDao().age30sCount(conn);
		
		close(conn);
		
		return count;
	}

	public int over40sCount() {
		Connection conn = getConnection();
		
		int count = new AdminDao().over40sCount(conn);
		
		close(conn);
		
		return count;
	}

	public int questionCount() {
		Connection conn = getConnection();
		
		int count = new AdminDao().qusetionCount(conn);
		
		close(conn);
		
		return count;
	}

	public ArrayList<Member> findMember(String value) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new AdminDao().findMember(conn, value);
		
		close(conn);
		
		return list;
	}
	
}
