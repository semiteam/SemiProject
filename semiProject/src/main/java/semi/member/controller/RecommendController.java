package semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.post.model.service.PostService;

/**
 * Servlet implementation class RecommendController
 */
@WebServlet("/recommend.po")
public class RecommendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int postNo = Integer.parseInt(request.getParameter("pno"));

	       
	        int result = new PostService().increaseRecommend(postNo);

	        response.setContentType("text/plain");
	        response.setCharacterEncoding("UTF-8");

	        if (result > 0) {
	            response.getWriter().print("success");
	        } else {
	            response.getWriter().print("fail");
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
