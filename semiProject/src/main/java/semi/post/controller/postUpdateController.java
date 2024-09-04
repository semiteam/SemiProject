package semi.post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.post.model.service.PostService;

/**
 * Servlet implementation class postUpdateController
 */
@WebServlet("/update.po")
public class postUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		int result = new PostService().updatePost(title,content,pno);
		
		if(result > 0) {
			
			response.sendRedirect(request.getContextPath() + "/list.po?cpage=1");
		}else {
			
		}
		

		int result1 = new PostService().deletePost(pno);
		
		if(result1 > 0) {
			
			
			request.getRequestDispatcher("views/post/postMain.jsp");
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
