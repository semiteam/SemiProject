package semi.post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.post.model.service.PostService;
import semi.post.model.vo.Post;

/**
 * Servlet implementation class postInsertController
 */
@WebServlet("/insert.po")
public class postInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		
		
		int result = new PostService().insertPost(mno,title,content);
		
		System.out.println(result + "1");
		
		if(result > 0) {
			
			
			response.sendRedirect(request.getContextPath() + "/list.po?cpage=1");
		}else {
			
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
