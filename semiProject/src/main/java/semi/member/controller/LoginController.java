package semi.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.admin.model.service.AdminService;
import semi.admin.model.vo.Admin;
import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.ad")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mId = request.getParameter("mId");
		String mPwd = request.getParameter("mPwd");
		
		Member loginUser = new MemberService().loginMember(mId, mPwd);
		
		HttpSession session = request.getSession();
		
		if(loginUser == null) {
			Admin loginAdmin = new AdminService().loginAdmin(mId, mPwd);
			
			if (loginAdmin == null) {
				session.setAttribute("alertMsg", "로그인에 실패하였습니다.");
				
				response.sendRedirect(request.getContextPath() + "/goLogin.me");
			} else {
				session.setAttribute("loginAdmin", loginAdmin);
	            session.setAttribute("alertMsg", loginAdmin.getaNickname() + "님의 방문을 환영합니다");
	            
	          
	            response.sendRedirect(request.getContextPath() + "/adminList.ad?cpage=1");
			}
		} else {
			session.setAttribute("loginUser", loginUser);
            session.setAttribute("alertMsg", loginUser.getmNickname() + "님의 방문을 환영합니다");
            
            response.sendRedirect(request.getContextPath() + "/afterLogin.me");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
