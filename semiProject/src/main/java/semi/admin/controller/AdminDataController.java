package semi.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		int mCount = new MemberService().selectMemberCount(); // 전체회원수
		request.setAttribute("mCount", mCount);
		
		int newCount = new AdminService().newCount(); // 신규가입자수 
		request.setAttribute("newCount", newCount);
		
		int manCount = new AdminService().manCount(); // 남자 회원수
		request.setAttribute("manCount", manCount);
		int womanCount = new AdminService().womanCount(); // 여자 회원수
		request.setAttribute("womanCount", womanCount);
		
		request.getRequestDispatcher("views/manager/manager2.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
