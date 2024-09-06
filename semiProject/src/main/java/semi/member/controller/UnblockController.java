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
 * Servlet implementation class UnblockController
 */
@WebServlet("/unblock.ad")
public class UnblockController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UnblockController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int mNo = Integer.parseInt(request.getParameter("mNo"));
		
		
		HttpSession session = request.getSession();
		
		if(!(new MemberService().memberStatus(mNo))) {
			session.setAttribute("alertMsg", "차단되어있지 않은 이용자입니다.");
			response.sendRedirect(request.getContextPath()+"/adminList.ad?cpage=1&pCpage=1");
		}else {
			int result = new MemberService().unblockMember(mNo);
			if(result>0) {
				session.setAttribute("alertMsg", "차단이 해제되었습니다.");
				
			}else {
				session.setAttribute("alertMsg", "해제가 실패하였습니다. 다시 확인해주세요.");
			}
			
			response.sendRedirect(request.getContextPath()+"/adminList.ad?cpage=1&pCpage=1");	
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
