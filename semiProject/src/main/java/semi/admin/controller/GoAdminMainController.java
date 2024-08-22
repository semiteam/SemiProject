package semi.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.common.model.vo.PageInfo;
import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class GoCourseBusanController
 */
@WebServlet(name = "GoAdminMain.ad", urlPatterns = { "/GoAdminMain.ad" })
public class GoAdminMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoAdminMainController() {
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
			int listCount;
			int currentPage;
			int pageLimit;
			int boardLimit;
			int maxPage;
			int startPage;
			int endPage;
			
			listCount = new MemberService().selectMemberCount();
			
			currentPage = 1;
			
			pageLimit = 10;
			
			boardLimit = 6;
			
			maxPage = (int)Math.ceil((double)listCount/boardLimit);
			
			startPage = (currentPage -1 )/pageLimit * pageLimit+1 ;
			
			endPage = startPage + pageLimit  - 1;
			
			if(endPage>maxPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
			
			ArrayList<Member> list = new MemberService().selectList(pi);
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("views/admin/admin1.jsp").forward(request, response);
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
