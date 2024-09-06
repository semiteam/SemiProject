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
 * Servlet implementation class FindPwdController
 */
@WebServlet("/findPwd.me")
public class FindPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 request.setCharacterEncoding("UTF-8");

		    String userId = request.getParameter("userId");
		    String name = request.getParameter("name");
		    String birth = request.getParameter("birth");

		    MemberService memberService = new MemberService();
		    Member member = memberService.findMemberByDetails(userId, name, birth);

		    StringBuilder errorMessage = new StringBuilder();

		    // ID 검증
		    if (!memberService.isUserIdValid(userId)) {
		        errorMessage.append("아이디 ");
		    }

		    // 이름 검증
		    if (!memberService.isNameValid(userId, name)) {
		        if (errorMessage.length() > 0) {
		            errorMessage.append("와 이름 ");
		        } else {
		            errorMessage.append("이름 ");
		        }
		    }

		    // 생년월일 검증
		    if (!memberService.isBirthValid(userId, birth)) {
		        if (errorMessage.length() > 0) {
		            errorMessage.append("와 생년월일 ");
		        } else {
		            errorMessage.append("생년월일 ");
		        }
		    }

		    if (errorMessage.length() > 0) {
		        errorMessage.append("이(가) 일치하지 않습니다.");
		        request.setAttribute("errorMessage", errorMessage.toString());
		        request.getRequestDispatcher("views/member/pwdSearch.jsp").forward(request, response);
		    } else {
		        // 비밀번호 변경 페이지로 userId를 전달
		        request.setAttribute("userId", userId);
		        request.setAttribute("message", "비밀번호를 찾았습니다. 새 비밀번호를 설정해주세요.");
		        request.getRequestDispatcher("views/member/newPwd.jsp").forward(request, response);
		    }
	}

}
