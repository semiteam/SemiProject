package semi.post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.common.model.vo.PageInfo;
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
		int listCount;     // 현재 총 게시글 개수
		int currentPage;   // 현재 페이지(즉, 사용자가 요청한 페이지)
		int pageLimit;     // 페이지 하단에 보여질 페이징바의 페이지 최대개수(몇개 단위씩)
		int boardLimit;    // 한 페이지내에 보여질 게시글 최대 개수(몇개 단위씩)
		
		int maxPage;       // 가장 마지막 페이지(총 페이지 수)
		int startPage;     // 페이징바의 시작수
		int endPage;       // 페이징바의 끝수
		
		// * listCount : 총 게시글 개수
				listCount = new PostService().selectListCount();
				
				// *currentPage : 현재페이지 (즉, 사용자가 요청한페이지)
				currentPage = Integer.parseInt(request.getParameter("cpage"));
				
				pageLimit = 10;
				
				
				boardLimit = 10;
			
				
				maxPage = (int)Math.ceil((double)listCount / boardLimit);
				
				
				startPage = (currentPage - 1) / pageLimit * pageLimit + 1 ;
				
				
				endPage = startPage + pageLimit - 1;
				
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
				
				
				
				
				ArrayList<Post> list = new PostService().selectList(pi);
				
				
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
				
				response.sendRedirect(request.getContextPath());
				
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
