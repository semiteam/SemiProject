package semi.member.model.service;
import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCTemplate.*;

import semi.common.model.vo.PageInfo;
import semi.member.model.dao.MemberDao;
import semi.member.model.vo.Member;


public class MemberService {

	public Member loginMember(String mId, String mPwd) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, mId, mPwd);
		
		close(conn);
		
		
		return m;
	}
	
	public Member updateMember(Member m) {
		
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn,m);
		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			//updateMem = new MemberDao().selectMember(conn,m.getmId());
		}else {
			rollback(conn);
		}
		System.out.println(updateMem + "서비스");
		close(conn);
		return updateMem;
	
	}

	
	

	public int selectMemberCount() {
		
		Connection conn = getConnection();
		
		int listCount = new MemberDao().selectMemberCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Member> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectList(conn,pi);
		
		close(conn);
		
		return list;
	}

}
