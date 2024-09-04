package semi.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.admin.model.service.AdminService;
import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class AdminDataController
 */
@WebServlet("/adminData.ad")
public class AdminDataController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDataController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		
		if (session.getAttribute("loginAdmin") == null) {
			session.setAttribute("alertMsg", "관리자만 이용 가능한 페이지입니다.");
			
			response.sendRedirect(request.getContextPath());
		} else {
				
			int mCount = new MemberService().selectMemberCount(); // 전체회원수
			request.setAttribute("mCount", mCount);
			
			int newCount = new AdminService().newCount(); // 신규가입자수 
			request.setAttribute("newCount", newCount);
			
			int manCount = new AdminService().manCount(); // 남자 회원수
			request.setAttribute("manCount", manCount);
			
			int womanCount = new AdminService().womanCount(); // 여자 회원수
			request.setAttribute("womanCount", womanCount);
			
			int under10s = new AdminService().under10sCount(); // 10대이하 회원수
			request.setAttribute("under10s", under10s);
			
			int age20s = new AdminService().age20sCount(); // 20대 회원수
			request.setAttribute("age20s", age20s);
			
			int age30s = new AdminService().age30sCount(); // 30대 회원수
			request.setAttribute("age30s", age30s);
			
			int over40s = new AdminService().over40sCount(); // 40대이상 회원수
			request.setAttribute("over40s", over40s);
			
			int nRcount = new AdminService().questionCount();
			request.setAttribute("nRcount", nRcount);
			
			request.getRequestDispatcher("views/admin/admin2.jsp").forward(request, response);
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
