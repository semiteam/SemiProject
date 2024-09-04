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
    
    public Member updateMember(Member member) {
        Connection conn = getConnection();  

        int result = new MemberDao().updateMember(conn, member); 

        Member updatedMember = null; 

        if (result > 0) {  
            commit(conn);  
            updatedMember = new MemberDao().selectMember(conn, member.getmId());  
        } else {
            rollback(conn);
        }

        close(conn);  

        return updatedMember;  
    }
    
    public int checkNickname(String nickname) {
        Connection conn = getConnection();
        int result = new MemberDao().checkNickname(conn, nickname);
        close(conn);
        return result;
    }
}
