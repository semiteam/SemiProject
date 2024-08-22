package semi.member.model.service;
import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCTemplate.*;

import semi.common.model.vo.PageInfo;
import semi.member.model.dao.KakaoDao;
import semi.member.model.dao.MemberDao;
import semi.member.model.vo.Member;


public class MemberService {
	
	private MemberDao memberDao = new MemberDao();
    private KakaoDao kakaoDao = new KakaoDao();

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
	
	public Member loginWithKakao(String kakaoId, String nickname, String email) {
        Connection conn = getConnection();

        // KAKAO_USER 테이블에 사용자가 있는지 확인
        Member loginUser = kakaoDao.findMemberByKakaoId(conn, kakaoId);

        if (loginUser == null) {
            // 사용자가 없다면 MEMBER 및 KAKAO_USER 테이블에 새 사용자 생성
            String newMemberId = memberDao.insertMember1(conn, new Member(nickname, kakaoId, nickname, null, null, null, email, null, null));
            kakaoDao.insertKakaoUser(conn, kakaoId, newMemberId, email, nickname);
            loginUser = memberDao.findMemberById(conn, newMemberId);
        }

        close(conn);
        return loginUser;
    }

}
