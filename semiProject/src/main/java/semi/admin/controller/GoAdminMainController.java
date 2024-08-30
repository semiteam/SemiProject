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
import semi.member.model.vo.Commentery;
import semi.member.model.vo.Member;
import semi.post.model.service.PostService;
import semi.post.model.vo.Post;
import semi.question.model.service.QuestionService;
import semi.question.model.vo.Question;

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
			
			boardLimit = 3;
			
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
			int questionListCount;
			
			
			
			postListCount = new PostService().selectPostCount();
			questionListCount = new QuestionService().selectQuestionCount();
			
			int resultCount = Math.max(postListCount, questionListCount);
			
			postCurrentPage = 1;
			
			postPageLimit = 10;
			
			postBoardLimit = 6;
			postMaxPage = (int) Math.ceil((double) resultCount / postBoardLimit);
			postStartPage = (postCurrentPage - 1) / postPageLimit * postPageLimit + 1;
			postEndPage = postStartPage + postPageLimit - 1;
			if (postEndPage > postMaxPage) {
				postEndPage = postMaxPage;
			}
			
			
			PageInfo postPi = new PageInfo(resultCount, postCurrentPage, postPageLimit, postBoardLimit, postMaxPage, postStartPage, postEndPage);
			ArrayList<Post> postList = new PostService().selectPostList(postPi);
			ArrayList<Question> qList = new QuestionService().selectQuestion(postPi);
			
			
			request.setAttribute("qList", qList);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.setAttribute("postPi", postPi);
			request.setAttribute("postList", postList);
			
		
			
			
			
			
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
