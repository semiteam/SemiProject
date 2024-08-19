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
		
		String mName = request.getParameter("mName");
		String mId = request.getParameter("mId");
		String mNn = request.getParameter("mNn");
		if (mNn.equals("")) {
			mNn = mId;
		}
		String mPwd = request.getParameter("mPwd");
		String mRrn = request.getParameter("mBirthday1") + request.getParameter("mBirthday2");
		String mPhone = request.getParameter("mPhone");
		String mMail = request.getParameter("mMail1") + "@" + request.getParameter("mMail2");
		String mAddress = request.getParameter("mAddress1") + " " + request.getParameter("mAddress2") + " " + request.getParameter("mAddress3");
		String mProfile = request.getParameter("mProfile");
		if (mProfile == null) {
			mProfile = "resouces/img/basicProfile.png";
		}
		
		Member m = new Member(mName, mId, mNn, mPwd, mRrn, mPhone, mMail, mAddress, mProfile);
		
		int result = new MemberService().insertMember(m);
		
		String alertMsg;
		
		if (result > 0) {
			alertMsg = "회원 가입이 성공적으로 완료되었습니다!";
		} else {
			alertMsg = "회원 가입에 실패하였습니다.";
		}
		
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
