package semi.member.model.service;
import java.sql.Connection;
import static semi.common.JDBCTemplate.*;

import semi.member.model.dao.MemberDao;
import semi.member.model.vo.Member;


public class MemberService {

	public Member loginMember(String mId, String mPwd) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, mId, mPwd);
		
		close(conn);
		
		
		return m;
	}

}
