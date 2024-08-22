package semi.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static semi.common.JDBCTemplate.*;
import semi.member.model.vo.Member;

public class KakaoDao {

    private Properties prop = new Properties();

    public KakaoDao() {
        String filePath = KakaoDao.class.getResource("/db/sql/kakao-mapper.xml").getPath();
        try {
            prop.loadFromXML(new FileInputStream(filePath));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public Member findMemberByKakaoId(Connection conn, String kakaoId) {
        Member member = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("findMemberByKakaoId");
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, kakaoId);

            rset = pstmt.executeQuery();

            if (rset.next()) {
                member = new Member();
                member.setmId(rset.getString("M_ID"));
                member.setmNickname(rset.getString("M_NICKNAME"));
                member.setmEmail(rset.getString("EMAIL"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }

        return member;
    }

    public int insertKakaoUser(Connection conn, String kakaoId, String mId, String email, String nickname) {
        int result = 0;
        PreparedStatement pstmt = null;

        String sql = "INSERT INTO KAKAO_USER (KAKAO_ID, M_ID, EMAIL, NICKNAME) VALUES (?, ?, ?, ?)";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, kakaoId);  // KAKAO_ID 값이 NULL이 아니어야 함
            pstmt.setString(2, mId);
            pstmt.setString(3, email);
            pstmt.setString(4, nickname);

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;
    }
}
