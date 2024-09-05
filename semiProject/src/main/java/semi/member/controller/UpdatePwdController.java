package semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.member.model.service.MemberService;

/**
 * Servlet implementation class UpdatePwdController
 */
@WebServlet("/updatePwd.me")
public class UpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");

		    // 폼에서 전달된 userId와 비밀번호
		    String userId = request.getParameter("userId");
		    String newPwd = request.getParameter("newPwd");

		    // 비밀번호 업데이트 처리
		    MemberService memberService = new MemberService();
		    int result = memberService.updatePassword(userId, newPwd);
		   
		    response.setContentType("text/html; charset=UTF-8");
		    
		    if (result > 0) {
		        // 비밀번호 업데이트 성공 시
		    	response.getWriter().write(
		                "<script>" +
		                "alert('비밀번호가 성공적으로 변경되었습니다.');" +
		                "window.location.href='" + request.getContextPath() + "/GoLogin.me';" + // 메인 페이지로 이동
		                "</script>"
		            );
		    } else {
		        // 비밀번호 업데이트 실패 시
		        response.getWriter().write(
		            "<script>" +
		            "alert('비밀번호 변경에 실패했습니다. 다시 시도해주세요.');" +
		            "history.back();" +
		            "</script>"
		        );
		    }
	}

}
