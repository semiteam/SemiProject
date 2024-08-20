package semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.member.model.dao.MemberDao;
import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class BlockController
 */
@WebServlet("/block.ad")
public class BlockController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlockController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// 업데이트로 멤버 블락시킨다음 다시 adminList.ad?cpage=1로 이동시키면 됨
		
			request.setCharacterEncoding("utf-8");
			
			int mNo = Integer.parseInt(request.getParameter("mNo"));
			
			HttpSession session = request.getSession();
			
			
			if(new MemberService().memberStatus(mNo)) {
				session.setAttribute("alertMsg", "이미차단된 사용자입니다");
				response.sendRedirect(request.getContextPath()+"/adminList.ad?cpage=1");
			}else {
				int result = new MemberService().blockMember(mNo);
				if(result>0) {
					session.setAttribute("alertMsg", "성공적으로 차단되었습니다.");
					
				}else {
					session.setAttribute("alertMsg", "차단에 실패하였습니다. 다시 확인해주세요.");
				}
				
				response.sendRedirect(request.getContextPath()+"/adminList.ad?cpage=1");	
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
