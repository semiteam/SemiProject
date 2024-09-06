package semi.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import javax.swing.event.AncestorListener;

import static semi.common.JDBCTemplate.*;

import semi.common.model.vo.PageInfo;
import semi.member.model.vo.Commentery;
import semi.member.model.vo.Member;


public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, String mId, String mPwd) {
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mId);
			pstmt.setString(2, mPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("M_NO"),
							   rset.getString("M_NAME"),
							   rset.getString("M_ID"),
							   rset.getString("M_NICKNAME"),
							   rset.getString("M_PWD"),
							   rset.getString("M_RRN"),
							   rset.getString("M_PHONE"),
							   rset.getString("M_EMAIL"),
							   rset.getString("M_ADDRESS"),
							   rset.getDate("M_DATE"),
							   rset.getDate("M_MODIFY"),
							   rset.getString("M_STATUS"),
							   rset.getInt("M_REPORT"),
							   rset.getString("M_GRADE"),
							   rset.getString("M_PROFILE"),
							   rset.getString("postal_code"),
							   rset.getString("basic_address"),
							   rset.getString("detailed_address"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	public int insertMember(Connection conn, Member m) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getmName());
			pstmt.setString(2, m.getmId());
			pstmt.setString(3, m.getmNickname());
			pstmt.setString(4, m.getmPwd());
			pstmt.setString(5, m.getmRrn());
			pstmt.setString(6, m.getmPhone());
			pstmt.setString(7, m.getmEmail());
			pstmt.setString(8, m.getmAddress());
			pstmt.setString(9, m.getmProfile());
			pstmt.setString(10, m.getPostalCode());
			pstmt.setString(11, m.getBasicAddress());
			pstmt.setString(12, m.getDetailedAddress());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
		
		

	public int selectMemberCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Member> selectList(Connection conn, PageInfo pi) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("M_NO"),
								   rset.getString("M_NAME"),
								   rset.getString("M_ID"),
								   rset.getString("M_NICKNAME"),
								   rset.getString("M_PWD"),
								   rset.getString("M_RRN"),
								   rset.getString("M_PHONE"),
								   rset.getString("M_EMAIL"),
								   rset.getString("M_ADDRESS"),
								   rset.getDate("M_DATE"),
								   rset.getDate("M_MODIFY"),
								   rset.getString("M_STATUS"),
								   rset.getInt("M_REPORT"),
								   rset.getString("M_GRADE"),
								   rset.getString("M_PROFILE"),
								   rset.getString("postal_code"),
								   rset.getString("basic_address"),
								   rset.getString("detailed_address"))
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

	
	public Member selectMember(Connection conn, String mId) {
	    Member m = null;
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;

	    String sql = prop.getProperty("selectMember");

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, mId);  // 업데이트된 회원의 ID 사용

	        rset = pstmt.executeQuery();
	        if (rset.next()) {
	            m = new Member(rset.getInt("M_NO"),
	                           rset.getString("M_NAME"),
	                           rset.getString("M_ID"),
	                           rset.getString("M_NICKNAME"),
	                           rset.getString("M_PWD"),
	                           rset.getString("M_PHONE"),
	                           rset.getString("M_EMAIL"),
	                           rset.getString("M_ADDRESS"),
	                           rset.getDate("M_DATE"),
	                           rset.getDate("M_MODIFY"),
	                           rset.getString("M_STATUS"),
	                           rset.getInt("M_REPORT"),
	                           rset.getString("M_GRADE"),
	                           rset.getString("M_PROFILE"),
	                           rset.getString("postal_code"),
							   rset.getString("basic_address"),
							   rset.getString("detailed_address")
	                           );
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }
	    return m;
	}

	public int blockMember(Connection conn, int mNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("blockMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int unblockMember(Connection conn, int mNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("unblockMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public boolean memberStatus(Connection conn, int mNo) {
		boolean mStatus = false;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("memberStatus");
		
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, mNo);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					mStatus = "B".equals(rset.getString("M_STATUS"));
				}
			} catch (SQLException e) {
	
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}

		return mStatus;
	}

	public ArrayList<Commentery> selectCommnetery(Connection conn) {
		ArrayList<Commentery> cList = new ArrayList<Commentery>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCommnetery");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				cList.add(new Commentery(rset.getInt("C_NO"),
						   rset.getInt("M_NO"),
						   rset.getString("C_CONTENT"),
						   rset.getDate("C_DATE"),
						   rset.getString("C_TYPE"),
						   rset.getString("C_STATUS"))
						);	
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return cList;
	}


	
	
	
    
	
	public Member kakaoLoginMember(Connection conn, String userId) {
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("kakaoLoginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("M_NO"),
						   rset.getString("M_NAME"),
						   rset.getString("M_ID"),
						   rset.getString("M_NICKNAME"),
						   rset.getString("M_PWD"),
						   rset.getString("M_RRN"),
						   rset.getString("M_PHONE"),
						   rset.getString("M_EMAIL"),
						   rset.getString("M_ADDRESS"),
						   rset.getDate("M_DATE"),
						   rset.getDate("M_MODIFY"),
						   rset.getString("M_STATUS"),
						   rset.getInt("M_REPORT"),
						   rset.getString("M_GRADE"),
						   rset.getString("M_PROFILE"),
						   rset.getString("postal_code"),
						   rset.getString("basic_address"),
						   rset.getString("detailed_address"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
	public int insertKakaoMember(Connection conn, Member m) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getmName());
			pstmt.setString(2, m.getmId());
			pstmt.setString(3, m.getmNickname());
			pstmt.setString(4, m.getmPwd());
			pstmt.setString(5, m.getmRrn());
			pstmt.setString(6, m.getmPhone());
			pstmt.setString(7, m.getmEmail());
			pstmt.setString(8, m.getmAddress());
			pstmt.setString(9, m.getmProfile());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int idCheck(Connection conn, String checkId) {
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	public Member idFindSearch(Connection conn, String name, String email) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idFindSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				
				m.setmNo(rset.getInt("m_no"));
				m.setmId(rset.getString("m_id"));
				
				
			}
			
		} catch (SQLException e) {
			 
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	
	
	public int checkId(Connection conn, String mId) {
	    int count = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    
	    String sql = prop.getProperty("checkId"); 

	    try {
	        pstmt = conn.prepareStatement(sql); 
	        pstmt.setString(1, mId); 
	       
	        rset = pstmt.executeQuery();
	        
	        if (rset.next()) {
	            count = rset.getInt("count");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }
	   
	    return count;
	    
	}
	
	public int updateMember(Connection conn, Member member) {
	    int result = 0;
	    PreparedStatement pstmt = null;

	    try {
	        // 기존의 업데이트 SQL 쿼리
	        String sql = prop.getProperty("updateMember");
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, member.getmNickname());
	        pstmt.setString(2, member.getmPwd());
	        pstmt.setString(3, member.getmPhone());
	        pstmt.setString(4, member.getmEmail());
	        pstmt.setString(5, member.getmAddress());
	        pstmt.setString(6, member.getmId());

	        result = pstmt.executeUpdate();  // 업데이트 수행

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(pstmt);
	    }

	    return result;  // 결과값을 반환
	}

	
	  public int checkNickname(Connection conn, String nickname) {
	        int count = 0;
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;

	        String sql = "SELECT COUNT(*) FROM MEMBER WHERE M_NICKNAME = ?";

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, nickname);
	            rset = pstmt.executeQuery();

	            if (rset.next()) {
	                count = rset.getInt(1);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return count;
	    }
	  
	  public int updateAddress(Connection conn, Member member) {
		    int result = 0;
		    PreparedStatement pstmt = null;

		    String sql = prop.getProperty("updateAddress");

		    try {
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setString(1, member.getPostalCode());
	            pstmt.setString(2, member.getBasicAddress());
	            pstmt.setString(3, member.getDetailedAddress());
	            pstmt.setString(4, member.getmId());
		       

		        result = pstmt.executeUpdate();
		        
		        

		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        close(pstmt);
		    }

		    return result;
		}
	  
	  public int deleteMember(Connection conn, String userId) {
	        int result = 0;
	        PreparedStatement pstmt = null;
	        
	        
	        String sql = prop.getProperty("deleteMember");
	        
	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, userId);
	            result = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(pstmt);
	        }
	        
	        return result;
	    }
	  
	  public Member findMemberByDetails(Connection conn, String userId, String name, String birth) {
	        Member member = null;
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;

	        String sql = prop.getProperty("findMemberByDetails");

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, userId);
	            pstmt.setString(2, name);
	            pstmt.setString(3, birth);

	            rset = pstmt.executeQuery();

	            if (rset.next()) {
	                member = new Member(
	                        rset.getInt("M_NO"),
	                        rset.getString("M_NAME"),
	                        rset.getString("M_ID"),
	                        rset.getString("M_NICKNAME"),
	                        rset.getString("M_PWD"), // 비밀번호 정보 가져옴
	                        rset.getString("M_RRN"),
	                        rset.getString("M_PHONE"),
	                        rset.getString("M_EMAIL"),
	                        rset.getString("M_ADDRESS"),
	                        rset.getDate("M_DATE"),
	                        rset.getDate("M_MODIFY"),
	                        rset.getString("M_STATUS"),
	                        rset.getInt("M_REPORT"),
	                        rset.getString("M_GRADE"),
	                        rset.getString("M_PROFILE")
	                         
	                );
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return member;
	    }
	  
	  public Member findMemberById(Connection conn, String userId) {
	        Member member = null;
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        String sql = "SELECT * FROM MEMBER WHERE M_ID = ?";

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, userId);
	            rset = pstmt.executeQuery();

	            if (rset.next()) {
	                member = new Member(rset.getInt("M_NO"),
	                        rset.getString("M_NAME"),
	                        rset.getString("M_ID"),
	                        rset.getString("M_NICKNAME"),
	                        rset.getString("M_PWD"), 
	                        rset.getString("M_RRN"),
	                        rset.getString("M_PHONE"),
	                        rset.getString("M_EMAIL"),
	                        rset.getString("M_ADDRESS"),
	                        rset.getDate("M_DATE"),
	                        rset.getDate("M_MODIFY"),
	                        rset.getString("M_STATUS"),
	                        rset.getInt("M_REPORT"),
	                        rset.getString("M_GRADE"),
	                        rset.getString("M_PROFILE"));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return member;
	    }

	    public Member findMemberByName(Connection conn, String userId, String name) {
	        Member member = null;
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        String sql = "SELECT * FROM MEMBER WHERE M_ID = ? AND M_NAME = ?";

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, userId);
	            pstmt.setString(2, name);
	            rset = pstmt.executeQuery();

	            if (rset.next()) {
	                member = new Member(rset.getInt("M_NO"),
	                        rset.getString("M_NAME"),
	                        rset.getString("M_ID"),
	                        rset.getString("M_NICKNAME"),
	                        rset.getString("M_PWD"), 
	                        rset.getString("M_RRN"),
	                        rset.getString("M_PHONE"),
	                        rset.getString("M_EMAIL"),
	                        rset.getString("M_ADDRESS"),
	                        rset.getDate("M_DATE"),
	                        rset.getDate("M_MODIFY"),
	                        rset.getString("M_STATUS"),
	                        rset.getInt("M_REPORT"),
	                        rset.getString("M_GRADE"),
	                        rset.getString("M_PROFILE"));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return member;
	    }

	    public Member findMemberByBirth(Connection conn, String userId, String birth) {
	        Member member = null;
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        String sql = "SELECT * FROM MEMBER WHERE M_ID = ? AND SUBSTR(M_RRN, 1, 6) = ?";

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, userId);
	            pstmt.setString(2, birth);
	            rset = pstmt.executeQuery();

	            if (rset.next()) {
	                member = new Member(rset.getInt("M_NO"),
	                        rset.getString("M_NAME"),
	                        rset.getString("M_ID"),
	                        rset.getString("M_NICKNAME"),
	                        rset.getString("M_PWD"), 
	                        rset.getString("M_RRN"),
	                        rset.getString("M_PHONE"),
	                        rset.getString("M_EMAIL"),
	                        rset.getString("M_ADDRESS"),
	                        rset.getDate("M_DATE"),
	                        rset.getDate("M_MODIFY"),
	                        rset.getString("M_STATUS"),
	                        rset.getInt("M_REPORT"),
	                        rset.getString("M_GRADE"),
	                        rset.getString("M_PROFILE"));  
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return member;
	    }
	    
	 // ID 유효성 검사
	    public boolean isUserIdValid(Connection conn, String userId) {
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        boolean isValid = false;
	        String sql = prop.getProperty("checkUserId");

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, userId);
	            rset = pstmt.executeQuery();
	            if (rset.next()) {
	                isValid = rset.getInt(1) > 0; // ID가 존재하면 true
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return isValid;
	    }

	    // 이름 유효성 검사 (아이디와 이름이 매칭되는지 확인)
	    public boolean isNameValid(Connection conn, String userId, String name) {
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        boolean isValid = false;
	        String sql = prop.getProperty("checkName");

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, userId);
	            pstmt.setString(2, name);
	            rset = pstmt.executeQuery();
	            if (rset.next()) {
	                isValid = rset.getInt(1) > 0; // 이름이 일치하면 true
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return isValid;
	    }

	    // 생년월일 유효성 검사 (아이디와 생년월일이 매칭되는지 확인)
	    public boolean isBirthValid(Connection conn, String userId, String birth) {
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        boolean isValid = false;
	        String sql = prop.getProperty("checkBirth");

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, userId);
	            pstmt.setString(2, birth);
	            rset = pstmt.executeQuery();
	            if (rset.next()) {
	                isValid = rset.getInt(1) > 0; // 생년월일이 일치하면 true
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return isValid;
	    }
	    
	    public int updatePassword(Connection conn, String userId, String newPwd) {
	        int result = 0;
	        PreparedStatement pstmt = null;

	        String sql = "UPDATE MEMBER SET M_PWD = ? WHERE M_ID = ?";
	        
	        

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, newPwd);
	            pstmt.setString(2, userId);

	            result = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(pstmt);
	        }
	        
	        

	        return result;
	    }
}
