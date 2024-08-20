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
		
				int listCount1;     
				int currentPage1;   
				int pageLimit1;     
				int boardLimit1;    
				int maxPage1;       
				int startPage1;     
				int endPage1;       
				

				listCount1 = new PostService().selectListCount();
				currentPage1 = Integer.parseInt(request.getParameter("cpage"));
				pageLimit1 = 10;
				boardLimit1 = 10;
				maxPage1 = (int)Math.ceil((double)listCount1 / boardLimit1);
				
				startPage1 = (currentPage1 - 1) / pageLimit1 * pageLimit1 + 1 ;
				
				endPage1 = startPage1 + pageLimit1 - 1;
				
				
				if(endPage1 > maxPage1) {
					endPage1 = maxPage1;
				}
				
				
				PageInfo pi = new PageInfo(listCount1,currentPage1,pageLimit1,boardLimit1,maxPage1,startPage1,endPage1);

				
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
