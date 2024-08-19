package semi.post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.common.model.vo.PageInfo;
import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;
import semi.post.model.service.PostService;
import semi.post.model.vo.Post;

/**
 * Servlet implementation class postController
 */
@WebServlet ("/list.po")
public class postListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public postListController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new MemberService().selectMemberCount();
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		pageLimit = 10;
		
		boardLimit = 6;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage -1 )/pageLimit * pageLimit+1 ;
		
		endPage = startPage + pageLimit  - 1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Post> list = new PostService().PostList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
	
		
		request.getRequestDispatcher("views/post/postMain.jsp").forward(request, response);
	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
