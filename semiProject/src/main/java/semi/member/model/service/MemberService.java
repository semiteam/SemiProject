package semi.member.model.service;
import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCTemplate.*;

import semi.common.model.vo.PageInfo;

import semi.member.model.dao.MemberDao;
import semi.member.model.vo.Commentery;
import semi.member.model.vo.Member;


public class MemberService {
	
	

	public Member loginMember(String mId, String mPwd) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, mId, mPwd);
		
		close(conn);
		
		
		return m;
	}

	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
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

	public int blockMember(int mNo) {
		Connection conn = getConnection();
		 
		int result = new MemberDao().blockMember(conn, mNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
			close(conn);
			
			return result;
	}
	
	public int unblockMember(int mNo) {
		Connection conn = getConnection();
		
		int result = new MemberDao().unblockMember(conn,mNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
			close(conn);
			
		return result;
	}
	
    public Member kakaoLoginMember(String userId) {
    	Connection conn = getConnection();
    	
    	Member m = new MemberDao().kakaoLoginMember(conn,userId);
    	
    	close(conn);
    	
    	return m;
    }
    
    public int insertKakaoMember(Member m) {
    	Connection conn = getConnection();
		
		int result = new MemberDao().insertKakaoMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
    }
    
    public int idCheck(String checkId) {
    	
    	Connection conn = getConnection();
		
		int count = new MemberDao().idCheck(conn, checkId);
		
		close(conn);
		
		return count;
    }

    public Member idFindSearch(String name, String email) {
    	
    	Connection conn = getConnection();
    	
    	Member m = new MemberDao().idFindSearch(conn,name,email);
    	
    	close(conn);
    	return m;
    }
    
   /*
    public String pwdFindSearch(String email) {
    	Connection conn = getConnection();
    	
    	String findPwd = new MemberDao().pwdFindSearch(conn,email);
    	
    	close(conn);
    	
    	return findPwd;
    }*/
    
    public int checkId(String mId) {
    	Connection conn = getConnection();
    	
    	int count = new MemberDao().checkId(conn,mId);
    	
    	close(conn);
    	
    	return count;
    }
	// member의 m_status를 확인하는 메소드 B면1 아니면0
	public boolean memberStatus(int mNo) {
		Connection conn = getConnection();
		
		boolean mStatus = new MemberDao().memberStatus(conn, mNo);
		
		close(conn);
		
		return mStatus; 
		
	}

	public ArrayList<Commentery> selectCommentery() {
		Connection conn = getConnection();
		
		ArrayList<Commentery> cList = new MemberDao().selectCommnetery(conn);
		
		close(conn);
		
		return cList;
	}


}
