package semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class SignUpController
 */
@WebServlet("/signUp.me")
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		
		// 회원가입 폼에서 전달된 값 가져오기
		String mName = request.getParameter("mName");
		String mId = request.getParameter("mId");
		String mNn = request.getParameter("mNn");
		String mPwd = request.getParameter("mPwd");
		String mRrn = request.getParameter("mBirthday1") + request.getParameter("mBirthday2");
		String mPhone = request.getParameter("mPhone");
		String mMail = request.getParameter("mMail1");
		String mAddress = request.getParameter("mAddress1") + " " + request.getParameter("mAddress2") + " " + request.getParameter("mAddress3");
		String mProfile = request.getParameter("mProfile");

		// 기본 프로필 이미지 설정
		if (mProfile == null || mProfile.isEmpty()) {
			mProfile = "resouces/img/basicProfile.png";
		}
		
		// 닉네임이 입력되지 않았을 경우 아이디를 닉네임으로 설정
		if (mNn == null || mNn.trim().isEmpty()) {
			mNn = mId;
		}
		
		// 주소
		String postalCode = request.getParameter("mAddress1");
		String basicAddress = request.getParameter("mAddress2");
		String detailedAddress = request.getParameter("mAddress3");

		// Member 객체 생성
		Member m = new Member(mName, mId, mNn, mPwd, mRrn, mPhone, mMail, mAddress, mProfile, postalCode, basicAddress, detailedAddress);
		
		// 서비스 로직 호출 및 결과 확인
		int result = new MemberService().insertMember(m);
		
		String alertMsg;
		if (result > 0) {
			alertMsg = "회원 가입이 성공적으로 완료되었습니다!";
		} else {
			alertMsg = "회원 가입에 실패하였습니다.";
		}
		
		// 세션에 결과 메시지 저장 후 리다이렉트
		request.getSession().setAttribute("alertMsg", alertMsg);
		response.sendRedirect(request.getContextPath());
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
