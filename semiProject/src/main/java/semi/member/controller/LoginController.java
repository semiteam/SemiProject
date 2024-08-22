package semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.admin.model.service.AdminService;
import semi.admin.model.vo.Admin;
import semi.common.model.vo.PageInfo;
import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;
import semi.post.model.service.PostService;
import semi.post.model.vo.Post;

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

				int postListCount;
				int postCurrentPage;
				int postPageLimit;
				int postBoardLimit;
				int postMaxPage;
				int postStartPage;
				int postEndPage;
				
				
				postListCount = new PostService().selectPostCount();
				
				postCurrentPage = 1;
				
				postPageLimit = 10;
				
				postBoardLimit = 6;
				postMaxPage = (int) Math.ceil((double) postListCount / postBoardLimit);
				postStartPage = (postCurrentPage - 1) / postPageLimit * postPageLimit + 1;
				postEndPage = postStartPage + postPageLimit - 1;
				if (postEndPage > postMaxPage) {
					postEndPage = postMaxPage;
				}
				
				
				PageInfo postPi = new PageInfo(postListCount, postCurrentPage, postPageLimit, postBoardLimit, postMaxPage, postStartPage, postEndPage);
				ArrayList<Post> postList = new PostService().selectPostList(postPi);

				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
				request.setAttribute("postPi", postPi);
				request.setAttribute("postList", postList);
				
				session.setAttribute("loginAdmin", loginAdmin);
	            session.setAttribute("alertMsg", loginAdmin.getaNickname() + "님의 방문을 환영합니다");
	            
	         
	          request.getRequestDispatcher("views/admin/admin1.jsp").forward(request, response);
			}
		} else {
			session.setAttribute("loginUser", loginUser);
            session.setAttribute("alertMsg", loginUser.getmNickname() + "님의 방문을 환영합니다");
            
            response.sendRedirect(request.getContextPath());
           
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
